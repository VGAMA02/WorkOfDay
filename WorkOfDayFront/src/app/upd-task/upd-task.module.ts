import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UpdTaskComponent } from './upd-task.component';
import { UpdTaskRoutingModule } from './upd-task-routing.module';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  declarations: [
    UpdTaskComponent
  ],
  imports: [
    CommonModule,UpdTaskRoutingModule,SharedModule
  ]
})
export class UpdTaskModule { }
