Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2FAD4AEB
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 08:14:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 369A2C30883;
	Wed, 11 Jun 2025 06:14:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E41A3C3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 06:14:30 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a4e6a0c274so24799f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 23:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749622470; x=1750227270;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wLYPwIWcNIonGvSRDv3RvBARXdaS/NHzLx8nwSb9+Xc=;
 b=b2cydTepiwAs14zYMChNyiwla07YFaxaPQ119vGSvPOjItXerxxRKx5EHwXT5xkUWK
 MMi3LVSv60yQ7yjKx+bAN7r262Wr3c3MgXlRGvgRLGxGyYBXXqZd9coP2y5rpDuiWrYm
 MmjQNkkK5nKqv8BpcoEXBWjhe5iKXAbVPvxLvEjyBQianCZ4O10H83VvSio3yKnDRITR
 fhcSnNJiwe162rWGgOxhyEWy8dF7xX/kDh1ySPlg+wrDJ4LsWQ92UaOLOSMoSCsgmbLa
 r4xjohWhb9g7ybpRQMIIYrTLfWGnphkF0r8L3mgJtBDOwGafiFy42+K6/FYkM5ORYNQ5
 duAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749622470; x=1750227270;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wLYPwIWcNIonGvSRDv3RvBARXdaS/NHzLx8nwSb9+Xc=;
 b=euZeQl1MMVB/XTgylscXXA204YaSrim4oll2cs14BOQTRmVOj7EAFPlZrqGi4SFAQf
 jYsZdfg/ustUlBHq8VEotkW8K9LFo4xCnt0VMmjWMWj5thHReSzH5ZVYieIFInF24eWY
 rAQKWCwYwOCDfP621WuC1xuXjmGhj4fygrMm9EgMPdpJU1dGEjTUR23uvJeNyD1rI491
 cElYQknTfo86tG4xP5taqP62osLOyJ8q7NrNd6t6Q2y0+/r/0x5DAMxwNQOtukWS5A9R
 rohjC8YDI1m/0y/xc56LQj6qvUPAt2Ulll2P84VhY8gkNWofnZJtn4aD4NSoM24SirdE
 wdzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzL7egDAfVqz+G/zW3U6+vDQApSaEgpclqgMJt0RV7LwJV0w3Rt2jK1N/CXZDiB/6b6z3i/uX6PcQPZA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyE4xmJ7wTBtA0ZTcxxKGSk4vhi61stqJoUQjen6yxLKJipZn0e
 bQNNd2xhadU4l8fraITbSpMFZFilOPHUC0dOoHr3f/AFDIYM0zW7w18q0KuyEJd1yCM=
X-Gm-Gg: ASbGncsqrd+cwaowFwiAlt2zIrM3yfs5kHBgIZl+vmq6bV4/GAQolw6mzLtMophkaKF
 fwE6mOqhtIPZKh9t83mpT0EJa36ZmLclR5DuYQBy87gPUmBl+otQyFF+CuBGj0PkGXv6bHeCNbS
 FoFtF1haEircUUTfvOAi91+vORaYkmxOuj88HvzSkeWmct2j65rMJI6t6G8EsmWYsCr4GtOLGT8
 hSORKNefpJVXBRhtgaVspJbjYu9EaGl7BC7QsN9S9Qm6rK+bYjxnRRgQmiOCrAF2pSpnAEkzpMj
 cMiQhb4wMdrzJUA3yKtgnehpAaJezlsIUrCSSPu6k7Q1TQWMYd6iFvucBI7/qYLv0qr30qjajAl
 DRvFarcvDtqXPnI2IZw==
X-Google-Smtp-Source: AGHT+IFZtxBFSjLuR6Ffe38My2u48aEsiQUnLVmgKKUP0ueXHo6YNiVvlCk4Ba8Qu3oZKGPSY/KEKw==
X-Received: by 2002:a05:600c:a413:b0:439:9a40:aa1a with SMTP id
 5b1f17b1804b1-453248cd75dmr4600935e9.6.1749622470317; 
 Tue, 10 Jun 2025 23:14:30 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 23:14:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:38 +0200
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8vGQpzjfE6u+giOJnSmjcfHXKBBVmk/PFMGclk6BN7Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6jcQ29NFFFK1Aw5C+7sI3DG40NeubIuVWQa
 M6tf00GyU2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeowAKCRDBN2bmhouD
 15qaD/988iyCPoqH/pBfTs7tUsVVV8Mri+Af4YNRSY86TwdRTqSCMO+0wpaUw2BeuKynQCs8ZSd
 v6c7y93x4QoZGwxvtP95m0lKxE96njRQ+2yEWLJHOZ5p+C5mkjTvNblw1G7iInSJsP8rchVDl40
 r0DH5cTiR5PBxP7K186nP0Ksdm28krr1TsC3HQuDiVbji6eJfxvrXFshWVpM2vWQQyRAaSBHkDt
 E449wE4IWwnye3jEhdetRCPEH0vVCuxuckhvO5Vw1XIoFHAIl6iko4DqbVzJmGnHroj1mHJM2eK
 53tzMUWNPCBCWcfu/jCo575CcJe3R3/LZPdj1frXSS9kau5xnfvQIhVXK6f5KxCG0CUM0qtlDlD
 p2RKEt6nSfk1il1nM/A8aWjhbK5jTiATzFEcXpIXJd1N5WccFnzR48dAHp+va8BhnC5QLcRsP9q
 vxTxvgB8pURZn0/cfKX2f7Sv0lmKxzrl0eZuS7H0xldoBa/ROi9lYTpG1PeuveKpRsR9fXMOcXM
 Ceiw64wJn2c7ndksjN48oBkeKzcjljo3MU7m0OLpv4qwb4tbUYCfNQJuDAyGXt6/aEvJwIL166W
 py6Jh/QFYmArWu9ggfKh/De2c0G+LzrGQixxWZ833ZoF2WqmwpQcZLhiBUhmtqXEXnSepRVMt7k
 k1gji4LlRC8ocpw==
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
Subject: [Linux-stm32] [PATCH v2 06/17] pinctrl: nuvoton: Constify static
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
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index dfd32feb34286b7a4d807e9033a11f507e277dce..b8872d8f5930ad931dad208afec4e08a23c3d653 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1817,7 +1817,7 @@ static const struct pinconf_ops npcm7xx_pinconf_ops = {
 };
 
 /* pinctrl_desc */
-static struct pinctrl_desc npcm7xx_pinctrl_desc = {
+static const struct pinctrl_desc npcm7xx_pinctrl_desc = {
 	.name = "npcm7xx-pinctrl",
 	.pins = npcm7xx_pins,
 	.npins = ARRAY_SIZE(npcm7xx_pins),
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index be3db8ab406c416f0709d06eb864e33e3208541a..3c3b9d8d3681c64c21927615e1bb49f157f156b5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2299,7 +2299,7 @@ static const struct pinconf_ops npcm8xx_pinconf_ops = {
 };
 
 /* pinctrl_desc */
-static struct pinctrl_desc npcm8xx_pinctrl_desc = {
+static const struct pinctrl_desc npcm8xx_pinctrl_desc = {
 	.name = "npcm8xx-pinctrl",
 	.pins = npcm8xx_pins,
 	.npins = ARRAY_SIZE(npcm8xx_pins),
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 4264ca749175a2ce0f3603c1d7aa271d98e6cd89..8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -989,7 +989,7 @@ static const struct pinconf_ops wpcm450_pinconf_ops = {
 	.pin_config_set = wpcm450_config_set,
 };
 
-static struct pinctrl_desc wpcm450_pinctrl_desc = {
+static const struct pinctrl_desc wpcm450_pinctrl_desc = {
 	.name = "wpcm450-pinctrl",
 	.pins = wpcm450_pins,
 	.npins = ARRAY_SIZE(wpcm450_pins),

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
