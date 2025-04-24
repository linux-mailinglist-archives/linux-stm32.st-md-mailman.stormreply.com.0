Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36139A9A60D
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:35:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECDB3C78F70;
	Thu, 24 Apr 2025 08:35:56 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB576C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:35:54 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39ee651e419so368064f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483754; x=1746088554;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=guVd0XqaIuuYiAcIyv3ohr2gNgxdcQXQ26FZ1XVufmo=;
 b=Ss95aFx+Ao5pSk18UmQ6nWJ29QHpluut0LFLLS2H0ZWE3C6T0Qc65Tbs2cjAO5H/3x
 WF4wKpvGX/ek42lu2CfAcSEkMjyEly83T3//iTQl5MWG9nvpDnase4DSI7odPznzXemg
 9A2gv5sybXpK3GoL0T4Z/FyiopkDNRMSQEtMugD7V9eTF6DHwO/pdCSQsITTBhzP/2Ai
 Fs9xzREkKb3L9gfA0rwf+K9ngn6Oozugi4AC4MM0j7mwnpg1G5bK+WQ7lD7RUee78dog
 7yHP2QTFlgFrB5X8SZTRilotFlqHvOtL/QWzjLy0oyoBUCksR4U5mX4N2DJ4wgwYR1GR
 CJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745483754; x=1746088554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=guVd0XqaIuuYiAcIyv3ohr2gNgxdcQXQ26FZ1XVufmo=;
 b=GaS2Aiq8K5US80BwBc13a250pvZcKBf0MsTqgWHCc6/Z2s44Mt4y7m5E/zdyYxkltp
 P0poJYWZQgewh/cKmidJJxk1lU6A4gVs5aApheOEvhZtMybMnZ9T0+h3EkiAm5FKu6SA
 ihbQvmyWjawPQLcX4B7A/tzj7erep9YK9sBKJ2hvLe59FTs907DQp6UVihHG/tWM8Ocv
 sBaJoJezhl/GjNBhkgovEieJicNW0erTfhMcf966xV9IF6zWYmXj6t+/xn0D3VRj1D7W
 YwDorckcAsVLV9YThoeQVgiKaDGMpy+o1uz78drUWDsfgO53QxQ+9v0YKmPec5wuX0Tx
 9ESQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxUbQjftjWGY70LbdzXI8tpnWmWjFfpKbHwUsy67YuAwcGo0wM7MWpYicVR2DKMv2X7frVOXwyhvgCtw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxZxyXDkyDCRw604/YS7OnLPF/dnMgtXhCeCq+QMTXzpqureuhm
 LB6oJOlXalcqb3N5DGBipX3j6mvdqyhUni2e9v83+K3IOr6OPMNMlPwThzEIzGI=
X-Gm-Gg: ASbGnct1xJ/rIsk2BYvHyncZfyFt75pJXxNUzv3quWaQA5T3u7Sa1HCCyBO1/7ypRXV
 mbEQuSiKgV80q4r4MVUqJiRkfX95qsDF2Qg5Hyn6lD0mD2edNSrXitKTx2XWpHQRgU/Beorrp+i
 R9QhdVfsq513G2DetkmFfiFiOvtycpkAxlq53QLsLUJSXfr/641NTgC7PS5ZkJRu9VKnoOqqGop
 vnFphxWENn0iuu2lZ4t1Nar8NkwIADFEvpeaElApL3ePvyUrzYUjkULWZeE7B9n6V3IG7liYOQd
 3JBIORK6IJAPcZtu8CT+G9/zTuJW+0n8/w==
X-Google-Smtp-Source: AGHT+IEn/oPv6UnLEvwrRXLxLEBd1A5hnHHfX68c3JV4/tT6U0jLedpQliXkYdl8P+72/kekunTQ+w==
X-Received: by 2002:a05:6000:420b:b0:391:4873:7940 with SMTP id
 ffacd0b85a97d-3a06cfb22c3mr1086182f8f.54.1745483754307; 
 Thu, 24 Apr 2025 01:35:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:35:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:31 +0200
MIME-Version: 1.0
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-8-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JQiHyqG15e1DMj51Mblko1MsHmKlA0nIqnk0NLfFft0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffc0yLOnkqqTE6zwxGGFb4MyEZpSfBDn7daV
 BRxeEOL8NKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 cnfxD/9hl8UZC729fpc39Q9MO+KK6OGwDTHMkxkX0abTk0tnDXvkYVW96eyNIRbMSvdgtxxYhQz
 DRC/3UA5i8zPRD/OwTjEIOsmy2MrIk7jIxOc5WSE9YQ8X7Y9Tm/SL7gxlxkKDhfXIfKk4kfIe1E
 XSwI6rjWj8PbPffzAMsQ27Kvm5wKlmT0jM3leNBQzqu94uViOHB830IfkAsXtoo2s4NWWmp3Xke
 aVgPWgFaZAwaXQnb6e/3UPwpp6qeMaofylNzH4HBO5YvWqtaL4kzYcSztcH4dRWVKwhXPaUQ6wj
 XddUuH4De8auEqWbcs37eMJhLmIPaj1lwGXEuYAAqPMc0aZBFF2k6QtC46GyCGx+TQywYIXaCak
 6Kd2qc8b8NJWREV/UnAq5r95k8EQhYr/GHDpFT2ZlikKn1JAVeDz2zPws30y9RhcvMgC7rHXhEc
 +ZDp3lgSoP0biUU8jtIZdCycINhWD2S9VGI+RRfDLkBZi4mm3DdvH0C2Cn7X6WGdo4rvJuqMwnr
 pHhDbirfJ5xluN72zegSt7BJLSKyLgRDejg/nElrexqqLGINLNl3P1RVsaVavFjwrw8K27FlZN8
 6927UtJgVUgH0EySgq1Dkch7+90ScwITtvN98N452XpCGrslt3WrHTz63//GtPkErNETJABYuBz
 mMIajgtwXO69Q7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/12] pinctrl: at91: allow building the
 module with COMPILE_TEST=y
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled. We can do this as the driver doesn't depend on any
architecture-specific bits.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 464cc9aca157..db84d80b7e7d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -103,8 +103,7 @@ config PINCTRL_AS3722
 
 config PINCTRL_AT91
 	bool "AT91 pinctrl driver"
-	depends on OF
-	depends on ARCH_AT91
+	depends on (OF && ARCH_AT91) || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GPIOLIB

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
