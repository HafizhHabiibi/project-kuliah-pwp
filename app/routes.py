from flask import Blueprint, jsonify, render_template, request, redirect, url_for, session, flash
from werkzeug.security import generate_password_hash, check_password_hash
from .models import User, db, Enumrole

main = Blueprint('main', __name__)

# @main.route('/users', methods=['GET'])
# def get_users():
#     users = User.query.all()
    
#     users_data = [
#         {"id": user.id, "name": user.username, "role": user.role,"email": user.email, "password": user.password_hash}
#         for user in users
#     ]
    
#     return jsonify(users_data)

# route ke homepage
@main.route('/')
def homepage():
    if 'loggedin' in session:
        # ambil data dengan SQLAlchemy
        users = User.query.all()
        return render_template('index.html', name = session['username'], user = users)
    else:
        flash('Silahkan login dahulu untuk mengakses halaman ini.', 'warning')
        return redirect(url_for('login'))

# route ke register / create
@main.route('/register', methods = ['GET', 'POST'])
def register():
    roles = [role.value for role in Enumrole]

    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        role = request.form['role']

        # hashing password saat user register
        hashed_password = generate_password_hash(password)

        # simpan data baru dengan SQLAlchemy
        new_user = User(username=username, email=email, password_hash=hashed_password)
        db.session.add(new_user)
        db.session.commit()

        flash('Berhasil melakukan registrasi silahkan login!', 'success')
        return redirect(url_for('login'))
    return render_template('register.html', roles = roles)

# edit user
@main.route('/edit/<int:id>', methods=['GET', 'POST'])
def edit(id):
    user = User.query.get(id)

    if request.method == 'POST':
        user.username = request.form['username']
        user.email = request.form['email']
        password = request.form['password']

        if password:
            user.password_hash = generate_password_hash(password)

        db.session.commit()
        flash('User berhasil diedit', 'success')
        return redirect(url_for('main.homepage'))
    
    return render_template('edit_user.html', user=user)

# hapus user
@main.route('/delete/<int:id>', methods=['POST'])
def delete(id):
    user = User.query.get(id)
    db.session.delete(user)
    db.commit()
    flash('User berhasil dihapus', 'danger')
    return redirect(url_for('main.homepage'))


# route ke login
@main.route('/login', methods = ['GET', 'POST'])
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

# route ke logout
@main.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('name', None)
    flash("Kamu berhasil logout", 'success')
    return redirect(url_for('login'))