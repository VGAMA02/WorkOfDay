import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class loginUser {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }
    loginUser(Email:string,Password:string): Observable<any> {
        let data = {Email,Password};
        return this._http.post(this.apiEndpoint +'User/AuthenticationUser',data);
    }

   

}