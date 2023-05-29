import { Component } from '@angular/core';
import {
  FormGroup,
  FormControl,
  Validators,
  FormBuilder,
} from '@angular/forms';
import { MessageService } from 'primeng/api';
import { Router, NavigationExtras } from '@angular/router';
import { homeServices } from './home.serves';
import { ThisReceiver } from '@angular/compiler';
import { Table } from 'primeng/table';
interface Tasks {
  PKTask:number;
  FKAssignedUser:number;
  FKCategory:number;
  FKLastUpdater:number;
  FKCreatorUser:number;
  Name: string;
  Description: string;
  AssignedUser: string;
  Category:string;
  StartDate:string;
  EndDate:string;
  Status:string;
}

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  providers: [homeServices]
})


export class HomeComponent {
  tasksData: Tasks[] = []; 
  userData: Array<any> = [];
  AllusersTaskData: Tasks[] = []; 
  loading: boolean = true;
  UserRole:any = localStorage.getItem("FKRole");;
  constructor(private _homeServices: homeServices,private _router: Router){
    this.getUserData();
    if(this.UserRole == 1){
      this.getAllUserData();
    }
  }
  
  ngOnInit(): void {
   
    this.getTasks();
    this.loading = false;
  }
  getAllUserData(){
    console.log("Getting all User");

    this._homeServices.getAllAvailableTasks().subscribe(res => {
      console.log("respuesta User: \n ");
      console.log(res[0]);
     
       this.AllusersTaskData = res;
           console.log("User: \n ");
      console.log(this.userData[0]);
      });
  
  }
  getUserData(){
    console.log("Getting User");
    let s = localStorage.getItem("PKUser")?.toString();
    let PKUser = parseInt(s ?? '0');
    console.log("pk: " + PKUser);
    this._homeServices.getUserByPk(PKUser).subscribe(res => {
      console.log("respuesta User: \n ");
      console.log(res[0]);
     
       this.userData = res;
           console.log("User: \n ");
      console.log(this.userData[0]);
      });
  
  }
  getTasks(){
    /// GetUsers
    console.log(localStorage.getItem("PKUser"));
    let s = localStorage.getItem("PKUser")?.toString();
    let PKUser = parseInt(s ?? '1');
    this._homeServices.getTasksByUser(PKUser).subscribe(res => {
      console.log("respuesta Tasks: \n ");
      console.log(res);
      /* this.users = res; */
      res.forEach((item: any) => {
        const Tasks: any = {
          PKTask: item.PKTask,
          Name: item.Name,
          Description: item.Description,
          AssignedUser: item.FirstName,
          Category:item.CategoryName,
          StartDate:item.StartDate,
          EndDate: item.EndDate,
          Status: item.StatusName
        };
        this.tasksData.push(Tasks);
      });
      console.log(this.tasksData);
    });
  }
  updTask(PKTask:number,Name:string,Description:string,StartDate:Date,EndDate:Date){
    console.log("Editar cancion");
    const datos = {
      PKTask: PKTask,
      Name:Name,
      Description:Description,
      StartDate:StartDate,
      EndDate:EndDate
    };
  
    // Define las opciones de navegación
    let navigationExtras: NavigationExtras = {
      queryParams: {
        // Agrega la información como parte del estado de navegación
        datos: JSON.stringify(datos)
      }
    };
    console.log("info a mandar");
    console.log(navigationExtras);
    // Navega a la página de ComponenteDestino con las opciones definidas
    this._router.navigate(['/updTask'], navigationExtras);
  }
  addTask(){
    //this._router.navigate(['/artistedit'], navigationExtras);
    this._router.navigate(['/addTask']);
    
  }

  clear(table: Table) {
    table.clear();
  }
  onInputChange(table: Table,event: Event) {
    if (event.target instanceof HTMLInputElement) {
      const value = event.target.value;
      table.filterGlobal(value, 'contains');
    }
  }
  getSeverity(status:string) {

      switch (status.toLowerCase()) {
          case 'unqualified':
              return 'danger';

          case 'qualified':
              return 'success';

          case 'new':
              return 'info';

          case 'negotiation':
              return 'warning';

          default:
              return null;
          
      }
      
  }

  


}
///Ejemplo para mandar datos a otro componente
/* console.log("Editar cancion");
const datos = {
  BfName: Name,
  BfNationality:Nationality,
  BfYear:Year,
};

// Define las opciones de navegación
let navigationExtras: NavigationExtras = {
  queryParams: {
    // Agrega la información como parte del estado de navegación
    datos: JSON.stringify(datos)
  }
};
console.log("info a mandar");
console.log(navigationExtras); */