Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C93BF3D3B0E
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 15:28:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EA40C5A4CF;
	Fri, 23 Jul 2021 13:28:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A59E1C5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 13:28:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NDBpmh019207; Fri, 23 Jul 2021 15:28:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=iBoH+/IMNmZJPhWTx8FB8yHSnaU+16pX2EaI38Jq0TY=;
 b=MgY0T1m2Q1PrNIXnZiMVgUOND6YpGKBbYIEHLwFrs/gTpKKlJaWtyx5znXKbWfo1Ji85
 nT6CgpHj7yyXp9AHtekcqINtCpGarO5iMiflnIGD7RuiYzIDlt2I/3EeecZ/0IyGQVKX
 qtUK8fx7K1JT2dI9JBhiKhoeZ1aOK0EQvrp0V0/x+bVCuoCcA1bCACPMehWrjJpAX72C
 9zqngn2itgmV7DVGcB3Swy1pd+v9FDWHqk1nsUDDZ9059ujtuioZdiEL/2v/x6zG6xni
 FlPHN2CSjMhRRTcrPs0HDnhMlb8CXZGC8TDblNs4PDXB7eedTYLQ3ueG5VJ5rUu7JPDR pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39ypq8jp08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 15:28:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBC35100039;
 Fri, 23 Jul 2021 15:28:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C85F2221783;
 Fri, 23 Jul 2021 15:28:14 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul 2021 15:28:14
 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, <arnd@arndb.de>, Olof Johansson
 <olof@lixom.net>, <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>
Date: Fri, 23 Jul 2021 15:28:06 +0200
Message-ID: <20210723132810.25728-4-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-23_05:2021-07-23,
 2021-07-23 signatures=0
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/7] docs: arm: stm32: introduce STM32MP13 SoCs
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

STM32MP13 SoCs are derivative of STM32MP15 SoCs. They embed one Cortex-A7
plus standard connectivity.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
index d4f34ae9e6f4..2bda5461a80b 100644
--- a/Documentation/arm/index.rst
+++ b/Documentation/arm/index.rst
@@ -55,6 +55,7 @@ SoC-specific documents
    stm32/stm32h750-overview
    stm32/stm32f769-overview
    stm32/stm32f429-overview
+   stm32/stm32mp13-overview
    stm32/stm32mp157-overview
 
    sunxi
diff --git a/Documentation/arm/stm32/stm32mp13-overview.rst b/Documentation/arm/stm32/stm32mp13-overview.rst
new file mode 100644
index 000000000000..3bb9492dad49
--- /dev/null
+++ b/Documentation/arm/stm32/stm32mp13-overview.rst
@@ -0,0 +1,37 @@
+===================
+STM32MP13 Overview
+===================
+
+Introduction
+------------
+
+The STM32MP131/STM32MP133/STM32MP135 are Cortex-A MPU aimed at various applications.
+They feature:
+
+- One Cortex-A7 application core
+- Standard memories interface support
+- Standard connectivity, widely inherited from the STM32 MCU family
+- Comprehensive security support
+
+More details:
+
+- Cortex-A7 core running up to @900MHz
+- FMC controller to connect SDRAM, NOR and NAND memories
+- QSPI
+- SD/MMC/SDIO support
+- 2*Ethernet controller
+- CAN
+- ADC/DAC
+- USB EHCI/OHCI controllers
+- USB OTG
+- I2C, SPI, CAN busses support
+- Several general purpose timers
+- Serial Audio interface
+- LCD controller
+- DCMIPP
+- SPDIFRX
+- DFSDM
+
+:Authors:
+
+- Alexandre Torgue <alexandre.torgue@foss.st.com>
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
