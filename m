Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5F50BB42
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 17:10:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88FCEC628A4;
	Fri, 22 Apr 2022 15:10:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BAD4C6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 15:10:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23MEYpBg004664;
 Fri, 22 Apr 2022 17:09:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=9QxTQMUq/Xo8vdY6aSgRWMlI+mjf+2qkd9WP7GUpTsg=;
 b=Ln1OT3cHY7fMCotXOcF1xtV1w1/MCnpw+WVkG4tNhhJ1LT3BXhPKxK62Lc59rcjqhFor
 ZP6AD9hOkedjAD+CsJ0UCmgNPK+ux54d0ho39Qz/y1Z2AGMv5ERelxM2O8tZotp85UxJ
 Q+hwbXhapEObuiuEDJFEkDh3Qp2p9/nEAQl53QF8wQS0NeE4rdom9pvte7qZejNMrcxD
 S/U7OgyukjJmEyPQBsRQCQzXGT0K5prJxp02FUInkyHoPRAI6wEmvexZe1lvJAQ9dFAJ
 XYnSaovAiuu3Xnn9H20npmcC1S1GU+8T74C6vPkrA7y/xErV0MITVOP5dXU5/fP5Ks+i iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe9v5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 17:09:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB02E10002A;
 Fri, 22 Apr 2022 17:09:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E21A8233C65;
 Fri, 22 Apr 2022 17:09:56 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 17:09:56 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <arnd@arndb.de>, <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 22 Apr 2022 17:09:48 +0200
Message-ID: <20220422150952.20587-5-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_04,2022-04-22_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, etienne.carriere@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/8] dt-bindings: reset: stm32mp15: rename
	RST_SCMI define
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

As we only have one SCMI instance, it's not necessary to add an index to
the name.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/include/dt-bindings/reset/stm32mp1-resets.h b/include/dt-bindings/reset/stm32mp1-resets.h
index f3a0ed317835..4ffa7c3612e6 100644
--- a/include/dt-bindings/reset/stm32mp1-resets.h
+++ b/include/dt-bindings/reset/stm32mp1-resets.h
@@ -107,17 +107,17 @@
 #define GPIOK_R		19786
 
 /* SCMI reset domain identifiers */
-#define RST_SCMI0_SPI6		0
-#define RST_SCMI0_I2C4		1
-#define RST_SCMI0_I2C6		2
-#define RST_SCMI0_USART1	3
-#define RST_SCMI0_STGEN		4
-#define RST_SCMI0_GPIOZ		5
-#define RST_SCMI0_CRYP1		6
-#define RST_SCMI0_HASH1		7
-#define RST_SCMI0_RNG1		8
-#define RST_SCMI0_MDMA		9
-#define RST_SCMI0_MCU		10
-#define RST_SCMI0_MCU_HOLD_BOOT	11
+#define RST_SCMI_SPI6		0
+#define RST_SCMI_I2C4		1
+#define RST_SCMI_I2C6		2
+#define RST_SCMI_USART1	3
+#define RST_SCMI_STGEN		4
+#define RST_SCMI_GPIOZ		5
+#define RST_SCMI_CRYP1		6
+#define RST_SCMI_HASH1		7
+#define RST_SCMI_RNG1		8
+#define RST_SCMI_MDMA		9
+#define RST_SCMI_MCU		10
+#define RST_SCMI_MCU_HOLD_BOOT	11
 
 #endif /* _DT_BINDINGS_STM32MP1_RESET_H_ */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
