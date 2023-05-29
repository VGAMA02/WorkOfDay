import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class RegisterUser {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }
    RegisterUser(FKRole:number,FirstName:string,LastName:string,Email:string,Password:string,BirthDay:string): Observable<any> {
        let data = {FKRole,FirstName,LastName,Email,Password,BirthDay};
        return this._http.post(this.apiEndpoint +'User/AddUser',data);
    }

}