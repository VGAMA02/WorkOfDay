import { Component } from '@angular/core';
import {
  FormGroup,
  FormControl,
  Validators,
  FormBuilder,
} from '@angular/forms';
import { MessageService } from 'primeng/api';
import { Router, NavigationExtras,ActivatedRoute } from '@angular/router';
import { ThisReceiver } from '@angular/compiler';
import { updTask } from './upd-task.services';
import { DatePipe } from '@angular/common';

interface Tasks {
  Name: string;
  Description: string;
  AssignedUser: string;
  Category:string;
  StartDate:string;
  EndDate:string;
  Status:string;
}
@Component({
  selector: 'app-upd-task',
  templateUrl: './upd-task.component.html',
  styleUrls: ['./upd-task.component.scss'],
  providers: [updTask,DatePipe]
})
export class UpdTaskComponent {
  addTaskForm: FormGroup;
  users: any[] = [];
  category: any[] = [];
  status: any[] = [];
  viejos: any[] = [];
  datos: any;
   constructor(private _Route: ActivatedRoute,private formBuilder: FormBuilder,private _updTask: updTask,private _Router: Router,private _datepipe: DatePipe) { 
     this.addTaskForm = this.formBuilder.group({
       FKAssignedUser: ['', Validators.required],
       FKCategory: ['', Validators.required],
       //FKLastUpdater: ['', Validators.required],
       //FKCreatorUser: ['', Validators.required],
       FKStatus: ['', Validators.required],
       Name: ['', Validators.required],
       Description: ['', Validators.required],
       StartDate: ['', Validators.required],
       EndDate: ['', Validators.required],
       //LastUpdate: ['', Validators.required]
     });

    
  /// GetUsers
  this._updTask.getUsers().subscribe(res => {
  console.log("respuesta: \n ");
  console.log(res);
  /* this.users = res; */
  res.forEach((item: any) => {
    const newItem: any = {
      Code: item.PKUser,
      name: item.FirstName + ' ' + item.LastName
    };
    this.users.push(newItem);
  });
  console.log(this.users);
});

///GetCategorys
this._updTask.getCategorys().subscribe(res => {
  console.log("respuesta: \n ");
  console.log(res);
  console.log(res[0].resultado);
  //this.category = res;
  res.forEach((item: any) => {
    const newItem: any = {
      Code: item.PKCategory,
      name: item.Name
    };
    this.category.push(newItem);
  });
  console.log(this.category);
});

//GetStatus
 this._updTask.getStatus().subscribe(res => {
  console.log("respuesta: \n ");
  console.log(res);
  //this.category = res;
  res.forEach((item: any) => {
    const newItem: any = {
      Code: item.PKStatus,
      name: item.Name
    };
    this.status.push(newItem);
  });
  console.log(this.status);
}); 

    }

  ngOnInit(): void {
    this._Route.queryParams.subscribe(params => {
      console.log(params['datos']);
      if (params['datos']) {
        this.datos = JSON.parse(params['datos']);
        this.viejos = JSON.parse(params['datos']);
      }
    }).unsubscribe;
    console.log("---------");
    console.log('Data recien traida: ');
    console.log(this.viejos);
  }

  updTask(){
    console.log(this.addTaskForm);console.log("\n");
    console.log(this.addTaskForm.value.FKAssignedUser.Code);
    let LastUpdate = new Date();
    //let SLastUpdate = LastUpdate.toDateString();
    let SLastUpdate = this._datepipe.transform(LastUpdate, 'yyyy-MM-dd HH:mm:ss') ?? '1900-01-01';
    //SLastUpdate = SLastUpdate ?? '1900-01-01';
    let s = localStorage.getItem("PKUser")?.toString();
    let dateUPd = new Date(SLastUpdate);
    console.log(dateUPd);
    let FKUser = parseInt(s ?? '0');
    this._updTask.updTask(this.datos.PKTask,this.addTaskForm.value.FKAssignedUser.Code,this.addTaskForm.value.FKCategory.Code,FKUser,FKUser,this.addTaskForm.value.FKStatus.Code,this.addTaskForm.value.Name,this.addTaskForm.value.Description,this._datepipe.transform(this.addTaskForm.value.StartDate, 'yyyy-MM-dd HH:mm:ss') ?? '1900-01-01',this._datepipe.transform(this.addTaskForm.value.EndDate, 'yyyy-MM-dd HH:mm:ss') ?? '1900-01-01',SLastUpdate).subscribe(res => {
      console.log(res);
      console.log(res[0].resultado);
      if(res[0].resultado == 1){
        alert("tarea agregada");
        //this.messageService.add({key:'tr', severity:'success', summary: 'Success', detail: 'Registration Successful', life: 3000});
        this._Router.navigate(['/home']);
      }
      else if(res[0].resultado == -1){
        alert("Falla al agregar la tarea posiblemente el correo ya existe");
      }
      else{
  
      }
        //console.log(this.songs);
      
    });
  }
}
