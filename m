Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ACD3AAAD5
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 07:18:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F10C7C597BF;
	Thu, 17 Jun 2021 05:18:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5FD2C597B1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 05:18:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H5GPU3012633; Thu, 17 Jun 2021 07:18:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=A31WB8a45RdJNJyy4CkopYj1ZluLSRGlf/Y3plnveP0=;
 b=DDaTm3lVEzC8dZ1UqTCiN6ZDLLvhxKUXz3dqbF5j0TacKCBi9rGgl9Hk8AOEWyx7hrps
 WsfXnQTfSp5ViwyhZClDuIqVRDabOMo2CgboEiTpwXumt6eCol+B8H+hWwpYgB4/9idI
 6b3hTTnirIgCbKc/rRCmCpl3mqE9FfQOnU4+duqd6Amr4T4k5g9YMkLsrNgyScGXQor2
 OWmIDSwlUNfgl6AZ8wjuQThZX75B/fyRf8tPom8XDTAxCgZXLGReHXX/SEdMLHXMaf2P
 x2Ck4HRlXypafGGl+TJv3oo9MeA6920PNvrLVqMfkfstr993D9I4KzMoFo4hR+4hu42b AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 397mmvatjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:18:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2909D100034;
 Thu, 17 Jun 2021 07:18:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1738D211278;
 Thu, 17 Jun 2021 07:18:25 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun 2021 07:18:24
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, <marex@denx.de>
Date: Thu, 17 Jun 2021 07:18:10 +0200
Message-ID: <20210617051814.12018-8-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_01:2021-06-15,
 2021-06-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RESEND PATCH v3 07/11] dt-bindings: clock: add IDs
	for SCMI clocks on stm32mp15
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

stm32mp15 TZ secure firmware provides SCMI clocks for oscillators, some
PLL output and few secure aware interfaces.
This change defines the SCMI clock identifiers used by SCMI agents
and servers.
Server SCMI0 exposes clocks and reset controllers for resources under
RCC[TZEN] configuration control.
Server SCMI1 exposes clocks for resources under RCC[MCKPROT] control.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/stm32mp1-clks.h | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/dt-bindings/clock/stm32mp1-clks.h b/include/dt-bindings/clock/stm32mp1-clks.h
index 4cdaf135829c..e02770b98e6c 100644
--- a/include/dt-bindings/clock/stm32mp1-clks.h
+++ b/include/dt-bindings/clock/stm32mp1-clks.h
@@ -248,4 +248,31 @@
 
 #define STM32MP1_LAST_CLK 232
 
+/* SCMI clock identifiers */
+#define CK_SCMI0_HSE		0
+#define CK_SCMI0_HSI		1
+#define CK_SCMI0_CSI		2
+#define CK_SCMI0_LSE		3
+#define CK_SCMI0_LSI		4
+#define CK_SCMI0_PLL2_Q		5
+#define CK_SCMI0_PLL2_R		6
+#define CK_SCMI0_MPU		7
+#define CK_SCMI0_AXI		8
+#define CK_SCMI0_BSEC		9
+#define CK_SCMI0_CRYP1		10
+#define CK_SCMI0_GPIOZ		11
+#define CK_SCMI0_HASH1		12
+#define CK_SCMI0_I2C4		13
+#define CK_SCMI0_I2C6		14
+#define CK_SCMI0_IWDG1		15
+#define CK_SCMI0_RNG1		16
+#define CK_SCMI0_RTC		17
+#define CK_SCMI0_RTCAPB		18
+#define CK_SCMI0_SPI6		19
+#define CK_SCMI0_USART1		20
+
+#define CK_SCMI1_PLL3_Q		0
+#define CK_SCMI1_PLL3_R		1
+#define CK_SCMI1_MCU		2
+
 #endif /* _DT_BINDINGS_STM32MP1_CLKS_H_ */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
