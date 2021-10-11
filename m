Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC2B428FB5
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 15:58:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F15BAC5C82E;
	Mon, 11 Oct 2021 13:58:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0B4FC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 13:58:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B9etZA022265; 
 Mon, 11 Oct 2021 15:58:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=0wse3awVSetc/Wr70lqYwJ90ngXqWfR4toGfT0ByfJ0=;
 b=1wv9zdYqJfUOTEuF72ZPfORVnFSTlUbnk+I+xHu8KvBnuzUzWpXHmHIh1kgxziM1QChj
 e05OxpwEIRcCpvwH1oU9EIutrDduHA4OyUU+6/STTmkzBWWjsduvHqAZyNdL/Nlxf913
 28t7+T3e8g7Y6VQDHA9Mggm4LZ7Q8wSxGGKZVJy7+m+vax44XFrplsw0fmZZnF9m6CUe
 W9Ofxx0pRu07bEm/KG29Uu4YYjjZecDQ76ST2cMv0yerBAG38jOXjtCPEqQwI1RpdpaJ
 5xwM+V58ff58Za0I0cUR472DdScna1bntH7X+zoKZ0Gywmpw22jsZxMoaZvXGozVJEuP rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bmdxrk7p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 15:58:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C049110002A;
 Mon, 11 Oct 2021 15:58:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B708022D165;
 Mon, 11 Oct 2021 15:58:42 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct 2021 15:58:42
 +0200
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-remoteproc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 11 Oct 2021 15:58:36 +0200
Message-ID: <20211011135836.1045437-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_04,2021-10-07_02,2020-04-07_01
Subject: [Linux-stm32] [PATCH v2] hwspinlock: stm32: enable clock at probe
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

Set the clock during probe and keep its control during suspend / resume
operations.
This fixes an issue when CONFIG_PM is not set and where the clock is
never enabled.

Make use of devm_ functions to simplify the code.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
Changes since v1:
- Call platform_set_drvdata() before pm_runtime_...() calls
---
 drivers/hwspinlock/stm32_hwspinlock.c | 58 +++++++++++++++++----------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 3ad0ce0da4d9..5bd11a7fab65 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -54,8 +54,23 @@ static const struct hwspinlock_ops stm32_hwspinlock_ops = {
 	.relax		= stm32_hwspinlock_relax,
 };
 
+static void stm32_hwspinlock_disable_clk(void *data)
+{
+	struct platform_device *pdev = data;
+	struct stm32_hwspinlock *hw = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_get_sync(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_put_noidle(dev);
+
+	clk_disable_unprepare(hw->clk);
+}
+
 static int stm32_hwspinlock_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
 	size_t array_size;
@@ -66,41 +81,43 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		return PTR_ERR(io_base);
 
 	array_size = STM32_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
-	hw = devm_kzalloc(&pdev->dev, sizeof(*hw) + array_size, GFP_KERNEL);
+	hw = devm_kzalloc(dev, sizeof(*hw) + array_size, GFP_KERNEL);
 	if (!hw)
 		return -ENOMEM;
 
-	hw->clk = devm_clk_get(&pdev->dev, "hsem");
+	hw->clk = devm_clk_get(dev, "hsem");
 	if (IS_ERR(hw->clk))
 		return PTR_ERR(hw->clk);
 
-	for (i = 0; i < STM32_MUTEX_NUM_LOCKS; i++)
-		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
+	ret = clk_prepare_enable(hw->clk);
+	if (ret) {
+		dev_err(dev, "Failed to prepare_enable clock\n");
+		return ret;
+	}
 
 	platform_set_drvdata(pdev, hw);
-	pm_runtime_enable(&pdev->dev);
 
-	ret = hwspin_lock_register(&hw->bank, &pdev->dev, &stm32_hwspinlock_ops,
-				   0, STM32_MUTEX_NUM_LOCKS);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_put(dev);
 
-	if (ret)
-		pm_runtime_disable(&pdev->dev);
+	ret = devm_add_action_or_reset(dev, stm32_hwspinlock_disable_clk, pdev);
+	if (ret) {
+		dev_err(dev, "Failed to register action\n");
+		return ret;
+	}
 
-	return ret;
-}
+	for (i = 0; i < STM32_MUTEX_NUM_LOCKS; i++)
+		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
 
-static int stm32_hwspinlock_remove(struct platform_device *pdev)
-{
-	struct stm32_hwspinlock *hw = platform_get_drvdata(pdev);
-	int ret;
+	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
+					0, STM32_MUTEX_NUM_LOCKS);
 
-	ret = hwspin_lock_unregister(&hw->bank);
 	if (ret)
-		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-
-	pm_runtime_disable(&pdev->dev);
+		dev_err(dev, "Failed to register hwspinlock\n");
 
-	return 0;
+	return ret;
 }
 
 static int __maybe_unused stm32_hwspinlock_runtime_suspend(struct device *dev)
@@ -135,7 +152,6 @@ MODULE_DEVICE_TABLE(of, stm32_hwpinlock_ids);
 
 static struct platform_driver stm32_hwspinlock_driver = {
 	.probe		= stm32_hwspinlock_probe,
-	.remove		= stm32_hwspinlock_remove,
 	.driver		= {
 		.name	= "stm32_hwspinlock",
 		.of_match_table = stm32_hwpinlock_ids,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
