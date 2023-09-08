Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD29798B07
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Sep 2023 18:54:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 504B4C6B475;
	Fri,  8 Sep 2023 16:54:10 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 620FFC6B47C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Sep 2023 16:54:09 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 388DhjCH020949; Fri, 8 Sep 2023 18:53:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=UVCzEPUOFYm/fUt81a6TTT6V/OGVngLPpT/Z+K3A1yM=; b=LP
 Jtn1rL/3sIxf6cY0F/ys1+r4om4vrHzdd4iPE3z4l2B/R7BhBPwtO94aYRwgdSdq
 ewAdtyPlLVHM2TCZqunJkkv1gWjF3WWX2aSC1xjkA74yjZFaWJ7V0q7Tc4YK4mVS
 biOckH+RdKEKYYDOzGgGNWoiPHlza9glJ+GrV7y/yQWYn1/ZUT80kE1aIdIs/UMP
 OtWS6EkSMbXpHF7OtAGDqeDjiTgPrFEKx0g58SCA3brJ17YYplq9bgHvr0t+Tgl/
 9HpB7jc8cKYmX9/eMmh34iyLzYyVSFd413hWO3jqvm5kH1O14mj12UhTWaFIjezX
 zOOHyuTXDipmhaOsDrgw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sy88wgdyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 18:53:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA57A10005B;
 Fri,  8 Sep 2023 18:53:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0CF4209EFC;
 Fri,  8 Sep 2023 18:53:55 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 8 Sep
 2023 18:53:55 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 8 Sep 2023 18:51:19 +0200
Message-ID: <20230908165120.730867-10-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
References: <20230908165120.730867-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_12,2023-09-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/10] hwrng: stm32 - rework power management
	sequences
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

Implement stm32_rng_suspend()/stm32_rng_resume() low-power APIs
called when the hardware block context will be lost.

There is no need to save the RNG_CR register in
stm32_rng_runtime_suspend() as the context is not lost. Therefore,
only enable/disable the RNG in the runtime sequences.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/char/hw_random/stm32-rng.c | 100 +++++++++++++++++++++++++++--
 1 file changed, 93 insertions(+), 7 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 0243b889ac54..3ac6712324c7 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -55,11 +55,25 @@ struct stm32_rng_data {
 	bool	has_cond_reset;
 };
 
+/**
+ * struct stm32_rng_config - RNG configuration data
+ *
+ * @cr:			RNG configuration. 0 means default hardware RNG configuration
+ * @nscr:		Noise sources control configuration.
+ * @htcr:		Health tests configuration.
+ */
+struct stm32_rng_config {
+	u32 cr;
+	u32 nscr;
+	u32 htcr;
+};
+
 struct stm32_rng_private {
 	struct hwrng rng;
 	void __iomem *base;
 	struct clk *clk;
 	struct reset_control *rst;
+	struct stm32_rng_config pm_conf;
 	const struct stm32_rng_data *data;
 	bool ced;
 	bool lock_conf;
@@ -355,11 +369,10 @@ static int stm32_rng_remove(struct platform_device *ofdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int stm32_rng_runtime_suspend(struct device *dev)
 {
-	u32 reg;
 	struct stm32_rng_private *priv = dev_get_drvdata(dev);
+	u32 reg;
 
 	reg = readl_relaxed(priv->base + RNG_CR);
 	reg &= ~RNG_CR_RNGEN;
@@ -369,25 +382,98 @@ static int stm32_rng_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused stm32_rng_suspend(struct device *dev)
+{
+	struct stm32_rng_private *priv = dev_get_drvdata(dev);
+
+	if (priv->data->has_cond_reset) {
+		priv->pm_conf.nscr = readl_relaxed(priv->base + RNG_NSCR);
+		priv->pm_conf.htcr = readl_relaxed(priv->base + RNG_HTCR);
+	}
+
+	/* Do not save that RNG is enabled as it will be handled at resume */
+	priv->pm_conf.cr = readl_relaxed(priv->base + RNG_CR) & ~RNG_CR_RNGEN;
+
+	writel_relaxed(priv->pm_conf.cr, priv->base + RNG_CR);
+
+	clk_disable_unprepare(priv->clk);
+
+	return 0;
+}
+
 static int stm32_rng_runtime_resume(struct device *dev)
 {
-	u32 reg;
 	struct stm32_rng_private *priv = dev_get_drvdata(dev);
+	int err;
+	u32 reg;
+
+	err = clk_prepare_enable(priv->clk);
+	if (err)
+		return err;
+
+	/* Clean error indications */
+	writel_relaxed(0, priv->base + RNG_SR);
 
-	clk_prepare_enable(priv->clk);
 	reg = readl_relaxed(priv->base + RNG_CR);
 	reg |= RNG_CR_RNGEN;
 	writel_relaxed(reg, priv->base + RNG_CR);
 
 	return 0;
 }
-#endif
+
+static int __maybe_unused stm32_rng_resume(struct device *dev)
+{
+	struct stm32_rng_private *priv = dev_get_drvdata(dev);
+	int err;
+	u32 reg;
+
+	err = clk_prepare_enable(priv->clk);
+	if (err)
+		return err;
+
+	/* Clean error indications */
+	writel_relaxed(0, priv->base + RNG_SR);
+
+	if (priv->data->has_cond_reset) {
+		/*
+		 * Correct configuration in bits [29:4] must be set in the same
+		 * access that set RNG_CR_CONDRST bit. Else config setting is
+		 * not taken into account. CONFIGLOCK bit must also be unset but
+		 * it is not handled at the moment.
+		 */
+		writel_relaxed(priv->pm_conf.cr | RNG_CR_CONDRST, priv->base + RNG_CR);
+
+		writel_relaxed(priv->pm_conf.nscr, priv->base + RNG_NSCR);
+		writel_relaxed(priv->pm_conf.htcr, priv->base + RNG_HTCR);
+
+		reg = readl_relaxed(priv->base + RNG_CR);
+		reg |= RNG_CR_RNGEN;
+		reg &= ~RNG_CR_CONDRST;
+		writel_relaxed(reg, priv->base + RNG_CR);
+
+		err = readl_relaxed_poll_timeout_atomic(priv->base + RNG_CR, reg,
+							reg & ~RNG_CR_CONDRST, 10, 100000);
+
+		if (err) {
+			clk_disable_unprepare(priv->clk);
+			dev_err((struct device *)priv->rng.priv,
+				"%s: timeout:%x CR: %x!\n", __func__, err, reg);
+			return -EINVAL;
+		}
+	} else {
+		reg = priv->pm_conf.cr;
+		reg |= RNG_CR_RNGEN;
+		writel_relaxed(reg, priv->base + RNG_CR);
+	}
+
+	return 0;
+}
 
 static const struct dev_pm_ops stm32_rng_pm_ops = {
 	SET_RUNTIME_PM_OPS(stm32_rng_runtime_suspend,
 			   stm32_rng_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(stm32_rng_suspend,
+				stm32_rng_resume)
 };
 
 static const struct stm32_rng_data stm32mp13_rng_data = {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
