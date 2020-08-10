using System;

namespace DotNetSale.Models
{
    /// <summary>
    /// 상품의 필드를 구성하는 상품 상세 클래스
    /// </summary>
    public class Product
    {
        public int ProductId { get; set; }
        public int CategoryId { get; set; }
        public string ModelNumber { get; set; }
        public string ModelName { get; set; }
        public string Company { get; set; }
        public int OriginPrice { get; set; }
        public int SellPrice { get; set; }
        public string EventName { get; set; }
        public string ProductImage { get; set; }
        public string Explain { get; set; }
        public string Description { get; set; }
        public string Encoding { get; set; }
        public int ProductCount { get; set; }
        public DateTime RegistDate { get; set; }
        public int Mileage { get; set; }
        public int Absence { get; set; }
    }
}
