# ---------------- IMPORTS ----------------
import smtplib
from email.mime.text import MIMEText
import random
import re
from flask import Flask, render_template, request, redirect, session
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash
import datetime

# ---------------- FLASK APP ----------------
app = Flask(__name__)
app.secret_key = "secret123"

# ---------------- DATABASE ----------------
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="11223344",
    database="survey"
)

cursor = db.cursor(buffered=True)

# ---------------- PASSWORD VALIDATION ----------------
def is_strong_password(password):
    if len(password) < 6:
        return False
    if not re.search(r"[A-Z]", password):
        return False
    if not re.search(r"[!@#$%^&*(),.?\":{}|<>]", password):
        return False
    return True

# ---------------- EMAIL OTP FUNCTION ----------------
def send_otp_email(to_email, otp):
    sender_email = "salman2000redmi@gmail.com"
    sender_password = "iihiarekftafvedg"

    try:
        msg = MIMEText(f"Your OTP for password reset is: {otp}")
        msg["Subject"] = "Password Reset OTP"
        msg["From"] = sender_email
        msg["To"] = to_email

        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.starttls()
        server.login(sender_email, sender_password)
        server.send_message(msg)
        server.quit()

        print("OTP sent successfully")

    except Exception as e:
        print("Email sending failed:", e)
# ---------------- LOGIN ----------------
@app.route("/", methods=["GET", "POST"])
def login():
    message = ""

    if request.method == "POST":
        email = request.form["email"].strip()
        password = request.form["password"].strip()

        if email == "" or password == "":
            message = "All fields are required"

        elif not re.match(r'^[\w\.-]+@[\w\.-]+\.\w+$', email):
            message = "Invalid email format"

        else:
            cursor.execute("SELECT * FROM users WHERE email=%s", (email,))  #  important
            user = cursor.fetchone()

            if user and check_password_hash(user[3], password):
                session["user"] = email
                return redirect("/survey")
            else:
                message = "Invalid email or password"

    return render_template("login.html", message=message)

# ---------------- SIGNUP ----------------
@app.route("/signup", methods=["GET", "POST"])
def signup():
    message = ""

    if request.method == "POST":
        username = request.form["username"].strip()
        email = request.form["email"].strip()
        password = request.form["password"].strip()

        if username == "" or email == "" or password == "":
            message = "All fields are required"

        elif not re.match(r'^[\w\.-]+@[\w\.-]+\.\w+$', email):
            message = "Invalid email format"

        elif not is_strong_password(password):
            message = "Password must contain 6+ chars, 1 uppercase, 1 special char"

        else:
            cursor.execute("SELECT * FROM users WHERE email=%s", (email,))
            existing = cursor.fetchone()

            if existing:
                message = "Email already exists"
            else:
                hashed = generate_password_hash(password)
                cursor.execute(
                    "INSERT INTO users (username, email, password) VALUES (%s,%s,%s)",
                    (username, email, hashed)
                )
                db.commit()
                return redirect("/")

    return render_template("signup.html", message=message)

# ---------------- FORGOT PASSWORD (OTP SEND) ----------------
@app.route("/forgot", methods=["GET", "POST"])
def forgot():
    message = ""

    if request.method == "POST":

        email = request.form["email"]

        # check if user exists in database
        cursor.execute("SELECT * FROM users WHERE email=%s", (email,))
        user = cursor.fetchone()

        if not user:
            message = "Email not registered"
            return render_template("forgot.html", message=message)

        # generate OTP
        otp = str(random.randint(1000, 9999))

        session["otp"] = otp
        session["reset_email"] = email

        # send OTP email
        send_otp_email(email, otp)

        return redirect("/verify")

    return render_template("forgot.html", message=message)

# ---------------- VERIFY OTP + RESET PASSWORD ----------------
@app.route("/verify", methods=["GET", "POST"])
def verify():
    message = ""

    if request.method == "POST":

        user_otp = request.form["otp"]
        new_password = request.form["password"]

        # check OTP
        if user_otp == session.get("otp"):

            hashed = generate_password_hash(new_password)

            cursor.execute(
                "UPDATE users SET password=%s WHERE email=%s",
                (hashed, session.get("reset_email"))
            )
            db.commit()

            # clear session
            session.pop("otp", None)
            session.pop("reset_email", None)

            return redirect("/")

        else:
            message = "Invalid OTP"

    return render_template("verify.html", message=message)

# ---------------- SURVEY ----------------
@app.route("/survey", methods=["GET", "POST"])
def survey():

    if "user" not in session:
        return redirect("/")

    email = session["user"]

    # 🔴 CHECK IF USER ALREADY SUBMITTED SURVEY
    cursor.execute("SELECT * FROM survey WHERE email=%s", (email,))
    existing = cursor.fetchone()

    # If already submitted → show message page
    if existing:
        return render_template("already_submitted.html")

    # If form submitted for first time
    if request.method == "POST":

        cursor.execute("""
        INSERT INTO survey (
            name, age, gender, email,
            programming_languages, preferred_language, ide,
            satisfaction, rating, preferred_time,
            suggestions, feedback
        ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        """, (
            request.form["name"],
            request.form["age"],
            request.form["gender"],
            request.form["email"],
            request.form["languages"],
            request.form["preferred"],
            request.form["ide"],
            request.form["satisfaction"],
            request.form["rating"],
            request.form["time"],
            request.form["suggestions"],
            request.form["feedback"]
        ))

        db.commit()

        return render_template("success.html")

    return render_template("survey.html")

@app.route("/logout")
def logout():
    session.clear()
    return redirect("/")

# ---------------- RUN APP ----------------
if __name__ == "__main__":
    app.run(debug=True)