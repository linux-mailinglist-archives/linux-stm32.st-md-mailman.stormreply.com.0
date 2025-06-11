Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5BAD4AF3
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 08:14:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 526F4C30883;
	Wed, 11 Jun 2025 06:14:41 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BBF3C3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 06:14:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a4e6a0c274so24822f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 23:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749622479; x=1750227279;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TE7gPFs8Np7Q/FF2lBSclyxd8XnUpnZDt9gHZQ7ecXc=;
 b=n/AmNlK+R473+EH0tjmdSbMyuWTg5p0cj7t1ZHCFtdp3SFEqvvRIvMgnopiizKE9mS
 VFOe1KnDhFZJhVGeoq+dEMKwmDD8HBuo4ibcktS3zqTDFu6OO21aXHlJv45Vu+Mla2TG
 lRqZPEcTyow/Coo1vkn9SE6ULRht6Kqjh7kt9BECukrMShJCR51Pv6hm9OUC0GNLlPJi
 z3e7qfsitAOIlPxcXb5pkCCst9OXut4pdaOkjV8JfliGlTLafEANfRwmExm7Ysz918cB
 /Hubd8vbfAx73OQ6QESpt2l5IDe3remnizG6rPIB5itopJsDwL7aPN/Maij9X2pKz4cK
 rogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749622479; x=1750227279;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TE7gPFs8Np7Q/FF2lBSclyxd8XnUpnZDt9gHZQ7ecXc=;
 b=rcvJBGhB4w32cdojPLRxEr3O+Ny3n4wycoWcKQ5z4xUxwzMMIu6KgUyuInnVERH/vs
 M2WzsGU5cRnzmx4+Z0bDwKtIWAOYCeycZBs033FFc73cVTQrVcjABgt0+1DT9UAIrCyA
 DuwCmLoM9hgAG7pT3SEikGnch/fEjfx7Xwhp+77ArolbrA/9tTxxrzYVlPRAxQkw+a6b
 iMmfEw43bzFY/iyeZtr1o26VDNLpd74hhmSrciFXdE3P+Cs2iPoW4lz8PjGHm1EaAz0f
 V2rN3cRqOcDD4IpaN/t02i3RDis6zwrSOYyRMMfyXp4nry8mt0WqPmWqVmk7DWIkomUA
 6/XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ6pHNSOjfhia1Z5vftG1Q22rJlQZRkfZdFpHKxpGZLLx8QFLe42Yhn+WTkE77z3dZs42t3pqG2AhK/Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YygCR+56D8Y6o/E4PMl+j9RQ77Ls9qbZMmNVHYT6+3D5ZOjq5Tx
 K1PgjM/NOfu7MFK9TOLu+iHugTJMzDxc0rYD8aRSHZ9muu0Z6nhYuPF81pZ98xywkqI=
X-Gm-Gg: ASbGnctKeJ0IpeBLSRr4ebM+3SihzNdWr8RNulhhVlbGE7hWb4j/fjHFcxcYlcreNAL
 wFW9ToK8K/Mtkf+Nf+3bcwZQcQ8uRlAQErlnBhhvl1+XDve8Gf8nB/PzkN1Cvilislwa/RlXEYg
 +brN0CZeWx9jmSAJPuqfnjRFkECiaSkDldxgqbZqwIiDH8yy5OGSTP3+YHpky8GKanRsnUfAabz
 91XrWSSyIWFhs6jWVVamxbD561IzTSTy0FpatomV0A42DPKoUO5LE3cxC3ch0LpMsRWLDkKmK76
 pgEqwhYdBoGkBN9yMS3lgfmP0b2Ojyia4+D6Rj078xdbm/Gou1zSygMpAUorwbXzyLuTPjxKMC0
 EuqF+fPY=
X-Google-Smtp-Source: AGHT+IFn+w9wTXPGUJy/sPilC/NQmEX8xSLBnguhN63zZeVVN5Y9q/yoed/8bnPWbjxQrrKvoL0/ug==
X-Received: by 2002:a05:6000:290f:b0:3a4:dbdf:7152 with SMTP id
 ffacd0b85a97d-3a558827131mr509857f8f.14.1749622478587; 
 Tue, 10 Jun 2025 23:14:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 23:14:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:40 +0200
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-8-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2161;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qxDFEG/2cjWrKLnKXwD75upSffPn/RaY6zrSF/H6Qbo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6lg4NYzThC3P0VBNILmPNpLI7cOGxxduFw2
 79gOSp38i6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepQAKCRDBN2bmhouD
 154dEACOMm3Rp/o7Yal3hsY5lrUILoLJv/3YbR1poy/Hntcal7lfWiRxrgpOmbhNAJ4gxXsCS2v
 pQvdOFDdKXryzGo5sBlbzlSZ+llGXe7xIMFD3ccyG7miWv3FoqR39Ss09HtlDLb/iY7lCYUklFO
 X4CE6AJdiC+cVyMjst1ORlZHYvtSmj84z8M8Xw7fjQpmfx3jwpMn8Xk98GAvBj32k1bffAnVrdc
 0dQ73IYkIqj1S30dFyPVw8jVo1NWaH7C4LOHljvBFAS2RWUlzu6GViA0z3aLYJlleswzhWiXdqQ
 2uggpYru6C02B3JBYWRsXiE9lcHMWwJdL8C3KWshReL5zYhV8hRSeuIcHkZjviIb6d7qLHswZoq
 BBsTpZzFdVstw34OgcD5V/WAGmnWxNMppVq42YTfT61ZSZo/M23EkrRVSOAtgXoy2FMcc5QNhv0
 xSBOHIUMCmzDYd3Jdou3acpCxF89InjFKRURreHYhf6ZDMV6r+Jwq9UljYzaJZ4HR0QsZZRunEj
 bIE5rRF/VBlRukZG9fnFQwey+KBFAhAYMQij7w+xJpoqhxqpyvWoVmvYHH29AzUzEaag4F/cxdw
 HHEQfjUS0EaLxw4ayenSuMFm9PmgmKlxXXS++io2JONMtPpSTwwKvP3qPWz7NuuR8O+m9h0hb1i
 HbUKb6deG5dGoyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-rtc@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 08/17] pinctrl: bcm: cygnus-mux: Move fixed
 assignments to 'pinctrl_desc' definition
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

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
index bf9597800954affd954e45a4baa01da4d5dbf420..e9aa99f85e05944a2a0cb9a3e6245c707dbc9b3a 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
@@ -903,6 +903,7 @@ static struct pinctrl_desc cygnus_pinctrl_desc = {
 	.name = "cygnus-pinmux",
 	.pctlops = &cygnus_pinctrl_ops,
 	.pmxops = &cygnus_pinmux_ops,
+	.npins = ARRAY_SIZE(cygnus_pins),
 };
 
 static int cygnus_mux_log_init(struct cygnus_pinctrl *pinctrl)
@@ -935,7 +936,6 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	struct cygnus_pinctrl *pinctrl;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned num_pins = ARRAY_SIZE(cygnus_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -963,11 +963,12 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(cygnus_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(cygnus_pins); i++) {
 		pins[i].number = cygnus_pins[i].pin;
 		pins[i].name = cygnus_pins[i].name;
 		pins[i].drv_data = &cygnus_pins[i].gpio_mux;
@@ -978,7 +979,6 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = cygnus_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(cygnus_pin_functions);
 	cygnus_pinctrl_desc.pins = pins;
-	cygnus_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &cygnus_pinctrl_desc,
 			pinctrl);

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
