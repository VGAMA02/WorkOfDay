import { NgModule } from '@angular/core';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { ToastModule } from 'primeng/toast';
import {DropdownModule} from 'primeng/dropdown';
import { ListboxModule } from 'primeng/listbox';
import { TableModule } from 'primeng/table';
@NgModule({
  exports: [
    FormsModule,
    ReactiveFormsModule,
    ButtonModule,
    ToastModule,
    DropdownModule,
    ListboxModule,
    TableModule

  ]
})
export class SharedModule { }