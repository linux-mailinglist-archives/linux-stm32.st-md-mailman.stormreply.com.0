Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE9851C03
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 18:50:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C478C71286;
	Mon, 12 Feb 2024 17:50:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D86FC6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 17:50:32 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41CE0Psl006769; Mon, 12 Feb 2024 18:50:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=OFS/WeJd4jRcMqQNxQdciKfLU7r6D+lgxuZRfC3hr4E=; b=mq
 EayElp2oxnKrSiPjYOaXW9jhDzTOk6b2bPRqaqgT0kEG4BYALw7WyX9N9QjhG1mS
 X4jniFnY6NZd1sZr+Q2p3YKf7ZTZKXm+HnZYocY0EAyzG2RJew42BMymX2Lk0gv8
 z3qMjEdLib0QUZMq7QpnWhMkCaIK9U4qKPg+6hH1QPu7rXXUYSJY7vN0W9ZrA5Fx
 2cOcm+Z+VICyqiXaCscdxQoC25Re0zu6TT+B2vjuKufxOc8vlm3SfyVlPyGc4JWi
 Y1DcichcHIL+xTA/vdbVSEfJkut0cna9kn5WRBWHSnraq3qLFqUvODlFpIiwggme
 zzv+Bb1ciKmv8Pdh/otg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62js7ptu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 18:50:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C54CD4002D;
 Mon, 12 Feb 2024 18:50:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CB1627F260;
 Mon, 12 Feb 2024 18:49:22 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:49:21 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Date: Mon, 12 Feb 2024 18:48:13 +0100
Message-ID: <20240212174822.77734-4-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212174822.77734-1-christophe.kerello@foss.st.com>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_15,2024-02-12_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 03/12] memory: stm32-fmc2-ebi: add a platform
	data structure
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

Before the introduction of MP25 support, let's use a platform data
structure for parameters that will differ.

The MP1 SOCs have only one signal to manage all the controllers (NWAIT).
The MP25 SOC has one RNB signal for the NAND controller and one NWAIT
signal for the memory controller.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/memory/stm32-fmc2-ebi.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index 47d0ea5f1616..5f82686689ee 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -132,10 +132,15 @@ enum stm32_fmc2_ebi_cpsize {
 	FMC2_CPSIZE_1024 = 1024
 };
 
+struct stm32_fmc2_ebi_data {
+	bool rnb_for_nand;
+};
+
 struct stm32_fmc2_ebi {
 	struct device *dev;
 	struct clk *clk;
 	struct regmap *regmap;
+	const struct stm32_fmc2_ebi_data *data;
 	u8 bank_assigned;
 
 	u32 bcr[FMC2_MAX_EBI_CE];
@@ -988,6 +993,9 @@ static bool stm32_fmc2_ebi_nwait_used_by_ctrls(struct stm32_fmc2_ebi *ebi)
 	unsigned int cs;
 	u32 bcr;
 
+	if (ebi->data->rnb_for_nand)
+		return false;
+
 	for (cs = 0; cs < FMC2_MAX_EBI_CE; cs++) {
 		if (!(ebi->bank_assigned & BIT(cs)))
 			continue;
@@ -1108,6 +1116,10 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
 
 	ebi->dev = dev;
 
+	ebi->data = of_device_get_match_data(dev);
+	if (!ebi->data)
+		return -EINVAL;
+
 	ebi->regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(ebi->regmap))
 		return PTR_ERR(ebi->regmap);
@@ -1187,8 +1199,15 @@ static int __maybe_unused stm32_fmc2_ebi_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(stm32_fmc2_ebi_pm_ops, stm32_fmc2_ebi_suspend,
 			 stm32_fmc2_ebi_resume);
 
+static const struct stm32_fmc2_ebi_data stm32_fmc2_ebi_mp1_data = {
+	.rnb_for_nand = false,
+};
+
 static const struct of_device_id stm32_fmc2_ebi_match[] = {
-	{.compatible = "st,stm32mp1-fmc2-ebi"},
+	{
+		.compatible = "st,stm32mp1-fmc2-ebi",
+		.data = &stm32_fmc2_ebi_mp1_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, stm32_fmc2_ebi_match);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
