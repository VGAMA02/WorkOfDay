import { Component } from '@angular/core';
import {
  FormGroup,
  FormControl,
  Validators,
  FormBuilder,
} from '@angular/forms';
import { MessageService } from 'primeng/api';
import { Router, NavigationExtras } from '@angular/router';
import { loginUser } from './login.services';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  providers: [loginUser]
})
export class LoginComponent {

  LoginForm: FormGroup;
  constructor(private formBuilder: FormBuilder, private _loginUser: loginUser,private _Router: Router) { 
    this.LoginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });

  }//Constructor

  
  ngOnInit(): void {
    
  }

  LoginUser(){

    console.log(this.LoginForm);console.log("\n");
    console.log(this.LoginForm.value.firstName,this.LoginForm.value.lastName);console.log("\n");
    if(this.LoginForm.value.password.length < 6){
      alert("la contraseña debe tener al menos 6 caracteres");
      return;
    }

    console.log(this.LoginForm.valid);console.log("\n");
    //mandar a API
    this._loginUser.loginUser(this.LoginForm.value.email,this.LoginForm.value.password).subscribe(res => {
      console.log("Entrando a respuesta");
      console.log(res);
      console.log(res[0].resultado);
      if(res[0].resultado != -1){
        //this.messageService.add({key:'tr', severity:'success', summary: 'Success', detail: 'Registration Successful', life: 3000});
        localStorage.setItem("PKUser",res[0].PKUser);
        localStorage.setItem("FKRole",res[0].FKRole);
        console.log("PKUsedr: " + localStorage.getItem("FKRole"));
        console.log("FKRole: " + localStorage.getItem("PKUser"));
        this._Router.navigate(['/home']);
        
      }
      else if(res[0].resultado == -1){
        alert("Falla al agregar usuario posiblemente el correo ya existe");
      }
      else{
  
      }
        //console.log(this.songs);
      
    });
    localStorage.setItem("emailUser",this.LoginForm.value.email);

  }




}
