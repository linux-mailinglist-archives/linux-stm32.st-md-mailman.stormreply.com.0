Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C09EBEB
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 17:08:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48EECC35E04;
	Tue, 27 Aug 2019 15:08:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04D87C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2019 15:08:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RF27Pu026516; Tue, 27 Aug 2019 17:08:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MKlaahYh2GyrYNC5OSGbdIImAgdDz5WxBqftSeUPh6k=;
 b=QWOq4bQUMB5zBU1+CzaYPmnKeVEpx+m6YtBdbQ+JTjVJtfKZLxfXYcZWWIP61Egv4hny
 TQjT0+ak6jI32S4OD2hd9Fx21WbUZ5GJefv94gDkc9H56I2/u67lqOsaVzBEUakwCJ5V
 bx2mpGWek4rQUDqWotQ3lzuo8HK77C6gV4IdoAG6WJfXt2BEmrC66G2VWhGUuyd8i2aQ
 F2Lb3QodX3RpwOhBJBvAvq9DDUaKQ+nQuROR4RwVz0k2Wx5Ei8ZbEiXEgfZtBbmF9pq/
 6LHyUvVMyhQ6nNIsYGdgdABWjz06OLYUSbffJZLdCyfde85BicwlxQ3gA+5nAub496Py CA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2ujv4kt4ay-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 27 Aug 2019 17:08:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 20AD154;
 Tue, 27 Aug 2019 15:08:22 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCE1B2B76DF;
 Tue, 27 Aug 2019 17:08:21 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Aug
 2019 17:08:21 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 27 Aug 2019 17:08:21 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: "will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net"
 <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>
Thread-Topic: [PATCH v3 4/5] ARM: configs: enable STM32_DDR_PMU
Thread-Index: AQHVXOlD6Kq1uoloYU2GrfhWvkfaXA==
Date: Tue, 27 Aug 2019 15:08:21 +0000
Message-ID: <1566918464-23927-5-git-send-email-gerald.baeza@st.com>
References: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
In-Reply-To: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_03:, , signatures=0
Cc: Gerald BAEZA <gerald.baeza@st.com>
Subject: [Linux-stm32] [PATCH v3 4/5] ARM: configs: enable STM32_DDR_PMU
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
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

STM32_DDR_PMU enables the perf driver that
controls the DDR Performance Monitor (DDRPERFM)

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6a40bc2..8fa4690 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1011,6 +1011,7 @@ CONFIG_PHY_DM816X_USB=m
 CONFIG_OMAP_USB2=y
 CONFIG_TI_PIPE3=y
 CONFIG_TWL4030_USB=m
+CONFIG_STM32_DDR_PMU=m
 CONFIG_MESON_MX_EFUSE=m
 CONFIG_ROCKCHIP_EFUSE=m
 CONFIG_NVMEM_IMX_OCOTP=y
-- 
2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
