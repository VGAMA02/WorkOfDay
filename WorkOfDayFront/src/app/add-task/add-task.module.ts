import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AddTaskComponent } from './add-task.component';
import { AddTaskRoutingModule } from './add-task-routing.module';
import { SharedModule } from '../shared/shared.module';
@NgModule({
  declarations: [
    AddTaskComponent
  ],
  imports: [
    CommonModule,AddTaskRoutingModule,SharedModule
  ]
})
export class AddTaskModule { }
