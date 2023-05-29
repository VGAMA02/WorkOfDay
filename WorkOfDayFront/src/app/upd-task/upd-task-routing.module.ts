import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {  Routes, RouterModule } from '@angular/router';
import { UpdTaskComponent } from './upd-task.component';
const routes: Routes = [
  {
    path: '',
    component: UpdTaskComponent
  }
];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class UpdTaskRoutingModule { }
