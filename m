Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B4AAC6752
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:42:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA6DCC36B35;
	Wed, 28 May 2025 10:42:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92D9DC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:42:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-442cd12d28cso4688765e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428940; x=1749033740;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
 b=oBqtc8lSl0nObSsYS1GPv58RkgmOF2Yq47xWlPiXVjyfQKJydwGbpUZdHwYIcZkbxY
 oZqeRFH7pNxW3M0ItRQgMnaG33XrXVn+5VfYcP5ldolR2s2EaV7cScUYIUwTkdOdsMUE
 fFjvntNWvZSUxzcpEj/m0Rz1ZYa2yntxP9kNhTZHeWkICnaGe6W14tg5hlBBayBG6FKH
 RJTbiozi6Pw6BLtvpnzrWqCDzNs4SJjMaWkgw272ikOcdY/hxiV/7EidujVZPQhjMVE/
 Y/dgvKeLjBjE966UWBjFpSM3FJGz4whc5CK0Ow9OeAB4mkaOO0SxfArlzZYrJ6MIY6gJ
 +whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428940; x=1749033740;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
 b=p7U9Qn83Wkt0pI9U0fzS6xoFBWnb6qd/998/yvTSZa9rbtw2UhqvNPwb5ll4xEkG2X
 7lSUHVtKu4U/CQBDekiDzcmqopGD+hmxYIhYCvRHzNwHQA1R/xSQjt0DZoBAnyGTsQCF
 xyx2kj64rKl5uWbWc7Rxlhuf0kK2YwDSa2N2Jv5F4qr0jvD6fmtwGx+aP4fOY6GLFzMw
 QXhDMvU0esmG08Hen8P6v9+chv1SNknO6EEdHvLkpeME7NxT8pqGa3C+ySq8ZCLOwilM
 Xbs3iDMLPgM0/7ZMRspNip44T8P2F588lcTCu+mbOKoxwfzAjxx//h90f17p6gOw6JdB
 WQdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfXvUBBNJSMiJcMcPCa7LbNccfoF+JIhCEUDZv+Q/0KB3bemYCSOmGFpDjDLNVYG99U0/L85JnDv7jKA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YweswBBR39+7R7R1hkD846viw/pXem3wB7jlU+ojMwdbQyKLii4
 DGJCNR0sZmK30wwj7gWjcjhP+gt5WInstHbsm9SRlSt8xMPUT1a/MEaqh5CJz8y0BTE=
X-Gm-Gg: ASbGnctFbbAFIz3DLg3EyybjFCJLWBEdo8ODLrGRXg25vpv/B0dgSZDFo+IHD9pqmFE
 Vxf5zcAMKYVqj7sLTpYqrscwgWFbHH7lKLuwenKJBH8q7zzziM6bpD6yoimkqNVd+i6TBWqb4qM
 Wvtwlvw8uFjwJ+ItoxKOP3dsiRejlRboPHb/+W/ukdPPdxfn187SC+OvKoKbjvuRc+m3D5WwH6q
 5p5B/DPzGYYuBisgPIesj9rggs+GjcH0KPpW4RTCgYxp6rgblCFOPVeYJC8sWanDoWoS9iG0Wo+
 emjK5iFFu79h+TJ2KYy1uoaZyQx8AWExVGBrB4gvNsgWmbay6a2UFeRrS7VycxqSvefI/tc=
X-Google-Smtp-Source: AGHT+IGOjiAalYWBzwElbSsmEX9f/2Y60O5w2k0gf1phaTpGJUJlpjPJvNra7B8bibqFA+SG8s+3FA==
X-Received: by 2002:a05:600c:1385:b0:43d:fa5d:2675 with SMTP id
 5b1f17b1804b1-44c954e5abbmr50075875e9.9.1748428939845; 
 Wed, 28 May 2025 03:42:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:42:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:11 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-15-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UtgeU3dDjW57LMOT846YXV02Tw4GcYGErdMblZiJj2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhWkTbDlacFgpFnf1vgJHMFlUPFeOl/ORR9m
 JSbFDyczmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVgAKCRDBN2bmhouD
 10W9D/9xIbBzH6McgFf7kxs3Wz0pkjTxc7iD6YAhHueVZZd1gP4kz2jdB6oiJdWYbdcvCTsO0Jb
 1M1uQI4Y+F5z9nhOIsSCZcbSEa8uYgf4mTdPeZejnHLZuN+XRE4q060VzMPM+0E5ffmjbSfdguv
 jUGo/ReQL/VbQR3GL3x3Sq+TYjMsUO9HwZ74ot0fnqvUDfwONwxm9Ia8eDAmZA5wOjtSqLldzqA
 nmcrMY8YYR++DoVRbPTLeb38zzchZ4+VQga+QK2Xjpm5Q2ybYvHN4lWRbyLvHLzodyGtm+9vfTG
 jar0yvgxFJxSt43uUsQQD2kiMQ5Wo/A7Gkl/g1mAoDL86kviDaDexYqAL6QM34oxF62djx6jTYo
 t1J67a9M34V59n3xE0FqQ/zITEuVNEP6mBzPXgRbusg8xO3mZGZyyCZFaz5TfC5GMy213jvzS2G
 /BQbvzGMIvKFcEJltkEesVBc3dhPn4j3T53KxDzwq0XR8/qrHK/24e3XCpaCpkP47HtU4IkGhtt
 LDzr6uOse1tliqhZHHOz+JMmqt+JgE2zu0h7xaqEXEV5JClvnbxo0LIz2LR0f7hnbRC//FKZpon
 bEVmb4R9Sw2nd4OuvK7aG4+5drtYGMTyYELEOHkaxIcGob6OxTK6E/vhm3q31u90R4Dyb3LEcPB
 i8N0zohII+TfZBA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 15/17] pinctrl: pistachio: Constify static
	'pinctrl_desc'
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

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety after moving .pins and .npins assignment to
definition.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index e7bf609609617d6af2f10a3df56c62e3bfe2dcd3..7f8b562c81c9cfd1ac3a0bd50018857450bdf609 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1156,11 +1156,14 @@ static const struct pinconf_ops pistachio_pinconf_ops = {
 	.is_generic = true,
 };
 
-static struct pinctrl_desc pistachio_pinctrl_desc = {
+static const struct pinctrl_desc pistachio_pinctrl_desc = {
 	.name = "pistachio-pinctrl",
 	.pctlops = &pistachio_pinctrl_ops,
 	.pmxops = &pistachio_pinmux_ops,
 	.confops = &pistachio_pinconf_ops,
+	.pins = pistachio_pins,
+	.npins = ARRAY_SIZE(pistachio_pins),
+
 };
 
 static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -1474,9 +1477,6 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_banks = pistachio_gpio_banks;
 	pctl->nbanks = ARRAY_SIZE(pistachio_gpio_banks);
 
-	pistachio_pinctrl_desc.pins = pctl->pins;
-	pistachio_pinctrl_desc.npins = pctl->npins;
-
 	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pistachio_pinctrl_desc,
 					      pctl);
 	if (IS_ERR(pctl->pctldev)) {

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
