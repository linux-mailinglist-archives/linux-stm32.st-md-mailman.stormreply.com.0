Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF537992D5B
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 15:32:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71AE9C7802D;
	Mon,  7 Oct 2024 13:32:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B2C4C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 13:32:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497B0qho010445;
 Mon, 7 Oct 2024 15:32:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 xzgG93BdkVXodGzAxOX10I0SBb7Z83WcOcVhqPTWIHE=; b=ZXVL4KuFhWR3yupw
 CNjhIwgP8Q3aD3J+k0px/gGdvsFugHTNI46LA21cydUeRgTT1WozPObWTez4CRKm
 visnFCF64fKT2mIT2kXah951ZhouDRH0iBvmv5cGnh6MvIrPyU3OF/wR4/9BnZBC
 OxAgeEsyEnSmsyVUbPcdfPHWZ959dD23NXP5UqCR53yQmmnAInv3XbpPQMK9edAv
 GpNdsyHR8IAOF7Ex0e34i8q15xAfVUE8gxOxhZkDm41ILHUR9T4VvHvzdQ2/9HyO
 y2jG9yG4GPeSy6YReUMidQJq77SzSDXslbzN5JCxjdKcM73vWRTtBMUjOXzuhryb
 KXESWA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv714xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 15:32:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AFE744004C;
 Mon,  7 Oct 2024 15:30:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0329F279E99;
 Mon,  7 Oct 2024 15:27:47 +0200 (CEST)
Received: from localhost (10.48.86.225) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 15:27:46 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marek Vasut <marex@denx.de>
Date: Mon, 7 Oct 2024 15:27:19 +0200
Message-ID: <20241007132721.168428-3-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.225]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/4] hwrng: stm32 - implement support for
	STM32MP25x platforms
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

Implement the support for STM32MP25x platforms. On this platform, a
security clock is shared between some hardware blocks. For the RNG,
it is the RNG kernel clock. Therefore, the gate is no more shared
between the RNG bus and kernel clocks as on STM32MP1x platforms and
the bus clock has to be managed on its own.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/char/hw_random/stm32-rng.c | 81 ++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 9d041a67c295..e7051005768d 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -49,6 +49,7 @@
 
 struct stm32_rng_data {
 	uint	max_clock_rate;
+	uint	nb_clock;
 	u32	cr;
 	u32	nscr;
 	u32	htcr;
@@ -73,6 +74,7 @@ struct stm32_rng_private {
 	struct device *dev;
 	void __iomem *base;
 	struct clk *clk;
+	struct clk *bus_clk;
 	struct reset_control *rst;
 	struct stm32_rng_config pm_conf;
 	const struct stm32_rng_data *data;
@@ -292,6 +294,14 @@ static int stm32_rng_init(struct hwrng *rng)
 	if (err)
 		return err;
 
+	if (priv->bus_clk) {
+		err = clk_prepare_enable(priv->bus_clk);
+		if (err) {
+			clk_disable_unprepare(priv->clk);
+			return err;
+		}
+	}
+
 	/* clear error indicators */
 	writel_relaxed(0, priv->base + RNG_SR);
 
@@ -329,6 +339,8 @@ static int stm32_rng_init(struct hwrng *rng)
 							10, 50000);
 		if (err) {
 			clk_disable_unprepare(priv->clk);
+			if (priv->bus_clk)
+				clk_disable_unprepare(priv->bus_clk);
 			dev_err(priv->dev, "%s: timeout %x!\n", __func__, reg);
 			return -EINVAL;
 		}
@@ -356,8 +368,11 @@ static int stm32_rng_init(struct hwrng *rng)
 						reg & RNG_SR_DRDY,
 						10, 100000);
 	if (err || (reg & ~RNG_SR_DRDY)) {
+		if (priv->bus_clk)
+			clk_disable_unprepare(priv->bus_clk);
 		clk_disable_unprepare(priv->clk);
 		dev_err(priv->dev, "%s: timeout:%x SR: %x!\n", __func__, err, reg);
+
 		return -EINVAL;
 	}
 
@@ -379,6 +394,9 @@ static int __maybe_unused stm32_rng_runtime_suspend(struct device *dev)
 	reg = readl_relaxed(priv->base + RNG_CR);
 	reg &= ~RNG_CR_RNGEN;
 	writel_relaxed(reg, priv->base + RNG_CR);
+
+	if (priv->bus_clk)
+		clk_disable_unprepare(priv->bus_clk);
 	clk_disable_unprepare(priv->clk);
 
 	return 0;
@@ -393,6 +411,14 @@ static int __maybe_unused stm32_rng_suspend(struct device *dev)
 	if (err)
 		return err;
 
+	if (priv->bus_clk) {
+		err = clk_prepare_enable(priv->bus_clk);
+		if (err) {
+			clk_disable_unprepare(priv->clk);
+			return err;
+		}
+	}
+
 	if (priv->data->has_cond_reset) {
 		priv->pm_conf.nscr = readl_relaxed(priv->base + RNG_NSCR);
 		priv->pm_conf.htcr = readl_relaxed(priv->base + RNG_HTCR);
@@ -403,6 +429,8 @@ static int __maybe_unused stm32_rng_suspend(struct device *dev)
 
 	writel_relaxed(priv->pm_conf.cr, priv->base + RNG_CR);
 
+	if (priv->bus_clk)
+		clk_disable_unprepare(priv->bus_clk);
 	clk_disable_unprepare(priv->clk);
 
 	return 0;
@@ -418,6 +446,14 @@ static int __maybe_unused stm32_rng_runtime_resume(struct device *dev)
 	if (err)
 		return err;
 
+	if (priv->bus_clk) {
+		err = clk_prepare_enable(priv->bus_clk);
+		if (err) {
+			clk_disable_unprepare(priv->clk);
+			return err;
+		}
+	}
+
 	/* Clean error indications */
 	writel_relaxed(0, priv->base + RNG_SR);
 
@@ -438,6 +474,14 @@ static int __maybe_unused stm32_rng_resume(struct device *dev)
 	if (err)
 		return err;
 
+	if (priv->bus_clk) {
+		err = clk_prepare_enable(priv->bus_clk);
+		if (err) {
+			clk_disable_unprepare(priv->clk);
+			return err;
+		}
+	}
+
 	/* Clean error indications */
 	writel_relaxed(0, priv->base + RNG_SR);
 
@@ -462,6 +506,8 @@ static int __maybe_unused stm32_rng_resume(struct device *dev)
 							reg & ~RNG_CR_CONDRST, 10, 100000);
 
 		if (err) {
+			if (priv->bus_clk)
+				clk_disable_unprepare(priv->bus_clk);
 			clk_disable_unprepare(priv->clk);
 			dev_err(priv->dev, "%s: timeout:%x CR: %x!\n", __func__, err, reg);
 			return -EINVAL;
@@ -473,6 +519,8 @@ static int __maybe_unused stm32_rng_resume(struct device *dev)
 	}
 
 	clk_disable_unprepare(priv->clk);
+	if (priv->bus_clk)
+		clk_disable_unprepare(priv->bus_clk);
 
 	return 0;
 }
@@ -484,9 +532,19 @@ static const struct dev_pm_ops __maybe_unused stm32_rng_pm_ops = {
 				stm32_rng_resume)
 };
 
+static const struct stm32_rng_data stm32mp25_rng_data = {
+	.has_cond_reset = true,
+	.max_clock_rate = 48000000,
+	.nb_clock = 2,
+	.cr = 0x00F00D00,
+	.nscr = 0x2B5BB,
+	.htcr = 0x969D,
+};
+
 static const struct stm32_rng_data stm32mp13_rng_data = {
 	.has_cond_reset = true,
 	.max_clock_rate = 48000000,
+	.nb_clock = 1,
 	.cr = 0x00F00D00,
 	.nscr = 0x2B5BB,
 	.htcr = 0x969D,
@@ -495,9 +553,14 @@ static const struct stm32_rng_data stm32mp13_rng_data = {
 static const struct stm32_rng_data stm32_rng_data = {
 	.has_cond_reset = false,
 	.max_clock_rate = 3000000,
+	.nb_clock = 1,
 };
 
 static const struct of_device_id stm32_rng_match[] = {
+	{
+		.compatible = "st,stm32mp25-rng",
+		.data = &stm32mp25_rng_data,
+	},
 	{
 		.compatible = "st,stm32mp13-rng",
 		.data = &stm32mp13_rng_data,
@@ -525,10 +588,6 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	priv->clk = devm_clk_get(&ofdev->dev, NULL);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-
 	priv->rst = devm_reset_control_get(&ofdev->dev, NULL);
 	if (!IS_ERR(priv->rst)) {
 		reset_control_assert(priv->rst);
@@ -551,6 +610,20 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 	priv->rng.read = stm32_rng_read;
 	priv->rng.quality = 900;
 
+	if (priv->data->nb_clock > 1) {
+		priv->clk = devm_clk_get(&ofdev->dev, "rng_clk");
+		if (IS_ERR(priv->clk))
+			return PTR_ERR(priv->clk);
+
+		priv->bus_clk = devm_clk_get(&ofdev->dev, "rng_hclk");
+		if (IS_ERR(priv->clk))
+			return PTR_ERR(priv->bus_clk);
+	} else {
+		priv->clk = devm_clk_get(&ofdev->dev, NULL);
+		if (IS_ERR(priv->clk))
+			return PTR_ERR(priv->clk);
+	}
+
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
