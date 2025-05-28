Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69385AC6741
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:42:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CB50C36B30;
	Wed, 28 May 2025 10:42:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FC63C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:41:58 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a4e575db1aso162072f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428918; x=1749033718;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pf1YR4gqV6lGcgRNt14+w6xZNohisJw9ukNkMtmqRYQ=;
 b=KgwhicOrl44rbrdSKETdqzqOVUaPCjZ5BePMsMyKLWuMq5r2E+h+Tctt7ZuFiCv9D6
 Gv/F4aewWm09UlpNEIgiONjYvtvkEcVVbV0iF9QknHK5qYHLiGj+/5TNfIZZzS3RvSNS
 0FAJdTexUAUYsYuO6QedFxk5i0465/TMdQ3T4VZF7IK06RfrYVyvBPl29JJDdPKgKgnJ
 5hYm0ikr/t2OcpGaO+B3Aw8CkT8rl22oMdWvy6k8U1E9pHH2/ULxjrjPWaW6olOi5+qG
 BDOZ2DTktwewzJyLjfp9QBUz/bCvippvErVCzRn7KJ8C/b1nghmg0sklvNy2kR4YMf06
 Mplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428918; x=1749033718;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pf1YR4gqV6lGcgRNt14+w6xZNohisJw9ukNkMtmqRYQ=;
 b=qblkgYuTasIj3NmNzGnHEWgqtdJZgMHOZMAnW6iiNw9ZVZT5fvLuHpF42ppB9QGsgr
 n+fQorhwlamclR+J297Zal3HQhMhyaSwlsR+x6tj+shIv0ffaLOzX6c+eMZrb6tYnqlI
 PTphlz3MEGIuFH4PyOkBIhrC/CFeftbjhtrLF4gsKg3d3rcAcdl9Ck9vRC/0znake8LW
 sip3F9Gx8lg7I+cb6tdft8RFk6Vi4TQc72wYUAslYGnb4w8gEroVnrxEOUP9ptiy7Nmu
 C2NXovKETiOo6k3+a6ju7qX5lJxthGFmzhtXfqDYeZ+o7crQdJgxKgqtxdPJA2QW15pZ
 KRpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIo+FOI+7iQjLwNYDOblywUURlkJmpnaUv9uFGKkvT4XIx1/lgH0x7iAMyDHKbJPsH9qNS+zZ6vaSd5Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzdEETaqQu63w2yQF7h0JlHP3yvJoUQ2RFtc+cFXzC9BjHoG4WW
 oT35TFUbrveCBbhQKiLN6SqGvotCBIfseA2wVO8sgK6nUov/I8+fO150idyqpZ48VCw=
X-Gm-Gg: ASbGncskxk9bNskqZmv2reSIkdbYWnkmGZjCdzJQIr+f4aMJFPgPbuqcmaaSMdvEkQf
 gTsWUAJSqBNe7Y7ZIwMC6QYF1AM2PE1PtZeWnSJYgHrbBzCkd4aEEbeMbTnXx+YlSAzR+b6XULk
 BqiTiQoMH9WvmMviU31NzxzP6xfRhKtlKrQVziSpYZBJjQ/Lv6VMkhb3rtrSSBtO9iGc3XSt6Dt
 wKwkZ9zn01JFHkUx/iaUu9I0LW6xUP8GToLZYqPqV/aM3kuDrt/pNB+tegz3XTkyd8nGBE3JHGM
 ZSzOnfcYHklHBR0roE/X98RorR4TLHw1gQtYmwsjSVQXXSn9+QIElKxgwdeLlFPc8LjdQiQ=
X-Google-Smtp-Source: AGHT+IH1zOEOLeCxje+RyhJLL9R7to4LG+S/YoypX4dofkpM8V4nOT+IYOSlqNv+mgg8x3vhGGPHiQ==
X-Received: by 2002:a05:6000:2303:b0:3a3:75ea:f9d3 with SMTP id
 ffacd0b85a97d-3a4cb4addbdmr5341295f8f.11.1748428917518; 
 Wed, 28 May 2025 03:41:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:41:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:04 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-8-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8TSMAdNwJJ4cMP69sWF06naMdDsc0YKsL1F2ggY8MtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhP4ba+/mFh+oFgO6EmJOLE0PvaD+UB1YrZI
 JEnxOp0UJOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTwAKCRDBN2bmhouD
 1wZUD/9bA+sdZ/7ZzrhcN224T33+HyLau7J4D7YZ4cKaBQB0U8+Zw8EsZqd4MTQZ6emR9L2iOku
 vB4WqG5e+8Z9LIfvJznXFBRZIVYlQMVs4gKMA6n1IQK+b3fdbSKyrWYxGzgWg1qHRWfrn6gFq8V
 qwQ3u4tXG8zk+5W7WCD/WmhtFm8AjfVPdLdTzD6BTNO5/1O3UECTfd4bdy5uAlIjjeeaglJ6U9x
 TfGg4iHSiUave8A4vNsJKpd2jh/UHo31b0ZzfwImQA+f8HM2q+iJGrpHX3CyIV6W2b20CcjaITi
 BVPzXRwFn1atUdyNm687e7TwfcAjztLBlCv8F8SICMdzeIwhYxkIJwrnzyA/XJKL8VZDWTgHXCG
 K2DF/qGfjZ5NgbqxaZoqwf1DAfB+eqty4Xax4UbJTIBeoox4mmxjYZGajNOOihw9gH0KKvHsj26
 zBwOdZRN9WJjBF/BLwvfGx358OA0ejwj8JIbMzzv7XPnPz8YhtHemtM/2Q/BUcu49g7M9Zn+SBQ
 kXnJY427cgGJL4hSfheW6ucWUtyWdpu9qP9QkoTJviZEn3MuNR1TyXnZlNQPQziFWzqHoSJpgWa
 B1C0T6yk8njHeARq0LwxzSDnTjEtcAmRHwCS5FH+LfTz1zCNy8ZkWDkhOkDAGNbKgggkp4iOtAa
 Y4YpkDzEcJUCemQ==
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
Subject: [Linux-stm32] [PATCH 08/17] pinctrl: bcm: cygnus-mux: Move fixed
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
