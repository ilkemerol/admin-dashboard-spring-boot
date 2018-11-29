<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/admin/adminSidebar.css">
<div class="page-wrapper chiller-theme">
    <a id="show-sidebar" class="btn btn-sm btn-dark">
        <i class="fas fa-bars" style="font-size: 16px;"></i>
    </a>
    <nav id="sidebar" class="sidebar-wrapper" style="font-size: 12px;">
        <div class="sidebar-content">
            <div class="sidebar-brand">
                <a href="#">admin panel</a>
                <div id="close-sidebar">
                    <i class="fas fa-times"></i>
                </div>
            </div>
            <div class="sidebar-header">
                <div class="user-pic">
                    <img class="img-responsive img-rounded" src="/resources/images/user.png" alt="User picture">
                </div>
                <div class="user-info">
                    <span class="user-name">Name
                        <strong>Surname</strong>
                    </span>
                    <span class="user-role">Administrator</span>
                    <span class="user-status">
                        <i class="fa fa-circle"></i>
                        <span>Active</span>
                    </span>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li class="header-menu">
                        <span>Genel</span>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-tachometer-alt"></i>
                            <span style="font-weight: 900;">Paneller</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                            	<li>
                                    <a href="/admin/companyPanel">Kurumsal Firma Paneli</a>
                                </li>
                                <li>
                                    <a href="/admin/stockPanel">Ürün Paneli</a>
                                </li>
                                <li>
                                    <a href="#">Calisan Paneli</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="header-menu">
                        <span>Hızlı Erişim</span>
                    </li>
                    <li>
                        <a href="/admin/companyPanel?companyAdd">
                            <i class="far fa-edit"></i>
                            <span style="font-weight: 900;">Firma Ekle</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/stockPanel?stockAdd">
                            <i class="fas fa-cloud-upload-alt"></i>
                            <span style="font-weight: 900;">Ürün Ekle</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-upload"></i>
                            <span style="font-weight: 900;">Calısan Ekle</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="sidebar-footer" style="min-height: 50px;">
            <!-- <a href="#">
                <i class="fas fa-check-square" style="padding: 10px 0px 10px 0px;"></i>
                <span class="badge badge-pill badge-success notification">3</span>
            </a>
            <a href="#">
                <i class="fas fa-circle-notch" style="padding: 10px 0px 10px 0px;"></i>
                <span class="badge badge-pill badge-warning notification">7</span>
            </a>
            <a href="#">
                <i class="fas fa-times" style="padding: 10px 0px 10px 0px;"></i>
                <span class="badge badge-pill badge-danger notification">5</span>
            </a> -->
            <a href="#">
                <i class="fa fa-power-off" style="padding: 10px 0px 10px 0px;"></i>
            </a>
        </div>
    </nav>
</div>
