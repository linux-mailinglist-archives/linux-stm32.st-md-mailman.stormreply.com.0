Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B45B851C15
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 18:52:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 409F1C71285;
	Mon, 12 Feb 2024 17:52:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE329C71284
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 17:52:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41CE0Pss006769; Mon, 12 Feb 2024 18:52:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=I6lmN2xCUej6ttHOqZWgQxZiDTKDUdt1z5FZ4+Y8XuI=; b=bT
 fuljjs28ay3pmxwTNnRZOCjY5iPxhWI5kB60eYWnXAJ9qs3JaqOvU/8JUu1A2tWc
 o7y8KHfMd9+uv/RTW2QwZpnsQHmnQ5l6kV4T7CT1CqZmLHBVeXxEUGL+JhyuaFA+
 IB5pMuQaeD+k+74grTeMxNLae0ZuQhZ3Qh2Cf2RQ0fdicG2RQeB9mKFKR5V4u213
 DQ/maEO9YvUhpd9RmcXz9m6yhm7CzFj2zO6+25lbOjSRO6eI1a8RaDTAV7XMbwn+
 Ub80i2BiC+4xHfgPGdSQzM9WgjQrKB4W0F+xRh1vMFnueePIprGp4hsN5vH207Ps
 NrQ6MjHd+MQd4+3jnqUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62js7py0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 18:52:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7B2B140044;
 Mon, 12 Feb 2024 18:52:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0A6B2688CE;
 Mon, 12 Feb 2024 18:51:21 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:51:21 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Date: Mon, 12 Feb 2024 18:48:21 +0100
Message-ID: <20240212174822.77734-12-christophe.kerello@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 11/12] mtd: rawnand: stm32_fmc2: add MP25
	support
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

Add MP25 SOC support (4 chip select are available).

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c5bdb43f7221..d71ec12cd5b1 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1878,11 +1878,14 @@ static int stm32_fmc2_nfc_set_cdev(struct stm32_fmc2_nfc *nfc)
 	struct device *dev = nfc->dev;
 	bool ebi_found = false;
 
-	if (dev->parent && of_device_is_compatible(dev->parent->of_node,
-						   "st,stm32mp1-fmc2-ebi"))
+	if (dev->parent && (of_device_is_compatible(dev->parent->of_node,
+						    "st,stm32mp1-fmc2-ebi") ||
+			    of_device_is_compatible(dev->parent->of_node,
+						    "st,stm32mp25-fmc2-ebi")))
 		ebi_found = true;
 
-	if (of_device_is_compatible(dev->of_node, "st,stm32mp1-fmc2-nfc")) {
+	if (of_device_is_compatible(dev->of_node, "st,stm32mp1-fmc2-nfc") ||
+	    of_device_is_compatible(dev->of_node, "st,stm32mp25-fmc2-nfc")) {
 		if (ebi_found) {
 			nfc->cdev = dev->parent;
 
@@ -2119,6 +2122,10 @@ static const struct stm32_fmc2_nfc_data stm32_fmc2_nfc_mp1_data = {
 	.max_ncs = 2,
 };
 
+static const struct stm32_fmc2_nfc_data stm32_fmc2_nfc_mp25_data = {
+	.max_ncs = 4,
+};
+
 static const struct of_device_id stm32_fmc2_nfc_match[] = {
 	{
 		.compatible = "st,stm32mp15-fmc2",
@@ -2128,6 +2135,14 @@ static const struct of_device_id stm32_fmc2_nfc_match[] = {
 		.compatible = "st,stm32mp1-fmc2-nfc",
 		.data = &stm32_fmc2_nfc_mp1_data,
 	},
+	{
+		.compatible = "st,stm32mp25-fmc2",
+		.data = &stm32_fmc2_nfc_mp25_data,
+	},
+	{
+		.compatible = "st,stm32mp25-fmc2-nfc",
+		.data = &stm32_fmc2_nfc_mp25_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, stm32_fmc2_nfc_match);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
