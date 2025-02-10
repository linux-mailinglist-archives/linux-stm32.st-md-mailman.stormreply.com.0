Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F43A2E9BB
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 11:41:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF7FC78F88;
	Mon, 10 Feb 2025 10:41:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 623ABC78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 10:40:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9ephh012591;
 Mon, 10 Feb 2025 11:40:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=013foi5X/BmKOy34Oh7COl
 Z1yi7o4IdG/96zL5C8KGQ=; b=5tbsMe9961Urpjp7ew3gfM2vAbInvhgoqHnxY6
 RURES+8kRO/+4Cwn2zkAeyeo5GVOssn2sfqvtZ13sskE/dvtgNL9yIgvc875fsDk
 YsVb22vPaFe0m2ciuMXlR2Y/s9AY61DepEL2l3Vy3rAehXekrcYOoBkjZq+b9h5Y
 LQK5jIue4FxRPbAKa9j4b9nwbyrsfYUPxI4ku4PxLVCzrqmVUw4pDEA4+OsSB1NR
 cL+ELlOnelNVL6UUKBje/h49DtiYzxPCNeQSS/mRiF3FlSSb5StRsFaEAg/8QNMB
 PSNYGa6dM0fuSSOcYVvh5i94jgkjLRCxZX/8Y4sBbkJCDwnw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0wswvcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2025 11:40:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8EB2C40058;
 Mon, 10 Feb 2025 11:39:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92A8B2FD8A0;
 Mon, 10 Feb 2025 11:35:22 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:35:22 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Mon, 10 Feb 2025 11:35:15 +0100
Message-ID: <20250210103515.2598377-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
Cc: linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 arnd@arndb.de, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 RESEND] phy: stm32: Fix constant-value
	overflow assertion
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

Rework the workaround as the lookup tables always fits into the bitfield,
and the default values are defined by the hardware and cannot be 0: 

Guard against false positive with a WARN_ON check to make the compiler
happy: The offset range is pre-checked against the sorted imp_lookup_table
values and overflow should not happen and would be caught by a warning and
return in error.

Also guard against a true positive found during the max_vswing lookup, as a
max vswing value can be 802000 or 803000 microvolt depending on the current
impedance. Therefore set the default impedence index.

Fixes: 2de679ecd724 ("phy: stm32: work around constant-value overflow assertion")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
v2: Change title and Fixes tag
---
 drivers/phy/st/phy-stm32-combophy.c | 38 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
index 49e9fa90a681..607b4d607eb5 100644
--- a/drivers/phy/st/phy-stm32-combophy.c
+++ b/drivers/phy/st/phy-stm32-combophy.c
@@ -111,6 +111,7 @@ static const struct clk_impedance imp_lookup[] = {
 	{ 4204000, { 511000, 609000, 706000, 802000 } },
 	{ 3999000, { 571000, 648000, 726000, 803000 } }
 };
+#define DEFAULT_IMP_INDEX 3 /* Default impedance is 50 Ohm */
 
 static int stm32_impedance_tune(struct stm32_combophy *combophy)
 {
@@ -119,10 +120,9 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 	u8 imp_of, vswing_of;
 	u32 max_imp = imp_lookup[0].microohm;
 	u32 min_imp = imp_lookup[imp_size - 1].microohm;
-	u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
+	u32 max_vswing;
 	u32 min_vswing = imp_lookup[0].vswing[0];
 	u32 val;
-	u32 regval;
 
 	if (!of_property_read_u32(combophy->dev->of_node, "st,output-micro-ohms", &val)) {
 		if (val < min_imp || val > max_imp) {
@@ -130,45 +130,43 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 			return -EINVAL;
 		}
 
-		regval = 0;
-		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
-			if (imp_lookup[imp_of].microohm <= val) {
-				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
+		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++)
+			if (imp_lookup[imp_of].microohm <= val)
 				break;
-			}
-		}
+
+		if (WARN_ON(imp_of == ARRAY_SIZE(imp_lookup)))
+			return -EINVAL;
 
 		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
 			imp_lookup[imp_of].microohm);
 
 		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
 				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
-				   regval);
-	} else {
-		regmap_read(combophy->regmap, SYSCFG_PCIEPRGCR, &val);
-		imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
-	}
+				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
+	} else
+		imp_of = DEFAULT_IMP_INDEX;
 
 	if (!of_property_read_u32(combophy->dev->of_node, "st,output-vswing-microvolt", &val)) {
+		max_vswing = imp_lookup[imp_of].vswing[vswing_size - 1];
+
 		if (val < min_vswing || val > max_vswing) {
 			dev_err(combophy->dev, "Invalid value %u for output vswing\n", val);
 			return -EINVAL;
 		}
 
-		regval = 0;
-		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
-			if (imp_lookup[imp_of].vswing[vswing_of] >= val) {
-				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
+		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++)
+			if (imp_lookup[imp_of].vswing[vswing_of] >= val)
 				break;
-			}
-		}
+
+		if (WARN_ON(vswing_of == ARRAY_SIZE(imp_lookup[imp_of].vswing)))
+			return -EINVAL;
 
 		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
 			 imp_lookup[imp_of].vswing[vswing_of]);
 
 		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
 				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
-				   regval);
+				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
 	}
 
 	return 0;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
