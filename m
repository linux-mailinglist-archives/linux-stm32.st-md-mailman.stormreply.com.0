Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A05ACAA6
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 08:31:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28474C0C920;
	Mon,  5 Sep 2022 06:31:17 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F987C04003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 06:31:15 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id x80so7349435pgx.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Sep 2022 23:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U194c+dv3L8PGxjQRUqmKsyVJlhonDrX8vTPY/i9hXs=;
 b=Fkbc/qOj6ZS7IqaqFcyPDPM8EDvYCU7OGChWB/9DpWkiWqS2dcKh9l1ojNoGhPTnaD
 njtjyQXo+Rn/WKjPbWSgQwcSRXqdDOgJDGXNJQq5SFjXCfctlSjW18o5uDca1l2zvr9s
 qI1PzrfdfgBUibYLHx0f78UFpIn7lM4srMFlpQG6GGUAs+9ir4zw3UO2CcA6EiK7Fjf1
 bf4cjTs1g6ppz8vMIVX34VakImJ62Z/3L44MxW6WWlAwFP7SjkuSosBV+uw4t/dQJPMK
 jdTwvre314VlwpC1eofIVn09IiP/lYmwjM75pESkwXfDC4BXtIhlz1s+2S/HOBFZhOcr
 KREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U194c+dv3L8PGxjQRUqmKsyVJlhonDrX8vTPY/i9hXs=;
 b=xz9Ngia1jkuVOaEJApPFa9koAwUtNbpBgZcpKnXyAhuNu7uFj4Fzhetmm7FjXhPqqo
 Z+reZZY/4ccNXX8LkDc/ZC2tyF+f6NRe0jAEAGYZIq7wS91qG/SM4KBRVeeU2kBD7o/O
 AoYS9aAhNtxwThjPioqQx7TUuthfLPlvrNPoa/UgwDFC/0dSu90k9PF5wJDf16ZHowhk
 iyLpmMYewWOdU0mP+I/fqdTHGRxp2x9GlcwpYHWoVWbdUDDoQQVq1LrxIcQ4oVFOwHhX
 2xR9MWnzYO1O3iYArHUqgeEG1+2FjqYbncUX1ggFkcOUHzbNk06VnJ8Thu1ufOq7gNGo
 sZkg==
X-Gm-Message-State: ACgBeo3OcVZdhX2DTSbfcRISGHy+IL8IvysTYvSbThkr0nkzerAN7lKv
 r5ydWEuL+kbXguFy1aoflIA=
X-Google-Smtp-Source: AA6agR5AcoEUClPAM45JZ1w1Bqqw5txpdGe6Mc9rimWxG6gO38z3tQNrUedFo00QOImtqhFwVKAqJg==
X-Received: by 2002:a63:914c:0:b0:42b:a8fa:eb4a with SMTP id
 l73-20020a63914c000000b0042ba8faeb4amr34343614pge.481.1662359473959; 
 Sun, 04 Sep 2022 23:31:13 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:13 -0700 (PDT)
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
Date: Sun,  4 Sep 2022 23:30:54 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
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
Subject: [Linux-stm32] [PATCH v1 02/11] drm/tegra: switch to using
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

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 47d26b5d9945..a8925dcd7edd 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -133,11 +133,11 @@ int tegra_output_probe(struct tegra_output *output)
 		}
 	}
 
-	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
-						       output->of_node,
-						       "nvidia,hpd-gpio", 0,
-						       GPIOD_IN,
-						       "HDMI hotplug detect");
+	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
+					of_fwnode_handle(output->of_node),
+					"nvidia,hpd",
+					GPIOD_IN,
+					"HDMI hotplug detect");
 	if (IS_ERR(output->hpd_gpio)) {
 		if (PTR_ERR(output->hpd_gpio) != -ENOENT)
 			return PTR_ERR(output->hpd_gpio);

-- 
b4 0.10.0-dev-fc921
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
