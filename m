Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CCE4E7A95
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Mar 2022 21:04:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CED23C628B0;
	Fri, 25 Mar 2022 20:04:19 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65CE7C628A9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 20:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648238656; x=1679774656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+3cMN1f1lEcXuRBrNDyNybfnJAqjD8jUdUQVryZwyuU=;
 b=IH1QJZXCL3yFj5oINDflkC8kUNLKtiKp9zHp3tWQZD6/TjBqdfH0E83M
 HgyJuHZlPSnZLBTUny/5ZJQ3N8G8ofBGngcHeGEjdQH1gk0Mzs9i0TF37
 xxV8mBYHzyJD/T8laj9nDHle8LFZiQB4jlF48Uk2W+es2qvFJP01FoIIZ
 V6yB855NA73FNThrD0NSWCXoG3YN/quYbkeKWoZKwl14Wjj7a0GGSl4HG
 ERjkhkZ0DRkf3/W4ZHWrC65lBG4rOsHoRxOK1mbHE0aUfa8W5evy+WRPM
 4SqlJ4KIwTsta4J8I7DsbmTUvbkxXGeXoOy/CQcvpaBTXXEVOF/uWNVdH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="240866699"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="240866699"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="561956350"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 25 Mar 2022 13:04:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A508B314; Fri, 25 Mar 2022 22:04:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Fri, 25 Mar 2022 22:03:38 +0200
Message-Id: <20220325200338.54270-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH v1 5/5] pinctrl: armada-37xx: Replace custom
	code by gpiochip_count() call
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

Since we have generic function to count GPIO controller nodes
under given device, there is no need to open code it. Replace
custom code by gpiochip_count() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 24 +++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 08cad14042e2..ba94125f6566 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -728,22 +728,18 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	struct gpio_irq_chip *girq = &gc->irq;
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
-	int ret = -ENODEV, i, nr_irq_parent;
+	unsigned int nr_child_nodes, i;
+	int ret;
 
 	/* Check if we have at least one gpio-controller child node */
-	for_each_child_of_node(dev->of_node, np) {
-		if (of_property_read_bool(np, "gpio-controller")) {
-			ret = 0;
-			break;
-		}
-	}
-	if (ret)
-		return dev_err_probe(dev, ret, "no gpio-controller child node\n");
+	nr_child_nodes = gpiochip_count(dev);
+	if (!nr_child_nodes)
+		return dev_err_probe(dev, -ENODEV, "no gpio-controller child node\n");
 
-	nr_irq_parent = of_irq_count(np);
 	spin_lock_init(&info->irq_lock);
 
-	if (!nr_irq_parent) {
+	nr_child_nodes = of_irq_count(np);
+	if (!nr_child_nodes) {
 		dev_err(dev, "invalid or no IRQ\n");
 		return 0;
 	}
@@ -766,11 +762,11 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	 * controller. But we do not take advantage of this and use
 	 * the chained irq with all of them.
 	 */
-	girq->num_parents = nr_irq_parent;
-	girq->parents = devm_kcalloc(dev, nr_irq_parent, sizeof(*girq->parents), GFP_KERNEL);
+	girq->num_parents = nr_child_nodes;
+	girq->parents = devm_kcalloc(dev, nr_child_nodes, sizeof(*girq->parents), GFP_KERNEL);
 	if (!girq->parents)
 		return -ENOMEM;
-	for (i = 0; i < nr_irq_parent; i++) {
+	for (i = 0; i < nr_child_nodes; i++) {
 		int irq = irq_of_parse_and_map(np, i);
 
 		if (irq < 0)
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
