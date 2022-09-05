Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 846775ACAA9
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 08:31:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44ABFC640FE;
	Mon,  5 Sep 2022 06:31:19 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B82DC55596
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 06:31:18 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 199so7757623pfz.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Sep 2022 23:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JcNarHX5vDGjVT4u3bJlQD1+cgrqWKhTPjcJ8WgPV+Y=;
 b=DxvplDrIsh+KijXXFdPyzxvt874fwO8Mrl8/8AeOKCJE+XbHxvUZFRKCE2GWxXKh/D
 umFYRihOe+jne0ztML2y6mc0jbRPpGBhC1g0NvUfpp6EeLk7jk01cUaRoaJOQGKx5afd
 lMrQqjCzBLO0lmmWRuQTMiLdS80KFr2EMlRBbDQ43Cvwei0LgWRjAJ8gs1Hh7H+I8nL+
 T7StbBazi7jgrWFhxeXo3Gac0AKQAJdX41kNsF1jErc6zj3GvAoSXS8rPqIvQoiy9CfD
 STWwhnuDN61n/ngUeJ4+XMum2eLhXHNuROQUxZWikj/bqGNqJIg0uK7dakXt3T7vhKRj
 +Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JcNarHX5vDGjVT4u3bJlQD1+cgrqWKhTPjcJ8WgPV+Y=;
 b=zgWz9Ilw68vZd7WLo7s8J9wddaUu5uRcp04FsacJzw5RNLlqL4l6ceTs67pPYPLzac
 F4xsxwLJ7O0zDMOXumUyPxbOJcwPSAkS7StgH86D1G733zaI3In9mRmiwWT+TLneCW9w
 kH8tm9xFC7N48l0J2dr3P61nWd2jcd7yDMi4zOh5o63aC1TTZ/frcibLrHSNLQWyoGL1
 Xj9Y8MyqY0mufRp5ZexhOJ1LnZ7E0F4t/HCeR2zGKcuMt4ik2nySpQohJWfH81rYU3pn
 KMJawbsvMMpmc9RKeQggAEn74VJmdGKVfEOEAAJSY/A7bjU/ykFUKksk+EQ2gFUCLchT
 TzHQ==
X-Gm-Message-State: ACgBeo0bxonb2H0yCMnhjzfvoYnjJgl3bzGxTtM0Fqez8eFJ6l/ONjMr
 7kfjuwyKJl2a4miMHFdQRFQ=
X-Google-Smtp-Source: AA6agR7ElJwXFJbXTWS13gywL0+xg7ynmUWpG94uiTchE1mDeAqtJvkeWg4KKm6lqy6WE6s/yuBdHA==
X-Received: by 2002:a63:fc11:0:b0:430:41b4:acf5 with SMTP id
 j17-20020a63fc11000000b0043041b4acf5mr19872386pgi.408.1662359476546; 
 Sun, 04 Sep 2022 23:31:16 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:16 -0700 (PDT)
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
Date: Sun,  4 Sep 2022 23:30:55 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-3-b29adfb27a6c@gmail.com>
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
Subject: [Linux-stm32] [PATCH v1 03/11] mtd: rawnand: stm32_fmc2: switch to
	using devm_fwnode_gpiod_get()
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

I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit, so let's switch to the generic
fwnode property API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 87c1c7dd97eb..7e466b840368 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1799,9 +1799,8 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
 		nand->cs_used[i] = cs;
 	}
 
-	nand->wp_gpio = devm_gpiod_get_from_of_node(nfc->dev, dn,
-						    "wp-gpios", 0,
-						    GPIOD_OUT_HIGH, "wp");
+	nand->wp_gpio = devm_fwnode_gpiod_get(nfc->dev, of_fwnode_handle(dn),
+					      "wp", GPIOD_OUT_HIGH, "wp");
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		if (ret != -ENOENT)

-- 
b4 0.10.0-dev-fc921
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
