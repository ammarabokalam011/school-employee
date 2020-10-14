using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class ClassRoomManager
    {
        internal static string GetClassRoomName(int classRoomId)
        {
            string name = "";
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    ClassRoom classRoom= db.ClassRoom.Where(x => x.ID == classRoomId).FirstOrDefault();
                    if (classRoom != null)
                        name = classRoom.Name;
                }catch(Exception e)
                {

                }
            }
            return name;
        }
    }
}