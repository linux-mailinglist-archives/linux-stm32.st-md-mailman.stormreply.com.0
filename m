Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D95983AAAD7
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 07:18:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F611C5A4C9;
	Thu, 17 Jun 2021 05:18:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9810C597B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 05:18:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H5H5f6032289; Thu, 17 Jun 2021 07:18:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=4T6Qz2/JmceHcxFve+YnEKkureSv6YCau+hALUO8xJQ=;
 b=2ZwXSCSab6fzOy1D0dMtWdoTwg94jR7G34y1pu2FGo+LdoQCoZl5AWfC5ZA+S8Wk4C7U
 3I61jGb27iRXZpwyTuIwlvQ+2iNW3lqnFUxhXiBKao23c7u7AHkD+QeBM4oCJLOcA7qk
 l5ofuyo7lNXaCUzcLTna5ja2XIrgUG+SZJG5tDmZMxxz6iz61wYyUyKKseM83l5TSKIf
 NSXHmd5sA8+B8YZ3gjbyFjl54+IL0z6IJnKHDsdS4goqN91Sg/mDEhbRS+dRkYGb8eC2
 kshM2jEKHYUFLUxmffq8EUlBny6/dZNcuqX3xV2BDfXZuelMfMlJZrhNHQ3IKvAvECK3 Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 397bxapeay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:18:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E055D100038;
 Thu, 17 Jun 2021 07:18:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBC2F211278;
 Thu, 17 Jun 2021 07:18:25 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun 2021 07:18:25
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, <marex@denx.de>
Date: Thu, 17 Jun 2021 07:18:11 +0200
Message-ID: <20210617051814.12018-9-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_01:2021-06-15,
 2021-06-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RESEND PATCH v3 08/11] dt-bindings: reset: add IDs
	for SCMI reset domains on stm32mp15
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

stm32mp15 TZ secure firmware provides SCMI reset domains for
secure resources. This change defines the SCMI reset domain
identifiers used by SCMI agents and servers.

Stm32mp15 TZ secure firmware provides SCMI clocks for oscillators, some
PLL output and few secure aware interfaces. This change defines the
SCMI clock identifiers used by SCMI agents and servers.

Server SCMI0 exposes reset controllers for resources under RCC[TZEN]
configuration control.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/reset/stm32mp1-resets.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/dt-bindings/reset/stm32mp1-resets.h b/include/dt-bindings/reset/stm32mp1-resets.h
index f0c3aaef67a0..bc71924faa54 100644
--- a/include/dt-bindings/reset/stm32mp1-resets.h
+++ b/include/dt-bindings/reset/stm32mp1-resets.h
@@ -105,4 +105,17 @@
 #define GPIOJ_R		19785
 #define GPIOK_R		19786
 
+/* SCMI reset domain identifiers */
+#define RST_SCMI0_SPI6		0
+#define RST_SCMI0_I2C4		1
+#define RST_SCMI0_I2C6		2
+#define RST_SCMI0_USART1	3
+#define RST_SCMI0_STGEN		4
+#define RST_SCMI0_GPIOZ		5
+#define RST_SCMI0_CRYP1		6
+#define RST_SCMI0_HASH1		7
+#define RST_SCMI0_RNG1		8
+#define RST_SCMI0_MDMA		9
+#define RST_SCMI0_MCU		10
+
 #endif /* _DT_BINDINGS_STM32MP1_RESET_H_ */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
