Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6180AD525D
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 12:44:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0251C36B1F;
	Wed, 11 Jun 2025 10:44:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30DCEC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 10:44:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4F498629E4;
 Wed, 11 Jun 2025 10:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D775C4CEEE;
 Wed, 11 Jun 2025 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749638666;
 bh=nZEHCyf1wViLq4HI/tYy5LRKqqJyp4jta9zEgDjuh9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pyHpeuv3BVU8OP1oC49OuLmvAsS4N/mu9V6m2BrDoR/y98PKOa4nzrV4zyxLaDHVQ
 fbQmG3Gv5gsyhOJGBFaGTlBLfOpBidLXjIRIDr5wzfW++zdQdz7q2zNR/8NCpjjqnu
 gHk+PYDWOkIAIIA5vpKCxbK8YIs8JEvNutmvthP3kwUVUe9x/oM88mRQqzhBE3ftuF
 7UMsjcIYXx7VYtl7VZVcklfY89lZqEcB36NkxNce7nptCAQ2HrR/Da1ybB7uhxFEfD
 mmB0bbkeaf2y1dR5Ktn0SlJ+w77bHGSDlm3d4siYuNmu2GyZnMz2QNE59SQNxb4uwW
 CBGN1WbJVmzaw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 11 Jun 2025 12:43:41 +0200
Message-ID: <20250611104348.192092-13-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Roger Quadros <rogerq@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 tglx@linutronix.de, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] [PATCH] mfd: Use dev_fwnode()
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

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Lee Jones <lee@kernel.org>

---
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: imx@lists.linux.dev
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-omap@vger.kernel.org
Cc: patches@opensource.cirrus.com
---
 drivers/mfd/ab8500-core.c     |  3 +--
 drivers/mfd/fsl-imx25-tsadc.c |  4 ++--
 drivers/mfd/lp8788-irq.c      |  2 +-
 drivers/mfd/mt6358-irq.c      |  3 +--
 drivers/mfd/mt6397-irq.c      |  4 ++--
 drivers/mfd/qcom-pm8xxx.c     |  4 ++--
 drivers/mfd/stmfx.c           |  5 ++---
 drivers/mfd/tps65217.c        |  4 ++--
 drivers/mfd/tps6586x.c        |  6 +++---
 drivers/mfd/twl6030-irq.c     |  5 ++---
 drivers/mfd/wm831x-irq.c      | 10 ++++------
 11 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 049abcbd71ce..f0bc0b5a6f4a 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -580,8 +580,7 @@ static int ab8500_irq_init(struct ab8500 *ab8500, struct device_node *np)
 		num_irqs = AB8500_NR_IRQS;
 
 	/* If ->irq_base is zero this will give a linear mapping */
-	ab8500->domain = irq_domain_create_simple(of_fwnode_handle(ab8500->dev->of_node),
-						  num_irqs, 0,
+	ab8500->domain = irq_domain_create_simple(dev_fwnode(ab8500->dev), num_irqs, 0,
 						  &ab8500_irq_ops, ab8500);
 
 	if (!ab8500->domain) {
diff --git a/drivers/mfd/fsl-imx25-tsadc.c b/drivers/mfd/fsl-imx25-tsadc.c
index d47152467951..0aab6428e042 100644
--- a/drivers/mfd/fsl-imx25-tsadc.c
+++ b/drivers/mfd/fsl-imx25-tsadc.c
@@ -71,8 +71,8 @@ static int mx25_tsadc_setup_irq(struct platform_device *pdev,
 	if (irq < 0)
 		return irq;
 
-	tsadc->domain = irq_domain_create_simple(of_fwnode_handle(dev->of_node), 2, 0,
-						 &mx25_tsadc_domain_ops, tsadc);
+	tsadc->domain = irq_domain_create_simple(dev_fwnode(dev), 2, 0, &mx25_tsadc_domain_ops,
+						 tsadc);
 	if (!tsadc->domain) {
 		dev_err(dev, "Failed to add irq domain\n");
 		return -ENOMEM;
diff --git a/drivers/mfd/lp8788-irq.c b/drivers/mfd/lp8788-irq.c
index ea0fdf7a4b6e..f62fa2d7f010 100644
--- a/drivers/mfd/lp8788-irq.c
+++ b/drivers/mfd/lp8788-irq.c
@@ -161,7 +161,7 @@ int lp8788_irq_init(struct lp8788 *lp, int irq)
 		return -ENOMEM;
 
 	irqd->lp = lp;
-	irqd->domain = irq_domain_create_linear(of_fwnode_handle(lp->dev->of_node), LP8788_INT_MAX,
+	irqd->domain = irq_domain_create_linear(dev_fwnode(lp->dev), LP8788_INT_MAX,
 					&lp8788_domain_ops, irqd);
 	if (!irqd->domain) {
 		dev_err(lp->dev, "failed to add irq domain err\n");
diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
index 9f0bcc3ad7a1..f467b00d2366 100644
--- a/drivers/mfd/mt6358-irq.c
+++ b/drivers/mfd/mt6358-irq.c
@@ -272,8 +272,7 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 				     irqd->pmic_ints[i].en_reg_shift * j, 0);
 	}
 
-	chip->irq_domain = irq_domain_create_linear(of_fwnode_handle(chip->dev->of_node),
-						    irqd->num_pmic_irqs,
+	chip->irq_domain = irq_domain_create_linear(dev_fwnode(chip->dev), irqd->num_pmic_irqs,
 						    &mt6358_irq_domain_ops, chip);
 	if (!chip->irq_domain) {
 		dev_err(chip->dev, "Could not create IRQ domain\n");
diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index badc614b4345..0e463026c5a9 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -216,8 +216,8 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		regmap_write(chip->regmap, chip->int_con[2], 0x0);
 
 	chip->pm_nb.notifier_call = mt6397_irq_pm_notifier;
-	chip->irq_domain = irq_domain_create_linear(of_fwnode_handle(chip->dev->of_node),
-						    MT6397_IRQ_NR, &mt6397_irq_domain_ops, chip);
+	chip->irq_domain = irq_domain_create_linear(dev_fwnode(chip->dev), MT6397_IRQ_NR,
+						    &mt6397_irq_domain_ops, chip);
 	if (!chip->irq_domain) {
 		dev_err(chip->dev, "could not create irq domain\n");
 		return -ENOMEM;
diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index c96ea6fbede8..1149f7102a36 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -559,8 +559,8 @@ static int pm8xxx_probe(struct platform_device *pdev)
 	chip->pm_irq_data = data;
 	spin_lock_init(&chip->pm_irq_lock);
 
-	chip->irqdomain = irq_domain_create_linear(of_fwnode_handle(pdev->dev.of_node),
-						   data->num_irqs, &pm8xxx_irq_domain_ops, chip);
+	chip->irqdomain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->num_irqs,
+						   &pm8xxx_irq_domain_ops, chip);
 	if (!chip->irqdomain)
 		return -ENODEV;
 
diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index 823b1d29389e..f683fdb6ece6 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -269,9 +269,8 @@ static int stmfx_irq_init(struct i2c_client *client)
 	u32 irqoutpin = 0, irqtrigger;
 	int ret;
 
-	stmfx->irq_domain = irq_domain_create_simple(of_fwnode_handle(stmfx->dev->of_node),
-						  STMFX_REG_IRQ_SRC_MAX, 0,
-						  &stmfx_irq_ops, stmfx);
+	stmfx->irq_domain = irq_domain_create_simple(dev_fwnode(stmfx->dev), STMFX_REG_IRQ_SRC_MAX,
+						     0, &stmfx_irq_ops, stmfx);
 	if (!stmfx->irq_domain) {
 		dev_err(stmfx->dev, "Failed to create IRQ domain\n");
 		return -EINVAL;
diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
index 4e9669d327b4..c240fac0ede7 100644
--- a/drivers/mfd/tps65217.c
+++ b/drivers/mfd/tps65217.c
@@ -158,8 +158,8 @@ static int tps65217_irq_init(struct tps65217 *tps, int irq)
 	tps65217_set_bits(tps, TPS65217_REG_INT, TPS65217_INT_MASK,
 			  TPS65217_INT_MASK, TPS65217_PROTECT_NONE);
 
-	tps->irq_domain = irq_domain_create_linear(of_fwnode_handle(tps->dev->of_node),
-		TPS65217_NUM_IRQ, &tps65217_irq_domain_ops, tps);
+	tps->irq_domain = irq_domain_create_linear(dev_fwnode(tps->dev), TPS65217_NUM_IRQ,
+						   &tps65217_irq_domain_ops, tps);
 	if (!tps->irq_domain) {
 		dev_err(tps->dev, "Could not create IRQ domain\n");
 		return -ENOMEM;
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 853c48286071..8d5fe2b60bfa 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -363,9 +363,9 @@ static int tps6586x_irq_init(struct tps6586x *tps6586x, int irq,
 		new_irq_base = 0;
 	}
 
-	tps6586x->irq_domain = irq_domain_create_simple(of_fwnode_handle(tps6586x->dev->of_node),
-				irq_num, new_irq_base, &tps6586x_domain_ops,
-				tps6586x);
+	tps6586x->irq_domain = irq_domain_create_simple(dev_fwnode(tps6586x->dev), irq_num,
+							new_irq_base, &tps6586x_domain_ops,
+							tps6586x);
 	if (!tps6586x->irq_domain) {
 		dev_err(tps6586x->dev, "Failed to create IRQ domain\n");
 		return -ENOMEM;
diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
index 00b14cef1dfb..df87b5168ae9 100644
--- a/drivers/mfd/twl6030-irq.c
+++ b/drivers/mfd/twl6030-irq.c
@@ -410,9 +410,8 @@ int twl6030_init_irq(struct device *dev, int irq_num)
 	atomic_set(&twl6030_irq->wakeirqs, 0);
 	twl6030_irq->irq_mapping_tbl = of_id->data;
 
-	twl6030_irq->irq_domain =
-		irq_domain_create_linear(of_fwnode_handle(dev->of_node), nr_irqs,
-					 &twl6030_irq_domain_ops, twl6030_irq);
+	twl6030_irq->irq_domain = irq_domain_create_linear(dev_fwnode(dev), nr_irqs,
+							   &twl6030_irq_domain_ops, twl6030_irq);
 	if (!twl6030_irq->irq_domain) {
 		dev_err(dev, "Can't add irq_domain\n");
 		return -ENOMEM;
diff --git a/drivers/mfd/wm831x-irq.c b/drivers/mfd/wm831x-irq.c
index b3883fa5dd9f..defd5f173eb6 100644
--- a/drivers/mfd/wm831x-irq.c
+++ b/drivers/mfd/wm831x-irq.c
@@ -587,13 +587,11 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)
 	}
 
 	if (irq_base)
-		domain = irq_domain_create_legacy(of_fwnode_handle(wm831x->dev->of_node),
-						  ARRAY_SIZE(wm831x_irqs), irq_base, 0,
-						  &wm831x_irq_domain_ops, wm831x);
+		domain = irq_domain_create_legacy(dev_fwnode(wm831x->dev), ARRAY_SIZE(wm831x_irqs),
+						  irq_base, 0, &wm831x_irq_domain_ops, wm831x);
 	else
-		domain = irq_domain_create_linear(of_fwnode_handle(wm831x->dev->of_node),
-						  ARRAY_SIZE(wm831x_irqs), &wm831x_irq_domain_ops,
-						  wm831x);
+		domain = irq_domain_create_linear(dev_fwnode(wm831x->dev), ARRAY_SIZE(wm831x_irqs),
+						  &wm831x_irq_domain_ops, wm831x);
 
 	if (!domain) {
 		dev_warn(wm831x->dev, "Failed to allocate IRQ domain\n");
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
