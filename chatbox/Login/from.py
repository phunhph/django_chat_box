from django import forms

class register_form(forms.RegisterForm):
    username = forms.CharField(max_length=20)
    email = forms.EmailField(max_length=20)
    password = forms.CharField(max_length=20, widget= forms.PasswordInput)