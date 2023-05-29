import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdTaskComponent } from './upd-task.component';

describe('UpdTaskComponent', () => {
  let component: UpdTaskComponent;
  let fixture: ComponentFixture<UpdTaskComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [UpdTaskComponent]
    });
    fixture = TestBed.createComponent(UpdTaskComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
