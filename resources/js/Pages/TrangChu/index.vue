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
            <ul>
  <li class="menu-item dashboard" @click="currentView = 'dashboard'">
    <span>Bảng điều khiển</span><span class="arrow">></span>
  </li>
  <li class="menu-item" @click="currentView = 'products'">
    <span>Sản phẩm</span><span class="arrow">></span>
  </li>
  <li class="menu-item" @click="currentView = 'orders'">
    <span>Đơn hàng</span><span class="arrow">></span>
  </li>
  <li class="menu-item" @click="currentView = 'customers'">
    <span>Khách hàng</span><span class="arrow">></span>
  </li>
  <li class="menu-item" @click="currentView = 'promotions'">
    <span>Khuyến mãi</span><span class="arrow">></span>
  </li>
  <li class="menu-item" @click="currentView = 'settings'">
    <span>Cài đặt</span><span class="arrow">></span>
  </li>
</ul>

</ul>

        </nav>
      </aside>
  
      <!-- Main Content -->
      <main class="main-content">
        <div class="content">
          <div v-if="currentView === 'dashboard'">
        </div>

        <div v-if="currentView === 'products'">
          <h2>Quản lý sản phẩm</h2>
        </div>

        <div v-if="currentView === 'orders'">
          <h2>Quản lý đơn hàng</h2>
        </div>

        <div v-if="currentView === 'customers'">
          <h2>Quản lý khách hàng</h2>
        </div>

        <div v-if="currentView === 'promotions'">
          <h2>Khuyến mãi</h2>
        </div>

        <div v-if="currentView === 'settings'">
          <h2>Cài đặt hệ thống</h2>
        </div>
</div>
      </main>
    </div>
  </template>
  
  <script setup>
  // Nếu bạn dùng Vue Router, router-view sẽ hiển thị nội dung từng trang
  import { ref } from 'vue'

const currentView = ref('dashboard')
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
    padding: 80px 30px 30px 250px;
    overflow-y: auto;
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

  </style>
  