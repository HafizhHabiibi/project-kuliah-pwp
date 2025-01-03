from flask import Flask, render_template, request, redirect, url_for, session, flash
from werkzeug.security import generate_password_hash, check_password_hash
from app import create_app, db
from app.models import User

app = create_app()
app.secret_key = '123'

@app.route('/')
def homepage():
    if 'loggedin' in session:
        # ambil data dengan SQLAlchemy
        users = User.query.all()
        return render_template('index.html', name = session['username'], user = users)
    else:
        flash('Silahkan login dahulu untuk mengakses halaman ini.', 'warning')
        return redirect(url_for('login'))
    
@app.route('/register', methods = ['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']

        # hashing password saat user register
        hashed_password = generate_password_hash(password)

        # simpan data baru dengan SQLAlchemy
        new_user = User(username=username, email=email, password_hash=hashed_password)
        db.session.add(new_user)
        db.session.commit()

        flash('Berhasil melakukan registrasi silahkan login!', 'success')
        return redirect(url_for('login'))
    return render_template('register.html')

@app.route('/login', methods = ['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        user = User.query.filter_by(email=email).first()

        if user and check_password_hash(user.password_hash, password):
            session['loggedin'] = True
            session['id'] = user.id
            session['username'] = user.username
            flash('Berhasil login', 'success')
            return redirect(url_for('homepage'))
        else:
            flash('Email atau password tidak valid', 'danger')
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('name', None)
    flash("Kamu berhasil logout", 'success')
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)