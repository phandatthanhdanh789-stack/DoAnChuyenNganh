<template>
    <div class="admin-layout">
      <!-- Header -->
      <header class="header">
  <div class="logo">Sweet cake</div>
  <div class="welcome">Chào mừng đến với Sweet Cake Admin 🎂</div>
</header>


  
      <!-- Sidebar -->
      <aside class="sidebar">
        <nav>
          <ul>
              <li class="menu-item" :class="{ active: currentView === 'dashboard' }" @click="currentView = 'dashboard'">
                  <span>Trang tổng quan</span><span class="arrow">></span>
              </li>
              <li class="menu-item" :class="{ active: currentView === 'products' }" @click="currentView = 'products'">
                  <span>Quản lý sản phẩm</span><span class="arrow">></span>
              </li>
              <li class="menu-item" :class="{ active: currentView === 'orders' }" @click="currentView = 'orders'">
                  <span>Quản lý đơn hàng</span><span class="arrow">></span>
              </li>
              <li class="menu-item" :class="{ active: currentView === 'customers' }" @click="currentView = 'customers'">
                  <span>Quản lý khách hàng</span><span class="arrow">></span>
              </li>
          </ul>
        </nav>
      </aside>
  
      <!-- Main Content -->
<main class="main-content">
        <div class="content">
      <div v-if="currentView === 'dashboard'">
         
<div class="dashboard">
  <div class="stats">
    <div class="stat-card orange">
      <div class="icon">🍰</div>
      <div class="number">25</div>
      <div class="label">Sản phẩm</div>
      <div class="desc">Tổng số sản phẩm đang bán</div>
    </div>

    <div class="stat-card purple">
      <div class="icon">🧍‍♂️</div>
      <div class="number">5</div>
      <div class="label">Khách hàng</div>
      <div class="desc">Khách hàng đã đăng ký</div>
    </div>
    
    <div class="stat-card green">
      <div class="icon">💰</div>
      <div class="number">3.500.000₫</div>
      <div class="label">Doanh thu</div>
      <div class="desc">Doanh thu tháng này</div>
    </div>
  </div>
</div>
      </div>
        
        <div v-if="currentView === 'products'">
         
          <div class="product-list">
    <div class="product-card" v-for="item in products" :key="item.id">
      <img :src="`/img/${item.image}`" :alt="item.name" class="product-img" />
      <div class="product-info">
        <h3 class="product-name">{{ item.name }}</h3>
        <p class="product-desc">{{ item.description }}</p>
        <div class="product-meta">
          <span class="product-category">{{ item.category }}</span>
          <span class="product-price">{{ item.price.toLocaleString('vi-VN') }}₫</span>
        </div>
        <div class="product-actions">
          <button class="edit-btn">Sửa</button>
          <button class="delete-btn">Xóa</button>
        </div>
      </div>
    </div>
  </div>
        </div>

        <!--quản ly don hang-->
        <div v-if="currentView === 'orders'">
        
<div class="filter-bar">
  <select>
    <option>Tất cả</option>
    <option>Chưa xử lý</option>
    <option>Đã xử lý</option>
  </select>

  <input type="text" placeholder="Tìm kiếm mã đơn, khách hàng..." />
  <input type="date" placeholder="Từ" />
  <input type="date" placeholder="Đến" />
  <button class="refresh-btn"></button>
</div>

<table class="order-table">
  <thead>
    <tr>
      <th>Mã đơn</th>
      <th>Khách hàng</th>
      <th>Ngày đặt</th>
      <th>Tổng tiền</th>
      <th>Trạng thái</th>
      <th>Thao tác</th>
    </tr>
  </thead>
  <tbody>
    <!-- Chưa có khách hàng nào -->
  </tbody>
</table>
        </div>

        <!--quản lý khách hàng -->
        <div v-if="currentView === 'customers'">
          <div class="filter-bar">
  <select>
    <option>Tất cả</option>
    <option>Chưa xử lý</option>
    <option>Đã xử lý</option>
  </select>

  <input type="text" placeholder="Tìm kiếm khách hàng..." />
  <input type="date" placeholder="Từ" />
  <input type="date" placeholder="Đến" />
  <button class="refresh-btn"></button>
</div>

<table class="order-table">
  <thead>
    <tr>
      <th>STT</th>
      <th>Họ và Tên</th>
      <th>Liên Hệ</th>
      <th>Ngày Tham Gia</th>
      <th>Tình Trạng</th>
    </tr>
  </thead>
  <tbody>
    <!-- Chưa có đơn hàng nào -->
  </tbody>
</table>
        </div>
    </div>
  </main>
    </div>
  </template>
  
  <script setup>
  // Nếu bạn dùng Vue Router, router-view sẽ hiển thị nội dung từng trang
  import { ref } from 'vue'

const currentView = ref('dashboard')
const products = [
  {
    id: 1,
    name: 'Bánh kem cam',
    description: 'Bánh kem mềm mịn, vị cam thơm nhẹ...',
    category: 'Món ngọt',
    price: 220000,
    image: 'banh_kem_cam.png'
  },
  {
    id: 2,
    name: 'Bánh kem đào',
    description: 'Kem mịn ngọt dịu, hương đào thanh thoát.',
    category: 'Món ngọt',
    price: 250000,
    image: 'banh_kem_dao.png',
  },
  {
    id: 3,
    name: 'Sữa chua việt quất',
    description: 'Chua ngọt hài hòa, việt quất tươi mát.',
    category: 'Món lạnh',
    price: 180000,
    image: 'sua_chua_viet_quat.png',
  },
  {
    id: 4,
    name: 'Bánh mây việt quất',
    description: 'Bánh mây xốp nhẹ, vị việt quất thanh mát.',
    category: 'Món ngọt',
    price: 300000,
    image: 'banh_may_vietquat.png'
  },
  {
    id: 5,
    name: 'Bánh mây dâu',
    description: 'Bông xốp nhẹ nhàng, vị dâu ngọt ngào.',
    category: 'Món ngọt',
    price: 200000,
    image: 'banhmay_dau.png'
  },
  {
    id: 6,
    name: 'Bánh mây',
    description: 'Mềm mịn xốp nhẹ, vị ngọt thanh tao.',
    category: 'Món ngọt',
    price: 150000,
    image: 'banhmay.png'
  }
]
  </script>
  
  <style scoped>
  .admin-layout {
    display: flex;
    height: 100vh;
    background-color: #fffaf0/* nền trắng hoặc kem nhạt */
  }
  
  .header {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f5deb3;
  height: 60px;
  padding: 0 20px;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
}

.logo {
  position: absolute;
  left: 20px;
  font-size: 24px;
  font-weight: bold;
  color: #5c4033;
}

.welcome {
  font-size: 18px;
  font-weight: 500;
  color: #333;
}

  
.sidebar {
  width: 220px;
  background-color: #ffe4e1; /* hồng nhạt */
  padding-top: 80px;
  padding-left: 20px;
  box-shadow: 2px 0 5px rgba(0,0,0,0.05);
  position: fixed;    /* 👈 cố định bên trái */
  top: 0;
  left: 0;
  bottom: 0;
}
  
  .sidebar ul {
    list-style: none;
    padding: 0;
  }
  
  .sidebar li {
    margin-bottom: 20px;
    font-size: 16px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    cursor: pointer;
    color: #333;
}

.arrow {
    font-size: 16px;
    color: #888;
    margin-right: 10px;
}
  
  .main-content {
    flex: 1;
  padding: 80px 30px 30px 240px;
  margin-left: 20px; /* thêm dòng này */
  overflow-y: auto;
  display: flex;
  justify-content: center;
  }
  .menu-item:hover {
  background-color: #ffd6dc;
  border-radius: 6px;
}

.menu-item.dashboard:hover {
  background-color: unset;
  border-radius: unset;
}
.menu-item.dashboard .arrow {
  display: none;
}

.dashboard {
  padding: 40px 20px;
  background-color: #f8f9fa;
  display: flex;
  flex-direction: column;
  align-items: center;
  max-width: 900px;
  width: 100%;
}

.menu-item.active {
  background-color: #ffb6c1; 
  font-weight: 600;
  color: #5c4033;
  border-radius: 6px;
}

.menu-item.active .arrow {
  color: #5c4033;
}

.stats {
  display: flex;
  gap: 20px;
  justify-content: center;
  flex-wrap: wrap;
  max-width: 800px;
}

.stat-card {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  padding: 20px;
  width: 250px;
  text-align: center;
  transition: box-shadow 0.3s, transform 0.3s;
}

/* Hiệu ứng khi rê chuột vào */
.stat-card:hover {
  box-shadow: 0 4px 12px rgba(0,0,0,0.2);
  transform: translateY(-4px);
}

.orange { border-top: 5px solid orange; }
.purple { border-top: 5px solid purple; }
.green  { border-top: 5px solid green; }

.product-list {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* đúng 3 sản phẩm mỗi hàng */
  gap: 20px;
  max-width: 1200px;
  margin: 0 auto;
  padding: 40px 20px;
  box-sizing: border-box;
}

/* Card sản phẩm */
.product-card {
  width: 260px;           
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  overflow: hidden;
  transition: transform 0.3s, box-shadow 0.3s;
  text-align: center;
  padding: 20px;
  display: flex;
  flex-direction: column;
}

.product-card:hover {
  box-shadow: 0 4px 12px rgba(0,0,0,0.2);
  transform: translateY(-4px);
}

.product-img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.product-info {
  padding: 20px;
  flex: 1;
}

.product-name {
  font-size: 18px;
  font-weight: bold;
  color: #5c4033;
  margin-bottom: 10px;
}

.product-desc {
  font-size: 14px;
  color: #555;
  margin-bottom: 10px;
}

.product-meta {
  display: flex;
  justify-content: space-between;
  font-size: 14px;
  font-weight: 600;
  color: #dc3545;
  margin-bottom: 10px;
}

.product-actions {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.edit-btn, .delete-btn {
  padding: 6px 12px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  font-size: 14px;
}

.edit-btn {
  background-color: #ffc107;
  color: #333;
}

.delete-btn {
  background-color: #dc3545;
  color: #fff;
}
/*css quan lý đơn hàng */
.order-section {
  padding: 20px;
  max-width: 1100px;   /* thu nhỏ chút để nằm gọn giữa */
  margin: 20px auto;   /* cách header 1 chút + căn giữa */
}

/* Thanh filter */
.filter-bar {
  display: flex;
  gap: 12px;
  margin-bottom: 20px;
  justify-content: flex-start;
  align-items: center;
}

.filter-bar input,
.filter-bar select {
  padding: 8px 12px;
  border-radius: 8px;      /* bo góc mềm hơn tí */
  border: 1px solid #ddd;
  background: #fff;
}

.refresh-btn {
  padding: 8px 12px;
  border: none;
  background-color: #ffebf0; /* hơi hồng hợp theme */
  border-radius: 8px;
  cursor: pointer;
}

/* Bảng đơn hàng */
.order-table {
  width: 100%;
  border-collapse: collapse;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
  overflow: hidden;
}

.order-table th,
.order-table td {
  padding: 16px 20px;
  text-align: center;
  border-bottom: 1px solid #eee;
}

.order-table th {
  background-color: #fff6f4;  /* xíu hồng nhẹ cho hợp sidebar */
  font-weight: bold;
}

/* Hover dòng trong bảng (khi có dữ liệu sẽ thấy rõ) */
.order-table tbody tr:hover {
  background-color: #fff9f7;
}
</style>