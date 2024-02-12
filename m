Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8A4851C0F
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 18:51:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5D0DC6DD97;
	Mon, 12 Feb 2024 17:51:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30411C6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 17:51:19 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41CFLrBU012118; Mon, 12 Feb 2024 18:51:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=yBt3J1JvC9JWaK1tn/1K6Z3tKSfz+E4rgFKGPurOxBY=; b=xZ
 x3E2wwN4kEMq39WrPmVwFEDW1B6Fddppyfll/2jFmRLCGh5NB7tkU0x5A482/pEE
 ZXMIHanjrTw/RdTfl/IpKwIySG9HQlvt39JXzgvxWoysu5OR+87MqPDZd6DAH+qP
 MjionM8pOk8HXk5x3uYhh55FfatkPuwaAtvdBfEQE/8XI5A4I1VWkOJsfUQmwEPm
 2EGk8a/5oadfOjS7fXFUjzCbTDFSqAShhsRS77VFdqfCQR7TdD31N7ET8pTSIPTk
 JkMriE1G81O2EZs7sd2IaeXXCuWunz7FzRUujzIRtWV3ShZs5KFhSV7y42tJIkS9
 0/WaGLDduM5ZnFjVCBsA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62h0qkux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 18:51:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 669B740044;
 Mon, 12 Feb 2024 18:51:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15F5927F261;
 Mon, 12 Feb 2024 18:50:22 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:50:21 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Date: Mon, 12 Feb 2024 18:48:17 +0100
Message-ID: <20240212174822.77734-8-christophe.kerello@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 07/12] memory: stm32-fmc2-ebi: add runtime PM
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

Add runtime PM support in FMC2 ebi driver to be able to manage GENPD
support when it will be enabled.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/memory/stm32-fmc2-ebi.c | 40 ++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index 04248c15832f..8c30e56be3b0 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -1381,6 +1382,7 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ebi->dev = dev;
+	platform_set_drvdata(pdev, ebi);
 
 	ebi->data = of_device_get_match_data(dev);
 	if (!ebi->data)
@@ -1398,10 +1400,14 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
 	if (PTR_ERR(rstc) == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
-	ret = clk_prepare_enable(ebi->clk);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
 	if (!IS_ERR(rstc)) {
 		reset_control_assert(rstc);
 		reset_control_deassert(rstc);
@@ -1432,7 +1438,6 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
 		goto err_release;
 
 	stm32_fmc2_ebi_save_setup(ebi);
-	platform_set_drvdata(pdev, ebi);
 
 	return 0;
 
@@ -1440,7 +1445,7 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
 	stm32_fmc2_ebi_disable_banks(ebi);
 	stm32_fmc2_ebi_disable(ebi);
 	stm32_fmc2_ebi_put_sems(ebi);
-	clk_disable_unprepare(ebi->clk);
+	pm_runtime_put_sync_suspend(dev);
 
 	return ret;
 }
@@ -1453,7 +1458,23 @@ static void stm32_fmc2_ebi_remove(struct platform_device *pdev)
 	stm32_fmc2_ebi_disable_banks(ebi);
 	stm32_fmc2_ebi_disable(ebi);
 	stm32_fmc2_ebi_put_sems(ebi);
+	pm_runtime_put_sync_suspend(&pdev->dev);
+}
+
+static int __maybe_unused stm32_fmc2_ebi_runtime_suspend(struct device *dev)
+{
+	struct stm32_fmc2_ebi *ebi = dev_get_drvdata(dev);
+
 	clk_disable_unprepare(ebi->clk);
+
+	return 0;
+}
+
+static int __maybe_unused stm32_fmc2_ebi_runtime_resume(struct device *dev)
+{
+	struct stm32_fmc2_ebi *ebi = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(ebi->clk);
 }
 
 static int __maybe_unused stm32_fmc2_ebi_suspend(struct device *dev)
@@ -1462,7 +1483,7 @@ static int __maybe_unused stm32_fmc2_ebi_suspend(struct device *dev)
 
 	stm32_fmc2_ebi_disable(ebi);
 	stm32_fmc2_ebi_put_sems(ebi);
-	clk_disable_unprepare(ebi->clk);
+	pm_runtime_put_sync_suspend(dev);
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -1475,8 +1496,8 @@ static int __maybe_unused stm32_fmc2_ebi_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	ret = clk_prepare_enable(ebi->clk);
-	if (ret)
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
 		return ret;
 
 	stm32_fmc2_ebi_get_sems(ebi);
@@ -1486,8 +1507,11 @@ static int __maybe_unused stm32_fmc2_ebi_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(stm32_fmc2_ebi_pm_ops, stm32_fmc2_ebi_suspend,
-			 stm32_fmc2_ebi_resume);
+static const struct dev_pm_ops stm32_fmc2_ebi_pm_ops = {
+	SET_RUNTIME_PM_OPS(stm32_fmc2_ebi_runtime_suspend,
+			   stm32_fmc2_ebi_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(stm32_fmc2_ebi_suspend, stm32_fmc2_ebi_resume)
+};
 
 static const struct stm32_fmc2_ebi_data stm32_fmc2_ebi_mp1_data = {
 	.rnb_for_nand = false,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
