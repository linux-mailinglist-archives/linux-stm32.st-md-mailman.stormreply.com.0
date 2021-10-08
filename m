Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2D3426AA7
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 14:25:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 437D2C5719E;
	Fri,  8 Oct 2021 12:25:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1775C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 12:25:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1989g3K9023582; 
 Fri, 8 Oct 2021 14:25:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=o5dnBVGOI0j0+u6Bn/o8WUIi3ZFLpUM04QJe3Cs6AOU=;
 b=CcP90rnzgOfMswdXew1Gty1D3hFwatW0LQWG+5gCTjZ/m3O0ZhKnsOIEJpheJqIjzAQ5
 M7nR4HZK2hLbP3dBitNKsCjPr2XwnPgUkFCptyw4zf0OoktWVbFlWEaCzuus0raBRCEk
 AoouUv04z5CBISwMizuVIWshx1y0t7jksrcfvpozpEINdMQeuucatnhGsJCfms+HeVmB
 TGTX26htQbJO3RFnr4GJzUEU4sQ4IMkGtxBlQMEhpYntKk0X6tCAU16Mgh4ptII2Lr9t
 62OVerJBsf0MMUoSsICXYgO8LwJi5i73kxxex73JiQ06+sn9qv0gCxmVqBnnqZxo7Zbd DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjkk78vnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 14:25:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDE2F10002A;
 Fri,  8 Oct 2021 14:25:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1527229A85;
 Fri,  8 Oct 2021 14:25:04 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct 2021 14:25:02
 +0200
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 8 Oct 2021 14:24:54 +0200
Message-ID: <20211008122454.617556-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_03,2021-10-07_02,2020-04-07_01
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: do not warn when 'st,
	package' is absent
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

Since the 'st,package' property is optional, outputting the "No package
detected" warning-level log when the property is absent is unsuitable.
Remove that log.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 68b3886f9f0f..ac82570e46be 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1415,17 +1415,6 @@ static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
 	return 0;
 }
 
-static void stm32_pctl_get_package(struct device_node *np,
-				   struct stm32_pinctrl *pctl)
-{
-	if (of_property_read_u32(np, "st,package", &pctl->pkg)) {
-		pctl->pkg = 0;
-		dev_warn(pctl->dev, "No package detected, use default one\n");
-	} else {
-		dev_dbg(pctl->dev, "package detected: %x\n", pctl->pkg);
-	}
-}
-
 int stm32_pctl_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1473,8 +1462,9 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->dev = dev;
 	pctl->match_data = match->data;
 
-	/*  get package information */
-	stm32_pctl_get_package(np, pctl);
+	/*  get optional package information */
+	if (!of_property_read_u32(np, "st,package", &pctl->pkg))
+		dev_dbg(pctl->dev, "package detected: %x\n", pctl->pkg);
 
 	pctl->pins = devm_kcalloc(pctl->dev, pctl->match_data->npins,
 				  sizeof(*pctl->pins), GFP_KERNEL);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
