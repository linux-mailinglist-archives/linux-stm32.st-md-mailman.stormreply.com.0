Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B050BB41
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 17:10:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74F68C6049D;
	Fri, 22 Apr 2022 15:10:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 080A8C6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 15:10:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M9XkOE025876;
 Fri, 22 Apr 2022 17:09:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=l9SvZJdyy9uik1+mGIZMe5PR4/rWu4TCEUCl9ef8drk=;
 b=jbKArl5ep7u/A1rbHlG5Z7uo3gZEl+6ZGde+j+xe+gGmxapzyLgljOhoQAzUZhw59Blw
 1t0bSa8oYoMukfyrXlETsxI18PAcnM901AKdxAQPuG2+FDV2rxPi+AUYOMFrfbLO+bOh
 1Gzl9zzTdYiMt91Jtmhq+B6fC9uUOuMWX+qIcvmUtWM4RUKyjXFSPrb8eQ0sjEXdyCe6
 z1K+/jJOwsCIJCHHhiC/UbDwATIbtq81nkNSZXnoNTqcRimNSBUYIzuycGgKygY/6pdE
 91da/OCfrlVoDUbGT58Wjhng7BiPMBFuoCp/yYKNqyu+RKubNEjx6ODwS+xEUG4uel34 ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe9v5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 17:09:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 653EB100034;
 Fri, 22 Apr 2022 17:09:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D7F1233C64;
 Fri, 22 Apr 2022 17:09:56 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 17:09:56 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <arnd@arndb.de>, <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 22 Apr 2022 17:09:47 +0200
Message-ID: <20220422150952.20587-4-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_04,2022-04-22_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, etienne.carriere@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/8] dt-bindings: clock: stm32mp15: rename
	CK_SCMI define
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

diff --git a/include/dt-bindings/clock/stm32mp1-clks.h b/include/dt-bindings/clock/stm32mp1-clks.h
index e02770b98e6c..25e8cfd43459 100644
--- a/include/dt-bindings/clock/stm32mp1-clks.h
+++ b/include/dt-bindings/clock/stm32mp1-clks.h
@@ -249,30 +249,26 @@
 #define STM32MP1_LAST_CLK 232
 
 /* SCMI clock identifiers */
-#define CK_SCMI0_HSE		0
-#define CK_SCMI0_HSI		1
-#define CK_SCMI0_CSI		2
-#define CK_SCMI0_LSE		3
-#define CK_SCMI0_LSI		4
-#define CK_SCMI0_PLL2_Q		5
-#define CK_SCMI0_PLL2_R		6
-#define CK_SCMI0_MPU		7
-#define CK_SCMI0_AXI		8
-#define CK_SCMI0_BSEC		9
-#define CK_SCMI0_CRYP1		10
-#define CK_SCMI0_GPIOZ		11
-#define CK_SCMI0_HASH1		12
-#define CK_SCMI0_I2C4		13
-#define CK_SCMI0_I2C6		14
-#define CK_SCMI0_IWDG1		15
-#define CK_SCMI0_RNG1		16
-#define CK_SCMI0_RTC		17
-#define CK_SCMI0_RTCAPB		18
-#define CK_SCMI0_SPI6		19
-#define CK_SCMI0_USART1		20
-
-#define CK_SCMI1_PLL3_Q		0
-#define CK_SCMI1_PLL3_R		1
-#define CK_SCMI1_MCU		2
+#define CK_SCMI_HSE		0
+#define CK_SCMI_HSI		1
+#define CK_SCMI_CSI		2
+#define CK_SCMI_LSE		3
+#define CK_SCMI_LSI		4
+#define CK_SCMI_PLL2_Q		5
+#define CK_SCMI_PLL2_R		6
+#define CK_SCMI_MPU		7
+#define CK_SCMI_AXI		8
+#define CK_SCMI_BSEC		9
+#define CK_SCMI_CRYP1		10
+#define CK_SCMI_GPIOZ		11
+#define CK_SCMI_HASH1		12
+#define CK_SCMI_I2C4		13
+#define CK_SCMI_I2C6		14
+#define CK_SCMI_IWDG1		15
+#define CK_SCMI_RNG1		16
+#define CK_SCMI_RTC		17
+#define CK_SCMI_RTCAPB		18
+#define CK_SCMI_SPI6		19
+#define CK_SCMI_USART1		20
 
 #endif /* _DT_BINDINGS_STM32MP1_CLKS_H_ */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
