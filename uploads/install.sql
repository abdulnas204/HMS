-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 21, 2017 at 12:52 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `creativeitem_bayanno_3.6_install`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

DROP TABLE IF EXISTS `accountant`;
CREATE TABLE IF NOT EXISTS `accountant` (
  `accountant_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`accountant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`) VALUES
(1, 'Mr. Admin', 'admin@example.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
CREATE TABLE IF NOT EXISTS `bed` (
  `bed_id` int(11) NOT NULL AUTO_INCREMENT,
  `bed_number` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` longtext NOT NULL COMMENT 'ward,cabin,ICU',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=unalloted;1=alloted',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bed_allotment`
--

DROP TABLE IF EXISTS `bed_allotment`;
CREATE TABLE IF NOT EXISTS `bed_allotment` (
  `bed_allotment_id` int(11) NOT NULL AUTO_INCREMENT,
  `bed_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `allotment_timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discharge_timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bed_allotment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank`
--

DROP TABLE IF EXISTS `blood_bank`;
CREATE TABLE IF NOT EXISTS `blood_bank` (
  `blood_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`blood_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `blood_bank`
--

INSERT INTO `blood_bank` (`blood_group_id`, `blood_group`, `status`) VALUES
(1, 'A+', '0 bags'),
(2, 'B+', '0 bags'),
(3, 'A-', '0 bags'),
(4, 'B-', '0 bags'),
(5, 'AB+', '0 bags'),
(6, 'AB-', '0 bags'),
(7, 'O+', '0 bags'),
(8, 'O-', '0 bags');

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor`
--

DROP TABLE IF EXISTS `blood_donor`;
CREATE TABLE IF NOT EXISTS `blood_donor` (
  `blood_donor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_donation_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`blood_donor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currency_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_report`
--

DROP TABLE IF EXISTS `diagnosis_report`;
CREATE TABLE IF NOT EXISTS `diagnosis_report` (
  `diagnosis_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'xray,blood test',
  `document_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'text,photo',
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `laboratorist_id` int(11) NOT NULL,
  PRIMARY KEY (`diagnosis_report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `profile` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
CREATE TABLE IF NOT EXISTS `email_template` (
  `email_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `task` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `instruction` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `form_element`
--

DROP TABLE IF EXISTS `form_element`;
CREATE TABLE IF NOT EXISTS `form_element` (
  `form_element_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `html` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` longtext COLLATE utf8_unicode_ci NOT NULL,
  `patient_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_entries` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `due_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  `vat_percentage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount_amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `laboratorist`
--

DROP TABLE IF EXISTS `laboratorist`;
CREATE TABLE IF NOT EXISTS `laboratorist` (
  `laboratorist_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`laboratorist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `phrase_id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `bengali` longtext COLLATE utf8_unicode_ci NOT NULL,
  `spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `arabic` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dutch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `polish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `german` longtext COLLATE utf8_unicode_ci NOT NULL,
  `french` longtext COLLATE utf8_unicode_ci NOT NULL,
  `italian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `russian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `portugese` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phrase_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=200 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `bengali`, `spanish`, `arabic`, `dutch`, `polish`, `german`, `french`, `italian`, `russian`, `portugese`) VALUES
(1, 'login', 'Login', 'লগইন', 'Iniciar Sesión', 'تسجيل الدخول', 'Login', 'Login', 'Einloggen', 'S''identifier', 'Login', 'Войти', 'Conecte-Se'),
(2, 'forgot_password', 'Forgot Password', 'পাসওয়ার্ড ভুলে গেছেন', '¿Has Olvidado Tu Contraseña', 'هل نسيت كلمة المرور', 'Wachtwoord vergeten', 'Nie pamiętam hasła', 'Passwort Vergessen', 'Mot De Passe Oublié', 'Ha Dimenticato La Password', 'Забыли пароль', 'Esqueceu Sua Senha'),
(3, 'reset_password', 'Reset Password', 'পাসওয়ার্ড রিসেট', 'Restablecer contraseña', 'إعادة تعيين كلمة المرور', 'Reset Password', 'Resetowanie hasła', 'Kennwort zurücksetzen', 'Réinitialiser mot de passe', 'Ripristino password', 'Сбросить пароль', 'Reset Password'),
(4, 'return_to_login_page', 'Return To Login Page', 'পাতা লগইন ফিরে', 'Volver a inicio página', 'العودة إلى تسجيل الدخول الصفحة', 'Keer terug naar Inlogpagina', 'Powrót do logowania Page', 'Zurück zur Anmeldeseite Seite', 'Return to Login page', 'Torna a Login Pagina', 'Вернуться на страницу входа', 'Retornar à página de login'),
(5, 'admin_dashboard', 'Admin Dashboard', 'অ্যাডমিন ড্যাশবোর্ড', 'Dashboard de administración', 'المشرف لوحة', 'Admin Dashboard', 'Panel administratora', 'Admin-Dashboard', 'Admin Dashboard', 'Admin Dashboard', 'Админ Панель', 'Admin Dashboard'),
(6, 'welcome', 'Welcome', 'স্বাগত', 'Bienvenida', 'ترحيب', 'Welkom', 'Powitanie', 'Willkommen', 'Bienvenue', 'Benvenuto', 'Добро пожаловать', 'Bem-vindo'),
(7, 'edit_profile', 'Edit Profile', 'প্রোফাইল সম্পাদনা করুন', 'Editar Perfil', 'تعديل الملف الشخصي', 'Profiel Bewerken', 'Edytuj Profil', 'Profil bearbeiten', 'Modifier le profil', 'Modifica profilo', 'Редактировать профиль', 'Editar Perfil'),
(8, 'change_password', 'Change Password', 'পাসওয়ার্ড পরিবর্তন করুন', 'Cambiar la contraseña', 'تغيير كلمة المرور', 'Wachtwoord wijzigen', 'Zmień hasło', 'Kennwort ändern', 'Changer le mot de passe', 'Cambiare la password', 'Сменить пароль', 'Alterar a senha'),
(9, 'dashboard', 'Dashboard', 'ড্যাশবোর্ড', 'Salpicadero', 'لوحة القيادة', 'Dashboard', 'Tablica rozdzielcza', 'Armaturenbrett', 'Tableau de bord', 'Cruscotto', 'Приборная панель', 'Painel de instrumentos'),
(10, 'department', 'Department', 'বিভাগ', 'Departamento', 'قسم', 'Afdeling', 'Dział', 'Abteilung', 'Département', 'Reparto', 'Отдел', 'Departamento'),
(11, 'doctor', 'Doctor', 'ডাক্তার', 'Médico', 'طبيب', 'Dokter', 'Lekarz', 'Arzt', 'Médecin', 'Medico', 'Врач', 'Médico'),
(12, 'patient', 'Patient', 'রোগী', 'Paciente', 'المريض', 'Patiënt', 'Pacjent', 'Patient', 'Patient', 'Paziente', 'Пациент', 'Paciente'),
(13, 'nurse', 'Nurse', 'নার্স', 'Enfermera', 'ممرضة', 'Verpleegster', 'Pielęgniarka', 'Krankenschwester', 'Infirmière', 'Infermiera', 'Медсестра', 'Enfermeira'),
(14, 'pharmacist', 'Pharmacist', 'কম্পউণ্ডার', 'Farmacéutico', 'صيدلي', 'Apotheker', 'Farmaceuta', 'Apotheker', 'Pharmacien', 'Farmacista', 'Фармацевт', 'Farmacêutico'),
(15, 'laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorio Unidad', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorista'),
(16, 'accountant', 'Accountant', 'হিসাবরক্ষক', 'Contador', 'محاسب', 'Accountant', 'Księgowy', 'Buchhalter', 'Comptable', 'Ragioniere', 'Бухгалтер', 'Contador'),
(17, 'monitor_hospital', 'Monitor Hospital', 'মনিটর হাসপাতালে', 'Hospital de monitor', 'مستشفى رصد', 'Monitor Ziekenhuis', 'Szpital monitora', 'Monitor-Krankenhaus', 'Hôpital Moniteur', 'Monitor Ospedale', 'Больница Monitor', 'Hospital do Monitor'),
(18, 'payment_history', 'Payment History', 'অর্থ প্রদান ইতিহাস', 'Historial de pagos', 'تاريخ الدفع', 'Betaalgeschiedenis', 'Historia płatności', 'Zahlungsverlauf', 'Historique des paiements', 'Cronologia pagamenti', 'История платежей', 'Histórico de pagamentos'),
(19, 'bed_allotment', 'Bed Allotment', 'বিছানা নাস্তা বরাদ্দ', 'Asignación de cama', 'السرير التخصيص', 'Bed Toewijzing', 'Łóżko Przydziału', 'Bed Zuteilung', 'Chambres surallocation', 'Bed Allotment', 'Кровать Выделение', 'Bed Loteamento'),
(20, 'blood_bank', 'Blood Bank', 'রক্তভাণ্ডার', 'Banco de sangre', 'بنك الدم', 'Bloedbank', 'Bank Krwi', 'Blutbank', 'Banque de sang', 'Banca del Sangue', 'Банк крови', 'Banco de sangue'),
(21, 'blood_donor', 'Blood Donor', 'রক্ত দাতার', 'Donante de sangre', 'المتبرعين بالدم', 'Blood Donor', 'Dawców Krwi', 'Blutspender', 'don de sang', 'Donatori di sangue', 'Донора крови', 'Doador de sangue'),
(22, 'medicine', 'Medicine', 'ঔষধ', 'Medicina', 'دواء', 'Geneeskunde', 'Medycyna', 'Medizin', 'Médecine', 'Medicina', 'Медицина', 'Medicina'),
(23, 'operation_report', 'Operation Report', 'অপারেশন রিপোর্ট', 'Operación Reportar', 'عملية تقرير', 'Operatie Report', 'Operacja Zgłoś', 'Betriebsbericht', 'Rapport d''opération', 'Rapporto Operazione', 'Операция Сообщить', 'Relatório de Operação'),
(24, 'birth_report', 'Birth Report', 'জন্ম রিপোর্ট', 'Informe Nacimiento', 'تقرير الميلاد', 'Geboorte Report', 'Zgłoś urodzenia', 'Geburt Bericht', 'Naissance Rapport', 'Nascita Rapporto', 'Сообщить о рождении', 'Relatório Nascimento'),
(25, 'death_report', 'Death Report', 'মৃত্যু রিপোর্ট', 'Informe de la Muerte', 'الموت تقرير', 'Dood Report', 'Śmierć Zgłoś', 'Tod Bericht', 'Rapport mort', 'Morte Relazione', 'Смерть Сообщить', 'Relatório Morte'),
(26, 'settings', 'Settings', 'সেটিংস', 'Ajustes', 'الإعدادات', 'Instellingen', 'Ustawienia', 'Einstellungen', 'Paramètres', 'Impostazioni', 'Настройки', 'Definições'),
(27, 'system_settings', 'System Settings', 'সিস্টেম সেটিংস', 'Configuración del sistema', 'إعدادات النظام', 'Systeeminstellingen', 'Ustawienia systemowe', 'Systemeinstellungen', 'Paramètres système', 'Impostazioni di sistema', 'Системные настройки', 'Configurações do sistema'),
(28, 'language_settings', 'Language Settings', 'ভাষা সেটিংস', 'Configuración de idioma', 'إعدادات اللغة', 'Taalinstellingen', 'Ustawienia języka', 'Spracheinstellungen', 'Paramètres de langue', 'Impostazioni lingua', 'Настройки языка', 'Definições de idioma'),
(29, 'account', 'Account', 'হিসাব', 'Cuenta', 'حساب', 'Rekening', 'Konto', 'Konto', 'Compte', 'Conto', 'Счет', 'Conta'),
(30, 'payment', 'Payment', 'প্রদান', 'Pago', 'دفع', 'Betaling', 'Płatność', 'Bezahlung', 'Paiement', 'Pagamento', 'Оплата', 'Pagamento'),
(31, 'delete', 'Delete', 'মুছে দিন', 'Borrar', 'حذف', 'Verwijderen', 'Usunąć', 'Löschen', 'Effacer', 'Cancellare', 'Удалять', 'Excluir'),
(32, 'cancel', 'Cancel', 'বাতিল', 'Cancelar', 'إلغاء', 'Annuleren', 'Anulować', 'Stornieren', 'Annuler', 'Cancellare', 'Отменить', 'Cancelar'),
(33, 'add_department', 'Add Department', 'বিভাগ যোগ করুন', 'Añadir Departamento', 'إضافة زارة', 'Toevoegen afdeling', 'Dodaj Działem', 'In Abteilung', 'Ajouter Département', 'Aggiungere Dipartimento', 'Добавить в отдел', 'Adicionar Departamento'),
(34, 'name', 'Name', 'নাম', 'Nombre', 'اسم', 'Naam', 'Nazwa', 'Name', 'Nom', 'Nome', 'Имя', 'Nome'),
(35, 'description', 'Description', 'বর্ণনা', 'Descripción', 'وصف', 'Beschrijving', 'Opis', 'Beschreibung', 'Description', 'Descrizione', 'Описание', 'Descrição'),
(36, 'options', 'Options', 'বিকল্প', 'Opciones', 'خيارات', 'Opties', 'Opcje', 'Optionen', 'Options', 'Opzioni', 'Опции', 'Opções'),
(37, 'add_doctor', 'Add Doctor', 'ডাক্তার যোগ করুন', 'Añadir Médico', 'إضافة طبيب', 'Voeg Doctor', 'Dodaj Doctor', 'Fügen Doktor', 'Ajouter Docteur', 'Aggiungi Dottore', 'Добавить доктор', 'Adicionar Doctor'),
(38, 'image', 'Image', 'ভাবমূর্তি', 'Imagen', 'صورة', 'Afbeelding', 'Obraz', 'Bild', 'Image', 'Immagine', 'Изображение', 'Imagem'),
(39, 'email', 'Email', 'ইমেল', 'Correo electrónico', 'البريد الإلكتروني', 'E-mail', 'E-mail', 'E-Mail', 'Email', 'Email', 'Email', 'Email'),
(40, 'address', 'Address', 'ঠিকানা', 'Dirección', 'عنوان', 'Adres', 'Adres', 'Anschrift', 'Adresse', 'Indirizzo', 'Адрес', 'Endereço'),
(41, 'phone', 'Phone', 'ফোন', 'Teléfono', 'هاتف', 'Telefoon', 'Telefon', 'Telefon', 'Téléphone', 'Telefono', 'Телефон', 'Telefone'),
(42, 'profile', 'Profile', 'প্রোফাইল', 'Perfil', 'الملف الشخصي', 'Profiel', 'Profil', 'Profil', 'Profil', 'Profilo', 'Профиль', 'Perfil'),
(43, 'edit_department', 'Edit Department', 'সম্পাদনা করুন বিভাগের', 'Editar Departamento', 'تحرير زارة', 'Afdeling bewerken', 'Edycja Wydział', 'Abteilung bearbeiten', 'Modifier Département', 'Modifica Dipartimento', 'Редактировать Департамент', 'Editar Departamento'),
(44, 'password', 'Password', 'পাসওয়ার্ড', 'Contraseña', 'كلمة المرور', 'Wachtwoord', 'Hasło', 'Passwort', 'Mot de passe', 'Password', 'Пароль', 'Senha'),
(45, 'select_department', 'Select Department', 'নির্বাচন বিভাগের', 'Seleccione Departamento', 'وزارة اختر', 'Afdeling Select', 'Wybierz Wydział', 'Wählen Sie die Abteilung', 'Sélectionnez Département', 'Selezionare Dipartimento', 'Выберите отдел', 'Selecionar Departamento'),
(46, 'edit_doctor', 'Edit Doctor', 'সম্পাদনা করুন ডাক্তার', 'Editar Médico', 'تحرير طبيب', 'Bewerk Doctor', 'Edycja Doktor', 'Bearbeiten Doktor', 'Modifier Docteur', 'Modifica Dottore', 'Редактировать доктор', 'Editar Doctor'),
(47, 'add_patient', 'Add Patient', 'রোগীর যোগ করুন', 'Añadir Paciente', 'إضافة المريض', 'Patient toevoegen', 'Dodaj pacjenta', 'Patient hinzufügen', 'Ajouter des patients', 'Aggiungi Paziente', 'Добавить пациент', 'Adicionar Patient'),
(48, 'sex', 'Sex', 'লিঙ্গ', 'Sexo', 'جنس', 'Geslacht', 'Seks', 'Sex', 'Sexe', 'Sesso', 'Секс', 'Sexo'),
(49, 'birth_date', 'Birth Date', 'জন্ম তারিখ', 'Fecha de nacimiento', 'تاريخ الولادة', 'Geboortedatum', 'Data urodzenia', 'Geburtsdatum', 'Date de naissance', 'Data di nascita', 'Дата рождения', 'Data de nascimento'),
(50, 'age', 'Age', 'বয়স', 'Edad', 'عمر', 'Leeftijd', 'Wiek', 'Alter', 'Âge', 'Età', 'Возраст', 'Idade'),
(51, 'blood_group', 'Blood Group', 'রক্তের গ্রুপ', 'Grupo sanguíneo', 'المجموعة الدم', 'Bloedgroep', 'Grupa krwi', 'Blutgruppe', 'Groupe sanguin', 'Gruppo sanguigno', 'Группа крови', 'Grupo sanguíneo'),
(52, 'select_sex', 'Select Sex', 'নির্বাচন সেক্স', 'Seleccionar sexo', 'اختر الجنس', 'Selecteer Sex', 'Wybierz Seks', 'Wählen Sex', 'Choisir le sexe', 'Seleziona Sex', 'Выберите Секс', 'Select Sex'),
(53, 'male', 'Male', 'পুরুষ', 'Masculino', 'ذكر', 'Mannelijk', 'Mężczyzna', 'Männlich', 'Mâle', 'Maschio', 'Мужчина', 'Masculino'),
(54, 'female', 'Female', 'মহিলা', 'Femenino', 'أنثى', 'Vrouwelijk', 'Żeński', 'Weiblich', 'Femelle', 'Femminile', 'Женщина', 'Feminino'),
(55, 'select_blood_group', 'Select Blood Group', 'রক্তের গ্রুপ নির্বাচন করুন', 'Seleccionar grupo sanguíneo', 'تحديد فصيلة الدم', 'Selecteer Blood Group', 'Wybierz grupę krwi', 'Wählen Sie Blutgruppe', 'Sélectionnez Groupe sanguin', 'Selezionare gruppo sanguigno', 'Выберите группу крови', 'Selecione Grupo Sanguíneo'),
(56, 'edit_patient', 'Edit Patient', 'সম্পাদনা করুন রোগীর', 'Editar paciente', 'تحرير المريض', 'Patiënt bewerken', 'Edycja pacjenta', 'Patient bearbeiten', 'Modifier des patients', 'Modifica paziente', 'Редактировать пациента', 'Editar Patient'),
(57, 'add_nurse', 'Add Nurse', 'নার্স যোগ করুন', 'Añadir Enfermera', 'إضافة ممرضة', 'Nurse Toevoegen', 'Dodaj Pielęgniarka', 'Nurse hinzufügen', 'Ajouter infirmière', 'Aggiungi Nurse', 'Добавить Медсестра', 'Adicionar Nurse'),
(58, 'edit_nurse', 'Edit Nurse', 'সম্পাদনা করুন নার্সের', 'Editar Enfermera', 'تحرير ممرضة', 'Verpleegster bewerken', 'Edycja Pielęgniarka', 'Nurse bearbeiten', 'Modifier infirmière', 'Modifica Nurse', 'Редактировать Медсестра', 'Editar Nurse'),
(59, 'add_pharmacist', 'Add Pharmacist', 'ফার্মাসিস্ট যোগ করুন', 'Añadir Farmacéutico', 'إضافة صيدلي', 'Voeg Apotheker', 'Dodaj Farmaceuty', 'Fügen Apotheker', 'Ajouter Pharmacien', 'Aggiungi Farmacista', 'Добавить Фармацевт', 'Adicionar Farmacêutico'),
(60, 'edit_pharmacist', 'Edit Pharmacist', 'সম্পাদনা করুন ফার্মাসিস্ট', 'Editar Farmacéutico', 'تحرير صيدلي', 'Bewerk Apotheker', 'Edycja Farmaceuta', 'Bearbeiten Apotheker', 'Modifier Pharmacien', 'Modifica Farmacista', 'Редактировать Фармацевт', 'Editar Farmacêutico'),
(61, 'add_laboratorist', 'Add Laboratorist', 'Laboratorist যোগ করুন', 'Añadir Laboratorio Unidad', 'إضافة Laboratorist', 'Voeg Laboratorist', 'Dodaj Laboratorist', 'Fügen Laboratorist', 'Ajouter Laboratorist', 'Aggiungi Laboratorist', 'Добавить Laboratorist', 'Adicionar laboratorista'),
(62, 'edit_laboratorist', 'Edit Laboratorist', 'সম্পাদনা করুন Laboratorist', 'Edición de Laboratorio', 'تحرير Laboratorist', 'Bewerk Laboratorist', 'Edycja Laboratorist', 'Bearbeiten Laboratorist', 'Modifier Laboratorist', 'Modifica Laboratorist', 'Редактировать Laboratorist', 'Editar laboratorista'),
(63, 'add_accountant', 'Add Accountant', 'একাউন্টেন্ট যোগ করুন', 'Añadir Contador', 'إضافة محاسب', 'Voeg Accountant', 'Dodaj Accountant', 'Fügen Accountant', 'Ajouter comptable', 'Aggiungi Accountant', 'Добавить бухгалтера', 'Adicionar Contador'),
(64, 'edit_accountant', 'Edit Accountant', 'সম্পাদনা করুন একাউন্টেন্ট', 'Editar Contador', 'تحرير محاسب', 'Bewerk Accountant', 'Edycja Księgowy', 'Bearbeiten Accountant', 'Modifier comptable', 'Modifica Accountant', 'Редактировать Бухгалтер', 'Editar Contador'),
(65, 'invoice_number', 'Invoice Number', 'চালান নম্বর', 'Número de factura', 'رقم الفاتورة', 'Factuurnummer', 'Numer faktury', 'Rechnungsnummer', 'Numéro de facture', 'Numero fattura', 'Номер счета', 'Número da Fatura'),
(66, 'title', 'Title', 'খেতাব', 'Título', 'لقب', 'Titel', 'Tytuł', 'Titel', 'Titre', 'Titolo', 'Название', 'Título'),
(67, 'creation_date', 'Creation Date', 'তৈরির তারিখ', 'Fecha de creación', 'تاريخ الأنشاء', 'Creation Date', 'Data utworzenia', 'Erstellungsdatum', 'Date de création', 'Data di creazione', 'Дата создания', 'Data de Criação'),
(68, 'due_date', 'Due Date', 'দরুন জন্ম', 'Fecha de vencimiento', 'تاريخ الاستحقاق', 'Vervaldag', 'Due Date', 'Fälligkeitsdatum', 'Date d''échéance', 'Scadenza', 'Срок Оплаты', 'Data de vencimento'),
(69, 'vat_percentage', 'Vat Percentage', 'ভ্যাট শতাংশ', 'Vat Porcentaje', 'ضريبة القيمة المضافة النسبة المئوية', 'Vat Percentage', 'Procentowy vat', 'Mehrwertsteuersatz', 'Vat Pourcentage', 'Iva Percentuale', 'НДС в процентах', 'Vat Percentual'),
(70, 'discount_amount', 'Discount Amount', 'ডিসকাউন্ট পরিমাণ', 'Cantidad de Descuento', 'مقدار الخصم', 'Korting Bedrag', 'Kwota z rabatem', 'Rabatt Menge', 'Montant de la remise', 'Importo Sconto', 'Сумма скидки', 'Quantidade de desconto'),
(71, 'status', 'Status', 'অবস্থা', 'Estado', 'وضع', 'Toestand', 'Status', 'Status', 'Statut', 'Stato', 'Статус', 'Estado'),
(72, 'bed_number', 'Bed Number', 'বিছানা নাস্তা সংখ্যা', 'Número de cama', 'عدد السرير', 'Bed Aantal', 'Ilość łóżko', 'Bed Anzahl', 'Nombre de lit', 'Number Bed', 'Кровать Количество', 'Número Bed'),
(73, 'bed_type', 'Bed Type', 'বিছানা নাস্তা প্রকার', 'Tipo Bed', 'نوع السرير', 'Bed Type', 'Rodzaj łóżka', 'Bettentyp', 'Type de lit', 'Tipo di letto', 'Кровать Тип', 'Tipo de cama'),
(74, 'allotment_time', 'Allotment Time', 'বরাদ্দ সময়', 'Asignación Tiempo', 'تخصيص وقت', 'Toewijzing Tijd', 'Przydział czasu', 'Zuteilungszeit', 'Lotissement Temps', 'Allotment Tempo', 'Выделение Время', 'Loteamento Tempo'),
(75, 'discharge_time', 'Discharge Time', 'সময় যখন স্রাব', 'Tiempo de descarga', 'تصريف الوقت', 'Kwijting Tijd', 'Czas rozładowania', 'Entladezeit', 'Temps de décharge', 'Scarico Tempo', 'Время разряда', 'Quitação Tempo'),
(76, 'issue_date', 'Issue Date', 'ইস্যু তারিখ', 'Fecha de asunto', 'تاريخ الإصدار', 'Uitgiftedatum', 'Data wydania', 'Ausgabetag', 'Date d''émission', 'Data di emissione', 'Дата выпуска', 'Data de emissão'),
(77, 'payment_to', 'Payment To', 'পেমেন্ট', 'Pago Para', 'دفع ل', 'Betaling aan', 'Płatność Do', 'Zahlung Um', 'Pour le paiement', 'Pagamento A', 'Оплата Для', 'Pagamento Para'),
(78, 'bill_to', 'Bill To', 'বিল', 'Cobrar a', 'مشروع قانون ل', 'Bill Om', 'Bill', 'Gesetzesentwurf für', 'Facturer', 'Disegno di legge per', 'Плательщик', 'Projeto de lei para'),
(79, 'invoice_entries', 'Invoice Entries', 'চালান দাখিলা', 'Entradas Factura', 'فاتورة مقالات', 'Factuur Entries', 'Faktura Wpisy', 'Rechnungs Einträge', 'Entrées facture', 'Voci della fattura', 'Счет-фактура Записи', 'Fatura Entries'),
(80, 'entry', 'Entry', 'প্রবেশ', 'Entrada', 'دخول', 'Binnenkomst', 'Wejście', 'Eintrag', 'Entrée', 'Ingresso', 'Запись', 'Entrada'),
(81, 'price', 'Price', 'মূল্য', 'Precio', 'السعر', 'Prijs', 'Cena', 'Preis', 'Prix', 'Prezzo', 'Цена', 'Preço'),
(82, 'sub_total', 'Sub Total', 'উপ মোট', 'Sub Total', 'المجموع الفرعي', 'Subtotaal', 'Sub Razem', 'Zwischensumme', 'Sous-total', 'Sub Total', 'Промежуточный итог', 'Subtotal'),
(83, 'discount', 'Discount', 'ডিসকাউন্ট', 'Descuento', 'خصم', 'Korting', 'Zniżka', 'Rabatt', 'Rabais', 'Sconto', 'Скидка', 'Desconto'),
(84, 'grand_total', 'Grand Total', 'সর্বমোট', 'Gran Total', 'المجموع الإجمالي', 'Algemeen totaal', 'Suma całkowita', 'Gesamtsumme', 'Total', 'Somma totale', 'Общий Итог', 'Total Geral'),
(85, 'date', 'Date', 'তারিখ', 'Fecha', 'تاريخ', 'Datum', 'Data', 'Datum', 'Date', 'Data', 'Дата', 'Data'),
(86, 'amount', 'Amount', 'পরিমাণ', 'Cantidad', 'كمية', 'Bedrag', 'Ilość', 'Höhe', 'Montant', 'Importo', 'Количество', 'Quantidade'),
(87, 'method', 'Method', 'পদ্ধতি', 'Método', 'طريقة', 'Methode', 'Metoda', 'Verfahren', 'Méthode', 'Metodo', 'Метод', 'Método'),
(88, 'last_donation_date', 'Last Donation Date', 'গত রক্তদান তারিখ', 'Última Donación Fecha', 'التبرع آخر تاريخ للمشاركة', 'Laatste Donatie Date', 'Ostatni Darowizna Data', 'Letzte Donation Datum', 'Dernière date don', 'Ultimo Donazione Data', 'Последнее Пожертвование Дата', 'Última Doação Data'),
(89, 'medicine_category', 'Medicine Category', 'মেডিসিন বিভাগ', 'Medicina Categoría', 'الطب الفئة', 'Geneeskunde Categorie', 'Medycyna Kategoria', 'Medizin Kategorie', 'Médecine Catégorie', 'Medicina Categoria', 'Медицина Категория', 'Medicina Categoria'),
(90, 'manufacturing_company', 'Manufacturing Company', 'ম্যানুফ্যাকচারিং কোম্পানি', 'Empresa de Produccion', 'شركة تصنيع', 'Manufacturing Company', 'Firma Produkcyjna', 'Manufacturing Company', 'Société de fabrication', 'Azienda manifatturiera', 'Производственная фирма', 'Manufacturing Company'),
(91, 'system_name', 'System Name', 'সিস্টেম নাম', 'Nombre del sistema', 'اسم النظام', 'System Name', 'Name System', 'System Name', 'Name System', 'Nome Sistema', 'Name System', 'Name System'),
(92, 'system_title', 'System Title', 'সিস্টেম শিরোনাম', 'Sistema Título', 'نظام العنوان', 'Systeem Titel', 'Tytuł systemu', 'System-Titel', 'Système Titre', 'Sistema Titolo', 'Система Название', 'Sistema de Título'),
(93, 'paypal_email', 'Paypal Email', 'PayPal এর ইমেইল', 'PayPal Correo electrónico', 'باي بال البريد الإلكتروني', 'Paypal E-mail', 'Paypal email', 'Paypal E-Mail', 'Paypal Email', 'Paypal Email', 'Paypal Email', 'Paypal Email'),
(94, 'currency', 'Currency', 'মুদ্রা', 'Moneda', 'عملة', 'Valuta', 'Waluta', 'Währung', 'Monnaie', 'Valuta', 'Валюта', 'Moeda'),
(95, 'system_email', 'System Email', 'সিস্টেম ইমেল', 'Sistema electrónico', 'نظام البريد الإلكتروني', 'Systeem E-mail', 'System E-mail', 'System-E-Mail', 'Système Email', 'Sistema Email', 'Система E-mail', 'Sistema de E-mail'),
(96, 'buyer', 'Buyer', 'ক্রেতা', 'Comprador', 'مشتر', 'Koper', 'Kupujący', 'Käufer', 'Acheteur', 'Compratore', 'Покупатель', 'Comprador'),
(97, 'value_required', 'Value Required', 'মূল্য প্রয়োজনীয়', 'Valor Obligatorio', 'القيمة المطلوبة', 'Value Required', 'Wartość Wymagany', 'Wert Erforderlich', 'Valeur Obligatoire', 'Valore Obbligatorio', 'Значение Обязательный', 'Valor Obrigatório'),
(98, 'purchase_code', 'Purchase Code', 'ক্রয় কোড', 'Código de Compra', 'كود شراء', 'Aankoop Code', 'Zakup Code', 'Kauf-Code', 'Code d''Achat', 'Codice di acquisto', 'Покупка код', 'Código de Compra'),
(99, 'language', 'Language', 'ভাষা', 'Idioma', 'لغة', 'Taal', 'Język', 'Sprache', 'Langue', 'Lingua', 'Язык', 'Língua'),
(100, 'text_align', 'Text Align', 'টেক্সট সারিবদ্ধ', 'Texto Alinear', 'محاذاة النص', 'Tekst uitlijnen', 'Tekst Wyrównaj', 'Text Align', 'Text Align', 'Testo Allinea', 'Text Align', 'Texto Align'),
(101, 'save', 'Save', 'সংরক্ষণ করুন', 'Guardar', 'حفظ', 'Opslaan', 'Zapisz', 'Speichern', 'Enregistrer', 'Salva', 'Сохранить', 'Salvar'),
(102, 'manage_language', 'Manage Language', 'ভাষা পরিচালনা', 'Administrar Idioma', 'إدارة اللغة', 'Beheer Taal', 'Zarządzaj język', 'Sprache verwalten', 'Gérer Langue', 'Gestisci Lingua', 'Управление языками', 'Gerenciar Idioma'),
(103, 'phrase_list', 'Phrase List', 'শব্দবন্ধ তালিকা', 'Lista Frase', 'قائمة العبارة', 'Uitdrukking Lijst', 'Lista zdanie', 'Phrasenliste', 'Liste phrase', 'Lista Frase', 'Фраза Список', 'Lista Frase'),
(104, 'add_phrase', 'Add Phrase', 'শব্দবন্ধ যোগ করুন', 'Añadir Frase', 'إضافة العبارة', 'Uitdrukking toe te voegen', 'Dodaj wyrażenie', 'Ausdruck hinzufügen', 'Ajouter Phrase', 'Aggiungi Frase', 'Добавить фразу', 'Adicionar Frase'),
(105, 'add_language', 'Add Language', 'ভাষা যোগ করা', 'Agregar idioma', 'إضافة اللغة', 'Voeg Taal', 'Dodaj język', 'Sprache hinzufügen', 'Ajouter une langue', 'Aggiungi lingua', 'Добавить язык', 'Adicionar idioma'),
(106, 'option', 'Option', 'পছন্দ', 'Opción', 'خيار', 'Optie', 'Opcja', 'Option', 'Option', 'Opzione', 'Опция', 'Opção'),
(107, 'edit_phrase', 'Edit Phrase', 'সম্পাদনা করুন শব্দবন্ধ', 'Editar Frase', 'تحرير العبارة', 'Phrase bewerken', 'Edycja wyrażenie', 'Phrase bearbeiten', 'Modifier Phrase', 'Modifica Frase', 'Редактировать Фраза', 'Editar Frase'),
(108, 'delete_language', 'Delete Language', 'ভাষা মুছে দিন', 'Eliminar Idioma', 'حذف اللغة', 'Verwijderen Taal', 'Usuń język', 'Sprache löschen', 'Supprimer Langue', 'Elimina Lingua', 'Удалить Язык', 'Excluir Idioma'),
(109, 'phrase', 'Phrase', 'বাক্য', 'Frase', 'العبارة', 'Uitdrukking', 'Zwrot', 'Ausdruck', 'Phrase', 'Frase', 'Фраза', 'Frase'),
(110, 'update_phrase', 'Update Phrase', 'আপডেট শব্দবন্ধ', 'Actualización Frase', 'تحديث العبارة', 'Phrase-update', 'Aktualizacja wyrażenie', 'Update-Satz', 'Mise à jour Phrase', 'Aggiornamento Frase', 'Обновление Фраза', 'Atualização Frase'),
(111, 'manage_profile', 'Manage Profile', 'লগ', 'Administrar perfil', 'إدارة الملف', 'Profiel beheren', 'Zarządzaj profilu', 'Profil verwalten', 'Gérer le profil', 'Gestisci profilo', 'Управление профиля', 'Gerenciar perfil'),
(112, 'update_profile', 'Update Profile', 'প্রোফাইল আপডেট করুন', 'Perfil de actualización', 'تحديث الملف الشخصي', 'Profiel bijwerken', 'Aktualizacja profilu', 'Profil aktualisieren', 'Mise à jour le profil', 'Aggiorna profilo', 'Обновление профиля', 'Atualizar Perfil'),
(113, 'current_password', 'Current Password', 'বর্তমান পাসওয়ার্ড', 'Contraseña Actual', 'كلمة المرور الحالية', 'Huidig ​​wachtwoord', 'Aktualny Hasło', 'Aktuelles Passwort', 'Mot de passe actuel', 'Password attuale', 'Текущий пароль', 'Senha atual'),
(114, 'new_password', 'New Password', 'নতুন পাসওয়ার্ড', 'Nueva contraseña', 'كلمة المرور الجديدة', 'Nieuw wachtwoord', 'Nowe hasło', 'Neues Passwort', 'Nouveau mot de passe', 'Nuova password', 'Новый пароль', 'Nova Senha'),
(115, 'confirm_new_password', 'Confirm New Password', 'পাসওয়ার্ড', 'Confirmar nueva contraseña', 'تأكيد كلمة السر الجديدة', 'Nieuw wachtwoord bevestigen', 'Potwierdź nowe hasło', 'Neues Passwort bestätigen', 'Confirmer le nouveau mot de passe', 'Conferma nuova password', 'Подтвердите новый пароль', 'Confirmar nova senha'),
(116, 'update_password', 'Update Password', 'আপডেট পাসওয়ার্ড', 'Actualizar contraseña', 'تحديث كلمة المرور', 'Wachtwoord bijwerken', 'Zaktualizuj hasło', 'Passwort aktualisieren', 'Mise à jour le mot de passe', 'Aggiorna password', 'Обновление Пароль', 'Atualizar Senha'),
(117, 'profile_info_updated_successfuly', 'Profile Info Updated Successfuly', 'প্রোফাইল তথ্য আপডেট করা হয়েছে Successfuly', 'Información del Perfil Actualizado exitosamente', 'الملف الشخصي تحديث معلومات بنجاح', 'Profiel Info Bijgewerkt Successfuly', 'Informacje o profilu Updated powodzeniem', 'Profil-Information aktualisiert Erfolgreicher', 'Info Profil Mise à jour avec succès', 'Profilo Info Aggiornato con successo', 'Профиль пользователя Обновлено успешно', 'Informações do Perfil Atualizado com sucesso'),
(118, 'doctor_dashboard', 'Doctor Dashboard', 'ডাক্তার ড্যাশবোর্ড', 'Médico Dashboard', 'الطبيب لوحة', 'Arts Dashboard', 'Doktor Dashboard', 'Doktor-Dashboard', 'Docteur Dashboard', 'Dottore Dashboard', 'Доктор Dashboard', 'Doctor Painel'),
(119, 'appointment', 'Appointment', 'এপয়েন্টমেন্ট', 'Nombramiento', 'موعد', 'Afspraak', 'Powołanie', 'Ernennung', 'Rendez-vous', 'Appuntamento', 'Назначение', 'Nomeação'),
(120, 'prescription', 'Prescription', 'প্রেসক্রিপশন', 'Receta', 'وصفة طبية', 'Recept', 'Recepta', 'Verschreibung', 'Prescription', 'Prescrizione', 'Рецепт', 'Prescrição'),
(121, 'report', 'Report', 'রিপোর্ট', 'Informe', 'تقرير', 'Rapport', 'Raport', 'Bericht', 'Rapport', 'Relazione', 'Отчет', 'Relatório'),
(122, 'appointment_schedule', 'Appointment Schedule', 'নিয়োগ সূচি', 'Programar una cita', 'جدول التعيين', 'Afspraak Schedule', 'Powołanie Harmonogram', 'Terminvereinbarung', 'Horaire de rendez-vous', 'Schedule Appuntamento', 'Расписание встреч', 'Marcar Nomeação'),
(123, 'add_appointment', 'Add Appointment', 'নিয়োগ যোগ করুন', 'Añadir cita', 'إضافة التعيين', 'Afspraak toevoegen', 'Dodaj Powoływanie', 'Neuer Termin', 'Ajouter Nomination', 'Aggiungi Appuntamento', 'Добавить Назначение', 'Adicionar Nomeação'),
(124, 'event_schedule', 'Event Schedule', 'অনুষ্ঠান সূচি', 'Calendario de eventos', 'جدول الحدث', 'Evenementenschema', 'Harmonogram zdarzeń', 'Veranstaltungstermine', 'Horaire de l''événement', 'Programma dell''evento', 'Расписание событий', 'Agenda de Eventos'),
(125, 'select_patient', 'Select Patient', 'নির্বাচন রোগীর', 'Seleccionar paciente', 'حدد المريض', 'Selecteer Patient', 'Wybierz pacjenta', 'Wählen Patient', 'Sélectionner un patient', 'Selezionare Paziente', 'Выберите пациента', 'Select Patient'),
(126, 'edit_appointment', 'Edit Appointment', 'সম্পাদনা করুন নিয়োগ', 'Modificar cita', 'تحرير تعيين', 'Afspraak bewerken', 'Edycja Powołanie', 'Termin bearbeiten', 'Modifier Nomination', 'Modifica appuntamento', 'Изменить назначение', 'Editar compromisso'),
(127, 'add_prescription', 'Add Prescription', 'প্রেসক্রিপশন যোগ করুন', 'Agregar Receta', 'إضافة وصفة طبية', 'Prescription toevoegen', 'Dodaj Prescription', 'Rezept hinzufügen', 'Ajouter Prescription', 'Aggiungi Ricetta', 'Добавить предписание', 'Adicionar Prescription'),
(128, 'case_history', 'Case History', 'রোগীর স্বাস্থ্যাদির বিবরণ', 'Case History', 'حالة التاريخ', 'Case History', 'Sprawa Historia', 'Anamnese', 'Histoire Case', 'Case History', 'История болезни', 'Case History'),
(129, 'medication', 'Medication', 'চিকিত্সা', 'Medicación', 'دواء', 'Geneesmiddel', 'Lek', 'Medikation', 'Médicament', 'Medicazione', 'Лечение', 'Medicação'),
(130, 'note', 'Note', 'নোট', 'Nota', 'ملاحظة', 'Notitie', 'Uwaga', 'Hinweis', 'Remarque', 'Nota', 'Заметка', 'Nota'),
(131, 'edit_prescription', 'Edit Prescription', 'সম্পাদনা করুন প্রেসক্রিপশন', 'Editar Prescription', 'تحرير وصفة طبية', 'Prescription bewerken', 'Edycja receptę', 'Rezept bearbeiten', 'Modifier Prescription', 'Modifica prescrizione', 'Редактировать Рецепт', 'Editar Prescription'),
(132, 'report_type', 'Report Type', 'রিপোর্ট প্রকার', 'Tipo de informe', 'نوع التقرير', 'Type rapport', 'Zgłoś Rodzaj', 'Berichtstyp', 'Type de rapport', 'Tipo di rapporto', 'Тип отчета', 'Tipo de relatório'),
(133, 'document_type', 'Document Type', 'ডকুমেন্ট প্রকার', 'Tipo de Documento', 'نوع الوثيقة', 'Soort document', 'Rodzaj dokumentu', 'Dokumenttyp', 'Type de document', 'Tipo di documento', 'Тип документа', 'Tipo de Documento'),
(134, 'download', 'Download', 'ডাউনলোড করুন', 'Descargar', 'تحميل', 'Download', 'Pobierz', 'Herunterladen', 'Télécharger', 'Scarica', 'Скачать', 'Baixar'),
(135, 'add_diagnosis_report', 'Add Diagnosis Report', 'রোগ নির্ণয় রিপোর্ট যোগ করুন', 'Añadir Informe de Diagnóstico', 'إضافة التشخيص تقرير', 'Voeg Diagnose Rapport', 'Dodaj raport Diagnosis', 'Fügen Diagnose Bericht', 'Ajouter un rapport de diagnostic', 'Aggiungi Diagnosi Relazione', 'Добавить Диагностика отчет', 'Adicionar Relatório de Diagnóstico'),
(136, 'select_report_type', 'Select Report Type', 'রিপোর্ট টাইপ নির্বাচন করুন', 'Seleccione el tipo de informe', 'اختر نوع التقرير', 'Rapport selecteren Type', 'Wybierz Typ raportu', 'Wählen Sie die Art des Berichts', 'Sélectionnez le type de rapport', 'Selezionare Tipo di rapporto', 'Выберите Тип отчета', 'Escolha um tipo de relatório'),
(137, 'xray', 'Xray', 'Xray', 'Radiografía', 'الأشعة السينية', 'Xray', 'Xray', 'Xray', 'Xray', 'Xray', 'Xray', 'Raio X'),
(138, 'blood_test', 'Blood Test', 'রক্তের টেস্ট', 'Análisis de sangre', 'فحص الدم', 'Bloedonderzoek', 'Badanie krwi', 'Bluttest', 'Blood Test', 'Esame del sangue', 'Анализ крови', 'Teste de sangue'),
(139, 'document', 'Document', 'দলিল', 'Documento', 'وثيقة', 'Document', 'Dokument', 'Dokument', 'Document', 'Documento', 'Документ', 'Documento'),
(140, 'select_document_type', 'Select Document Type', 'ডকুমেন্ট টাইপ নির্বাচন করুন', 'Seleccionar tipo de documento', 'اختر نوع الوثيقة', 'Selecteer Document Type', 'Wybierz typ dokumentu', 'Wählen Sie Dokumenttyp', 'Sélectionnez le type de document', 'Seleziona tipo di documento', 'Выбор типа документа', 'Selecione Tipo de Documento'),
(141, 'doc', 'Doc', 'ডক', 'Doctor', 'وثيقة', 'Dokter', 'Doc', 'Doc', 'Doc', 'Doc', 'Доктор', 'Doutor'),
(142, 'pdf', 'Pdf', 'পিডিএফ', 'Pdf', 'قوات الدفاع الشعبي', 'Pdf', 'Pdf', 'Pdf', 'Pdf', 'Pdf', 'Pdf', 'Pdf'),
(143, 'excel', 'Excel', 'সীমা অতিক্রম করা', 'Sobresalir', 'تفوق', 'Uitmunten', 'Przewyższać', 'Übertreffen', 'Exceller', 'Eccellere', 'Превосходить', 'Sobressair'),
(144, 'other', 'Other', 'অন্যান্য', 'Otro', 'آخر', 'Ander', 'Inny', 'Andere', 'Autre', 'Altro', 'Другой', 'Outro'),
(145, 'add_bed_allotment', 'Add Bed Allotment', 'বিছানা নাস্তা বরাদ্দ যোগ করুন', 'Añadir Asignación Cama', 'إضافة سرير التخصيص', 'Voeg Bed Toewijzing', 'Dodaj Bed Przydziału', 'In Bed Zuteilung', 'Ajouter Bed surallocation', 'Aggiungi Bed Allotment', 'Добавить кровать Расспределение', 'Adicionar Bed Loteamento'),
(146, 'select_bed_number', 'Select Bed Number', 'নির্বাচন বিছানা নাস্তা সংখ্যা', 'Seleccione un número de cama', 'حدد عدد سرير', 'Select Bed Aantal', 'Wybierz Ilość Bed', 'Wählen Bed Anzahl', 'Sélectionnez Nombre de lit', 'Selezionare Numero Bed', 'Выберите Кровать Количество', 'Selecione Número Bed'),
(147, 'edit_bed_allotment', 'Edit Bed Allotment', 'সম্পাদনা করুন বিছানা নাস্তা বরাদ্দ', 'Editar Bed Loteo', 'تحرير سرير التخصيص', 'Bed bewerken Toewijzing', 'Edycja Przydział B', 'Bearbeiten Bed Zuteilung', 'Modifier Bed surallocation', 'Modifica Bed Allotment', 'Редактировать кровать Выделение', 'Editar Bed Loteamento'),
(148, 'blood_donor_list', 'Blood Donor List', 'রক্ত দাতার তালিকা', 'Lista de Donación de Sangre', 'قائمة المتبرعين بالدم', 'Blood Donor List', 'Lista Dawców Krwi', 'Blutspendeliste', 'Liste des donneurs de sang', 'Sangue lista dei donatori', 'Список доноров крови', 'Lista do Doador de Sangue'),
(149, 'blood_bank_status', 'Blood Bank Status', 'ব্লাড ব্যাংক স্থিতি', 'Estado del Banco de Sangre', 'مركز بنك الدم', 'Bloedbank Status', 'Stan Banku Krwi', 'Blutbank-Status', 'Statut de la Banque de Sang', 'Stato Banca del Sangue', 'Банк крови Статус', 'Status de Banco de Sangue'),
(150, 'add_report', 'Add Report', 'রিপোর্ট যোগ করুন', 'Añadir Reportar', 'إضافة تقرير', 'Rapport toevoegen', 'Dodaj raport', 'Bericht hinzufügen', 'Ajouter un rapport', 'Aggiungi relazione', 'Добавить отчет', 'Adicionar relatório'),
(151, 'operation', 'Operation', 'অপারেশন', 'Operación', 'عملية', 'Operatie', 'Operacja', 'Betrieb', 'Opération', 'Operazione', 'Операция', 'Operação'),
(152, 'birth', 'Birth', 'জন্ম', 'Nacimiento', 'الولادة', 'Geboorte', 'Narodziny', 'Geburt', 'Naissance', 'Nascita', 'Рождения', 'Nascimento'),
(153, 'death', 'Death', 'মৃতু্য', 'Muerte', 'الموت', 'Dood', 'Śmierć', 'Tod', 'Mort', 'Morte', 'Смерть', 'Morte'),
(154, 'type', 'Type', 'আদর্শ', 'Tipo', 'نوع', 'Type', 'Typ', 'Art', 'Type', 'Tipo', 'Тип', 'Tipo'),
(155, 'select_type', 'Select Type', 'নির্বাচন করুন', 'Seleccionar tipo', 'حدد نوع', 'Kies een type', 'Wybierz typ', 'Wählen Sie Art', 'Sélectionner le type', 'Seleziona tipo', 'Выберите тип', 'Selecionar Tipo'),
(156, 'edit_report', 'Edit Report', 'সম্পাদনা করুন ক্লিক করুন', 'Editar informe', 'تحرير تقرير', 'Rapport bewerken', 'Edycja Zgłoś', 'Bericht bearbeiten', 'Modifier le rapport', 'Modifica report', 'Редактировать отчет', 'Editar relatório'),
(157, 'old_password', 'Old Password', 'পুরাতন পাসওয়ার্ড', 'Contraseña anterior', 'كلمة المرور القديمة', 'Oud wachtwoord', 'Stare hasło', 'Altes Passwort', 'Ancien mot de passe', 'Vecchia password', 'Старый пароль', 'Senha Antiga'),
(158, 'patient_dashboard', 'Patient Dashboard', 'রোগীর ড্যাশবোর্ড', 'Dashboard Paciente', 'لوحة المرضى', 'Patiënt Dashboard', 'Panel Pacjenta', 'Patient-Dashboard', 'Tableau de bord des patients', 'Dashboard paziente', 'Dashboard пациента', 'Painel Patient'),
(159, 'admit_history', 'Admit History', 'ইতিহাস মানা', 'Admitir Historia', 'أعترف التاريخ', 'Toegeven Geschiedenis', 'Przyznaj Historia', 'Zugeben Geschichte', 'Admettez Histoire', 'Ammettere Storia', 'Признайтесь История', 'Admita História'),
(160, 'operation_history', 'Operation History', 'অপারেশন ইতিহাস', 'Historia Operación', 'عملية التاريخ', 'Operatie Geschiedenis', 'Historia operacji', 'Betriebsgeschichte', 'Opération Histoire', 'Storia Funzionamento', 'Операция История', 'Operação História'),
(161, 'invoice', 'Invoice', 'চালান', 'Factura', 'فاتورة', 'Factuur', 'Faktura', 'Rechnung', 'Facture', 'Fattura', 'Счет-фактура', 'Fatura'),
(162, 'nurse_dashboard', 'Nurse Dashboard', 'নার্স ড্যাশবোর্ড', 'Dashboard Enfermera', 'ممرضة لوحة', 'Verpleegkundige Dashboard', 'Pielęgniarka Dashboard', 'Krankenschwester-Dashboard', 'Infirmière Dashboard', 'Nurse Dashboard', 'Медсестра Dashboard', 'Painel Nurse'),
(163, 'bed_/_ward', 'Bed / Ward', 'বিছানা / ওয়ার্ড', 'Cama / sala', 'سرير / وارد', 'Bed / Ward', 'Łóżko / Ward', 'Bed / Ward', 'Chambres / Ward', 'Letto / Ward', 'Кровать / Ward', 'Cama / Ward'),
(164, 'manage_bed', 'Manage Bed', 'বিছানা নাস্তা পরিচালনা', 'Administrar Cama', 'إدارة سرير', 'Beheerder bent van Bed', 'Zarządzaj Bed', 'Bed verwalten', 'Gérer Chambres', 'Gestisci Bed', 'Управление Кровать', 'Gerenciar Bed'),
(165, 'manage_blood_bank', 'Manage Blood Bank', 'ব্লাড ব্যাংক পরিচালনা', 'Administrar el Banco de Sangre', 'إدارة بنك الدم', 'Beheer Bloedbank', 'Zarządzaj Bank Krwi', 'Verwalten Blutbank', 'Gérer banque de sang', 'Gestisci Blood Bank', 'Управление банком крови', 'Gerenciar Banco de Sangue'),
(166, 'bed', 'Bed', 'বিছানা', 'Cama', 'قاع', 'Bed', 'Łóżko', 'Bett', 'Lit', 'Letto', 'Кровать', 'Cama'),
(167, 'add_bed', 'Add Bed', 'বিছানা নাস্তা যোগ করুন', 'Añadir Cama', 'إضافة سرير', 'Bed voegen', 'Dodaj Bed', 'In Bed', 'Ajouter Chambres', 'Aggiungi Bed', 'Добавить Bed', 'Adicionar Bed'),
(168, 'ward', 'Ward', 'পাটক', 'Sala', 'جناح', 'Afdeling', 'Wychowanek', 'Station', 'Quartier', 'Reparto', 'Подопечный', 'Enfermaria'),
(169, 'cabin', 'Cabin', 'কেবিন', 'Cabina', 'قمرة', 'Cabine', 'Kabina', 'Kabine', 'Cabine', 'Cabina', 'Кабина', 'Cabine'),
(170, 'icu', 'Icu', 'ICU', 'Icu', 'وحدة العناية المركزة', 'Icu', 'Icu', 'Icu', 'Icu', 'Icu', 'Icu', 'Icu'),
(171, 'edit_bed', 'Edit Bed', 'সম্পাদনা করুন বিছানা নাস্তা', 'Editar Cama', 'تحرير سرير', 'Bewerk Bed', 'Edycja B', 'Bed bearbeiten', 'Modifier Chambres', 'Modifica Bed', 'Редактировать кровать', 'Editar Bed'),
(172, 'edit_blood_bank', 'Edit Blood Bank', 'সম্পাদনা করুন ব্লাড ব্যাংক', 'Editar Banco de Sangre', 'تحرير بنك الدم', 'Bewerk Bloedbank', 'Edycja Bank Krwi', 'Bearbeiten Blutbank', 'Modifier banque de sang', 'Modifica Banca del Sangue', 'Редактировать банка крови', 'Editar Banco de Sangue'),
(173, 'add_blood_donor', 'Add Blood Donor', 'রক্ত দাতার যোগ করুন', 'Añadir Donante de Sangre', 'إضافة للمتبرعين بالدم', 'Voeg Blood Donor', 'Dodaj dawców krwi', 'In der Blutspender', 'Ajouter don de sang', 'Aggiungi Blood Donor', 'Добавить донорской крови', 'Adicionar Doador de Sangue'),
(174, 'edit_blood_donor', 'Edit Blood Donor', 'সম্পাদনা করুন রক্ত ​​দাতার', 'Edición del Donante de Sangre', 'تحرير متبرعين بالدم', 'Bewerk Blood Donor', 'Edycja Dawców Krwi', 'Bearbeiten-Blutspender', 'Modifier don de sang', 'Modifica Blood Donor', 'Редактировать донора крови', 'Editar do Doador de Sangue'),
(175, 'select_doctor', 'Select Doctor', 'নির্বাচন ডাক্তার', 'Seleccionar Médico', 'حدد طبيب', 'Selecteer Doctor', 'Wybierz Doktor', 'Wählen Doktor', 'Sélectionnez Docteur', 'Seleziona Dottore', 'Выберите Доктор', 'Select Doctor'),
(176, 'pharmacist_dashboard', 'Pharmacist Dashboard', 'ফার্মাসিস্ট ড্যাশবোর্ড', 'Dashboard Farmacéutico', 'لوحة الصيدلي', 'Apotheker Dashboard', 'Farmaceuta Dashboard', 'Apotheker-Dashboard', 'Dashboard Pharmacien', 'Dashboard Farmacista', 'Фармацевт Dashboard', 'Painel Farmacêutico'),
(177, 'add_medicine', 'Add Medicine', 'মেডিসিন যোগ করুন', 'Añadir Medicina', 'إضافة الطب', 'Medicine', 'Dodaj Medycyna', 'Medizin hinzufügen', 'Ajouter médecine', 'Aggiungi Medicina', 'Добавить Медицина', 'Adicionar Medicina'),
(178, 'select_medicine_category', 'Select Medicine Category', 'মেডিসিন বিভাগ নির্বাচন করুন', 'Seleccione Medicina Categoría', 'حدد الطب الفئة', 'Selecteer Geneeskunde Categorie', 'Wybierz kategorię Medycyna', 'Wählen Sie Kategorie Medizin', 'Sélectionnez médecine Catégorie', 'Seleziona Medicine Categoria', 'Выберите Медицина Категория', 'Selecione Medicine Categoria'),
(179, 'select_status', 'Select Status', 'নির্বাচন স্থিতি', 'Seleccione Estado', 'اختر الحالة', 'Selecteer Status', 'Wybierz status', 'Wählen Sie Status', 'Sélectionnez État', 'Selezionare Stato', 'Выберите Состояние', 'Selecione Status'),
(180, 'available', 'Available', 'পাওয়া যায়', 'Disponible', 'متاح', 'Beschikbaar', 'Dostępny', 'Verfügbar', 'Disponible', 'Disponibile', 'Доступный', 'Disponível'),
(181, 'unavailable', 'Unavailable', 'অপ্রাপ্য', 'Indisponible', 'غير متاح', 'Niet beschikbaar', 'Niedostępny', 'Nicht verfügbar', 'Indisponible', 'Non disponibile', 'Недоступен', 'Indisponível'),
(182, 'edit_medicine', 'Edit Medicine', 'সম্পাদনা করুন মেডিসিন', 'Editar Medicina', 'تحرير الطب', 'Geneeskunde bewerken', 'Edycja Medycyna', 'Bearbeiten Medizin', 'Modifier Médecine', 'Modifica Medicine', 'Редактировать Медицина', 'Editar Medicina'),
(183, 'add_medicine_category', 'Add Medicine Category', 'মেডিসিন বিভাগ যোগ করুন', 'Añadir Medicina Categoría', 'إضافة الطب الفئة', 'Voeg Geneeskunde Categorie', 'Dodaj Medicine Kategoria', 'In Medizin Kategorie', 'Ajouter médecine Catégorie', 'Aggiungi Medicine Categoria', 'Добавить медицины Категория', 'Adicionar Medicine Categoria'),
(184, 'edit_medicine_category', 'Edit Medicine Category', 'সম্পাদনা করুন মেডিসিন বিভাগ', 'Editar Medicina Categoría', 'تحرير الطب الفئة', 'Geneeskunde Categorie bewerken', 'Edycja Medycyna Kategoria', 'Bearbeiten Medizin Kategorie', 'Modifier médecine Catégorie', 'Modifica Medicine Categoria', 'Редактировать Медицина Категория', 'Editar Medicine Categoria'),
(185, 'laboratorist_dashboard', 'Laboratorist Dashboard', 'Laboratorist ড্যাশবোর্ড', 'Dashboard de Laboratorio', 'لوحة Laboratorist', 'Laboratorist Dashboard', 'Laboratorist Dashboard', 'Laboratorist Armaturenbrett', 'Dashboard Laboratorist', 'Dashboard Laboratorist', 'Laboratorist Dashboard', 'Painel laboratorista'),
(186, 'accountant_dashboard', 'Accountant Dashboard', 'একাউন্টেন্ট ড্যাশবোর্ড', 'Dashboard Contador', 'لوحة محاسب', 'Accountant Dashboard', 'Księgowy Dashboard', 'Accountant-Dashboard', 'Dashboard comptable', 'Dashboard Accountant', 'Бухгалтер Dashboard', 'Painel Accountant'),
(187, 'add_invoice', 'Add Invoice', 'চালান যোগ করুন', 'Añadir Factura', 'إضافة الفاتورة', 'Voeg Factuur', 'Dodaj faktury', 'In Rechnung', 'Ajouter Facture', 'Aggiungi Fattura', 'Добавить счет-фактуру', 'Adicionar Invoice'),
(188, 'manage_invoice', 'Manage Invoice', 'চালান পরিচালনা', 'Administrar Factura', 'إدارة الفاتورة', 'Beheer Factuur', 'Zarządzaj faktury', 'Rechnung verwalten', 'Gérer facture', 'Gestisci Fattura', 'Управление Счет', 'Gerenciar Invoice'),
(189, 'invoice_title', 'Invoice Title', 'চালান টাইটেল', 'Factura Título', 'عنوان الفاتورة', 'Factuur Titel', 'Faktura Tytuł', 'Rechnungs Titel', 'Titre facture', 'Titolo Fattura', 'Счет Название', 'Título Invoice'),
(190, 'select_a_patient', 'Select A Patient', 'একটি রোগীর নির্বাচন করুন', 'Seleccione un paciente', 'حدد المريض', 'Selecteer een Patiënt', 'Wybierz pacjenta', 'Wählen Sie einen Patienten', 'Sélectionner un patient', 'Selezionare un paziente', 'Выберите пациента', 'Seleccione um paciente'),
(191, 'payment_status', 'Payment Status', 'পেমেন্ট অবস্থা', 'El estado del pedido', 'الحالة الدفع', 'Betaling Status', 'Płatność status', 'Payment Status', 'Statut de paiement', 'Pagamento Stato', 'Оплата Статус', 'Situação do pagamento'),
(192, 'select_a_status', 'Select A Status', 'একটি অবস্থা নির্বাচন করুন', 'Seleccione un Estado', 'اختر الحالة', 'Selecteer A Status', 'Wybierz status', 'Wählen Sie einen Status', 'Sélectionnez un état', 'Selezionare uno stato', 'Выберите статус', 'Selecione um status');
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `bengali`, `spanish`, `arabic`, `dutch`, `polish`, `german`, `french`, `italian`, `russian`, `portugese`) VALUES
(193, 'paid', 'Paid', 'প্রদত্ত', 'Pagado', 'مدفوع', 'Betaald', 'Płatny', 'Bezahlt', 'Payé', 'Pagato', 'Платный', 'Pago'),
(194, 'unpaid', 'Unpaid', 'অবৈতনিক', 'No pagado', 'غير مدفوع', 'Onbetaald', 'Niezapłacone', 'Unbezahlt', 'Non rémunéré', 'Non pagato', 'Неоплаченный', 'Não remunerado'),
(195, 'invoice_entry', 'Invoice Entry', 'চালান এন্ট্রি', 'Entrada de facturas', 'الدخول فاتورة', 'Factuur Entry', 'Faktura Wejście', 'Rechnungserfassung', 'Saisie des factures', 'Fattura Entry', 'Счет запись', 'Nota Fiscal de Entrada'),
(196, 'add_invoice_entry', 'Add Invoice Entry', 'চালান এন্ট্রি যোগ করুন', 'Añadir entrada Factura', 'إضافة إدخال الفاتورة', 'Voeg Factuur Entry', 'Dodaj wpis faktury', 'Fügen Rechnungserfassung', 'Ajouter Saisie des factures', 'Aggiungi Fattura Entry', 'Добавить счет-фактуру запись', 'Adicionar Nota Fiscal de Entrada'),
(197, 'create_new_invoice', 'Create New Invoice', 'নতুন চালান তৈরি করুন', 'Crear Nueva factura', 'خلق فاتورة جديدة', 'Maak Nieuwe factuur', 'Utwórz nową fakturę', 'Neues Rechnungs', 'Créer une nouvelle facture', 'Crea nuova fattura', 'Создать новую фактуру', 'Criar Nova Fatura'),
(198, 'edit_invoice', 'Edit Invoice', 'সম্পাদনা করুন চালান', 'Editar Factura', 'تحرير الفاتورة', 'Bewerk Factuur', 'Edycja faktury', 'Bearbeiten Rechnung', 'Modifier facture', 'Modifica fattura', 'Редактировать Счет', 'Editar Invoice'),
(199, 'update_invoice', 'Update Invoice', 'আপডেট চালান', 'Actualización Factura', 'تحديث الفاتورة', 'Bijwerken Factuur', 'Aktualizacja Faktura', 'Update-Rechnung', 'Mise à jour des factures', 'Aggiornamento Fattura', 'Обновление счета', 'Atualização Invoice');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `medicine_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `manufacturing_company` longtext COLLATE utf8_unicode_ci NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `sold_quantity` int(11) NOT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

DROP TABLE IF EXISTS `medicine_category`;
CREATE TABLE IF NOT EXISTS `medicine_category` (
  `medicine_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`medicine_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_sale`
--

DROP TABLE IF EXISTS `medicine_sale`;
CREATE TABLE IF NOT EXISTS `medicine_sale` (
  `medicine_sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `medicines` longtext COLLATE utf8_unicode_ci NOT NULL,
  `total_amount` int(11) NOT NULL,
  PRIMARY KEY (`medicine_sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext NOT NULL,
  `message` longtext NOT NULL,
  `sender` longtext NOT NULL,
  `timestamp` longtext NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 unread 1 read',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

DROP TABLE IF EXISTS `message_thread`;
CREATE TABLE IF NOT EXISTS `message_thread` (
  `message_thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reciever` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`message_thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `color` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_create` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_last_update` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `start_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `end_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `noticeboard`
--

DROP TABLE IF EXISTS `noticeboard`;
CREATE TABLE IF NOT EXISTS `noticeboard` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
CREATE TABLE IF NOT EXISTS `nurse` (
  `nurse_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`nurse_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `blood_group` longtext COLLATE utf8_unicode_ci NOT NULL,
  `account_opening_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'income expense',
  `amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_number` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
CREATE TABLE IF NOT EXISTS `payroll` (
  `payroll_id` int(11) NOT NULL AUTO_INCREMENT,
  `payroll_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `joining_salary` int(11) NOT NULL DEFAULT '0',
  `allowances` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deductions` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = unpaid, 1 = paid',
  PRIMARY KEY (`payroll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

DROP TABLE IF EXISTS `pharmacist`;
CREATE TABLE IF NOT EXISTS `pharmacist` (
  `pharmacist_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pharmacist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE IF NOT EXISTS `prescription` (
  `prescription_id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `case_history` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medication` longtext COLLATE utf8_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`prescription_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
CREATE TABLE IF NOT EXISTS `receptionist` (
  `receptionist_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`receptionist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'operation,birth,death',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'Bayanno Hospital Management System'),
(2, 'system_title', 'Bayanno Hospital Management System'),
(3, 'address', ''),
(4, 'phone', ''),
(5, 'paypal_email', ''),
(6, 'currency', 'usd'),
(7, 'system_email', 'admin@example.com'),
(8, 'buyer', ''),
(9, 'purchase_code', ''),
(11, 'language', 'english'),
(12, 'text_align', 'left-to-right'),
(13, 'system_currency_id', '1'),
(14, 'clickatell_user', '[YOUR CLICKATELL USERNAME]'),
(15, 'clickatell_password', '[YOUR CLICKATELL PASSWORD]'),
(16, 'clickatell_api_id', '[YOUR CLICKATELL API ID]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
