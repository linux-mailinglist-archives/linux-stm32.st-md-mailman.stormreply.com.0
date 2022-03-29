Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E54EB05F
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 17:29:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66206C5F1FB;
	Tue, 29 Mar 2022 15:29:19 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD226C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567757; x=1680103757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fCKfKSD0iyV78apRqDWQhujTsUEBgiS/rWxFJUbLX2w=;
 b=K/eVUp4qU+5bXuybdJjGU67xD7TZ8x/0wbf1q8YDa9JjkO8F+FhjP3Y0
 TI0q56P0uoj+MAzp/pvnBph3exkiQkhEAWmq0jZLzRidvzS5Y+VaELa11
 faTeerY8EC6daeUlqHfE/M6XXFcmYPzuRnmA8smdWXzfRoKZ1B0MP6Xxj
 zdw3ccIadKfSnN6CHCEGWKm9OvRVwxiMNtGsNaP0q8oHemQpgNwO7gTyT
 hI/QqAFbFTPOC/3oyhH/+HEBljogS/qHB9E9EbatN7jq1ds23Q6YIy1uy
 YtTU3LqE2+dkyBChD05FfFOhyUZcNj/wtCKHS+jMi4o9Ifs2zA3tbm/lF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259462989"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259462989"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="521478476"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 29 Mar 2022 08:29:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 259551DD; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 29 Mar 2022 18:29:16 +0300
Message-Id: <20220329152926.50958-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Benjamin Fair <benjaminfair@google.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Nancy Yuen <yuenn@google.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gregory Clement <gregory.clement@bootlin.com>
Subject: [Linux-stm32] [PATCH v2 03/13] pinctrl: stm32: Replace custom code
	by gpiochip_node_count() call
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
under a given device, there is no need to open code it. Replace
custom code by gpiochip_node_count() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 92348e09af28..4043a44211f0 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1423,7 +1423,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_pinctrl *pctl;
 	struct pinctrl_pin_desc *pins;
-	int i, ret, hwlock_id, banks = 0;
+	int i, ret, hwlock_id;
+	unsigned int banks;
 
 	if (!np)
 		return -EINVAL;
@@ -1513,10 +1514,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return PTR_ERR(pctl->pctl_dev);
 	}
 
-	for_each_available_child_of_node(np, child)
-		if (of_property_read_bool(child, "gpio-controller"))
-			banks++;
-
+	banks = gpiochip_node_count(dev);
 	if (!banks) {
 		dev_err(dev, "at least one GPIO bank is required\n");
 		return -EINVAL;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
