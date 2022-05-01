<template lang="pug">
<div class="sidebar d-flex flex-column" style="height:100%">
    <nav class="navbar navbar-expand-lg navbar-light d-flex flex-lg-column">
        <a href="#">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expand="false" aria-label="Toggle Navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse w-100" id="navbarSupportedContent">
            <ul class="navbar-nav w-100 d-flex flex-sm-column justify-content-center align-self-center text-center">
            <li class="active py-3">
                <a href="javascript:;">
                <p><i class="fas fa-home fs-3"></i> <router-link to="/">หน้าหลัก</router-link></p>
                </a>
            </li>
            <li class="py-3">
                <a href="javascript:;">
                <p><i class="fas fa-shopping-basket fs-3"></i> <router-link to="/order">จัดการข้อมูลการสั่งซื้อ</router-link></p>
                </a>
            </li>
            <li class="py-3">
                <a href="javascript:;">
                <p><i class="fas fa-store fs-3"></i> <router-link to="/stock">จัดการข้อมูลสต็อก</router-link></p>
                </a>
            </li>
            <li class="py-3">
                <a href="javascript:;">
                <p><i class="fas fa-carrot fs-3"></i> <router-link to="/item">จัดการข้อมูลสินค้า</router-link></p>
                </a>
            </li>
             <li class="py-3">
                <a href="javascript:;">
                <p><i class="fas fa-tag fs-3"></i> <router-link to="/promotion">จัดการโปรโมชั่น</router-link></p>
                </a>
            </li>
            <li class="py-3">
                <a href="javascript:;">
                <p><i class="fas fa-address-card fs-3"></i> <router-link to="/customer">จัดการข้อมูลลูกค้า</router-link></p>
                </a>
            </li>
            <li class="py-3">
                <a href="javascript:;">
                <p><i class="fas fa-users-cog fs-3"></i> <router-link to="/admin">จัดการข้อมูลพนักงาน</router-link></p>
                </a>
            </li>
            <li class="py-3">
                <a href="javascript:;">
                <p><i class="fas fa-chart-bar fs-3"></i> <router-link to="/analysis">วิเคราะห์และสรุปผล</router-link></p>
                </a>
            </li>
            </ul>
      </div>
    </nav>
      
    </div>
</template>