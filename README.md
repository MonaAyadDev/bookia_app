# bookia_app
## ✨ Key Features

- 🌓 **Dual Theme Support**: Light & Dark mode designed for optimal reading and browsing experiences.
- 🌐 **Multi-Language (Localization)**: Complete RTL & LTR layout support (Arabic & English).
- 🔐 **Authentication Flow**: User onboarding, login, registration, and password recovery interfaces.
- 📱 **Responsive Design**: Screen utility integration for pixel-perfect layout across various device sizes.

---

## 📱 App Screenshots
| Screen | Arabic (RTL) | English (LTR) |
| :--- | :---: | :---: |
| **Code** | <img src="screen/code.png" width="500"/>
| **Key bordtype** | <img src="screen/keybord_type.png" width="200"/> |
| **pass_fild** | <img src="screen/pass_fild.png" width="200"/> 


### 🎨 Theme & Onboarding Preview

| Light Theme | Dark Theme |
| :---: | :---: |
| <img src="screen/welcomeLight.png" width="250"/> <br> **Welcome (Light)** | <img src="screen/welcomeDark.png" width="250"/> <br> **Welcome (Dark)** |
| <img src="screen/loginLAr.png" width="250"/> <br> **Login - Arabic** | <img src="screen/loginD.png" width="250"/> <br> **Login - Dark** |

---

### 🌐 Screen Gallery

#### ☀️ Light Mode
| Screen | Arabic (RTL) | English (LTR) |
| :--- | :---: | :---: |
| **Welcome** | <img src="screen/welcomeLight.png" width="200"/> | <img src="screen/darkWelcomEn.png" width="200"/> |
| **Login** | <img src="screen/loginLAr.png" width="200"/> | <img src="screen/loginLEn.png" width="200"/> |
| **Register** | <img src="screen/registerLAr.png" width="200"/> | <img src="screen/registerLEn.png" width="200"/> |

#### 🌙 Dark Mode
| Screen | Dark (Arabic) | Dark (English) |
| :--- | :---: | :---: |
| **Welcome** | <img src="screen/welcomeDark.png" width="200"/> | <img src="screen/darkWelcomEn.png" width="200"/> |
| **Login** | <img src="screen/loginDAr.png" width="200"/> | <img src="screen/loginD.png" width="200"/> |
| **Register** | <img src="screen/registerDAr.png" width="200"/> | <img src="screen/registerD.png" width="200"/> |

---
A new Flutter project.
## Code Generation Commands

### 1. Run Build Runner
لتوليد الأصول والملفات التلقائية ومسح أي تعارضات سابقة:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 2. Generate Localization Keys
لتوليد مفاتيح الترجمة من ملفات `ar.json` و `en.json`:
```bash
dart run easy_localization:generate --source-dir ./assets/translation -f keys -o locale_keys.g.dart -o lib/gen
```