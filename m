Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 037BC4E7A93
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Mar 2022 21:04:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD0E2C628AD;
	Fri, 25 Mar 2022 20:04:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CA5FC6049F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648238656; x=1679774656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s157fb9lA4a8XOSEq9n0q0pdUa5Gw9sK4n7L6BfC7jE=;
 b=SPrCOXHxQzgMYwokmPwL6bHmyQZvXg4N83LPvJjUxw6/esn7N9+1XEiN
 J5z6nJk0IGD6cfhxokgZx8SnHUmjA9rGuaRrJdu0RogfEeyJj9+GVD/Jf
 wHhGkaaUYENIWir4KN6Vka2kZI/ofS08zUC1vXvrtFb7vsBi1oxgLk9XJ
 kmZMvLd1oQRcb3bcLo/PkO4MTPVXn3nC/ZV3kqY3/T+E8iOcJ0fIAWiKg
 87Tkt4lfzsIigEq+qsKdxA20MLInthFuFvdkPsi4EAFN6eEeD7QQDsPcJ
 Upg3yzZDIf+t+BGh6E0B8xHykPF94H4sgcvvL91F3XvXf+WZV8NMM24m8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="257537297"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="257537297"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="638321942"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2022 13:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8C8E61C8; Fri, 25 Mar 2022 22:04:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Fri, 25 Mar 2022 22:03:36 +0200
Message-Id: <20220325200338.54270-3-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v1 3/5] pinctrl: renesas: Replace custom code
	by gpiochip_count() call
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
 drivers/pinctrl/renesas/pinctrl-rza1.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index c1d6e9512c7a..c66e72e7dd71 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1154,21 +1154,6 @@ static const struct pinmux_ops rza1_pinmux_ops = {
  * RZ/A1 pin controller driver operations
  */
 
-static unsigned int rza1_count_gpio_chips(struct device_node *np)
-{
-	struct device_node *child;
-	unsigned int count = 0;
-
-	for_each_child_of_node(np, child) {
-		if (!of_property_read_bool(child, "gpio-controller"))
-			continue;
-
-		count++;
-	}
-
-	return count;
-}
-
 /**
  * rza1_parse_gpiochip() - parse and register a gpio chip and pin range
  *
@@ -1255,7 +1240,7 @@ static int rza1_gpio_register(struct rza1_pinctrl *rza1_pctl)
 	unsigned int i;
 	int ret;
 
-	ngpiochips = rza1_count_gpio_chips(np);
+	ngpiochips = gpiochip_count(rza1_pctl->dev);
 	if (ngpiochips == 0) {
 		dev_dbg(rza1_pctl->dev, "No gpiochip registered\n");
 		return 0;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
