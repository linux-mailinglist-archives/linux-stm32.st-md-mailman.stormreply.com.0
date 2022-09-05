Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD25ACAA5
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 08:31:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 136F0C640F0;
	Mon,  5 Sep 2022 06:31:14 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C530AC55596
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 06:31:12 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id h188so7266048pgc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Sep 2022 23:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OVfZryZDsn7EOmcZgQCBsExc88uptR2TDaptHz7Mkz0=;
 b=NCVkm6jO5T8JvtIiswGFJRWQ6X8V/lEcdFXeBX/jS7NR6HfIMOFQqwtvbzVJH4QbnW
 5eAaKJ2Btz6EDiplEg7pNTEHzAVyU5kQFh+Had3EVkArXQkeEhZc+8Xu5s/fSXNTBYRd
 QxwDXvJLKzwpv0KLpWVLomVHNaTztUDtOmDZOUePP3FQAXx80QMYryGWp8Qtgtkq+rCS
 zMl46htgUuknSjojcasQ8VFXQgdYGTuGM8zLouDO2HoFeHfp3xTuqNCMdAVcyrwb89NO
 Puk4rmbUyqRCdbE9PptjU3xweuFiTOXTPnuBWJEMAtMUaphJsUh67rNB6zwD4fYTTNtY
 YpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OVfZryZDsn7EOmcZgQCBsExc88uptR2TDaptHz7Mkz0=;
 b=VuOxU+zivhsgl2KeiqvJLVq2AHhMGKNbn9cQxoll3R+zR9B4Yof0Oagwz0rNp52gbL
 y/zVdtJVc83KDfY/q+UEjAxhGY9ZpeKfzQvzhJOGXtDECgXgjMdQ7ZA72PYrNp6lVpEt
 Vr5OCtMHQZoQWbT6bbsJZXytZGGj+BNL5286ikFQLLc57nOIB/6otVz0joo3tMZxjQuP
 B6VRu82d59uNYmGrZZdmpcZzTlU2HW7PVVLpGWGRfnAdT/CfwDoxAkzih8EmObBksZFg
 vGP1S+ZhjarCowwV9Xf6OzPnkux6veYdNrbD7l48Qwu9h5CsiZ2ACeVak0IhW1sUnsJL
 y1zw==
X-Gm-Message-State: ACgBeo3x927HM5tHzYgFCAqkBa6/u0Sw/c+Q6va9Z9jH2GViOkrOEfk2
 +qt5AK7/34M/Al0pcW+rSw8=
X-Google-Smtp-Source: AA6agR6Idf7B+Ir3+C7s0CQ8UlH5pwxbWKYpAaeA415uduldic97z5mhuS5KFGWggWKjnL3sMq7imA==
X-Received: by 2002:a63:dd51:0:b0:430:18d9:edf8 with SMTP id
 g17-20020a63dd51000000b0043018d9edf8mr21685454pgj.163.1662359471251; 
 Sun, 04 Sep 2022 23:31:11 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:10 -0700 (PDT)
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
Date: Sun,  4 Sep 2022 23:30:53 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
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
Subject: [Linux-stm32] [PATCH v1 01/11] PCI: tegra: switch to using
	devm_fwnode_gpiod_get
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

I would like to limit (or maybe even remove) use of
[devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
a bit, so let's switch to the generic device property API. It may even
help with handling secondary fwnodes when gpiolib is taught to handle
gpios described by swnodes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 8e323e93be91..929f9363e94b 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2202,10 +2202,11 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		 * and in this case fall back to using AFI per port register
 		 * to toggle PERST# SFIO line.
 		 */
-		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
-							     "reset-gpios", 0,
-							     GPIOD_OUT_LOW,
-							     label);
+		rp->reset_gpio = devm_fwnode_gpiod_get(dev,
+						       of_fwnode_handle(port),
+						       "reset",
+						       GPIOD_OUT_LOW,
+						       label);
 		if (IS_ERR(rp->reset_gpio)) {
 			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
 				rp->reset_gpio = NULL;

-- 
b4 0.10.0-dev-fc921
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
