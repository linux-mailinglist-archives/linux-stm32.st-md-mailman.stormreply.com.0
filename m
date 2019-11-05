Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F19EFBA1
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 11:42:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EA2CC36B0B;
	Tue,  5 Nov 2019 10:42:30 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 133FCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 10:42:29 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 139so21270029ljf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2019 02:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zJQtw6WsLKIdVwDZMV0Pz6fU4JFtWwFkbgS9iv+/IOA=;
 b=a7VD6GnqgZjpW35ObIP8kDBBQQq4PEUbWyc0ndWwONpFAqhlVvSIbXQx27d1U35Vug
 3NpGswP+85ElRubGiXARvFu7VJPhMziV26Lb7FQDVLiWoD/IR/ZO2hLIgQCecMQp6WXS
 lORmNXqnsN90TLLd7BFP2nQLMdMOf7626qmP9afjK02KoT/G4NDJZxpQTN7GtOahu2jd
 df9ehxw8+JiWIvjeGfZkFPNkL4kBXnoXNonK15kIewstmrS+dTUn6J+O5w3eUp7uVBQE
 RftFdJ+y0BvZ2BWE6eYOO/VEf/lKxNcKK373wQkPTywiTmWsQP4CYB7z2AcGov4u0S5t
 wM4w==
X-Gm-Message-State: APjAAAWBj5gNiuf+fv2f/2eFh2MlNMl+PvGkkgAIxgnn5y+zDWKJmdjR
 pmbeedSylp5TZ3AwIS0lQqk=
X-Google-Smtp-Source: APXvYqwOFSWIOcTngdfrUrZTLUT1vT2lZ4x7hyEHAU08t2ea6kvg8p56NtVIkvH7brQqOjIrQEACtw==
X-Received: by 2002:a2e:8e21:: with SMTP id r1mr22778902ljk.81.1572950548332; 
 Tue, 05 Nov 2019 02:42:28 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id z22sm8386482ljm.92.2019.11.05.02.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 02:42:27 -0800 (PST)
Date: Tue, 5 Nov 2019 12:42:21 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Message-ID: <06aa0acec5797fc5711354d8ecad18bc6e947122.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
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
Subject: [Linux-stm32] [PATCH 62/62] gpiolib: Nag for INPUT direction values
 other than GPIO_LINE_DIRECTION_IN
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

It seems that bunch of drivers put some effort (namely use !! or ! when
converting GPIO direction register value to direction) to only return 1
or 0 for direction INPUT/UOTPUT. Others do just return any positive value
they happen to read from register for INPUT. Let's try iron out this habit
by nagging if our cool new definitions GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT are not used.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpiolib.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 104ed299d5ea..ed292498afb6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -226,6 +226,12 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	ret = chip->get_direction(chip, offset);
 	if (ret > 0) {
 		/* GPIOF_DIR_IN, or other positive */
+		if (ret != GPIO_LINE_DIRECTION_IN) {
+			struct gpio_device *gdev = chip->gpiodev;
+
+			dev_warn(&gdev->dev,
+				 "drivers should use GPIO_LINE_DIRECTION_IN\n");
+		}
 		ret = 1;
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 	}
@@ -1389,12 +1395,18 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	for (i = 0; i < chip->ngpio; i++) {
 		struct gpio_desc *desc = &gdev->descs[i];
+		int dir;
 
 		if (chip->get_direction && gpiochip_line_is_valid(chip, i)) {
-			if (!chip->get_direction(chip, i))
+			dir = chip->get_direction(chip, i);
+			if (!dir) {
 				set_bit(FLAG_IS_OUT, &desc->flags);
-			else
+			} else {
+				if (dir != GPIO_LINE_DIRECTION_IN)
+					dev_warn(&gdev->dev,
+						 "drivers should use GPIO_LINE_DIRECTION_IN\n");
 				clear_bit(FLAG_IS_OUT, &desc->flags);
+			}
 		} else {
 			if (!chip->direction_input)
 				set_bit(FLAG_IS_OUT, &desc->flags);
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
