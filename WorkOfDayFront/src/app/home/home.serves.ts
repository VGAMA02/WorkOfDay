import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class homeServices {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }
    getTasksByUser(FKUser:Number,): Observable<any> {
        let data = {FKUser};
        return this._http.post(this.apiEndpoint +'Task/GetTaskByAssignedUser',data);
    }
    
    getUserByPk(PKUser:Number,): Observable<any> {
        let data = {PKUser};
        return this._http.post(this.apiEndpoint +'User/GetUserByPKUser',data);
    }
    getTaskByUser(): Observable<any> {
        return this._http.get(this.apiEndpoint +'User/GetAllUsers');
    }
    getTaskOfAll(): Observable<any> {
        return this._http.get(this.apiEndpoint +'Category/GetAllCategory');
    }
    getStatus(): Observable<any> {
        return this._http.get(this.apiEndpoint +'Status/GetAllStatus');
    } 
    getAllAvailableTasks(): Observable<any> {
        return this._http.get(this.apiEndpoint +'Task/GetAllAvailableTask');
    } 

}