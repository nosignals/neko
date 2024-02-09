<h1 align="center">
  <img src="https://raw.githubusercontent.com/nosignals/neko/main/img/neko.png" alt="neko" width="500">
</h1>

<p align="center">
	<a target="_blank" href="#">
   <img src="https://img.shields.io/github/downloads/nosignals/neko/total?label=Total%20Download&labelColor=blue">
 </a>
</p>

<p align="center">
  XRAY/V2ray, Shadowsocks, ShadowsocksR, etc.</br>
  Mihomo based Proxy
</p>

Input Theme
---
1. Fork this Repository with All Branch
2. change ` [data-bs-theme=[theme name]_[author]] `
   - ex ` [data-bs-theme=neko_nosignal] `
3. Rename your CSS theme with format `[theme name]_[author].css`
   - ex ` neko_nosignal.css `
4. Push our theme to Repository on this branch
5. Pull request
6. Wait to accept
7. done

Neko Theme Structure
---
- ### Theme Location
  - Linux-Generic ` /home/host/.neko/www/nekoclash/assets/theme/ `
  - OpenWrt ` /www/nekoclash/assets/theme/ `
- ### Structure
![image](https://github.com/nosignals/neko/assets/53216409/1922e3de-7370-4a9e-a0c5-b66dd78dddff)
  1. [Background Color](#background-color)
  2. [Secondary Background Color](#secondary-background-color)
  3. [Border Container](#border-container)
  4. [Button Success](#button-success)
  5. [Border Form Control](#border-form-control)
  6. [Button Danger](#button-danger)
  7. [Button Warning](#button-warning)

Neko Theme CSS
---
- ### Background Color
  - ` --bs-body-bg `
```css
[data-bs-theme=dark]{
  color-scheme: dark;
  --bs-body-bg: #424963;
  ...
}
```
- ### Secondary Background Color
  - ` --bs-secondary-bg-subtle `
  - append at ` container-bg ` class
  - example behind is a Secondary Color Pointed to ` table, container-bg, and form-control `
```css
[data-bs-theme=dark]{
  color-scheme: dark;
  --bs-secondary-bg-subtle: #424963;
  ...
  .table {
    --bs-table-bg:var(--bs-secondary-bg-subtle);
  }
  .container-bg {
    background:var(--bs-secondary-bg-subtle);
  }
  .form-control {
    background-color: var(--bs-secondary-bg-subtle);
    border-color: black;
  }
}
```
- ### Border Container
  - ` --bs-secondary-bg-subtle `
  - on ` border ` class
```css
[data-bs-theme=dark]{
  color-scheme: dark;
  --bs-border-color: #dee2e6;
}
```
- ### Button Success
  - on ` btn-outline-success btn-success ` class
```css
[data-bs-theme=dark]{
  color-scheme: dark;
  ...

  .btn-outline-success {
    --bs-btn-color: #198754;
    --bs-btn-border-color: #198754;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #198754;
    --bs-btn-hover-border-color: #198754;
    --bs-btn-focus-shadow-rgb: 25,135,84;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #198754;
    --bs-btn-active-border-color: #198754;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #198754;
    --bs-btn-disabled-bg: transparent;
    --bs-btn-disabled-border-color: #198754;
    --bs-gradient: none;
  }
  .btn-success {
    --bs-btn-color: #fff;
    --bs-btn-bg: #198754;
    --bs-btn-border-color: #198754;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #157347;
    --bs-btn-hover-border-color: #146c43;
    --bs-btn-focus-shadow-rgb: 60,153,110;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #146c43;
    --bs-btn-active-border-color: #13653f;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #198754;
    --bs-btn-disabled-border-color: #198754;
  }
}
```
- ### Border Form Control
  - ` border-color `
  - on ` form-control ` class
```css
[data-bs-theme=dark]{
  color-scheme: dark;
  ...
  .form-control {
    background-color: var(--bs-secondary-bg-subtle);
    border-color: black;
  }
}
```
- ### Button Danger
  - on ` btn-outline-danger btn-danger ` class
```css
[data-bs-theme=dark]{
  color-scheme: dark;
  ...
  .btn-outline-danger {
    --bs-btn-color: #dc3545;
    --bs-btn-border-color: #dc3545;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #dc3545;
    --bs-btn-hover-border-color: #dc3545;
    --bs-btn-focus-shadow-rgb: 220,53,69;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #dc3545;
    --bs-btn-active-border-color: #dc3545;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #dc3545;
    --bs-btn-disabled-bg: transparent;
    --bs-btn-disabled-border-color: #dc3545;
    --bs-gradient: none;
 }
  .btn-danger {
    --bs-btn-color: #fff;
    --bs-btn-bg: #dc3545;
    --bs-btn-border-color: #dc3545;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #bb2d3b;
    --bs-btn-hover-border-color: #b02a37;
    --bs-btn-focus-shadow-rgb: 225,83,97;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #b02a37;
    --bs-btn-active-border-color: #a52834;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #dc3545;
    --bs-btn-disabled-border-color: #dc3545;
 }
}
```
- ### Button Warning
  - on ` btn-warning ` class
```css
[data-bs-theme=dark]{
  color-scheme: dark;
  ...
  .btn-warning {
    --bs-btn-color: #000;
    --bs-btn-bg: #ffc107;
    --bs-btn-border-color: #ffc107;
    --bs-btn-hover-color: #000;
    --bs-btn-hover-bg: #ffca2c;
    --bs-btn-hover-border-color: #ffc720;
    --bs-btn-focus-shadow-rgb: 217,164,6;
    --bs-btn-active-color: #000;
    --bs-btn-active-bg: #ffcd39;
    --bs-btn-active-border-color: #ffc720;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #000;
    --bs-btn-disabled-bg: #ffc107;
    --bs-btn-disabled-border-color: #ffc107;
 }
}
```
## Example theme, you can check on Theme Directory

