import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full'
  },
  {
    path:'login',
    loadChildren: () => import('./login/login.module').then (m => m.LoginModule)
  },
  {
    path:'register',
    loadChildren: () => import('./register/register.module').then (m => m.RegisterModule )
  },
  {
    path:'home',
    loadChildren: () => import('./home/home.module').then (m => m.HomeModule)
  },
  {
    path:'addTask',
    loadChildren: () => import('./add-task/add-task.module').then (m => m.AddTaskModule)
  },
  {
    path:'updTask',
    loadChildren: () => import('./upd-task/upd-task.module').then (m => m.UpdTaskModule)
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
