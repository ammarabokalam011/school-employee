﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolWeb.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SchoolDBEntities : DbContext
    {
        public SchoolDBEntities()
            : base("name=SchoolDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Article> Article { get; set; }
        public DbSet<Classfication> Classfication { get; set; }
        public DbSet<ClassRoom> ClassRoom { get; set; }
        public DbSet<Employee> Employee { get; set; }
        public DbSet<Exam> Exam { get; set; }
        public DbSet<Fee> Fee { get; set; }
        public DbSet<Grade> Grade { get; set; }
        public DbSet<GradeFee> GradeFee { get; set; }
        public DbSet<News> News { get; set; }
        public DbSet<Payment> Payment { get; set; }
        public DbSet<PaymentStudent> PaymentStudent { get; set; }
        public DbSet<Period> Period { get; set; }
        public DbSet<Permission> Permission { get; set; }
        public DbSet<Schedule> Schedule { get; set; }
        public DbSet<Student> Student { get; set; }
        public DbSet<StudentExam> StudentExam { get; set; }
        public DbSet<Subject> Subject { get; set; }
        public DbSet<Teacher> Teacher { get; set; }
        public DbSet<EmployeeLog> EmployeeLog { get; set; }
    }
}
