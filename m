Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 586FC85A55B
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 15:05:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19EBDC6B45E;
	Mon, 19 Feb 2024 14:05:09 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F466C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 14:05:08 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41JBPV6C011678; Mon, 19 Feb 2024 15:05:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=UpwsTRqMb0U8hGwknl8QF8zKrhGPawmi4ZB0T5+Hy+k=; b=54
 XofLlVEw3qgAjOXP/xHF+gEjTv38ebHK8qUc2numPUM+beL7wNneXcnkk4td0qfW
 DGMwLmH01cicZMoNOTetpf+I324UDFiDCwGiM/KcfCMFRSlFobdCjCjlwqoDlJj5
 sICRps6PEtCs55JF1ScQkSPXqVXT4YYU4xaOL7Ei4h8B9oO2bcNxSgiuMRxEmW/L
 +O/Yxo6Nwb0+s+tdUFnj0NxIev4qzN5VKb1Bmjl76jXr1Tn/sRxBVy5T8C8PYsOD
 oz9edawnGQ3ShS4/eKCypBnoVwTCgB5OqmFHiSdeJ9Q/Xo3RWATOrrTOfquLaTi6
 qQVSE+jxX7NSThLEQjWQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wb8mnmn8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Feb 2024 15:05:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1ADDA4002D;
 Mon, 19 Feb 2024 15:04:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7BD1926A990;
 Mon, 19 Feb 2024 15:04:29 +0100 (CET)
Received: from localhost (10.201.21.177) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 19 Feb
 2024 15:04:29 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Date: Mon, 19 Feb 2024 15:02:02 +0100
Message-ID: <20240219140202.85680-6-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219140202.85680-1-christophe.kerello@foss.st.com>
References: <20240219140202.85680-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_10,2024-02-19_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 5/5] memory: stm32-fmc2-ebi: keep power
	domain on
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

MP25 FMC2 domain has to be kept on. To handle it throw PSCI OS-initiated,
basic PM for keeping domain on is introduced.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
Changes in v2:
 - Patch has been renamed and associated commit message has been updated.

 drivers/memory/stm32-fmc2-ebi.c | 41 +++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index b1d5e61c2434..e32d2a24af8c 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -1655,6 +1656,7 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ebi->dev = dev;
+	platform_set_drvdata(pdev, ebi);
 
 	ebi->data = of_device_get_match_data(dev);
 	if (!ebi->data)
@@ -1672,10 +1674,14 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
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
@@ -1713,8 +1719,6 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
 			goto err_release;
 	}
 
-	platform_set_drvdata(pdev, ebi);
-
 	return 0;
 
 err_release:
@@ -1722,7 +1726,7 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
 	stm32_fmc2_ebi_disable(ebi);
 	if (ebi->data->put_sems)
 		ebi->data->put_sems(ebi);
-	clk_disable_unprepare(ebi->clk);
+	pm_runtime_put_sync_suspend(dev);
 
 	return ret;
 }
@@ -1736,7 +1740,23 @@ static void stm32_fmc2_ebi_remove(struct platform_device *pdev)
 	stm32_fmc2_ebi_disable(ebi);
 	if (ebi->data->put_sems)
 		ebi->data->put_sems(ebi);
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
@@ -1746,7 +1766,7 @@ static int __maybe_unused stm32_fmc2_ebi_suspend(struct device *dev)
 	stm32_fmc2_ebi_disable(ebi);
 	if (ebi->data->put_sems)
 		ebi->data->put_sems(ebi);
-	clk_disable_unprepare(ebi->clk);
+	pm_runtime_put_sync_suspend(dev);
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -1759,8 +1779,8 @@ static int __maybe_unused stm32_fmc2_ebi_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	ret = clk_prepare_enable(ebi->clk);
-	if (ret)
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
 		return ret;
 
 	if (ebi->data->get_sems)
@@ -1773,8 +1793,11 @@ static int __maybe_unused stm32_fmc2_ebi_resume(struct device *dev)
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
 	.child_props = stm32_fmc2_child_props,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
