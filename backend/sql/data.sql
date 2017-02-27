

INSERT INTO `payment_methods` (`ID`, `Name`) VALUES
(1, 'Invoice'),
(2, 'Cash'),
(3, 'Creditcard-Stripe');


INSERT INTO `pages` (`ID`, `Active`, `Name`) VALUES
(1, 'Y', 'settings'),
(2, 'Y', 'dispatch'),
(3, 'Y', 'print'),
(4, 'Y', 'ordersearch'),
(5, 'Y', 'transportorder_new'),
(6, 'Y', 'transportorder_edit'),
(7, 'Y', 'prices'),
(9, 'Y', 'reports'),
(10, 'Y', 'drivers'),
(11, 'Y', 'users'),
(12, 'Y', 'invoice'),
(14, 'Y', 'myaccount'),
(15, 'Y', 'customer'),
(16, 'Y', 'changelog'),
(17, 'Y', 'order-pricing'),
(18, 'Y', 'orders'),
(19, 'Y', 'generate'),
(20, 'Y', 'testpage'),
(21, 'Y', 'superadmin');


INSERT INTO `drivers` ( `DrivereksternID`, `CompanyName`, `DriverName`, `Vehicle_type`, `Percent`, `Orgnr`, `Address`, `Zip`, `City`, `Country`, `Phone1`, `Phone2`, `Email`, `Carinfo`, `CarRegnr`, `Notes`, `Username`, `Password`, `Active`, `Vat`, `Monthly_license`, `Accounting_number`, `Hjelm`, `Vest`, `Vernesko`, `Idkort`, `Arbeidstoy`, `ADR`, `Takstativ`, `Bildekor`, `Hengerfeste`, `Car_brand`, `Aarsmodell`, `Farge`, `Nyttelastkg`, `Inv_lengde`, `Inv_bredde`, `Inv_hoyde`, `Start_time`, `End_time`, `Regtime`) VALUES
( 1, 'Dummydriver', 'F24 Dummy', 3, 60, '242342342', 'Dummyaddress', '1312', 'Oslo', 'no', '34234234', '13123123', 'test@test.com', 'test', '234234sdfsd', '', 'mk', 'km', 'Y', 'N', 0.00, '', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 3, 0, 'hvit', 0.00, 0.00, 0.00, 0.00, 0, 0, 0);


INSERT INTO `vehicle_types` (`ID`, `Name`, `Icon`, `Customerweb`, `Description`, `Maxkolliweight`, `Maxtotalweight`, `Maxquantity`, `Maxlength`, `Maxheight`, `Maxwidth`, `Haslift`, `Maxliftweight`, `List_priority`, `Active`) VALUES
(1, 'Budbil', 'litenbil.png', 'Y', 'Liten bil. Varene må kunne plasseres i forsetet. Max 20kg / 3 kolli. ', 35, 100, 100, 0, 0, 0, 'N', 0, 0, 'Y'),
(2, 'Liten varebil', 'litenvarebil.png', 'N', '21 – 99 kg (inntil 1.5 m lastelengde)', 35, 100, 10000, 0, 0, 0, 'N', 0, 6, 'N'),
(3, 'Varebil', 'varebil.png', 'Y', '100 – 300 kg. Tilsvarer inntil 30 a-4 esker. (inntil 2.5 m lastelengde) ', 36, 300, 30, 0, 0, 0, 'N', 0, 1, 'Y'),
(4, 'Stor varebil', 'storvare.png', 'Y', '301 - 750 kg. Tilsvarer inntil 50 a-4 esker.  (inntil 4.0 m lastelengde)', 35, 800, 10000, 0, 0, 0, 'N', 0, 2, 'Y'),
(5, 'Lastebil KL1', 'lastebil.png', 'Y', 'Maks 1,80m høyt gods, maks 500 kg pr pall, maks total vekt 1000 kg og maks 4 meter totallengde.', 750, 3500, 10000, 500, 100, 200, 'Y', 750, 3, 'Y'),
(6, 'Lastebil KL2', 'lastebilkl2.png', 'Y', 'Maks 2,50m høyt gods, maks 2000 kg pr pall, maks total vekt 9000 kg og maks 7 meter totallengde.', 1250, 5000, 10000, 0, 0, 0, 'Y', 1250, 4, 'Y'),
(7, 'Sykkelbud', 'sykkel.png', 'N', 'Raskt og miljøvennlig i Oslo sentrum (innen ring 2). Dokumenter inntil a-3 størrelse. Max vekt 4 kg.', 0, 0, 0, 0, 0, 0, 'N', 0, 5, 'N');


INSERT INTO `country` (`ID`, `CountryCode`, `Name`, `Sortorder`, `Active`) VALUES
(1, 'no', 'Norway', 0, 'Y'),
(2, 'se', 'Sweden', 2, 'Y'),
(3, 'dk', 'Denmark', 1, 'Y');

INSERT INTO `customer` (`ID`, `Secret_key`, `Customertype`, `CompanyName`, `ContactName`, `Address_visit`, `Address_visit2`, `Zip_visit`, `City_visit`, `Country_visit`, `LatLon_visit`, `Address_post`, `Address_post2`, `Zip_post`, `City_post`, `Country_post`, `LatLon_post`, `Email`, `Orgnr`, `Phone`, `Fax`, `Country`, `Invoice_email`, `Invoice_group`, `Creditcustomer`, `Credit_days`, `Credit_stop`, `Notes`, `Gebyr`, `Tax`, `Autopricing`, `Invoice_showbrutto`, `Req_fakturaref`, `Send_daily_pod`, `Daily_pod_email`, `Web_show_price`, `Web_show_driver`, `Std_order_invoice_alone`, `Active`, `Added_by`, `Added_time`) VALUES
(1, '', 'C', 'Test Company', 'John Dou', 'Test 5', '', '2010', 'Strømmen', 'no', '', 'Test 5', '', '2010', 'Test', 'no', '', 'johndou@hotmail.com', 913265122, '92642370', '', 'NO','johndou@hotmail.com', 1, 'Y', 10, 'N', '', 'Y', 'Y', 'Y', 'N', 'Y', 'N', 'johndou@hotmail.com', 'N', 'N', 'Y', 'Y', 1, '');


