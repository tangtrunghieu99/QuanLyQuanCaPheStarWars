//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class ThucUong
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThucUong()
        {
            this.ThongTinDatHangs = new HashSet<ThongTinDatHang>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public string UrlTitle { get; set; }
        public Nullable<int> IDCaterogy { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public string MoreImage { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<int> Quality { get; set; }
        public string Detail { get; set; }
        public Nullable<int> ViewCount { get; set; }
    
        public virtual LoaiThucUong LoaiThucUong { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ThongTinDatHang> ThongTinDatHangs { get; set; }
    }
}