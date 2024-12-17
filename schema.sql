-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mkdb
-- ------------------------------------------------------
-- Server version	8.0.30

CREATE DATABASE IF NOT EXISTS mkdb;
USE mkdb;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories` (
  `PartID` char(6) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` VALUES ('AC0001','o-rings'),('AC0002','switch films'),('AC0003','lube oil'),('AC0004','usb cable'),('AC0005','foam'),('AC0006','lube'),('AC0007','usb cable'),('AC0008','switch puller'),('AC0009','keycap puller'),('AC0010','lube');
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `bookmarkID` char(6) NOT NULL,
  `username` varchar(128) NOT NULL,
  `PartID` char(6) NOT NULL,
  PRIMARY KEY (`bookmarkID`),
  UNIQUE KEY `bookmarklistID_UNIQUE` (`bookmarkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
INSERT INTO `bookmarks` VALUES ('BL0001','akhal','SW0007'),('BL0002','bluu','CS0003'),('BL0003','cherrylover','KC0003'),('BL0004','dontcallme','AC0010'),('BL0005','kbfan','AC0010'),('BL0006','kbfan','SB0010'),('BL0007','kbfan','PB0005'),('BL0008','menace','PB0006'),('BL0009','spand','SB0002'),('BL0010','sqleury','SB0008');
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kbcase`
--

DROP TABLE IF EXISTS `kbcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kbcase` (
  `PartID` char(6) NOT NULL,
  `size` varchar(45) NOT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kbcase`
--

LOCK TABLES `kbcase` WRITE;
/*!40000 ALTER TABLE `kbcase` DISABLE KEYS */;
INSERT INTO `kbcase` VALUES ('CS0001','65%'),('CS0002','65%'),('CS0003','65%'),('CS0004','65%'),('CS0005','75%'),('CS0006','60%'),('CS0007','60%'),('CS0008','60%'),('CS0009','60%'),('CS0010','60%');
/*!40000 ALTER TABLE `kbcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyboardpart`
--

DROP TABLE IF EXISTS `keyboardpart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyboardpart` (
  `PartID` char(6) NOT NULL,
  `URL` longtext NOT NULL,
  `name` longtext NOT NULL,
  `brand` varchar(512) NOT NULL,
  `price` double NOT NULL,
  `username` varchar(128) NOT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyboardpart`
--

LOCK TABLES `keyboardpart` WRITE;
/*!40000 ALTER TABLE `keyboardpart` DISABLE KEYS */;
INSERT INTO `keyboardpart` VALUES ('AC0001','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=5421','MK Pro Rings Silicone Switch Dampening O-rings 50A 1.5mm (120 Pack)','MK Pro',12,'sqluery'),('AC0002','https://jinrasworkshop.com/thicc-films','thicc films','Jinras Workshop',8,'exapple'),('AC0003','https://dangkeebs.com/products/krytox-gpl-105-oil','Krytox GPL 105 Oil','Krytox',9.5,'kbfan'),('AC0004','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=8748','DIY Custom USB Cable Kit','MK Keyboard',35,'spand'),('AC0005','https://www.amazon.com/Isolate-Sorbothane-Acoustic-Vibration-Damping/dp/B019GBG97Q/ref=sr_1_3?keywords=sorbothane+foam&qid=1659675247&sr=8-3','Sorbothane Acoustic & Vibration Damping Film 40 Duro','Isolate It!',30.95,'dontcallme'),('AC0006','https://www.amazon.com/Glorious-Lube-Brush-Stabilizers-GLO-Acc-LUBE-Brush/dp/B08T98Q2FY','Glorious Lube Brush - Lube Brush for Mechanical Gaming Keyboard Switches and Stabilizers (GLO-Acc-LUBE-Brush) ','Glorious',6.99,'spand'),('AC0007','https://www.amazon.com/GUNMJO-GunMjo-Coiled-Keyboard-Cables/dp/B09Z2LCBD9','GunMjo Pro Custom Coiled USB C Cable for Gaming Keyboard, Double-Sleeved Mechanical Keyboard Cable with Detachable Metal Aviator, 1.5M USB-C to USB-A, Blue Color ','GunMjo',22.99,'spand'),('AC0008','https://www.amazon.com/Glorious-Switch-Puller-for-Keyboards/dp/B08K3MLW9L/ref=sr_1_3?keywords=key+switch+puller&qid=1667454033&qu=eyJxc2MiOiI0LjczIiwicXNhIjoiNC4yNCIsInFzcCI6IjQuMDgifQ%3D%3D&sr=8-3','Glorious Switch Puller - Stainless Steel Premium Switch Puller for Mechanical Gaming Keyboard Switches (GLO-Acc-SP) ','Glorious',7.99,'exapple'),('AC0009','https://www.amazon.com/Qisan-Stainless-Mechanical-Keyboard-Magicforce/dp/B01HPC88HM/ref=sr_1_6?crid=1ZCJLBWH8K8ZE&keywords=keycap+puller&qid=1667454043&qu=eyJxc2MiOiI0Ljk4IiwicXNhIjoiMy44NiIsInFzcCI6IjMuNjMifQ%3D%3D&sprefix=keycap+pull%2Caps%2C169&sr=8-6','Keycap Puller Black Stainless Steel Keycap Removal Tool Expert for Mechanical Keyboard Magicforce by Qisan ','Qisan',5.99,'sqluery'),('AC0010','https://dangkeebs.com/products/krytox-205g0?pr_prod_strat=copurchase&pr_rec_id=6d1dfe088&pr_rec_pid=5749851226273&pr_ref_pid=6040666472620&pr_seq=uniform','Krytox 205g0','Krytox',12,'sqluery'),('CS0001','https://kbdfans.com/collections/kbd67-lite/products/kbd67-abs-plastic-case','KBD 67 Lite R4 ABS Plastic Case','KBD',14.5,'kblover'),('CS0002','https://kbdfans.com/collections/case/products/tofu65-acrylic-mechanical-keyboars-case','TOFU65 ACRYLIC','KBDfans',109,'kbfan'),('CS0003','https://kbdfans.com/collections/case/products/65-wooden-case','65% WOODEN CASE','KBDfans',45,'kbfan'),('CS0004','https://www.walmart.com/ip/68-Keyboard-Case-65-fit-Most-PCB-Keyboards-Computer-Frame-DIY-Component/475111125?wmlspartner=wlpa&selectedSellerId=18988','68 Keyboard Case 65% fit Most PCB Keyboards Computer Frame DIY Component','ANHTCZYX',28.59,'dontcallme'),('CS0005','https://www.aliexpress.us/item/3256803443270541.html?spm=a2g0o.productlist.main.17.b56c7f93GPpsVj&algo_pvid=4b423c6e-8665-4953-b71e-6f53808fe53d&algo_exp_id=4b423c6e-8665-4953-b71e-6f53808fe53d-8&pdp_ext_f=%7B%22sku_id%22%3A%2212000026567337202%22%7D&pdp_npi=2%40dis%21USD%2156.57%2146.95%21%21%21%21%21%402122457116674544460578173d0732%2112000026567337202%21sea&curPageLogUid=b7MXt8WtQVRB','NextTime 75 ','NextTime',46.95,'kbfan'),('CS0006','https://www.aliexpress.us/item/3256803492027305.html?pdp_npi=2%40dis%21USD%21US%20%24388.00%21%2442.68%21%21%21%21%21%402101c84f16674544397538659e7f36%2112000026765311887%21btf&_t=pvid%3A9ca1f284-345f-485c-8d80-1bc24e15834d&afTraceInfo=1005003678342057__pc__pcBridgePPC__xxxxxx__1667454439&spm=a2g0o.ppclist.product.mainProduct&gatewayAdapt=glo2usa&_randl_shipto=US','China Custom Keyboard Case Aluminum CNC 60% Keyboard Case Mechanical Keyboards 60 keyboard Case Teclado 40 For jiu kyuu keyboard','CNC-Machining Store',42.68,'menace'),('CS0007','https://www.aliexpress.us/item/3256801611918688.html?spm=a2g0o.productlist.main.27.3ff2bc8eLNVtvx&algo_pvid=0525dc37-6d0b-4245-b0a9-5897aeb44b5c&algo_exp_id=0525dc37-6d0b-4245-b0a9-5897aeb44b5c-13&pdp_ext_f=%7B%22sku_id%22%3A%2212000017624455325%22%7D&pdp_npi=2%40dis%21USD%2138.7%2132.12%21%21%21%21%21%40212279a216674545269191024d073f%2112000017624455325%21sea&curPageLogUid=InyoPkGDN0XF','GH60 Plastic Case 60% ','BGEKTOTH',32.12,'kbfan'),('CS0008','https://www.aliexpress.us/item/3256802858056754.html?spm=a2g0o.productlist.main.33.3ff2bc8eLNVtvx&algo_pvid=0525dc37-6d0b-4245-b0a9-5897aeb44b5c&algo_exp_id=0525dc37-6d0b-4245-b0a9-5897aeb44b5c-16&pdp_ext_f=%7B%22sku_id%22%3A%2212000023422565045%22%7D&pdp_npi=2%40dis%21USD%21118.9%21118.9%21%21%21%21%21%40212279a216674545269191024d073f%2112000023422565045%21sea&curPageLogUid=OTpdNkCJ6Kd4','KBD TOFU 60 ','KBDfans',118.9,'spand'),('CS0009','https://www.aliexpress.us/item/3256801495659858.html?pdp_npi=2%40dis%21USD%21US%20%2489.34%21%2483.98%21%21%21%21%21%402101c84f16674546802136389e7f5a%2112000017117749683%21btf&_t=pvid%3Ab0311ecc-61a8-44f3-bc80-b8f1e78fd73c&afTraceInfo=1005001681974610__pc__pcBridgePPC__xxxxxx__1667454680&spm=a2g0o.ppclist.product.mainProduct&gatewayAdapt=glo2usa&_randl_shipto=US','GK61/64 Case Mechanical Keyboard Case CNC Anodized Aluminum GH60% Metal PC Transparent Acrylic','CuXiu',83.98,'dontcallme'),('CS0010','https://www.aliexpress.us/item/2255800894593326.html?pdp_npi=2%40dis%21USD%21US%20%2453.07%21US%20%2449.89%21%21%21%21%21%402100bde116674547583577842e5438%2110000014222483165%21sh&gatewayAdapt=glo2usa&_randl_shipto=USS','Wood Case For Anne Pro 2 Mini Portable 60% Mechanical Keyboard Black Walnut Wood Anne Pro 2case','CuXiu',49.89,'sqluery'),('KC0001','https://www.amazon.com/Hyekit-Keycaps-Dye-Sublimation-Mechanical-Keyboards/dp/B0B28K4R9M/ref=sr_1_3?crid=3NSWVGCW7D9XI&keywords=xda%2Bkeycaps&qid=1659295041&s=electronics&sprefix=xda%2Bkeyca%2Celectronics%2C155&sr=1-3&th=1','Hyekit PBT Keycaps 138 Keys Soy Milk Keycaps Dye-Sublimation Cute Keycaps XDA Profile Custom Keycaps for for Mac Windows PC Mechanical Keyboards ','HyeKit',29.99,'bluu'),('KC0002','https://www.amazon.com/EPOMAKER-Sublimation-Mechanical-Keyboard-Compatible/dp/B09HCCDHLN/ref=sr_1_1?keywords=ice+cream+keycaps&qid=1667453025&qu=eyJxc2MiOiIzLjgzIiwicXNhIjoiMi41OSIsInFzcCI6IjEuNjMifQ%3D%3D&s=electronics&sprefix=ice+crea%2Celectronics%2C264&sr=1-1','Icecream PBT Keycaps','EPOMAKER',32.99,'akhal'),('KC0003','https://kineticlabs.com/keycaps/polycaps/corn-pbt','Corn PBT Keyaps','PolyCaps',79.99,'menace'),('KC0004','https://www.amazon.com/Matcha-Green-Keycap-Keyboard-Janpanese/dp/B08SLDHVSKK','XDA V2 Matcha Green Tea Dye Sub Keycap','KPREPUBLIC',24.9,'kbfan'),('KC0005','https://www.amazon.com/Hyekit-Marshmallow-Dye-Sublimation-Mechanical-Keyboards/dp/B09XQQDKCG/ref=sr_1_4?crid=AMJENVP5JVKG&keywords=keycaps&qid=1667453410&qu=eyJxc2MiOiI4Ljc5IiwicXNhIjoiOC41OCIsInFzcCI6IjcuOTMifQ%3D%3D&s=electronics&sprefix=keycaps%2Celectronics%2C143&sr=1-4','Hyekit PBT Keycaps 132 Keys Marshmallow','Hyekit',28.99,'bluu'),('KC0006','https://www.amazon.com/Profile-Sublimation-Switches-Mechanical-Keyboard/dp/B0B24KY398/ref=sr_1_16?crid=49O59IGTPEP2&keywords=keycaps&qid=1667453363&qu=eyJxc2MiOiI4Ljc5IiwicXNhIjoiOC41OCIsInFzcCI6IjcuOTMifQ%3D%3D&sprefix=keycap%2Caps%2C173&sr=8-166','WHYSP XDA Profile PBT Keycaps','Owpkeenthy',29.99,'kbfan'),('KC0007','https://www.amazon.com/JOMKIZ-Sublimation-Spacebar-Mechanical-Keyboards/dp/B09XDZ7SHC/ref=sr_1_8?crid=AMJENVP5JVKG&keywords=keycaps&qid=1667453679&qu=eyJxc2MiOiI4Ljc5IiwicXNhIjoiOC41OCIsInFzcCI6IjcuOTMifQ%3D%3D&s=electronics&sprefix=keycaps%2Celectronics%2C143&sr=1-8','JOMKIZ PBT Keycaps,135 Keys Mecha Dye Sublimation ','JOMKIZ',36.99,'kbfan'),('KC0008','https://omnitype.com/products/gmk-redacted-keycap-set','GMK REDACTED KEYCAP SET','GMK',184.99,'menace'),('KC0009','https://www.amazon.com/Aerospace-Dye-Sublimation-Switches-Mechanical-Keyboard/dp/B09NY1PMPN/ref=pd_rhf_d_dp_s_crs_dp_rhf_k2p_sccl_2_7/136-5807229-2676366?pd_rd_w=isR8e&content-id=amzn1.sym.b4b29072-2a46-4040-9ae4-91e4b7e95920&pf_rd_p=b4b29072-2a46-4040-9ae4-91e4b7e95920&pf_rd_r=4J7J3SE0D5N3E66JK0F8&pd_rd_wg=FYz71&pd_rd_r=6f8d12da-5da2-4511-a80b-0f37326a21e7&pd_rd_i=B09NY1PMPN&psc=1','PBT Keycaps Apollo Aerospace','Hyekit',35.99,'sqluery'),('KC0010','https://drop.com/buy/drop-mito-mt3-godspeed-custom-keycap-set?defaultSelectionIds=968934','drop + mito mt3 godspeed','Drop',120,'bluu'),('PB0001','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=5027','Duck One 2 Mini White','Ducky',99,'sqluery'),('PB0002','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=3917','Vortex Race 3','Vortex Gear',139,'sqluery'),('PB0003','https://www.amazon.com/Womier-Keyboard-Swappable-Mechanical-Crystalline/dp/B089SHMD61','Womier K66','Womier',74.99,'spand'),('PB0004','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=3785','Royal Kludge RK61 Black ','Royal Kludge',59,'kbfan'),('PB0005','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=4096','Leopold FC660C Blue/Grey 65% Dye Sub PBT Mechanical Keyboard','Leopold',239,'exapple'),('PB0006','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=3537','Ducky One 2 Horizon TKL ','Ducky',99,'kbfan'),('PB0007','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=3909','James Donkey 612 Yellow LED','James Donkey',89,'kbfan'),('PB0008','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=8810','Ducky One 3 Mini Daybreak','Ducky',119,'kbfan'),('PB0009','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=8802','Ducky One 3 Matcha','Ducky',109,'dontcallme'),('PB0010','https://www.gloriousgaming.com/products/glorious-gmmk-pro-75-barebone-black','GMMK Pro (Prebuilt)','Glorious',349.99,'menace'),('PC0001','https://kbdfans.com/collections/pcb/products/kbd67-markii-pcb','KBD67 MARK II ','KBD Fans',55,'dontcallme'),('PC0002','https://kbdfans.com/collections/pcb/products/kbdpad-markii-pcb','KBDPAD MARK II ','KBD Fans',25,'sqluery'),('PC0003','https://kbdfans.com/products/dz60rgb-hot-swap-custom-keyboard-pcb','DZ60RGB V2','KBD Fans',55,'sqluery'),('PC0004','https://www.amazon.com/bm60rgb-swappable-Mechanical-Keyboard-underglow/dp/B08GJMLXHQ/ref=sr_1_3?crid=W2L8EQVSLIQ6&keywords=PCB+Board+keyboard&qid=1667452176&qu=eyJxc2MiOiI0LjU0IiwicXNhIjoiMy45MSIsInFzcCI6IjEuMDAifQ%3D%3D&sprefix=pcb+board+keyboa%2Caps%2C164&sr=8-3','bm60rgb','KPREPUBLIC',46.9,'dontcallme'),('PC0005','https://kbdfans.com/products/dz60rgb-hot-swap-custom-keyboard-pcbb','DZ60RGB-ANSI V2 ','KBD Fans',55,'bluu'),('PC0006','https://www.amazon.com/EPOMAKER-Hotswap-Custom-Keyboard-Mounting/dp/B0893YXHG2/ref=sr_1_2?keywords=PCB+Board+keyboard&qid=1667452431&qu=eyJxc2MiOiI0LjU0IiwicXNhIjoiMy45MSIsInFzcCI6IjEuMDAifQ%3D%3D&sr=8-2','EPOMAKER GK61X','EPOMAKER',63,'bluu'),('PC0007','https://www.amazon.com/GK61-Independent-Driver-Wired-Tyce-C/dp/B07TBWVK6B/ref=sr_1_9?keywords=keyboard+pcb&qid=1667452444&qu=eyJxc2MiOiI2LjEyIiwicXNhIjoiNS4zNSIsInFzcCI6IjQuNTYifQ%3D%3D&sr=8-99','GK61','YMDK',48,'sqluery'),('PC0008','https://www.amazon.com/Glorious-Mechanical-Keyboard-Tenkeyless-Gaming/dp/B01MSVHZTT/ref=sr_1_6?keywords=PCB+Board+keyboard&qid=1667452472&qu=eyJxc2MiOiI0LjU0IiwicXNhIjoiMy45MSIsInFzcCI6IjEuMDAifQ%3D%3D&sr=8-6','GMMK 85% Percent TKL Barebone','Glorious',54.99,'menace'),('PC0009','https://www.amazon.com/Drop-ALT-High-Profile-Mechanical-Keyboard/dp/B083TFV5RP/ref=sr_1_15?keywords=PCB+Board+keyboard&qid=1667452546&qu=eyJxc2MiOiI0LjU0IiwicXNhIjoiMy45MSIsInFzcCI6IjEuMDAifQ%3D%3D&sr=8-15','Drop ALT High-Profile Mechanical Keyboard','Drop',220,'menace'),('PC0010','https://www.amazon.com/FL-ESPORTS-MK870-Mechanical-Customizable/dp/B09GYGFQMJ/ref=sr_1_24?keywords=keyboard+pcb&qid=1667452543&qu=eyJxc2MiOiI2LjEyIiwicXNhIjoiNS4zNSIsInFzcCI6IjQuNTYifQ%3D%3D&sr=8-24&ufe=app_do%3Aamzn1.fos.006c50ae-5d4c-4777-9bc0-4513d670b6bc','MK870','FL ESPORTS',59.99,'menace'),('SB0001','https://www.amazon.com/New-Fashion-Kingdom-Stabilizers-GreenLemoncolor/dp/B0978PWJG9','Snap-in Stabilizers Plate Mounted','New Fashion Kingdom',8.99,'akhal'),('SB0002','https://divinikey.com/products/durock-v2-stabilizers-screw-in?variant=32275866681409','Durock V2 Stabilizers','Durock',3.5,'akhal'),('SB0003','https://www.keychron.com/products/keychron-gold-plated-pcb-mounted-stabilizer-set','Keychron Gold Plated PCB Mounted Stabilizer Set ','Keychron',10,'bluu'),('SB0004','https://www.amazon.com/EPOMAKER-Plate-Mounted-Stabilizer-Stainless-Mechanical/dp/B09Y93VXDW/ref=sr_1_10?keywords=stabilizers+keyboard&qid=1667452696&qu=eyJxc2MiOiI0LjczIiwicXNhIjoiNC43OCIsInFzcCI6IjQuNDYifQ%3D%3D&sprefix=stab%2Caps%2C145&sr=8-10','EPOMAKER Plate-Mounted Stabilizer','EPOMAKER',7.99,'bluu'),('SB0005','https://kbdfans.com/products/gateron-lubed-plate-mounted-stabilizers','Gateron plate mounted stabilizers','KBD Fans',9.41,'bluu'),('SB0006','https://www.amazon.com/CuXiu-Stabilizer-Mechanical-Customized-Stabilizers/dp/B094CL3HLG/ref=sr_1_15?keywords=stabilizers+keyboard&qid=1667452696&qu=eyJxc2MiOiI0LjczIiwicXNhIjoiNC43OCIsInFzcCI6IjQuNDYifQ%3D%3D&sprefix=stab%2Caps%2C145&sr=8-15','CuXiukeys Stabilizer Plate Mounted','CuXiu',13.6,'dontcallme'),('SB0007','https://www.amazon.com/Everglide-Transparent-Stabilizer-Mechanical-Keyboard/dp/B09GHG8H6R/ref=sr_1_20?keywords=stabilizers+keyboard&qid=1667452696&qu=eyJxc2MiOiI0LjczIiwicXNhIjoiNC43OCIsInFzcCI6IjQuNDYifQ%3D%3D&sprefix=stab%2Caps%2C145&sr=8-20','Everglide V2 Transparent Gold Plated PCB Screw in Stabilizer','Everglide ',24.6,'exapple'),('SB0008','https://swagkeys.com/products/genuine-cherry-plate-stabilizerss','Genuine Cherry Plate-Mount Stabilizers','swagkeys',7,'exapple'),('SB0009','https://www.amazon.com/Stabilizers-Stabilizer-Chestnut-Mechanical-Keyboard/dp/B09WZPLQPW/ref=sr_1_20?keywords=stabilizers+keyboard&qid=1667452870&qu=eyJxc2MiOiI0LjczIiwicXNhIjoiNC43OCIsInFzcCI6IjQuNDYifQ%3D%3D&sprefix=stab%2Caps%2C145&sr=8-20','Gateron V2 Stabilizers PCB Mount Screw in Stabilizer Funk Silver Persia Chestnut Time White Custom Stabilizers','Gateron',23.5,'cherrylover'),('SB0010','https://keebsforall.com/products/durock-plate-mounted-stabilizers?variant=42458217545947&currency=USD&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic','Durock Plate Mounted Stabilizers','Durock',8.5,'exapple'),('SW0001','https://www.amazon.com/Cherry-switches-MX1AG1NN-Mechanical-Keyboard/dp/B07RSWRHR9','Cherry MX Black','Cherry',12.99,'cherrylover'),('SW0002','https://www.amazon.com/Cherry-switches-MX1AG1NN-Mechanical-Keyboard/dp/B07RRXCW8Q','Cherry MX Red','Cherry',10.99,'cherrylover'),('SW0003','https://dangkeebs.com/products/gateron-blue','Gateron Blue','Gateron',2.4,'menace'),('SW0004','https://dangkeebs.com/products/gateron-red','Gateron Red','Gateron ',2.4,'akhal'),('SW0005','https://dangkeebs.com/products/ktt-kang-white','KTT Kang White V3','KTT',2.7,'bluu'),('SW0006','https://dangkeebs.com/collections/switches/products/mamba','Mamba','JWK',6.5,'bluu'),('SW0007','https://novelkeys.com/products/kailh-box-switches','Kailh Box White','Kailh',10.8,'dontcallme'),('SW0008','https://dangkeebs.com/products/gateron-milky-yellow?pr_prod_strat=use_description&pr_rec_id=135d867e8&pr_rec_pid=5497746849953&pr_ref_pid=5498164019361&pr_seq=uniform','Gateron Milky Yellow','Gateron',2.4,'akhal'),('SW0009','https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=6337','Kailh Choc Red Switch - Low Profile - Linear','Kailh',3.99,'exapple'),('SW0010','https://www.amazon.com/Cherry-Blue-Keyswitch-pack-himalayanelixir/dp/B01N2L8RR2','Cherry MX Blue','Cherry',9.49,'spand');
/*!40000 ALTER TABLE `keyboardpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keycaps`
--

DROP TABLE IF EXISTS `keycaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keycaps` (
  `PartID` char(6) NOT NULL,
  `profile` varchar(45) NOT NULL,
  `material` varchar(45) NOT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keycaps`
--

LOCK TABLES `keycaps` WRITE;
/*!40000 ALTER TABLE `keycaps` DISABLE KEYS */;
INSERT INTO `keycaps` VALUES ('KC0001','XDA','PBT'),('KC0002','XDA','PBT'),('KC0003','Cherry','PBT'),('KC0004','XDA','PBT'),('KC0005','XDA','PBT'),('KC0006','XDA','PBT'),('KC0007','Cherry','PBT'),('KC0008','GMK','ABS'),('KC0009','Cherry','PBT'),('KC0010','MT3','PBT');
/*!40000 ALTER TABLE `keycaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderators`
--

DROP TABLE IF EXISTS `moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderators` (
  `ModID` char(6) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`ModID`),
  UNIQUE KEY `ModID_UNIQUE` (`ModID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderators`
--

LOCK TABLES `moderators` WRITE;
/*!40000 ALTER TABLE `moderators` DISABLE KEYS */;
INSERT INTO `moderators` VALUES ('md0001','asdfe123'),('md0100','wefine'),('md1241','anion2'),('md1245','eienn6'),('md1782','aserb1'),('md2442','mp9'),('md4514','ann2'),('md5190','asb15r1s'),('md8357','anber12'),('md9120','we4gh2');
/*!40000 ALTER TABLE `moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partlist`
--

DROP TABLE IF EXISTS `partlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partlist` (
  `PartListID` char(10) NOT NULL,
  `totalPrice` double NOT NULL,
  `username` varchar(128) NOT NULL,
  `prebuilt_id` char(6) DEFAULT NULL,
  `pcb_id` char(6) DEFAULT NULL,
  `accessories_id` char(6) DEFAULT NULL,
  `switches_id` char(6) DEFAULT NULL,
  `case_id` char(6) DEFAULT NULL,
  `stab_id` char(6) DEFAULT NULL,
  `keycaps_id` char(6) DEFAULT NULL,
  PRIMARY KEY (`PartListID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartListID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partlist`
--

LOCK TABLES `partlist` WRITE;
/*!40000 ALTER TABLE `partlist` DISABLE KEYS */;
INSERT INTO `partlist` VALUES ('PL0001',150,'akhal','PB0001','PC0001','AC0008','SW0001','','SB0001','KC0001'),('PL0002',29,'bluu','PB0010','PC0002','','SW0002','','SB0002','KC0002'),('PL0003',200,'cherrylover','PB0007','PC0003','AC0006','SW0003','','SB0003',''),('PL0004',399,'dontcallme','PB0004','PC0005','AC0005','SW0004','CS0004','','KC0004'),('PL0005',500,'exapple','PB0003','','AC0004','SW0005','CS0005','','KC0004'),('PL0006',89,'kbfan','PB0006','PC0006','AC0003','SW0006','CS0006','','KC0006'),('PL0007',40,'kbfan','','PC0006','','SW0007','CS0007','SB0007','KC0005'),('PL0008',4000,'menace','PB0003','PC0008','','SW0008','','SB0008','KC0008'),('PL0009',600,'spand','PB0001','PC0004','AC0009','SW0009','CS0002','SB0009','KC0002'),('PL0010',50,'sqleury','PB0010','PC0001','AC0010','SW0010','','SB0010','KC0010');
/*!40000 ALTER TABLE `partlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcb`
--

DROP TABLE IF EXISTS `pcb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pcb` (
  `PartID` char(6) NOT NULL,
  `containsRGB` char(3) NOT NULL,
  `hotSwappable` char(3) NOT NULL,
  `size` varchar(45) NOT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcb`
--

LOCK TABLES `pcb` WRITE;
/*!40000 ALTER TABLE `pcb` DISABLE KEYS */;
INSERT INTO `pcb` VALUES ('PC0001','YES','YES','65%'),('PC0002','YES','NO','numpad'),('PC0003','YES','YES','60%'),('PC0004','YES','YES','60%'),('PC0005','YES','YES','60%'),('PC0006','YES','YES','60%'),('PC0007','YES','YES','60%'),('PC0008','YES','YES','85%'),('PC0009','YES','YES','65%'),('PC0010','YES','YES','80%');
/*!40000 ALTER TABLE `pcb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prebuilt`
--

DROP TABLE IF EXISTS `prebuilt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prebuilt` (
  `PartID` char(6) NOT NULL,
  `switchName` varchar(128) NOT NULL,
  `hotSwappable` char(3) NOT NULL,
  `size` varchar(45) NOT NULL,
  `containsRGB` char(3) NOT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prebuilt`
--

LOCK TABLES `prebuilt` WRITE;
/*!40000 ALTER TABLE `prebuilt` DISABLE KEYS */;
INSERT INTO `prebuilt` VALUES ('PB0001','varies','NO','60%','YES'),('PB0002','varies','NO','TKL','NO'),('PB0003','Gateron Blue','YES','60%','YES'),('PB0004','Kailh Blue','NO','60%','YES'),('PB0005','varies (topre)','NO','65%','NO'),('PB0006','varies','NO','TKL','NO'),('PB0007','Kailh Brown','NO','Full Sized','YES'),('PB0008','varies','YES','60%','YES'),('PB0009','varies','YES','TKL','NO'),('PB0010','varies','YES','75%','YES');
/*!40000 ALTER TABLE `prebuilt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportlistings`
--

DROP TABLE IF EXISTS `reportlistings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportlistings` (
  `ReportListID` char(6) NOT NULL,
  `PartID` char(6) NOT NULL,
  PRIMARY KEY (`ReportListID`),
  UNIQUE KEY `ReportListID_UNIQUE` (`ReportListID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportlistings`
--

LOCK TABLES `reportlistings` WRITE;
/*!40000 ALTER TABLE `reportlistings` DISABLE KEYS */;
INSERT INTO `reportlistings` VALUES ('RL0001','PC0003'),('RL0002','CS0003'),('RL0003','AC0007'),('RL0004','PB0001'),('RL0005','KC0006'),('RL0006','PC0006'),('RL0007','SW0008'),('RL0008','SW0009'),('RL0009','SW0010'),('RL0010','KC0007'),('RL0104','CS0010'),('RL0682','CS0010'),('RL1292','CS0010'),('RL1593','CS0010'),('RL1807','CS0010'),('RL1903','CS0010'),('RL2146','CS0010'),('RL2338','CS0010'),('RL2433','CS0002'),('RL2446','CS0010'),('RL2453','CS0009'),('RL4388','CS0010'),('RL4569','CS0010'),('RL5295','CS0009'),('RL5508','CS0010'),('RL5763','CS0010'),('RL6439','CS0010'),('RL6974','CS0001'),('RL7756','CS0010'),('RL7980','CS0002'),('RL7984','CS0010'),('RL8129','CS0010'),('RL8384','CS0010'),('RL8652','CS0009');
/*!40000 ALTER TABLE `reportlistings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stabilizers`
--

DROP TABLE IF EXISTS `stabilizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stabilizers` (
  `PartID` char(6) NOT NULL,
  `stabtype` longtext NOT NULL,
  `info` longtext NOT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stabilizers`
--

LOCK TABLES `stabilizers` WRITE;
/*!40000 ALTER TABLE `stabilizers` DISABLE KEYS */;
INSERT INTO `stabilizers` VALUES ('SB0001','2U, 6.25U','snap-in, plate mount'),('SB0002','2U, 6.25U, 7U','screw-in, pcb mount'),('SB0003','2U, 6.25U, 7U','screw-in, pcb mount'),('SB0004','2U, 6.25U','plate mount'),('SB0005','2U, 6.25U, 7U','plate mount'),('SB0006','2U, 6.25U, 7U','plate mount'),('SB0007','6.25U','screw in, pcb mount'),('SB0008','2U, 6.25U','plate mount'),('SB0009','2U, 6.25U, 7U','screw-in, pcb mount'),('SB0010','2U, 6.25U, 7U','screw-in, pcb mount');
/*!40000 ALTER TABLE `stabilizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switches`
--

DROP TABLE IF EXISTS `switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switches` (
  `PartID` char(6) NOT NULL,
  `type` varchar(45) NOT NULL,
  `stem` varchar(45) NOT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switches`
--

LOCK TABLES `switches` WRITE;
/*!40000 ALTER TABLE `switches` DISABLE KEYS */;
INSERT INTO `switches` VALUES ('SW0001','linear','cherry'),('SW0002','linear','cherry'),('SW0003','clicky','cherry'),('SW0004','linear','cherry'),('SW0005','linear','cherry'),('SW0006','linear','cherry'),('SW0007','clicky','kailh box'),('SW0008','linear','cherry'),('SW0009','linear','kailh choc low profile'),('SW0010','tactile','cherry');
/*!40000 ALTER TABLE `switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('akhal','originalpass'),('bluu','pass'),('cherrylover','asdeb4'),('dontcallme','dfkj'),('exapple','asdfasdf'),('kbfan','evbein'),('kbhater','awsef123'),('menace','qwop'),('spand','pass123'),('sqleury','sevsav');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 15:14:55
