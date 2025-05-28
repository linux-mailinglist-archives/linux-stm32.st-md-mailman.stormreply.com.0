Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B0AC6746
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:42:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68523C36B31;
	Wed, 28 May 2025 10:42:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36FD4C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:42:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43f106a3591so5001185e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428928; x=1749033728;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
 b=Bs0uTNt37k0VZ03Fp+PCeSzyBDd/HNkvjxNIBj9G9W+i1af2BTl1CYcocAIewqVMJZ
 +hNgybVfPzDz+L1wPskxPcfup4tqkarAnnTdzbtRFBPnt7pCYlg0oVoIK4SmLfskoviv
 E/NsMCTeTIoE28dHfZ51WGoWJHdQG21Mg4Q1ZquS6Q+lnx+6QRe07ue7rR4ApZp/8Hcr
 1LG7dcPbd4Dcnc+UOBKNrt+sfLfvIPsgyDiELplJcRG8Er6h7BmD5IuqpL+RlPe+1HML
 wW/KhufTHPAHiwiYfjdQ8ofQeiK3PwumkzTLI1aUc+8SCg6+CHbBcBd57DYTXWNMdtIL
 yHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428928; x=1749033728;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
 b=nMt3C9JM8CjmONqDdLBZApxO2YXSCNkWXWWk+TpXjabO3V9W9cTEwOfryoIMfc8njW
 9zxSMizD2An19tP57vcQrERSGymrOzlDfD+EtX50Mlmo+EgZVcBC7w3RKlxukPRwIvQm
 FnK8apVbvwg0Uw3/dwN+QAsGXodcLtcvV0tgTFJ36xDz7/JigKkn89eI9kI8crX6SInq
 /8sjXKsXKxqyKSt99Tj0jIsFPkzP36EegsDN8eeohV0zjmrjHitFP9HB4UA+Vs0mLPrB
 4yzmNPht++4+6a6r0RQi5SaNawcFMjrN7SFqcnfTS6fAdUxzAmjFXvQskGQO/btMIgLp
 qsJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMMeddkWwI4FO5KnipySdZ7Ivfa8Z5Bqu6EgD2yyIYeCkHGm9kQV10qKPOqN+4aWLnykXFUEOao1n+Pg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyScIimiIjq+I9qVAHaiW4kpWRQTx4wMdgNPXiHj4cuQzEdlo07
 6HtKbX/yn0k8dMf9kU0UJxnNuEAQVIy6bqZhfryV4+wIpFEGDUQ5cdbtXx60Q3gFhxE=
X-Gm-Gg: ASbGncv5KbQvardj8084N1hvgE/RQ84hGCww3ee+o1/7g6KqYKOGItw77uII97VG59j
 wg+i41F52IafTc+3UA4X+fkHBF6I6oqU7i8TXg/8Ed0wui8KO142EdTBuXZC+Sff5l/f5aU/CDr
 e32KCHoo0CFYX0kzLfW+mN6l+VzSND7+v858Tfv9QOA3riZnXvQwXD486hGICWc+6i2vD0dxWK2
 oAeJECPaEgcV3yKAkYDQy6ueKEo1KJyubE/zCFeQ6ZnVBTJf0k96s2Zgn5U3YMPRD6NEzdcAGOv
 fhEIjMuMwZfdpPz2pU86l1YEODrrzFAKzYPaVvYAd9w97mMu2pkpYQ5yfIHkRI6A6hsFONzwbBd
 I5hxPZQ==
X-Google-Smtp-Source: AGHT+IFXJEnneO4xSk8QHxW3M4MG6X2rUF/ijYk6/3E6ibOcv7/LTi5pTGoQU3pGtcmJJ43pDOy8uA==
X-Received: by 2002:a05:600c:474d:b0:439:9c0e:36e6 with SMTP id
 5b1f17b1804b1-44c91fbb19cmr53499225e9.3.1748428927574; 
 Wed, 28 May 2025 03:42:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:42:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:07 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-11-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhSmo0CjMtoXcC2sHTGZq48JxTVj2z45DQTw
 MfdipuBb+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUgAKCRDBN2bmhouD
 11uhD/4gp5pseL4b42D5IrbEvXxuCr6fAiAGchUSH1EtuHVur/ZUNsA/puQb+u0ePsLEwBisB8N
 HkCZQy1wRLe47FK3rertUOcjzUira7hX1qKm0jhTZant8VKm9nCaQfuvyHxdpPhOoVCVJooM9Ad
 c50bsIAmLW6CrtUn7kwQQ3rbem/I/4JrlLZQ3V+T2HBOBa+wh/sf2x2tGfE/ilSmEXtZ9VCsdbQ
 VeEf7DbVnNsvDCjNCQtCxzEBdKpKKSvCkiKIJcFpEb2Szo35NLhJzj0aBmlXWzocpri70Ho42iN
 GPRpc/emYDOm+hq9iusYbHVvfypT9421VVBIJZ8npbZmUnTu39bKewgOaguan2CHrPsWa8yw3nt
 yw5e2VWBb/HSAChzlE86yqdW9+rkoB5jFUYD23+dUZ3eWK3NDUviqsT+/YmruwWE9exSwIoDVno
 3GCqUCo5TCQOgp0hLWvEbWq7L24O47InJOwlG/6ZNrPwi+mCdVERcA18YX8T5vAEdBBiOdTFHSC
 Ekwch4dUQYD6n5qRL1rRfPoiWhQKE9VTbMoVCm46WQx7XkVKJy35962yFBpybsElB8wY4ca2J9M
 vOA8pVv0owKcK1pBhmg42QqkBmJWh3CkNUY8E0To1kMPcNE6E/hWvW13iZ5xppI3+CQBocPYecS
 qfWXlWeL9QmpElQ==
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
Subject: [Linux-stm32] [PATCH 11/17] pinctrl: as3722: Move fixed assignments
 to 'pinctrl_desc' definition
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

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 0d8c75ce20eda97627aef773342a0b63ff6114a1..ed7b2c482ff0bb6a546955c083ef7046701527b0 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -422,6 +422,8 @@ static struct pinctrl_desc as3722_pinctrl_desc = {
 	.pmxops = &as3722_pinmux_ops,
 	.confops = &as3722_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = as3722_pins_desc,
+	.npins = ARRAY_SIZE(as3722_pins_desc),
 };
 
 static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -550,8 +552,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	as_pci->pin_groups = as3722_pingroups;
 	as_pci->num_pin_groups = ARRAY_SIZE(as3722_pingroups);
 	as3722_pinctrl_desc.name = dev_name(&pdev->dev);
-	as3722_pinctrl_desc.pins = as3722_pins_desc;
-	as3722_pinctrl_desc.npins = ARRAY_SIZE(as3722_pins_desc);
 	as_pci->pctl = devm_pinctrl_register(&pdev->dev, &as3722_pinctrl_desc,
 					     as_pci);
 	if (IS_ERR(as_pci->pctl)) {

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
