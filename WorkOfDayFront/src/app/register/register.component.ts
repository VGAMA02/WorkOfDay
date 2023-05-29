import { ThisReceiver } from '@angular/compiler';
import { Component } from '@angular/core';
import {
  FormGroup,
  FormControl,
  Validators,
  FormBuilder,
} from '@angular/forms';
import { MessageService } from 'primeng/api';
import { RegisterUser } from './register.services';
import { Router, NavigationExtras } from '@angular/router';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss'],
  providers:[MessageService,RegisterUser]
})
export class RegisterComponent {
  registerForm: FormGroup;
  constructor(private formBuilder: FormBuilder,private messageService: MessageService, private _RegisterUser: RegisterUser,private _Router: Router) { 
    this.registerForm = this.formBuilder.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      birthDate: ['', Validators.required],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', Validators.required],
    });
  }
  
 

  ngOnInit(): void {
    
  }

  signUp(){

    console.log(this.registerForm);console.log("\n");
    console.log(this.registerForm.value.firstName,this.registerForm.value.lastName,this.registerForm.value.email,this.registerForm.value.birthDate,this.registerForm.value.password);console.log("\n");
    if(this.registerForm.value.password != this.registerForm.value.confirmPassword){
        alert("la contraseña no coincide");
        return;
    }
    if(this.registerForm.value.password.length < 6){
      alert("la contraseña debe tener al menos 6 caracteres");
      return;
    }

    console.log(this.registerForm.valid);console.log("\n");
    //mandar a API
    this._RegisterUser.RegisterUser(3,this.registerForm.value.firstName,this.registerForm.value.lastName,this.registerForm.value.email,this.registerForm.value.password,this.registerForm.value.birthDate).subscribe(res => {
      console.log(res);
      console.log(res[0].resultado);
      if(res[0].resultado == 1){
        alert("Usuario agregado");
        //this.messageService.add({key:'tr', severity:'success', summary: 'Success', detail: 'Registration Successful', life: 3000});
        this._Router.navigate(['/login']);
      }
      else if(res[0].resultado == -1){
        alert("Falla al agregar usuario posiblemente el correo ya existe");
      }
      else{
  
      }
        //console.log(this.songs);
      
    });
    localStorage.setItem("emailUser",this.registerForm.value.email);

  }
}
