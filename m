Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A068651E66C
	for <lists+linux-stm32@lfdr.de>; Sat,  7 May 2022 12:23:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50F29C628A8;
	Sat,  7 May 2022 10:23:15 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23C69C5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 May 2022 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651918993; x=1683454993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZFgriWo4QmnK8I4aKqpEp72LmAajKhhg7MNjxcrFCVE=;
 b=mIyilvaJjQL7g2TWceGFcUOBIMTFt6zQB7LzlYRfLRQTgVohrIp9dq4Y
 vewl4uat9hYz8yp2+1czZKaf7uXcunpFkiS1aGMeN+pkk0Kse2YS1PBXs
 nkp5wWfWf+YvZnyvU7rf0VsdF89x5UiKhSrp0CMTdI9ss0gHNumtW8HSc
 vhc0uzXiiW9Ly34bIbX8qZq/FcCbBkv+PcybKTk6/UAyTAncVtXVjB/4t
 HsekxLW+Y6KmTO5lxM428M0gB1Ibs+wXFdth8ziqS5MLK9kWWEJdAzyH2
 35yXKT1MtK+ZQXyWCG+OK3mABGKleVq2tyCvCr+DB4vywHw3503Y7JkKg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268318630"
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="268318630"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 03:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="695561328"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 07 May 2022 03:23:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 039B3155; Sat,  7 May 2022 13:23:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat,  7 May 2022 13:22:57 +0300
Message-Id: <20220507102257.26414-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel test robot <lkp@intel.com>
Subject: [Linux-stm32] [PATCH v1 1/1] pinctrl: stm32: Unshadow np variable
	in stm32_pctl_probe()
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

The np variable is used globally for stm32_pctl_probe() and in one of
its code branches. cppcheck is not happy with that:

  pinctrl-stm32.c:1530:23: warning: Local variable 'np' shadows outer variable [shadowVariable]

Instead of simply renaming one of the variables convert some code to
use a device pointer directly.

Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_node() helper")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index e73f2d24611f..5d1d067b2247 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1364,8 +1364,9 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	return err;
 }
 
-static struct irq_domain *stm32_pctrl_get_irq_domain(struct device_node *np)
+static struct irq_domain *stm32_pctrl_get_irq_domain(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct device_node *parent;
 	struct irq_domain *domain;
 
@@ -1482,23 +1483,19 @@ static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
 
 int stm32_pctl_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	const struct stm32_pinctrl_match_data *match_data;
 	struct fwnode_handle *child;
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct stm32_pinctrl *pctl;
 	struct pinctrl_pin_desc *pins;
 	int i, ret, hwlock_id;
 	unsigned int banks;
 
-	if (!np)
-		return -EINVAL;
-
-	match = of_match_device(dev->driver->of_match_table, dev);
-	if (!match || !match->data)
+	match_data = device_get_match_data(dev);
+	if (!match_data)
 		return -EINVAL;
 
-	if (!of_find_property(np, "pins-are-numbered", NULL)) {
+	if (!device_property_present(dev, "pins-are-numbered")) {
 		dev_err(dev, "only support pins-are-numbered format\n");
 		return -EINVAL;
 	}
@@ -1510,7 +1507,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pctl);
 
 	/* check for IRQ controller (may require deferred probe) */
-	pctl->domain = stm32_pctrl_get_irq_domain(np);
+	pctl->domain = stm32_pctrl_get_irq_domain(pdev);
 	if (IS_ERR(pctl->domain))
 		return PTR_ERR(pctl->domain);
 
@@ -1526,10 +1523,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	spin_lock_init(&pctl->irqmux_lock);
 
 	pctl->dev = dev;
-	pctl->match_data = match->data;
+	pctl->match_data = match_data;
 
 	/*  get optional package information */
-	if (!of_property_read_u32(np, "st,package", &pctl->pkg))
+	if (!device_property_read_u32(dev, "st,package", &pctl->pkg))
 		dev_dbg(pctl->dev, "package detected: %x\n", pctl->pkg);
 
 	pctl->pins = devm_kcalloc(pctl->dev, pctl->match_data->npins,
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
