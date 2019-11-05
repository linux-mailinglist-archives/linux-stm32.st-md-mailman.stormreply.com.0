Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F3EFDF9
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 14:11:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BEA8C36B0B;
	Tue,  5 Nov 2019 13:11:10 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14690C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 13:11:09 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y127so15074632lfc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2019 05:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l8Im5R3FQ0f+QIAnNwvzY4o+9bLtjTOzR+ED97CX0bQ=;
 b=HHshDW75S92jc3LXO8IxqL38UVTa4Rw9J+GP+bvV4v6cSb7Ltg9XDb9VMJefwTWPuj
 yqdf9QBv81oMacKt6l+U7UqGmDnScPeJnv/Wsj/2gzpXlALidoi2pSkuXxzEmIGLy+DD
 9ucI0BYAmWSHzdlgZZ0p/tEDfQWEc7RUdW5q9PdpB3Z1esvkiTDXtXIz8ZVqmktpZ2pN
 Mqq+ys8FjCShxG/+VAberBaTXzplDKzQUn0F/41cHHmSOZBzfs9rugJBkTm6BESqDW5D
 Qxooz60uwKavIHEHkTbArxBPJMBYZfWrXfXKWr+T5nub/RbK1Q7g2ShE78RkTIniY0Ts
 OcPg==
X-Gm-Message-State: APjAAAWHdKoAEQAEjk/aYY3lgzpytAP1m7/FtIOyj4DIE876CGwLOQrc
 ccBvwiU8MGKWVo7/0BED2Ng=
X-Google-Smtp-Source: APXvYqxG8YUAy+DwKkIGY9cWv77NiqqeBDme3G0xG3YGsXTNlOyWrcCj6kB+mRP7VfBCxP+SG4zG9Q==
X-Received: by 2002:a19:5010:: with SMTP id e16mr7124449lfb.49.1572959468332; 
 Tue, 05 Nov 2019 05:11:08 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id z22sm8538198ljm.92.2019.11.05.05.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 05:11:07 -0800 (PST)
Date: Tue, 5 Nov 2019 15:10:54 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Message-ID: <9e233d62cc282f3b03196d638f2188d9ab394b75.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, David Daney <david.daney@cavium.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Peter Tyser <ptyser@xes-inc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, Joel Stanley <joel@jms.id.au>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-omap@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nandor Han <nandor.han@ge.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] [RESEND PATCH 01/62] gpio: Add definition for GPIO
	direction
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

At least for me it is difficult to remember the meaning of GPIO
direction values. Define GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT so that occasional GPIO contributors would
not need to always check the meaning of hard coded values 1 and 0.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Sorry for folks. I do resend this single patch as this was intended
to be sent for _all_ reviewers. I accidentally did originally send
this only to those the get_maintainer.py listed for this patch.

 include/linux/gpio/driver.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5dd9c982e2cb..cc9ade4552d9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -22,6 +22,9 @@ enum gpio_lookup_flags;
 
 struct gpio_chip;
 
+#define GPIO_LINE_DIRECTION_IN	1
+#define GPIO_LINE_DIRECTION_OUT	0
+
 /**
  * struct gpio_irq_chip - GPIO interrupt controller
  */
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
