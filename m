Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD845ACAB1
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 08:31:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEA88C640FE;
	Mon,  5 Sep 2022 06:31:31 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 948FBC640F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 06:31:29 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id x80so7349858pgx.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Sep 2022 23:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=G2Q8X3FWNy+Mum1KFhHHSQCIItKgzpZiSb8mAdu3vck=;
 b=FBPmWKbk3BWYF+J3K1WZ+Ol82sdIUCowS0WjoBoeLJwP+LR5gAz/hqHX1gjYAVa5om
 NIgH7Qk6N5rigD1eJP5EuzqqWeBUI8rxO6FNbumER8jIOtzxax/MwNFhpzGpMzlxKr9x
 KHJ7i9RRjxYVABvDu4w+I2WlJTjEqjc2B4kijfECmGBvAZhSZMXJefbYqeLIph3SF4qn
 3n1+0jSFCH68oN7ImYI32e/dUNgIUelohNCH+XyjOKvH1oHWOKxSKn7Uxut1MpeOF0oa
 OMMldcVIUk/MvfKw67fTrKU0zEyg6YlcDYcuroJpaBs56j1Djz+Q6Fl7tyyophfaU0TY
 Hgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=G2Q8X3FWNy+Mum1KFhHHSQCIItKgzpZiSb8mAdu3vck=;
 b=n4K+KHnOnw0y2dC4nuh/qpe5XYlzFFuToM2HXsF9bgt3djaAb7hW3yX1b5mFER4yLz
 /8Dq2uVIitXt4i96qo/ZlhTvykQrTnyKNJ0PmPySXWIrMqQGiLljgRR6onviAELCC+py
 U8D8RMtiLT29pygcI7kopXbxvFip8L5THfi+oygZNJIjOgNSm84MqFeJYQsISOq+eDTy
 oqCgpF61g3pUaP3vRb3QxmRF921jQvuXWt6prK/OgueKnF/NCZbwLRBEoPB3S/3EmgpM
 OKahYA2IZClsCipW9Dddr6rIjJ3mmLmLazZcziAKVHjBuvUqaZtI9u8VG43XGBpzDpMt
 zY2w==
X-Gm-Message-State: ACgBeo1PXnIR+Wm93AspPSWTsrLpG1AWX2Pzki0I4i2Lrm4eABEf9zMU
 a5h95LLV3/2Qq4wx+gp5LUo=
X-Google-Smtp-Source: AA6agR5x3Cd2bUFdFVhQSgyMvYn8olPbDNMNhdGlpAAhOjZvTLjZqt1otHo2lVL9RBMjcQPiw4Cbsg==
X-Received: by 2002:a05:6a00:10c7:b0:53b:5eb3:4648 with SMTP id
 d7-20020a056a0010c700b0053b5eb34648mr13563922pfu.67.1662359488945; 
 Sun, 04 Sep 2022 23:31:28 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:28 -0700 (PDT)
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
Date: Sun,  4 Sep 2022 23:31:00 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
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
Subject: [Linux-stm32] [PATCH v1 08/11] regulator: bd71815: switch to using
	devm_fwnode_gpiod_get()
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

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index acaa6607898e..c2b8b8be7824 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -571,11 +571,10 @@ static int bd7181x_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "No parent regmap\n");
 		return -ENODEV;
 	}
-	ldo4_en = devm_gpiod_get_from_of_node(&pdev->dev,
-					      pdev->dev.parent->of_node,
-						 "rohm,vsel-gpios", 0,
-						 GPIOD_ASIS, "ldo4-en");
 
+	ldo4_en = devm_fwnode_gpiod_get(&pdev->dev,
+					dev_fwnode(pdev->dev.parent),
+					"rohm,vsel", GPIOD_ASIS, "ldo4-en");
 	if (IS_ERR(ldo4_en)) {
 		ret = PTR_ERR(ldo4_en);
 		if (ret != -ENOENT)

-- 
b4 0.10.0-dev-fc921
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
