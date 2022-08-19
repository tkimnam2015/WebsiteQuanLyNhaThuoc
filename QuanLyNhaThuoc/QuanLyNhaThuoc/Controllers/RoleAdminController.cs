
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyNhaThuoc.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Net;
using System.Threading.Tasks;
namespace QuanLyNhaThuoc.Controllers
{
    [Authorize(Roles = "Admin")]
    public class RoleAdminController : Controller
    {
        ApplicationDbContext context = new ApplicationDbContext();
        // GET: RoleAdmin
        public ActionResult Index()
        {
            var RoloManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));

            return View(RoloManager.Roles);
        }

        // GET: RoleAdmin/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
                return View("Error");
            var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var role = await RoleManager.FindByIdAsync(id);
            var listUser = new List<ApplicationUser>();
            foreach (var user in UserManager.Users.ToList())
            {
                if (await UserManager.IsInRoleAsync(user.Id, role.Name))
                    listUser.Add(user);
            }
            ViewBag.User = listUser;
            ViewBag.UserCount = listUser.Count();
            return View(role);
        }

        // GET: RoleAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RoleAdmin/Create
        [HttpPost]
        public async Task<ActionResult> Create(RoleViewModel roleViewModel)
        {
            if (ModelState.IsValid)
            {
                var role = new IdentityRole(roleViewModel.Name);
                var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
                var check = await RoleManager.CreateAsync(role);
                if (!check.Succeeded)
                {
                    ModelState.AddModelError("", check.Errors.First());
                    return View();
                }
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: RoleAdmin/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
                return View("Error");
            var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var role = await RoleManager.FindByIdAsync(id);
            if (role == null)
                return HttpNotFound();
            RoleViewModel roleModel = new RoleViewModel{ Id = role.Id, Name = role.Name};
            return View(roleModel);
        }

        // POST: RoleAdmin/Edit/5
        [HttpPost]
        public async Task< ActionResult> Edit(RoleViewModel roleViewModel)
        {
            if(ModelState.IsValid)
            {
                var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
                var role = await RoleManager.FindByIdAsync(roleViewModel.Id);
                role.Name = roleViewModel.Name;
                await RoleManager.UpdateAsync(role);
               return RedirectToAction("Index");
            }
            
            
                return View();
            
        }

        // GET: RoleAdmin/Delete/5
        public async Task< ActionResult> Delete(string id)
        {
            if (id == null)
                return View("Error");
            var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var role = await RoleManager.FindByIdAsync(id);
            if (role == null)
                return HttpNotFound();
            
            return View();
        }

        // POST: RoleAdmin/Delete/5
        [HttpPost]
        public async Task< ActionResult> Delete(string id,string x="")
        {
            if (ModelState.IsValid)
            { 
            if (id == null)
                return View("Error");
            var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var role = await RoleManager.FindByIdAsync(id);
            if (role == null)
                return HttpNotFound();

                var check = await RoleManager.DeleteAsync(role);
                if (!check.Succeeded)
                {
                    ModelState.AddModelError("", check.Errors.First());
                    return View();
                }
                return RedirectToAction("Index");
            }
            return View();
        }
    }
}
