Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B11195ACAAC
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 08:31:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 764DAC640FE;
	Mon,  5 Sep 2022 06:31:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10D60C640F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 06:31:23 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y127so7745210pfy.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Sep 2022 23:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=f1PZzsaMnOlN09CVwbSU1GebwD1POC8hMtOU/HbCocM=;
 b=pdli+4eCvdWbxLZpx0O/e5Ud3wuQ5WWZPs7wxvLZ8aWyeshw5o3oRO/WG8ev2Aaq1m
 BX/Fr0/H0104qGs68GxhCwuFDG+PdZ2DrBRO+OPQVwRTpp7rdrBwbaXxSj0nC7vBM+b5
 GXjvKR+R9YSnP5K560kQKQaswuG1HWEF9p6rBSHyfMHnnKCObj/NMkW/0nwlLU7coaJN
 lMlGTVarp6ddLZqLDpTSWdUVPPyTlQJyHZXKdGvmnZujDf4OJXr1QpZ4olhMYA2SJhx8
 m53y0aRnHgIB7peKEuEd6JQIyv+D3WxGZ668VhcUTC58GT5LurfYxI/+Of47FfV3GuNG
 TzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=f1PZzsaMnOlN09CVwbSU1GebwD1POC8hMtOU/HbCocM=;
 b=3RgnPcXBOxM23ETlyX6IswSnw6yimPSd8uw31EeSdY3x25zJB1XQJSavhKZkxf02ET
 wGO2Ym9WV2QxJnUjE8oUnyjTxJb0k0UsPBMhp8G6Ak/Oe2f3hxEnPqlVgbIK5OZCy4iH
 e4xYB0XwB0KDNFSb0Qe4q6jhu80Oj+3iSqkxBAU6hdoJWWDUQvBi7QpzqqUDmtzx1p4m
 pmciEZcduxwG49QYYvBZ3KXwHOoY2el3v7CAUrOYjrLgJcAhIQayOpInakE6dO5oBoW8
 OE1CWzmjtXUSU4eFNhKLdE9USsAbhxMpq5/8uZoWc8+SVadjOMSC+Od3gZGy+b6mc3PQ
 62zA==
X-Gm-Message-State: ACgBeo050tLMZxAexGOiUgdzBMCENcycHMZR8mIfqkmDsxmi/ypRFkhg
 wl7KR4vB5U+8RWDJcFF3hoE=
X-Google-Smtp-Source: AA6agR5cvvg/UZg1XV6YqtMeu4gBydqn31I2YyYPcH2GdlFOcXWs2FB6+oFFKzKdNcI+NqL1V/14Sg==
X-Received: by 2002:aa7:978c:0:b0:537:d68e:3a27 with SMTP id
 o12-20020aa7978c000000b00537d68e3a27mr28251047pfp.71.1662359481595; 
 Sun, 04 Sep 2022 23:31:21 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Date: Sun,  4 Sep 2022 23:30:57 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-5-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 05/11] usb: gadget: udc: at91: switch to
	using fwnode_gpiod_get_index()
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

I would like to stop exporting OF-specific gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit, so let's switch to the generic
fwnode property API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 728987280373..1db1dbbab79a 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1779,12 +1779,14 @@ static void at91udc_of_init(struct at91_udc *udc, struct device_node *np)
 	if (of_property_read_u32(np, "atmel,vbus-polled", &val) == 0)
 		board->vbus_polled = 1;
 
-	board->vbus_pin = gpiod_get_from_of_node(np, "atmel,vbus-gpio", 0,
-						 GPIOD_IN, "udc_vbus");
+	board->vbus_pin = fwnode_gpiod_get_index(of_fwnode_handle(np),
+						 "atmel,vbus", 0, GPIOD_IN,
+						 "udc_vbus");
 	if (IS_ERR(board->vbus_pin))
 		board->vbus_pin = NULL;
 
-	board->pullup_pin = gpiod_get_from_of_node(np, "atmel,pullup-gpio", 0,
+	board->pullup_pin = fwnode_gpiod_get_index(of_fwnode_handle(np),
+						   "atmel,pullup", 0,
 						   GPIOD_ASIS, "udc_pullup");
 	if (IS_ERR(board->pullup_pin))
 		board->pullup_pin = NULL;

-- 
b4 0.10.0-dev-fc921
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
