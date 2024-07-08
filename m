Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0592A5CF
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2024 17:36:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4DEBC6DD96;
	Mon,  8 Jul 2024 15:36:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6C20C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2024 15:36:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468CNpqB021626;
 Mon, 8 Jul 2024 17:35:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 J1GYQoG/MOzUks6R/F0NbZqXAOFjwLwk5Y99MtlLrsM=; b=FvIN2spMKl3qjXzf
 hMqdVuleorPi9LcAjikRn9LTr8KWXmxUC+9vKjD23UelWaWAI84sEh80koUBsMJd
 AyqbFsWru6F6isJ1Co/PBzZRqLAED/YzY6FZX4tYC8WCz9U/s5GgrvlGV1y2gFQ4
 FdigcwG2gYSN7esmz7FYtRUCHiRyO+I1i4GAEupsM8O6BttRRRs71l09x35EGR6d
 afDByyp3S9np7ofbNrGStUovJ8Q/vtRY9jmjZz5oedYOk8WvFTvVz3V1wrZzTT3V
 8ZRlXuTyRbm8SrJK0CWOK/bqwFoNP1xGkjDNK64hP/vJYRWA0EWDY1QUCLOHSIbL
 fDKwyg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406wqt7h00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2024 17:35:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 02FEA40044;
 Mon,  8 Jul 2024 17:35:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5209422D0F2;
 Mon,  8 Jul 2024 17:35:08 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Jul
 2024 17:35:07 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Mon, 8 Jul 2024 17:34:34 +0200
Message-ID: <20240708153434.416287-3-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240708153434.416287-1-valentin.caron@foss.st.com>
References: <20240708153434.416287-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] rtc: stm32: add new st,
	stm32mp25-rtc compatible and check RIF configuration
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

Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.

Difference is that stm32mp25 soc implements a triple protection on RTC
registers:
- Secure bit based protection
- Privileged context based protection
- Compartment ID filtering based protection
This driver will now check theses configurations before probing to avoid
exceptions and fake reads on register.

At this time, driver needs only to check two resources: INIT and ALARM_A.
Other resources are not used.

Resource isolation framework (RIF) is a comprehensive set of hardware
blocks designed to enforce and manage isolation of STM32 hardware
resources, like memory and peripherals.

Link: https://www.st.com/resource/en/reference_manual/rm0457-stm32mp25xx-advanced-armbased-3264bit-mpus-stmicroelectronics.pdf#page=4081
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/rtc/rtc-stm32.c | 78 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 76753c71d92e..98b07969609d 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/iopoll.h>
@@ -83,6 +84,18 @@
 #define STM32_RTC_VERR_MAJREV_SHIFT	4
 #define STM32_RTC_VERR_MAJREV		GENMASK(7, 4)
 
+/* STM32_RTC_SECCFGR bit fields */
+#define STM32_RTC_SECCFGR		0x20
+#define STM32_RTC_SECCFGR_ALRA_SEC	BIT(0)
+#define STM32_RTC_SECCFGR_INIT_SEC	BIT(14)
+#define STM32_RTC_SECCFGR_SEC		BIT(15)
+
+/* STM32_RTC_RXCIDCFGR bit fields */
+#define STM32_RTC_RXCIDCFGR(x)		(0x80 + 0x4 * (x))
+#define STM32_RTC_RXCIDCFGR_CFEN	BIT(0)
+#define STM32_RTC_RXCIDCFGR_CID		GENMASK(6, 4)
+#define STM32_RTC_RXCIDCFGR_CID1	1
+
 /* STM32_RTC_WPR key constants */
 #define RTC_WPR_1ST_KEY			0xCA
 #define RTC_WPR_2ND_KEY			0x53
@@ -120,6 +133,7 @@ struct stm32_rtc_data {
 	bool has_pclk;
 	bool need_dbp;
 	bool need_accuracy;
+	bool rif_protected;
 };
 
 struct stm32_rtc {
@@ -134,6 +148,14 @@ struct stm32_rtc {
 	int irq_alarm;
 };
 
+struct stm32_rtc_rif_resource {
+	unsigned int num;
+	u32 bit;
+};
+
+static const struct stm32_rtc_rif_resource STM32_RTC_RES_ALRA = {0, STM32_RTC_SECCFGR_ALRA_SEC};
+static const struct stm32_rtc_rif_resource STM32_RTC_RES_INIT = {5, STM32_RTC_SECCFGR_INIT_SEC};
+
 static void stm32_rtc_wpr_unlock(struct stm32_rtc *rtc)
 {
 	const struct stm32_rtc_registers *regs = &rtc->data->regs;
@@ -553,6 +575,7 @@ static const struct stm32_rtc_data stm32_rtc_data = {
 	.has_pclk = false,
 	.need_dbp = true,
 	.need_accuracy = false,
+	.rif_protected = false,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -575,6 +598,7 @@ static const struct stm32_rtc_data stm32h7_rtc_data = {
 	.has_pclk = true,
 	.need_dbp = true,
 	.need_accuracy = false,
+	.rif_protected = false,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -606,6 +630,7 @@ static const struct stm32_rtc_data stm32mp1_data = {
 	.has_pclk = true,
 	.need_dbp = false,
 	.need_accuracy = true,
+	.rif_protected = false,
 	.regs = {
 		.tr = 0x00,
 		.dr = 0x04,
@@ -624,14 +649,57 @@ static const struct stm32_rtc_data stm32mp1_data = {
 	.clear_events = stm32mp1_rtc_clear_events,
 };
 
+static const struct stm32_rtc_data stm32mp25_data = {
+	.has_pclk = true,
+	.need_dbp = false,
+	.need_accuracy = true,
+	.rif_protected = true,
+	.regs = {
+		.tr = 0x00,
+		.dr = 0x04,
+		.cr = 0x18,
+		.isr = 0x0C, /* named RTC_ICSR on stm32mp25 */
+		.prer = 0x10,
+		.alrmar = 0x40,
+		.wpr = 0x24,
+		.sr = 0x50,
+		.scr = 0x5C,
+		.verr = 0x3F4,
+	},
+	.events = {
+		.alra = STM32_RTC_SR_ALRA,
+	},
+	.clear_events = stm32mp1_rtc_clear_events,
+};
+
 static const struct of_device_id stm32_rtc_of_match[] = {
 	{ .compatible = "st,stm32-rtc", .data = &stm32_rtc_data },
 	{ .compatible = "st,stm32h7-rtc", .data = &stm32h7_rtc_data },
 	{ .compatible = "st,stm32mp1-rtc", .data = &stm32mp1_data },
+	{ .compatible = "st,stm32mp25-rtc", .data = &stm32mp25_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, stm32_rtc_of_match);
 
+static int stm32_rtc_check_rif(struct stm32_rtc *stm32_rtc,
+			       struct stm32_rtc_rif_resource res)
+{
+	u32 rxcidcfgr = readl_relaxed(stm32_rtc->base + STM32_RTC_RXCIDCFGR(res.num));
+	u32 seccfgr;
+
+	/* Check if RTC available for our CID */
+	if ((rxcidcfgr & STM32_RTC_RXCIDCFGR_CFEN) &&
+	    (FIELD_GET(STM32_RTC_RXCIDCFGR_CID, rxcidcfgr) != STM32_RTC_RXCIDCFGR_CID1))
+		return -EACCES;
+
+	/* Check if RTC available for non secure world */
+	seccfgr = readl_relaxed(stm32_rtc->base + STM32_RTC_SECCFGR);
+	if ((seccfgr & STM32_RTC_SECCFGR_SEC) | (seccfgr & res.bit))
+		return -EACCES;
+
+	return 0;
+}
+
 static int stm32_rtc_init(struct platform_device *pdev,
 			  struct stm32_rtc *rtc)
 {
@@ -787,6 +855,16 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 		regmap_update_bits(rtc->dbp, rtc->dbp_reg,
 				   rtc->dbp_mask, rtc->dbp_mask);
 
+	if (rtc->data->rif_protected) {
+		ret = stm32_rtc_check_rif(rtc, STM32_RTC_RES_INIT);
+		if (!ret)
+			ret = stm32_rtc_check_rif(rtc, STM32_RTC_RES_ALRA);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to probe RTC due to RIF configuration\n");
+			goto err;
+		}
+	}
+
 	/*
 	 * After a system reset, RTC_ISR.INITS flag can be read to check if
 	 * the calendar has been initialized or not. INITS flag is reset by a
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
