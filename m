Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB3DD53CA
	for <lists+linux-stm32@lfdr.de>; Sun, 13 Oct 2019 04:24:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B213C36B0B;
	Sun, 13 Oct 2019 02:24:46 +0000 (UTC)
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7287C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Oct 2019 02:24:43 +0000 (UTC)
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D2OJNt026850
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 20:24:19 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D2OJvX026841; Sat, 12 Oct 2019 20:24:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=P91uflCk9IxMFAolU92mGIgCGbWGGNLXBZ/pJBjwmlY=;
 b=KkUEF5MoMVIQonrjKXYx6+82BFHHpwxE8H86KYV/P8pE2e8nhujJ1TgWwdxtzXVLvszr
 MxEKBPE4S1ZOagrUDP0BPF1StC9IAZYC8H00DwpCQFmsaSxGaHLcZd9sqVDqjDS9k68K
 YmMhR99AEeyWizNgcHBb6PftOcmp8y//1Je0PF7vTA5r7M3ay1bJfNa+5ULecjCI7oyS
 LWpDYTHkDWDTjI/wukSJAbzrEwVxbflXKy53vAs7+px0FJtfki2WJbf71M6aLs4uYcJM
 NZvm/ZGj8FFyJTe7FFrVG/dsV7tjTfe8ZhzK5WLd5eKOxV1NDR6lUmwkQiif8N9/kfs1 4A== 
Received: from BN6PR03MB3234.namprd03.prod.outlook.com (2603:10b6:a03:12b::29)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR07CA0088.NAMPRD07.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 17:29:37 +0000
Received: from BN6PR03CA0001.namprd03.prod.outlook.com (2603:10b6:404:23::11)
 by
 BN6PR03MB3234.namprd03.prod.outlook.com (2603:10b6:405:40::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 17:26:41 +0000
Received: from BN3NAM01FT014.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e41::207) by BN6PR03CA0001.outlook.office365.com
 (2603:10b6:404:23::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 17:26:41 +0000
Received: from ipmx8.colorado.edu (128.138.67.85) by
 BN3NAM01FT014.mail.protection.outlook.com (10.152.67.115) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:26:40 +0000
Received: from mx-spsc.colorado.edu (HELO mx.colorado.edu) ([128.138.67.77]) by
 mx.colorado.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019
 10:48:18 -0600
Received: from mx-spsc.colorado.edu (HELO mx.colorado.edu) ([128.138.67.77]) by
 mx.colorado.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019
 10:21:17 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:03:14 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731736AbfJIQDN (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 12:03:13 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:42180 "EHLO 
 mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)        by
 vger.kernel.org with ESMTP id S1731724AbfJIQDN (ORCPT       
 <rfc822; linux-kernel@vger.kernel.org>); Wed, 9 Oct 2019 12:03:13 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])        by
 mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x99G0t1m031465;        Wed, 9 Oct 2019 18:03:01 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35]) by
 mx08-00178001.pphosted.com with ESMTP id 2vej2pf6he-1       
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);   
 Wed, 09 Oct 2019 18:03:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20]) by
 beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 267A7100034; 
 Wed,  9 Oct 2019 18:02:58 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44]) by
 euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E95E52A9704; 
 Wed,  9 Oct 2019 18:02:57 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct
 2019 18:02:57 +0200
Received: from localhost (10.201.20.122) by webmail-ga.st.com (10.75.90.48)
 with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 18:02:57 +0200
Authentication-Results: spf=none (sender IP is 128.138.67.85)
 smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=pass (signature was verified)
 header.d=st.com;o365.colorado.edu; dmarc=bestguesspass action=none
 header.from=st.com;
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
Authentication-Results-Original: mx.colorado.edu;
 dkim=pass (signature verified)
 header.i=@st.com
IronPort-SDR: H1nONSGPM2rtILfEQ3I7TurGoGpUFAWz7UQsmPMJ+2DW2TxNtYnLN9pINH72/preb42Au9SLKn
 3v45A8WbDu0BLcIiJSp0gJuEpgKxd4vHI=
IronPort-SDR: drYd/IZrbqLAxc+BS6j5J4+8lbYDAruJNOIuFHXNKc/dpkXxqPZvDblnSP1aYzLBwyFi7YRZc1
 +zXmcCM6lOCKwVvv5qnf1i5GvjqZztQpg=
IronPort-SDR: MwpbK7CI2cO8P/d9uHAOtJx9QX5JYCCAE20oQK9oZKbElCpnp0dCBneFJNotQF+9lKVu1Td6y+
 h+1iXW74aWhaF6sdLLa478nibJbwSDuDk=
IronPort-PHdr: =?us-ascii?q?9a23=3AaaikEB/az0/hWv9uRHKK80MuRw1ilqv9OhMc9p?=
 =?us-ascii?q?sgje8eIva9qs2xdEWK/+5kyUTJVN+GtaEMgL/MvqTpSWEMpoyMtHkSfZAfHx?=
 =?us-ascii?q?NQktlQlAslU4aFXEPhK/uiPWQmG4wQHFRutyPzKlVfGsv1eziw6i/64TcOF1?=
 =?us-ascii?q?2tfQ94Pf/8FYOXjsj/hai3+pjeJhtFniG8ZrU6fl29qgPNu88KxJdzMqtigg?=
 =?us-ascii?q?CcmUdteu9Mwm5sKFmPhRH658yrr/sBuy5Q7spwrtNOVY75LoUoaJJxCzAbYj?=
 =?us-ascii?q?owy+zknjbJciSgwF8seFdRijhiARfA6CCvDfKT+iGvlelA9QfHGMrTc5ENXj?=
 =?us-ascii?q?K47YRbeQ+2y3ddHRAZ0HnImuEgrPIFgyOf4CQv26OObdGTNOd8XPrhcuwFSX?=
 =?us-ascii?q?pdTPZvczJaEJnZDcMqH8ciF95187KklXwHogGDKTH0LtvBkwRUrS7X9J8L+L?=
 =?us-ascii?q?QBSVnqwxQLJvwLq33vvPr8FIMZY+zk17D24SzBQ8gH2mmty+2qOiEkhPG2DO?=
 =?us-ascii?q?NZXMfA9kg9MQzOrn+a97TrIxSe0/xdoi/ctshtDdqB1HAbglxr/R30z9Z1gK?=
 =?us-ascii?q?vHoItWl23g+C5766dqIsyDLSwzReG8PKpslyK2CKdKQOJlXHxrgwQTwK8clI?=
 =?us-ascii?q?GFbCIEzKQE1kOEddWcLMuQ8krNdvqfIjYiu1Bvdu3moki71VP819z3dOzRsh?=
 =?us-ascii?q?5snDRA1evjtCAj+Q3x1sXYZNVnwGjm1S2xiBzR1u9JcXI0h4mGFLotn7MTsY?=
 =?us-ascii?q?ot6GLvJHHypUDpj5aXd0t03Lnv6Or8O/26j8rJf9w8mkT/KKMogsulHaEiPx?=
 =?us-ascii?q?MTW3TO4e2nz+65px/QXalKg/sqk6LQrJHdI4Ehq7WkBxNOjNpx7gb5BDCi18?=
 =?us-ascii?q?4RkX5BIV5YK1qLjInsbknHO+uwTey+jFKljCpxyrjYM6fgDJTAIjmLkLrocb?=
 =?us-ascii?q?tnrU8J4BEvi9tY4p8=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3AyorEPh0k+yXgZbUesmDT+DJfSgsGnvDZIAcR95?=
 =?us-ascii?q?M7irVIL/TzrYq3ZR+X7KB3l1aMRoXSsa8a2KLd5rrtXWUQ7JrGqn0GeYxBW0?=
 =?us-ascii?q?xNhZANg0orB8vWQU2uIuTtamRoVNhFHA0t9HrzYwBOBcz8albOxx/6v3YeEw?=
 =?us-ascii?q?nyfVg9I+nuAYfdgoG226jgs5jSZggNmjenerJ1Kl3k5Q7WsNUbh5cnNrcpx0?=
 =?us-ascii?q?iBuS5zR8FXznlvKFaelArm4cGx94UwlkYYsfJ0z58ZTKv+VKdpbKx9Ih0hN1?=
 =?us-ascii?q?1kvsjElBboYgGwyVQ6dlU8oF1QISLH8xT+b8Ki10myvL9e2xS3E5DTSpUKeA?=
 =?us-ascii?q?2l6b1pay/ZmHlEZ2QT3kH3ktNgofJ78EyCliI4+97MTduYZPx+Y6H/JO8Ven?=
 =?us-ascii?q?VNTtpDZxJlHJiude5tR88REMVyl6ShnAI8ihKxHzSAPLvF8hERvWPdjIwT4d?=
 =?us-ascii?q?UKQSGehCA/B/k3nnHPpe7lG64ydeuHwPjT1AvvdvF64mb+ttjrF3JpkPSpXY?=
 =?us-ascii?q?ghIOP8xFgQFhHjgV6wg4a7Bz2J8e8IqziKqK05d+/3s0B4tT1Y/yLw45wlm9?=
 =?us-ascii?q?DDpIwzwxOZyAF0y4QeBIK/WXUeA5aAL4N8hh26NKdJbv8gYiZ3pSUB6JQMq4?=
 =?us-ascii?q?SWYxYawpoj9z3ONqeZWpPXoQrzDMizPTl7hShaWrix2E+Xr0GE0bHhZ8KW9T?=
 =?us-ascii?q?Mo5gx3jNyLhF8PhzL9++q7R6RT0F2f9nGDzD6M9uN4L01kp6rJCMMe5rJtm7?=
 =?us-ascii?q?k0oXqaOAPMxkHLibCVT0Ql9LiOuqPkbK6/7sO1Yto82Unud6U0ncqnBv4kdx?=
 =?us-ascii?q?IDRHWf5bGk3ab4rhejEpxXkv07lLXYu5nGJMMd45S0GBJRzp19t0S6H3Gt19?=
 =?us-ascii?q?Afh3ALKxRIdA/Ux4TqOlSbOPnjFr//mFWjlj532urLdqPsGJTDL3XP0f/hcL?=
 =?us-ascii?q?9x5lQayV8b1swZ7JVRBw=3D=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3AdFQDCxb+yR65JiWBgXSP9cn/LSx+5ufYHS8wr7?=
 =?us-ascii?q?c5grZTe7ii+JK/bByN+6A03xfACJ/A4rdfi+OM7v6zEWdV+5uFuWAPfNtWWh?=
 =?us-ascii?q?sMmcgazEQsVdWZT0b8Ka2ib3k0BsNHHA0t43bzYwBeE46sL0bPqH+/5iJ3eF?=
 =?us-ascii?q?2tfQZ8Oum9SMbXgt+s3u+/vpzfK1cAgTu4bPZsIQ+trALX/pteioxkNqs31l?=
 =?us-ascii?q?7Vs2NFKKxNkFhUAFOYhRHx4sq74IRk9SVboKFElYZKUfDCLv0lQ7hzD2UHI0?=
 =?us-ascii?q?UbzcrviEiZSCSu6VAzWFo5vTxsMyL3qwnYdJXuty/L47kYumGQaO71cJ0aBB?=
 =?us-ascii?q?GlyplKcRjukiUkBw8priKH0OZerIJDvwKM9zwvna3lXsatZOJTJK6Ne9MHR0?=
 =?us-ascii?q?gYYsluSCBRHpGMUa8RFPgbWIQQipnQhHE2gEeFXDuLDez19xNw3lXO8/QBz8?=
 =?us-ascii?q?9wMCj07SdwP4pWnGvMh+zbMbwbavCaxYnsxgfPPuhP5xvk6qTzIxN/8dLpP/?=
 =?us-ascii?q?pBdO/R8xh+Pi7In2qRu6rqNBO/3Lo1vXS85O94BfPozDcFpllJjGex+u5xkN?=
 =?us-ascii?q?bs3YsEk1rm+wNwg9sIAdCzSmVaPtm1K/4y/wWlL6dHfuMhb15EhCQbjaIbuq?=
 =?us-ascii?q?WZVSIY0rk4+Q7VZfi3UJnVuQzKT7nSOScgqlB5drG+3SmQ+0b/k8iiX+2vjE?=
 =?us-ascii?q?t7pQhg97uEkEIT0lvhxcrXZNVs3HushhihzT78re1fHx8ol5bVJs4TwqwTy6?=
 =?us-ascii?q?U3vRnOPQjmphzQoJXIcngh5euR6uXpMpO34ZySLNY81iirZ+x90tz6AP4/NB?=
 =?us-ascii?q?AJRXTe4+mnybn/qFXwW64Z1Kdku7TFsJ3cOcUQr7K4BAkQ6Is49hKjFGn6gt?=
 =?us-ascii?q?EI23IAKFVfcR6AyYXlJgKGLPP5CKKnik+32Hdwxv/AN6H8GJiFMHXZkbngcL?=
 =?us-ascii?q?o8o05RwQY+15ZesrpPFvcKJ/f+?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FJBgDME55dYU1DioBlhDUnKYE7EjS?=
 =?us-ascii?q?NG6MYAQEBAQEBAQEBBgEBLQIBAQEBhzM4EwMCCQEBAQMBAgIBBQIBAQICAxg?=
 =?us-ascii?q?WBoVrg0ZrAQEBAQEBAQEBAQEBAQEBAQEBARYCXE4BIQIkGQEBNwEFCQJQA1o?=
 =?us-ascii?q?BDQUFglJLgngEr2ECAYFyM4J+AYENAYRvgT8JIIhJhjE/hGGEKIYIrUcHgiV?=
 =?us-ascii?q?mBJQjJ5k/AYQ5iXSZNgIEAgQFAhWBaYF7TSOEDBAUj14BIReBeo5wgSMBAQ?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0E6AgDoDJ5dfU1DioBlhDUngWMSNI0?=
 =?us-ascii?q?boxgBAQEBAQEBAQEGAQEtAgEBAQGHMzgTAwIJAQEBAwECAgEFAgEBAgIQAQE?=
 =?us-ascii?q?JFgiFaYNGawEBAQEBAQEBAQEBAQEBAQEBAQEWAlxOIgI9AQE3AQUJAlADWgE?=
 =?us-ascii?q?NBQWCUkuCCwSvbwIBgiWCfgGBDQGEb4E/CSCISYYxP4RhhCiGAq1HB4IlZgS?=
 =?us-ascii?q?UIyeZPwGEOYl0mTYCBAIEBQIVgWmBe00jhAwQFI9eASEXQYE5kjqBIwEB?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FjAQDjBZ5dh0O0hNFlHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuBdCeBdSoKjRuHfJsKEQEBAQEBAQEBAQYBARgUAQIBAQEBhxA?=
 =?us-ascii?q?jOBMCAQIJAQEBAwEBAQIBBQIBAQICEAEBAQoLCQgphTQMg0ZrAQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBARYCCFROAQEbBQIkGQEBNwEFCQJQA1oBDQUFglJLggsEr1w?=
 =?us-ascii?q?BAQGBcjOCfQEBBYEIAYRugT8JgTSHNYRZgVg/hGGEKIYCrUcHgiVmBJQjJ5k?=
 =?us-ascii?q?/AYQ5iXSZNgIEAgQFAhWBaYF7TSODPFAQFIFPDBeDUIocASEXQAExgQYBAZI?=
 =?us-ascii?q?6gSMBAQ?=
X-IPAS-Result: =?us-ascii?q?A0FJBgDME55dYU1DioBlhDUnKYE7EjSNG6MYAQEBAQEBA?=
 =?us-ascii?q?QEBBgEBLQIBAQEBhzM4EwMCCQEBAQMBAgIBBQIBAQICAxgWBoVrg0ZrAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBARYCXE4BIQIkGQEBNwEFCQJQA1oBDQUFglJLgngEr?=
 =?us-ascii?q?2ECAYFyM4J+AYENAYRvgT8JIIhJhjE/hGGEKIYIrUcHgiVmBJQjJ5k/AYQ5i?=
 =?us-ascii?q?XSZNgIEAgQFAhWBaYF7TSOEDBAUj14BIReBeo5wgSMBAQ?=
X-IPAS-Result: =?us-ascii?q?A0E6AgDoDJ5dfU1DioBlhDUngWMSNI0boxgBAQEBAQEBA?=
 =?us-ascii?q?QEGAQEtAgEBAQGHMzgTAwIJAQEBAwECAgEFAgEBAgIQAQEJFgiFaYNGawEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEWAlxOIgI9AQE3AQUJAlADWgENBQWCUkuCCwSvb?=
 =?us-ascii?q?wIBgiWCfgGBDQGEb4E/CSCISYYxP4RhhCiGAq1HB4IlZgSUIyeZPwGEOYl0m?=
 =?us-ascii?q?TYCBAIEBQIVgWmBe00jhAwQFI9eASEXQYE5kjqBIwEB?=
X-IPAS-Result: =?us-ascii?q?A0FjAQDjBZ5dh0O0hNFlHAEBAQEBBwEBEQEEBAEBgXuBd?=
 =?us-ascii?q?CeBdSoKjRuHfJsKEQEBAQEBAQEBAQYBARgUAQIBAQEBhxAjOBMCAQIJAQEBA?=
 =?us-ascii?q?wEBAQIBBQIBAQICEAEBAQoLCQgphTQMg0ZrAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RYCCFROAQEbBQIkGQEBNwEFCQJQA1oBDQUFglJLggsEr1wBAQGBcjOCfQEBB?=
 =?us-ascii?q?YEIAYRugT8JgTSHNYRZgVg/hGGEKIYCrUcHgiVmBJQjJ5k/AYQ5iXSZNgIEA?=
 =?us-ascii?q?gQFAhWBaYF7TSODPFAQFIFPDBeDUIocASEXQAExgQYBAZI6gSMBAQ?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="scan'208"; a="371450812"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="371371628"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="371305457"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
From: "Benjamin Gaignard" <benjamin.gaignard@st.com>
To: "fweisbec@gmail.com" <fweisbec@gmail.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@kernel.org" <mingo@kernel.org>,
 "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "daniel.lezcano@linaro.org"
 <daniel.lezcano@linaro.org>
Date: Wed, 9 Oct 2019 18:02:46 +0200
Message-ID: <20191009160246.17898-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_07:2019-10-08,2019-10-09 signatures=0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:26:40.7991 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 7241afb8-2398-4f5c-79aa-08d74cddd8fa
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.67.85; IPV:CAL; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:BN6PR03MB3234; H:ipmx8.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: BN3NAM01FT014.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7241afb8-2398-4f5c-79aa-08d74cddd8fa
X-MS-TrafficTypeDiagnostic: BN6PR03MB3234:|BN6PR03MB3234:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:26:40.5549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7241afb8-2398-4f5c-79aa-08d74cddd8fa
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.67.85];
 Helo=[ipmx8.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3234
X-MS-Exchange-Transport-EndToEndLatency: 00:02:58.4009344
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fod6XfBuGr7rJVy2JuMdao8XEx7Kx1D+eKBYll5YakmPEldFxAMij7bRC8Me?=
 =?us-ascii?Q?foBYNXnESi8DKTNrgEBZpdYjEL+Xiqc8yDIlOJb9Yo2NnvZkaddMgOcILDua?=
 =?us-ascii?Q?wXYXmddcUTXprIItE+LbflQ+JnE3OnL1JavqWz2bkNWiwVi7Vbwr6Qymh8Ac?=
 =?us-ascii?Q?+F4o8gDlqbeQbV09sZ5dvSO6f+wY54nb4d+KNUOAw7haB3q1Plpmpr1hy53A?=
 =?us-ascii?Q?XvCsgRf7tYiMVsfp3XyHIMMO8CzzDHwGoZOsOlG9FsASWA++cRnya3Svwq7H?=
 =?us-ascii?Q?5CEpuSBVmumUihS9mtTHMRXq+FK8zEJ9tIVAIkI9O4Z0aA7ao9ekLE7w08nH?=
 =?us-ascii?Q?RzVn0wcesumQ42RcaECHQYDMHa+/pkun4vn4D3Jh9Q41xDi3UYfBcdtiaock?=
 =?us-ascii?Q?ZnHUHBn19Nje4vbMiXp/swjgNYvXKq16K8t4yQmDdrrE3PMdYdZSNvBMvbVJ?=
 =?us-ascii?Q?4erKoLHt0P7DfY7grWkHSklckJk1Mb00SqF8e9LtGC/giaCxt3hqEujyt1Gz?=
 =?us-ascii?Q?tWD2sYrO1KTa+uJ4b0gfSz2MoK0o8gI0nflkeErJVLJB4McHV8p1gWSxNgf5?=
 =?us-ascii?Q?Gm7g2VRFVoF7EnU7OObKYvJKDsoddEN423XR0c0t23OKTf4rqkn3/0ca1p0J?=
 =?us-ascii?Q?5tlGqiQ7QF0hoEOSsgdlxlI+ZcWS4mjB4IBHYW+HeJYC/79kWG6NnuY/xrLI?=
 =?us-ascii?Q?mTBtyTVnQBmVN+0Cxjv7oCsp2OK9WMQYEVimyEvP9iSAyEFbLAEvI9zhU9U6?=
 =?us-ascii?Q?vSB32ey+ijlXGDL8U9jTu1Oks1/uuJxjkmuZO6sL9VsXY2iQxqd2/uKiLZ1x?=
 =?us-ascii?Q?VxU6OaLmDOeTFmZKCb9jXu1zjZfuW3+2+XV9hPPj7mlulDiQ6iDHnr2Xk/SN?=
 =?us-ascii?Q?SlyXLUExe69bMsyysigVsOlN//mQzHKwCzM9OQ/tnO/LRNEm97+acMJ0TR4G?=
 =?us-ascii?Q?LCxDXZL9RjechK4rjf4/BmofQrH/pC18W7rompIaagyFMx9ZsOy8/4uPcHFP?=
 =?us-ascii?Q?FvIjZpyfRm/IvlcgkZA6xmhH1ZjHegzz5XihnHmQ8uXBC+7JraBntoJftloq?=
 =?us-ascii?Q?i8URBgqxrLr+ATYOkwmCi2TAohImbfyheFYyT9DBGv8MJTWTZ5WFJHmrql0/?=
 =?us-ascii?Q?DdiHCFwP0erIXDK+ZqQXsMcAvEpx7Y7cjg=3D=3D?=
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [PATCH] tick: check if broadcast device could really
	be stopped
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

If the CPU isn't able to go in states where the clock event will
be stopped we can ignore CLOCK_EVT_FEAT_C3STOP flag.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 kernel/time/tick-broadcast.c |  6 +++---
 kernel/time/tick-common.c    |  4 ++--
 kernel/time/tick-internal.h  | 12 ++++++++++++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/kernel/time/tick-broadcast.c b/kernel/time/tick-broadcast.c
index e51778c312f1..5393778d7703 100644
--- a/kernel/time/tick-broadcast.c
+++ b/kernel/time/tick-broadcast.c
@@ -78,7 +78,7 @@ static bool tick_check_broadcast_device(struct clock_event_device *curdev,
 {
 	if ((newdev->features & CLOCK_EVT_FEAT_DUMMY) ||
 	    (newdev->features & CLOCK_EVT_FEAT_PERCPU) ||
-	    (newdev->features & CLOCK_EVT_FEAT_C3STOP))
+	    tick_broadcast_could_stop(newdev))
 		return false;
 
 	if (tick_broadcast_device.mode == TICKDEV_MODE_ONESHOT &&
@@ -188,7 +188,7 @@ int tick_device_uses_broadcast(struct clock_event_device *dev, int cpu)
 		 * Clear the broadcast bit for this cpu if the
 		 * device is not power state affected.
 		 */
-		if (!(dev->features & CLOCK_EVT_FEAT_C3STOP))
+		if (!tick_broadcast_could_stop(dev))
 			cpumask_clear_cpu(cpu, tick_broadcast_mask);
 		else
 			tick_device_setup_broadcast_func(dev);
@@ -368,7 +368,7 @@ void tick_broadcast_control(enum tick_broadcast_mode mode)
 	/*
 	 * Is the device not affected by the powerstate ?
 	 */
-	if (!dev || !(dev->features & CLOCK_EVT_FEAT_C3STOP))
+	if (!dev || !tick_broadcast_could_stop(dev))
 		goto out;
 
 	if (!tick_device_is_functional(dev))
diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
index 59225b484e4e..a300ee941c56 100644
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -72,7 +72,7 @@ int tick_is_oneshot_available(void)
 
 	if (!dev || !(dev->features & CLOCK_EVT_FEAT_ONESHOT))
 		return 0;
-	if (!(dev->features & CLOCK_EVT_FEAT_C3STOP))
+	if (!tick_broadcast_could_stop(dev))
 		return 1;
 	return tick_broadcast_oneshot_available();
 }
@@ -393,7 +393,7 @@ int tick_broadcast_oneshot_control(enum tick_broadcast_state state)
 {
 	struct tick_device *td = this_cpu_ptr(&tick_cpu_device);
 
-	if (!(td->evtdev->features & CLOCK_EVT_FEAT_C3STOP))
+	if (!tick_broadcast_could_stop(td->evtdev))
 		return 0;
 
 	return __tick_broadcast_oneshot_control(state);
diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
index 7b2496136729..99aa7b5a8dae 100644
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@ -2,6 +2,7 @@
 /*
  * tick internal variable and functions used by low/high res code
  */
+#include <linux/cpuidle.h>
 #include <linux/hrtimer.h>
 #include <linux/tick.h>
 
@@ -48,6 +49,17 @@ static inline void clockevent_set_state(struct clock_event_device *dev,
 	dev->state_use_accessors = state;
 }
 
+/**
+ * Return true if the cpu could go in states where the device will be stopped
+ */
+static inline int tick_broadcast_could_stop(struct clock_event_device *dev)
+{
+	struct cpuidle_driver *drv = cpuidle_get_driver();
+
+	return !!((dev->features & CLOCK_EVT_FEAT_C3STOP)
+		  && drv && drv->bctimer);
+}
+
 extern void clockevents_shutdown(struct clock_event_device *dev);
 extern void clockevents_exchange_device(struct clock_event_device *old,
 					struct clock_event_device *new);
-- 
2.15.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
