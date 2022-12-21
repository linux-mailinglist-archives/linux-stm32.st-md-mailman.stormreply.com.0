Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B465653588
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Dec 2022 18:46:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2ED0C69058;
	Wed, 21 Dec 2022 17:46:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C36FC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Dec 2022 17:33:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLDfZSw026717; Wed, 21 Dec 2022 18:32:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=pnk0AODRWy9qchWqvydC204yIzXNjeaL4loMfcA2TJ0=;
 b=Z8mDQIlKYwALDFujDUgCm/kNVM9X0aH1YFtcoDwPJQThwb1dVfz6dgtsMO/HxvcjdTcT
 fKyiTHcQBWvXofXBBFqHHaeZacVSDYcLcH6Fx6DAJdlMsKpTYNOgyY+Owdz7i5Y2r0tu
 kUSrUa4PcyvWfJjz77k0oxvC1MY1+yDDPan/cNUlpIZT/yKYYEm2x/IobjAl1Xgs5sxh
 OWG/AWvHzoB5puxybNltgDTZEGwszfu8zYTeXLta3DudmshOnaAwtVDfIaeVmIANp30U
 oo10pPe1awurRgIRlBpV4zU25pSgD4oJnD/Ra6iK0g79FMaF3vfKapQba4dK7DYUY1af kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mka9xapqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 18:32:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7334310002A;
 Wed, 21 Dec 2022 18:32:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CFD724C45A;
 Wed, 21 Dec 2022 18:32:47 +0100 (CET)
Received: from localhost (10.201.21.217) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 21 Dec
 2022 18:32:47 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <Oleksii_Moisieiev@epam.com>, <linus.walleij@linaro.org>,
 <gregkh@linuxfoundation.org>
Date: Wed, 21 Dec 2022 18:30:52 +0100
Message-ID: <20221221173055.11719-5-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.217]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_10,2022-12-21_01,2022-06-22_01
X-Mailman-Approved-At: Wed, 21 Dec 2022 17:46:17 +0000
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, gatien.chevallier@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH 4/7] dt-bindings: bus: add STM32MP13 ETZPC
	firewall bus bindings
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

Adds the list of peripherals IDs under firewall bus on STM32MP13.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 include/dt-bindings/bus/stm32mp13_sys_bus.h | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 include/dt-bindings/bus/stm32mp13_sys_bus.h

diff --git a/include/dt-bindings/bus/stm32mp13_sys_bus.h b/include/dt-bindings/bus/stm32mp13_sys_bus.h
new file mode 100644
index 000000000000..1160de87bc4a
--- /dev/null
+++ b/include/dt-bindings/bus/stm32mp13_sys_bus.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ */
+#ifndef _DT_BINDINGS_BUS_STM32MP13_SYS_BUS_H
+#define _DT_BINDINGS_BUS_STM32MP13_SYS_BUS_H
+
+/* ETZPC IDs */
+#define STM32MP1_ETZPC_VREFBUF_ID	0
+#define STM32MP1_ETZPC_LPTIM2_ID	1
+#define STM32MP1_ETZPC_LPTIM3_ID	2
+#define STM32MP1_ETZPC_LTDC_ID		3
+#define STM32MP1_ETZPC_DCMIPP_ID	4
+#define STM32MP1_ETZPC_USBPHYCTRL_ID	5
+#define STM32MP1_ETZPC_DDRCTRLPHY_ID	6
+/* IDs 7-11 reserved */
+#define STM32MP1_ETZPC_IWDG1_ID		12
+#define STM32MP1_ETZPC_STGENC_ID	13
+/* IDs 14-15 reserved */
+#define STM32MP1_ETZPC_USART1_ID	16
+#define STM32MP1_ETZPC_USART2_ID	17
+#define STM32MP1_ETZPC_SPI4_ID		18
+#define STM32MP1_ETZPC_SPI5_ID		19
+#define STM32MP1_ETZPC_I2C3_ID		20
+#define STM32MP1_ETZPC_I2C4_ID		21
+#define STM32MP1_ETZPC_I2C5_ID		22
+#define STM32MP1_ETZPC_TIM12_ID		23
+#define STM32MP1_ETZPC_TIM13_ID		24
+#define STM32MP1_ETZPC_TIM14_ID		25
+#define STM32MP1_ETZPC_TIM15_ID		26
+#define STM32MP1_ETZPC_TIM16_ID		27
+#define STM32MP1_ETZPC_TIM17_ID		28
+/* IDs 29-31 reserved */
+#define STM32MP1_ETZPC_ADC1_ID		32
+#define STM32MP1_ETZPC_ADC2_ID		33
+#define STM32MP1_ETZPC_OTG_ID		34
+/* IDs 35-39 reserved */
+#define STM32MP1_ETZPC_TSC_ID		37
+#define STM32MP1_ETZPC_RNG_ID		40
+#define STM32MP1_ETZPC_HASH_ID		41
+#define STM32MP1_ETZPC_CRYP_ID		42
+#define STM32MP1_ETZPC_SAES_ID		43
+#define STM32MP1_ETZPC_PKA_ID		44
+#define STM32MP1_ETZPC_BKPSRAM_ID	45
+/* IDs 46-47 reserved */
+#define STM32MP1_ETZPC_ETH1_ID		48
+#define STM32MP1_ETZPC_ETH2_ID		49
+#define STM32MP1_ETZPC_SDMMC1_ID	50
+#define STM32MP1_ETZPC_SDMMC2_ID	51
+/* ID 52 reserved */
+#define STM32MP1_ETZPC_MCE_ID		53
+#define STM32MP1_ETZPC_FMC_ID		54
+#define STM32MP1_ETZPC_QSPI_ID		55
+/* IDs 56-59 reserved */
+#define STM32MP1_ETZPC_SRAM1_ID		60
+#define STM32MP1_ETZPC_SRAM2_ID		61
+#define STM32MP1_ETZPC_SRAM3_ID		62
+/* ID 63 reserved */
+
+#endif /* _DT_BINDINGS_BUS_STM32MP13_SYS_BUS_H */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
