Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE395ACAAA
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 08:31:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FD8DC640FE;
	Mon,  5 Sep 2022 06:31:21 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B86ECC64103
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 06:31:19 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id h188so7266267pgc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Sep 2022 23:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nEbjUfr7fwqueSmjAsD0W8GSCJGEGPrp4ULUwjjyEJA=;
 b=BwhSxhJHuNZubY5udVF0benef1V78QThc+I+5pdGaAhS9f7czmXQ0+lX6fLemCXOdl
 3fHYh5mFxmh6vXpEgGgoJfSt54Hg8m+uS1Wxx8zGEMMd3IMEilC7XzLCelQyUpIGADDa
 eHrlp4RIUpSke6IDMjI2wRpqP3Xcu9nVikuwws6JGbz1bpaNy+xlA1aWhyGXSVM8Bgez
 rR7uraO+M+9xWjLBH/xW3NfDDpH5H4xC8AhL1rqmFoqQ1YQUTwU9vSojevfdF4bc76Qh
 TW0gqThzNTQaw7vPqkwkLSNXzYRvK/UJpAMinaSHE472WQuIkYWNlxKNX/l2rblcn6fr
 t2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nEbjUfr7fwqueSmjAsD0W8GSCJGEGPrp4ULUwjjyEJA=;
 b=I+BdTu5NJNOXjRihNrKChCYNfhmG8sRRuKVZROGdfxqqfugwsM/ar3rv3+JifD/XzE
 7+lNuWJw+s2YXwjDUthLgM5SHPTc8djVeB21EeoF5eNXXXO4YNEj4YQwY6LMMKhl7jjp
 pOT1hA8nHIl4nWFD1xCP9LUFANeIszwS8PL7uMVK9fvS1Wtre3iT8CTcz4EvrgBUZexh
 hWhmCWhMH0ELX+bC2JeaWvPE4zp1lHP3A2UvYMrPam0q6/7L/PNp/uwcQrhGm19nQMi6
 kgWi8A80TGS1k707uV4mKuJ3EwLH5LpuhWY8yF5SVhvqxzFZs70+GhbROwCKMDPIEkHr
 R5Xg==
X-Gm-Message-State: ACgBeo0k6BC/Po0AhGhMXZu0OfThFrUqDdf2jrNiCw5EIaN9ikGxu4J/
 MMJXR5E7Ob/voMSwpzxoAdo=
X-Google-Smtp-Source: AA6agR7O3xsaJm3PXWVEz8pTAeV7SFmhqqPNXXBFz2iOIaqf7IbZO/oITkU5Ekfa+HSas+vh7tCo8A==
X-Received: by 2002:a05:6a00:2293:b0:53b:93ec:1dc1 with SMTP id
 f19-20020a056a00229300b0053b93ec1dc1mr8858576pfe.62.1662359479124; 
 Sun, 04 Sep 2022 23:31:19 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:18 -0700 (PDT)
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
Date: Sun,  4 Sep 2022 23:30:56 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
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
Subject: [Linux-stm32] [PATCH v1 04/11] usb: phy: tegra: switch to using
	devm_gpiod_get()
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
device property API.

I believe that the only reason the driver, instead of the standard
devm_gpiod_get(), used devm_gpiod_get_from_of_node() is because it
wanted to set up a pretty consumer name for the GPIO, and we now have
a special API for that.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 68cd4b68e3a2..f0240107edb1 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -1440,16 +1440,22 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 			return err;
 		}
 
-		gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
-						    "nvidia,phy-reset-gpio",
-						    0, GPIOD_OUT_HIGH,
-						    "ulpi_phy_reset_b");
+		gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
+				       GPIOD_OUT_HIGH);
 		err = PTR_ERR_OR_ZERO(gpiod);
 		if (err) {
 			dev_err(&pdev->dev,
 				"Request failed for reset GPIO: %d\n", err);
 			return err;
 		}
+
+		err = gpiod_set_consumer_name(gpiod, "ulpi_phy_reset_b");
+		if (err) {
+			dev_err(&pdev->dev,
+				"Failed to set up reset GPIO name: %d\n", err);
+			return err;
+		}
+
 		tegra_phy->reset_gpio = gpiod;
 
 		phy = devm_otg_ulpi_create(&pdev->dev,

-- 
b4 0.10.0-dev-fc921
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
