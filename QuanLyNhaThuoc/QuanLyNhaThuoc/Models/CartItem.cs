using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhaThuoc.Models
{
    public class CartItem
    {
        public int MaThuoc { get; set; }
        public string TenThuoc { get; set; }
        public int SoLuong { get; set; }
        public double DonGia { get; set; }
        public double ThanhTien
        {
            get
            {
                return SoLuong * DonGia;
            }
        }



    }
}