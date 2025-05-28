Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0177AC672A
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:41:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5BBDC36B30;
	Wed, 28 May 2025 10:41:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 961DAC36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:41:35 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a4ebbfb18fso52983f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428895; x=1749033695;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7p6g8nrYLu2YSRDRFX7+ayHvEGE7eEHjSKPeWK9MLgc=;
 b=OxzNplnt/0vARpjQHV/dyJL+N7uHJUAL5GN2vVcsnlp5t2WW79rLYOAHQSbriB9lIF
 lb1Y5sDXfYDAtEEzPmTs9bjd/sWIVaX7NdVfnB9DbinTKawdSLv24NZdsljowm8DPmsn
 2o2YVoyPHNuniRD5BCpUTPMsDyJsQuU694Ta5S8Fin/vHJGnKRc2HHBLNS8xfbm1v0oO
 gR+wWZ2q6YomNg9+3/Cpzu49p70F3FeX7MKaYcXKe9tYM8PXRLkcb3KI1ONC9c0Igimg
 a4Xmr91bgXhPJC27tswEfVYM6h8fF1zAeS9eSpH/egc/uBkuTgG3iftyY2nam21gkFer
 33rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428895; x=1749033695;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7p6g8nrYLu2YSRDRFX7+ayHvEGE7eEHjSKPeWK9MLgc=;
 b=dN9YCYPag6eSYblWNR3IFNwXt+UFiliXeJphW3eBzhZeJEAdVFpyZx09Y6A9u1mFuN
 xkVboPaTXj7PtMwMxPwbG3eU/tiiicllF/TgaQK2kOsIuTai1Kf6sAIqdXZGqsjY49zV
 w8v96uiuy5oQSlTBB0Ryh03t89BYtLKMZB+w3eCvgGUuKGQcT7uQNJDdBWMWaxJtDzkP
 aGFcSFofpNSdpxOE1z0OQvuOsaWpzNZzuzO6KzODchN3Yp9xu/CSs1wSL54vPoAWrkVZ
 J1RL/Y9cBZkmKgvLFvJl/yY13Ev6Rv5T1AYsXmh9in+rRidCzwH61N/cMElRWIH+hdxI
 rCgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZuSvfXVSG+bB9oD+nHQkss7D+k+TBXN9kGbzyP0mQSMbD/bWkQE9pkl9ik9W+07vnzFxeeXlA1T2dSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz0DvCdJq1UsWYHgcGI4Q1hH8xpBsNnbLoxEheg+f3gVeNwGPIm
 xol5M1h3dVxGUDK6q7NQUWHor07CdpJj4QCs4JFKOyygli2bDxg1UlgXBOdEEb/pY+c=
X-Gm-Gg: ASbGncvjOSdAOh5jCJ8+wNl1RIWwbhkP3GpkStH5tfFuNrRtTsn7p4YiasRDmOvlFpM
 WzeiW5iyxQdj1ajQMdc+NDPFKcM9/wY1fPLVb4WpoFCA2UrpweWscduSaaWFJ2eQjx/8vtAYC21
 53Ue2BB96BZ0S3PhPCVMWAU3+uWl9RvxP6JBKcE00sU6xnqP62UFiMVYkDBUkzA+cXqgTK8WYi6
 LwDjAbdgeVh4oZ3ruub0HnrXXupI6cs9yYIgm72zosVQk3QdWOYCVz2SdM0H45XM5NcqxFF9jWZ
 t9dBQvO+dw3r3qlKAfaQVA7uUDGrn9ipVWL0KLXTg+OReGNRhhjwg8avV6/XicWz8hAID+rTrrC
 O27IyVQ==
X-Google-Smtp-Source: AGHT+IF4XXp1aLCWKB2Y2JNdxIiZKbtNgU9ZnNFVay8r7bVjoBOcuQslbgG6XG2skmv22UHi94V+gA==
X-Received: by 2002:a05:6000:1885:b0:3a4:e672:df0c with SMTP id
 ffacd0b85a97d-3a4e672e083mr1108871f8f.13.1748428894969; 
 Wed, 28 May 2025 03:41:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:41:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:40:57 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zrI5XszXIHo55XzuEzxs+Nt+l2DX90UOcjrVjPXljcM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhJ4yZZSqj6dEPnXTgLNjKYLUIHgwgauUARk
 H8eJl7B4ryJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSQAKCRDBN2bmhouD
 1+ivEACCJDREpm7C+JuFF39/eQGACEJKolMKPZ3B1qh8VZPQQTidC/Sc4YJsNMf2ALyneQVNJRr
 ee0rzIGyB1dV+BdbrAAaU1luTOQfqd28ZU+hkN12kluq5TtfVYsfjC3qY+xT+s57CmqWJrS8suf
 tF84DJ05p8vijBMGOe4xzZO7or5BqM1JK32hTFyoZh7kOPiI174p0w91Flem3uX1rLg8f2iRGf5
 nPHw4aLV+fgDVeF1lulUpeOAfqHnt0lqKBhpWkowevGEp1PvCHxN9C+zZxjzyVFbhW7DQ7Vtb2q
 ekSrBr/nfXxV1LWbppOeZjsUoqbUYpEBFiNSjCW5tB6Rc2K4ez83OLBVRPG6U/mKcdlG/sz8MYf
 kxnETUB/7A5YgTrEHNeATC8iZ+qcu0dlniWB178PRj/Ohb5p/++wVINLNbOzxqKur1h03+i74ZQ
 lU+QrFHay3EclA4eZmLOSb5rWnnCam0dbD7OAwUxuYLUeB1dFqcULcpDozUjb0t6M4vPm2Opadi
 Y+Kcj/2g3qAtprbL+7BXQPANgJ7TNXpvHXfiUyPvyMmZPuCNkI2SsPmCPNPVAMn0fgSqkoz6iC1
 UKVdN+23XFZMk5MbzTHm838PZoLCCpE96EW79bgbL2OEPv4hPAfZ9GTjdJjAGafoQ+3/4WhNNSh
 y+XmeSNsjaGGtHQ==
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
Subject: [Linux-stm32] [PATCH 01/17] pinctrl: starfive: Allow compile
 testing on other platforms
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

Always descent to drivers/pinctrl/starfive/ because limiting it with
SOC_STARFIVE is redundant since all of its Kconfig entries are already
have "depends on SOC_STARFIVE".  This allows compile testing on other
architectures with allyesconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index ac27e88677d14f1c697e0d0be9f295c746556f4d..dcede70b25660833a158c298d1269d6ecea9dd8b 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -82,7 +82,7 @@ obj-y				+= sophgo/
 obj-y				+= spacemit/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
 obj-y				+= sprd/
-obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
+obj-y				+= starfive/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
 obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
