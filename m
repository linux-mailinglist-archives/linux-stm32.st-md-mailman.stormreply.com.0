Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E1F10569A
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 17:12:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40829C36B0B;
	Thu, 21 Nov 2019 16:12:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 085E2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 16:12:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALFq6jY032620; Thu, 21 Nov 2019 17:11:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=t+47w3ZxOzPvOfnpHUIZTNysGQGkRlS9if3BoXHEp/c=;
 b=p8vWYBuX6eITDAoXWYZA61KOdd4iq4NhRXTUYCVWt8N/AkTLVq2MPadHjY//4W2KPkvg
 X8Ujq4pLwkmnAvLUBF72d1DdE3rtw5cBZRko6ozJsdgDlJZ59qA5xul+X9FRCegno9ys
 D7csLi4X5StafcofndVVieUXGMLXtxYD81kBkH03ZMMMMG/QBe9OkgD0KCVqMTpphCFU
 Uzu09qezYWTeLM0lDTr4YnPqm1oxwul6shBVKztUAswwEln2HHDJ9B3Tu+NiJd1LH4i5
 Rj+6xtnZdfJTjnKSBcYm9EfJ8UOrCimrjbMEeQDEjARCdyDBI3rOn0Oz0OctGFNUtvIP MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9ujc9ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 17:11:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C80910002A;
 Thu, 21 Nov 2019 17:11:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 152102C084E;
 Thu, 21 Nov 2019 17:11:53 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 21 Nov 2019 17:11:52
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Nov 2019 17:11:52 +0100
Message-ID: <20191121161152.25541-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_03:2019-11-21,2019-11-21 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/5] USB support on stm32mp157 boards
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

This patchset adds support for USB (Host and OTG) on stm32mp157a-dk1.
USB OTG HS is forced in Peripheral mode.
This patchset also fixes USB on stm32mp157c-ev1: USB PHYS supplies were missing
(CONFIG_REGULATOR_STM32_PWR) and usbotg_hs node requires phy-names property to
get the phy.

Amelie Delaunay (5):
  ARM: multi_v7_defconfig: enable STM32 PWR regulator
  ARM: dts: stm32: enable USBPHYC on stm32mp157a-dk1
  ARM: dts: stm32: enable USB Host (USBH) EHCI controller on
    stm32mp157a-dk1
  ARM: dts: stm32: enable USB OTG HS on stm32mp157a-dk1
  ARM: dts: stm32: add phy-names to usbotg_hs on stm32mp157c-ev1

 arch/arm/boot/dts/stm32mp157a-dk1.dts | 28 +++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts |  1 +
 arch/arm/configs/multi_v7_defconfig   |  1 +
 3 files changed, 30 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
