Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916A2EA6E6
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 10:05:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 579B5C5719F;
	Tue,  5 Jan 2021 09:05:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45D97C56638
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 09:05:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10593GVq000730; Tue, 5 Jan 2021 10:05:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=hYiicVywXCd7xirUgUa9dC2vbnbYjk1YfIG5djESsrY=;
 b=qBITXknq+F3a9MLj4k0H7auLOCqQaxeeuwdjoRYLuiA/TuS4/sNzOLRHQmbkxO2QwywY
 7kaMYyUJJfXQ6QKytQIzdhqZAp+EY9t/zlLpGekNh7ZZMc69pQ5G7nOUlF2Ow0jOkecH
 N8TTFlszDytOMjZm80ubrMZs55tUlexFY4OPeNGrYypN8GsXZktjGVkBJ+BqIVYhZqGW
 xQfZz/kCtc2+mRXgvxTJ1razbt8S9jV7JSb5LEH8jxyYcCWHKVBgpJzvzy+P90U5Dvg4
 9Y97vqrhT1I6ayLqJcwL/4iLEy0CQ6lzWa9DRUbDOOpRgWo9/5q9WLX2oP9HHNlPKwQF aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35tf66uy58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 10:05:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D58210002A;
 Tue,  5 Jan 2021 10:05:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C67722AA5B;
 Tue,  5 Jan 2021 10:05:36 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan 2021 10:05:35
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 5 Jan 2021 10:05:22 +0100
Message-ID: <20210105090525.23164-4-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105090525.23164-1-amelie.delaunay@foss.st.com>
References: <20210105090525.23164-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_01:2021-01-05,
 2021-01-05 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 3/6] phy: stm32: replace regulator_bulk* by
	multiple regulator_*
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

Due to async_schedule_domain call in regulator_bulk_enable,
scheduling while atomic bug can raise if regulator_bulk_enable is called
under atomic context.
To avoid this issue, this patch replaces all regulator_bulk* by regulator_
per regulators.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 69 ++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index c78a2c7947ce..8ef97c8806ff 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -36,13 +36,6 @@
 #define MINREV			GENMASK(3, 0)
 #define MAJREV			GENMASK(7, 4)
 
-static const char * const supplies_names[] = {
-	"vdda1v1",	/* 1V1 */
-	"vdda1v8",	/* 1V8 */
-};
-
-#define NUM_SUPPLIES		ARRAY_SIZE(supplies_names)
-
 #define PLL_LOCK_TIME_US	100
 #define PLL_PWR_DOWN_TIME_US	5
 #define PLL_FVCO_MHZ		2880
@@ -69,7 +62,8 @@ struct stm32_usbphyc {
 	struct reset_control *rst;
 	struct stm32_usbphyc_phy **phys;
 	int nphys;
-	struct regulator_bulk_data supplies[NUM_SUPPLIES];
+	struct regulator *vdda1v1;
+	struct regulator *vdda1v8;
 	int switch_setup;
 };
 
@@ -83,6 +77,41 @@ static inline void stm32_usbphyc_clr_bits(void __iomem *reg, u32 bits)
 	writel_relaxed(readl_relaxed(reg) & ~bits, reg);
 }
 
+static int stm32_usbphyc_regulators_enable(struct stm32_usbphyc *usbphyc)
+{
+	int ret;
+
+	ret = regulator_enable(usbphyc->vdda1v1);
+	if (ret)
+		return ret;
+
+	ret = regulator_enable(usbphyc->vdda1v8);
+	if (ret)
+		goto vdda1v1_disable;
+
+	return 0;
+
+vdda1v1_disable:
+	regulator_disable(usbphyc->vdda1v1);
+
+	return ret;
+}
+
+static int stm32_usbphyc_regulators_disable(struct stm32_usbphyc *usbphyc)
+{
+	int ret;
+
+	ret = regulator_disable(usbphyc->vdda1v8);
+	if (ret)
+		return ret;
+
+	ret = regulator_disable(usbphyc->vdda1v1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static void stm32_usbphyc_get_pll_params(u32 clk_rate,
 					 struct pll_params *pll_params)
 {
@@ -170,7 +199,7 @@ static int stm32_usbphyc_pll_disable(struct stm32_usbphyc *usbphyc)
 		return -EIO;
 	}
 
-	return regulator_bulk_disable(NUM_SUPPLIES, usbphyc->supplies);
+	return stm32_usbphyc_regulators_disable(usbphyc);
 }
 
 static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
@@ -189,7 +218,7 @@ static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
 			return ret;
 	}
 
-	ret = regulator_bulk_enable(NUM_SUPPLIES, usbphyc->supplies);
+	ret = stm32_usbphyc_regulators_enable(usbphyc);
 	if (ret)
 		return ret;
 
@@ -210,7 +239,7 @@ static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
 	return 0;
 
 reg_disable:
-	regulator_bulk_disable(NUM_SUPPLIES, usbphyc->supplies);
+	stm32_usbphyc_regulators_disable(usbphyc);
 
 	return ret;
 }
@@ -306,7 +335,7 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 	struct device_node *child, *np = dev->of_node;
 	struct phy_provider *phy_provider;
 	u32 version;
-	int ret, i, port = 0;
+	int ret, port = 0;
 
 	usbphyc = devm_kzalloc(dev, sizeof(*usbphyc), GFP_KERNEL);
 	if (!usbphyc)
@@ -348,13 +377,19 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	for (i = 0; i < NUM_SUPPLIES; i++)
-		usbphyc->supplies[i].supply = supplies_names[i];
+	usbphyc->vdda1v1 = devm_regulator_get(dev, "vdda1v1");
+	if (IS_ERR(usbphyc->vdda1v1)) {
+		ret = PTR_ERR(usbphyc->vdda1v1);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get vdda1v1 supply: %d\n", ret);
+		goto clk_disable;
+	}
 
-	ret = devm_regulator_bulk_get(dev, NUM_SUPPLIES, usbphyc->supplies);
-	if (ret) {
+	usbphyc->vdda1v8 = devm_regulator_get(dev, "vdda1v8");
+	if (IS_ERR(usbphyc->vdda1v8)) {
+		ret = PTR_ERR(usbphyc->vdda1v8);
 		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get regulators: %d\n", ret);
+			dev_err(dev, "failed to get vdda1v8 supply: %d\n", ret);
 		goto clk_disable;
 	}
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
