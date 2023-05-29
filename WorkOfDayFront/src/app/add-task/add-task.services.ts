import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class addTask {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }
    addTask(FKAssignedUser:Number,FKCategory:Number,FKLastUpdater:Number,FKCreatorUser:Number,FKStatus:Number,Name:string,Description:string,StartDate:string,EndDate:string,LastUpdate:string): Observable<any> {
        let data = {FKAssignedUser,FKCategory,FKLastUpdater,FKCreatorUser,FKStatus,Name,Description,StartDate,EndDate,LastUpdate};
        return this._http.post(this.apiEndpoint +'Task/PostAddTask',data);
    }
    getUsers(): Observable<any> {
        return this._http.get(this.apiEndpoint +'User/GetAllUsers');
    }
    getCategorys(): Observable<any> {
        return this._http.get(this.apiEndpoint +'Category/GetAllCategory');
    }
    getStatus(): Observable<any> {
        return this._http.get(this.apiEndpoint +'Status/GetAllStatus');
    } 
   

}