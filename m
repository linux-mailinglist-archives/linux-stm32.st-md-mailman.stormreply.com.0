Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE5AC674A
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:42:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75589C36B30;
	Wed, 28 May 2025 10:42:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49062C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:42:11 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43d4ff56136so5473655e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428931; x=1749033731;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
 b=CXp++nHhKJLRAaT2VsKRxlS9iQfltq6+kyCavAKcz83GFOZ+rFErmZIoc6pqvc4PID
 Zzi7zeduQyYgBjH2yoicHe8HJwQoTkm2POwwapwlvyNXKm4ZHUWyId4PrVuA744xu2KK
 3NhgbVV9vowEd+LAGBw5PdJnXrsSlRl4Nx+ZcJQ9rbrcQez5vG/C/KdngGj5jojgF866
 21eeGb8w38cA7SKwiYlqblpFWHPZDQvq95fztnZaK6Lh1dZhY/mi9tFzC2pk2o0r3mGM
 ZCk3ekfqQgEupiuMcnvv3CrhBCL8gZjdvhkt5KhImXiy5yS592IhTfT9r1iZJkeIzmam
 xQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428931; x=1749033731;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
 b=dIp4eMN/MahPoXJG7SskzHvKh8V92ZZFie0f7VAExtxwpsZpm+sBcrFIdHEW4laCQQ
 cefAsSbuxqXVLdvgNuoNtGC1P4hKhJ+wIaGpTIOOFwBJYRvDKktmVIv0T3Zpc3Qs0PiA
 lSYlKKwcIgVF49J6QBCXwoTkd7IOFnQDiCo2xLzO+0sDiLT3eHtIU17afvpxJ91L6ftb
 5fCFkuZtVE3STb00t2doKY0ey/vSDfho/wJbmfdKHpFRjenCITZ0hYrpcckWi3+2WKA/
 9bfbj/m78jwCHVFsWCC1Yetb28ClR2oNMCfzeu3xC9G3AEeP8xCfba/Elx8k9y7zKKLK
 gW1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzN//LHsL1ZGuTDA/wuD3sHVT6dRZ2xXABBLSINFKMXqDhL0DZfwCaPx7qMULEQFgA/OEe7nuINvGr2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyvN1zFdSNVRgW+y7xKkQFOiG2/BUT2BoTzgzEeEuRdzsNiN0An
 8ZAjqJIuxKffkGEYRsKs0oCQ4JeEh5FhYrRWq2qvk+i2DeSFG5sx4ZUx9MDnxAOj1eg=
X-Gm-Gg: ASbGncvUoqmdv9orHIhz9OhDzVwmJ5N6K11OWgRg9jSjEyXOfScXhIsvILDs6EIkewB
 0R6P7EspGZcIRE+UO9YgXP7Am4OtOz9LZzkRx6329vK9+oyV2UZrrzV/bisPAqsasJyE1r7AdjQ
 npMdm+NX2ffBGDepLPA1pmnGbsICUBW78a+roafoHgwTwO5iJIP2hwznY1wpgR7fPoDbj9PREu+
 CzgYdWAMiPu+I79UB4Yec1sFbDf/5JglkxpWt2F3iMdCDCtwwGTDTCZJFSo/RwC++/YVcg7Cn2+
 s05IVehlVNV1bPHCEJ+jn+M5XndwlvObltEjER2dZn/xgDViclxtf+NQ9YrXPFDfauvQTuAYCWk
 G0eYhkw==
X-Google-Smtp-Source: AGHT+IHdcQ9yFIlwP3zJEBCO4eEnwvHp4vt7sag5E+m0p9zZBnLpwpM4OjjEhLuG3z+TywmxNPkmLg==
X-Received: by 2002:a05:600c:4f0c:b0:439:a30f:2e49 with SMTP id
 5b1f17b1804b1-44ff407200bmr6539815e9.5.1748428930677; 
 Wed, 28 May 2025 03:42:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:42:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:08 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-12-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vXeTXdr0B9QOQoZjEzmtipvrdS/pdMRjTxQFNr/h+bw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhT4xTFSLShiMHGrzurn8k/RWLwBOEg/kTfX
 2gUx5kqw3WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUwAKCRDBN2bmhouD
 119uEACKrgBEySfxytMKjgXas+UOwi3IzZ36tTWGAtahy8quwEaS8yKLMXGH3UR5R/xfiE/qxgT
 K0j8KZQkSSoxJgxu/1dPpRloEO6KFrgMS1JNvrxc535yglaGGAF6dztV4S0X8Zw47lxNkSI3oCf
 kmg6Jop17f+7Kjbsu3oNHrrdaoyBSECGDQxfjPrG1OK1828Xa1Gs20NH8vBU0CQOtNFmjAg4W1q
 rCrbcRJkrSV7L68wgkZcewjkW+uCHpp8xfiuky/X+XA3LrnVkt3ZWvvtx5EVrBotsW3c605oGMm
 aIh39HoF2i+U+c1KA9+kRRkUESeOM0m/NNik+1C01XMxfvb6mtTvGtL474OCtItf1zazpXvoj9T
 ygvQC/oprYke1uID4uognq5UNn/OdoNvQJk6tbxBkAwR2epz1lboNXHXIe1MMdo+aFjl0220apS
 E2bXflnrkOr9/PrUbwkSiJxaLcUHqAJCywLcj/t0mPNa791g/BPtMYNr8rDFfZ7XmZyrEPbEJKp
 5XT8mZQD9JIEGYwbw0cQH/vz9kgOs7p47hN4UApEPGZ0HzG/37d9kmNp+Q9mNDbTUfAr5OPTT0V
 Bv9d8JMKPn9VoDFIrtdM3+11ONR/OmTdCfKgP1pqzLvz0HwoQl9QvT6II0t/70s7GaWP8Umrwo8
 X7EdXcYJodX39FA==
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
Subject: [Linux-stm32] [PATCH 12/17] pinctrl: max77620: Move fixed
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

Assign 'struct pinctrl_desc' .pins, .npins and other members in
definition to make clear that number of pins is fixed and have less code
in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-max77620.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index d236daa7c13ebbcaf7c4a8d1a8bed751aa111c0f..acb945a2574368b2e34659a902c34df8aad193d7 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -543,6 +543,10 @@ static struct pinctrl_desc max77620_pinctrl_desc = {
 	.pctlops = &max77620_pinctrl_ops,
 	.pmxops = &max77620_pinmux_ops,
 	.confops = &max77620_pinconf_ops,
+	.pins = max77620_pins_desc,
+	.npins = ARRAY_SIZE(max77620_pins_desc),
+	.num_custom_params = ARRAY_SIZE(max77620_cfg_params),
+	.custom_params = max77620_cfg_params,
 };
 
 static int max77620_pinctrl_probe(struct platform_device *pdev)
@@ -569,11 +573,6 @@ static int max77620_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mpci);
 
 	max77620_pinctrl_desc.name = dev_name(&pdev->dev);
-	max77620_pinctrl_desc.pins = max77620_pins_desc;
-	max77620_pinctrl_desc.npins = ARRAY_SIZE(max77620_pins_desc);
-	max77620_pinctrl_desc.num_custom_params =
-				ARRAY_SIZE(max77620_cfg_params);
-	max77620_pinctrl_desc.custom_params = max77620_cfg_params;
 
 	for (i = 0; i < MAX77620_PIN_NUM; ++i) {
 		mpci->fps_config[i].active_fps_src = -1;

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
