Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09BAD4B0C
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 08:15:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 064BEC32E8F;
	Wed, 11 Jun 2025 06:15:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0FFBC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 06:15:10 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a4ef05f631so25089f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 23:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749622510; x=1750227310;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
 b=Kx8t21BpsjY06CGu5SyALfMKYnvLWMnU+T25+EB4zdotfqPhT4dhJh38woYQDsyhcj
 2UzLkZD/KGMvKUiW09CK8vTP/ie3XUDYI3PD8DpILRTVsD8C3tfIRTMN8bWA1snWeJJM
 L5I+eqtKgZ64RR/j8QVR+uzX2IEsFLynffX1oQ7Uq6hznUpFRC5hsVsBuq/uetPQET0o
 OlDChbvU2zJhR9fR2juxeBarbyKHCiQs5qok95AhSBnvY+7E+3Q7a0v756E6/NnnCSy2
 T5rkuT6JmkSSiVZcySWUokp0YCihEbCzYaGR8BCj7tFDOgBA8Lwx8eBy6B5Ft5+qD0ok
 Psww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749622510; x=1750227310;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
 b=WuXc990f+j/zjJIXAFiiP55b7ZUD5XYHQ3smen7ZBAhx/PCB943GKRgbMtHSlr6agd
 DW3NDIA+Sj1pnI2EGRRDeQLgTc4CO3BVujyf6uLC3/ghT9VJr6WhFMn4uDxK2LxrYtxO
 gS2Ia0MKb745oFr5O+vGWy7T8nXl4vI3BafuHUYcKgAlHcu5rlRJpfe0MuZCXM/4K8UT
 s0kGICWvg4m/OJwJdsKrjeeup0Dl7dFrpIBMuGMW4bee984Z/dJzEhWyGqKcX/F9aqhG
 JTAbSONKokupDLhH/qdMsJ6t1u4YTRr7RwMlFq0AyC+onvkSetvBvUKDdNOEF1VuSqZD
 14Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEcIeJIopChaGiJWsDi2WOcFyMeX8RmR8WOHAYLzrExfnIz4R7XRkYPrxexdDNSn/g9N+x6O+/LgHdqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkBHAf4RG6vhz0/LNtHtAnRlTBgKZ7+f8MVT0P0cFs3UV0pkQS
 JbG3mXXf4FLNUkYs8uTuAvtbiwvuvv6U4mAkAikf3KfAYvva4NSQJAA62X1DWcv17t8=
X-Gm-Gg: ASbGncut9HVMnfLx1qxCpdpCzhB+BrlM0bIRfrqcD6usTzA43bDQuQY4JqiJl+GNxw4
 UvWDtqW+GuqPQS972ec9lPwPX1ILg3J3t6BnIs3H01NjEfhzrz70UrU1bW2QxaBSswJoxLcatbh
 Ly8L9KOQoWn+r8MAT+WM1x+5hJkd4Wu870eCP/7OqfSmvTs38qrwBe1SvYC+kRlFdNVyYGdenyt
 ba0eKxvGSuPwStXhx8NpmtGhuUXpfcSOreNEfdxsr4wpx6h2uDDQJEKONxxZxcvZKs1ey5H1dTF
 BpTNJj9C40jwr1oE7Y5WdzAdi/OdSvrXiU4A4oAk8bqPtDcs7YHiZ89CqJOKaZG8I1qfKuDMmal
 vFopVmAeVq+V03j+2RA==
X-Google-Smtp-Source: AGHT+IE7ZMpyUDf4YrNSUvsjoRE3vjRVPb6bVXPGoeL9ls3/WZGat0okcbwks4ptZKut2a4VQEsADA==
X-Received: by 2002:a05:6000:18a5:b0:3a4:e667:923d with SMTP id
 ffacd0b85a97d-3a5586cbaafmr541720f8f.7.1749622510208; 
 Tue, 10 Jun 2025 23:15:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 23:15:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:49 +0200
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-17-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aZiHVtAix4Bs7VFa47r9w+gaIOPFsTrPZZVeoeZFBbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6t5SafcpPp5dX+SCVOeGb2hFRBkfuLb14pw
 s7c8HNmfV+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkerQAKCRDBN2bmhouD
 11knD/9M3DV/vwXFJpNByYjPAAfPbQYiYkwFNYQHUnPzXNhKs/vugtZWoOplA3JWYFVV83HKQP7
 uw3WamLIyTbIQRBTc1s5kYotDILFcXtEuSZn9ut+zGmEtrMVigSPDvqgokfS+ZQSs6dQPF5ZJv7
 +aqYtV+yIAgCJ5de6A8vYZsWp6UYmn51U4Y4R/OX8UM6fxzj+bbMuXr73AsweooW/WYTwxs0tGQ
 u8J/Ig7SVBkSMfYTdGAi2fabtexF7dXOeVyVlmbn9PdktSW/PsChHgaxt74g8YGyq8RAVS7G3oy
 Wb5YIe+nXI8oxp2pRHHcp/1xme8/Dq/OHlHDjYlqltkPGqKUpbDCTqOMbfwl+oqk832IU9YSTYE
 6qMWelzKCzuphqYOP+gk02SE2WKQ5xuQ3kLSCC2YtcSwoP3/V85G4qFLQm2dXZHHW1lAjFiMdL4
 k6iyeo+At8cXPMKvUYLbuCfzKzXpCJ1F45XL0v4mlYrRtXqlWYkAdPq93S3x5jij462AEvNwTz4
 G6DrpD8SbLh/EnkF2C3h7fpu++EsQsj3fXVaN5uHzzibtagMfWEF/xN9Li05E8PYsIhiqmrijA/
 blAWty+7bSqiSP1NbqhzH0zmIcCtAbAzmN9j6DHNVcQq5mzCAKwkNBKtxMNJ2suuFDzyHqWvfGI
 a63Jhr46asoT94w==
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
Subject: [Linux-stm32] [PATCH v2 17/17] rtc: stm32: Constify static
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

Patch depends on this series - const in pinctrl core. Please ack and
this should go via pinctrl tree.
---
 drivers/rtc/rtc-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index ef8fb88aab48a0edad19ae5872421815aa04fe46..d4ebf3eb54aa9e91c8e9f8254f571c53794192fd 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -393,7 +393,7 @@ static const struct pinmux_ops stm32_rtc_pinmux_ops = {
 	.strict			= true,
 };
 
-static struct pinctrl_desc stm32_rtc_pdesc = {
+static const struct pinctrl_desc stm32_rtc_pdesc = {
 	.name = DRIVER_NAME,
 	.pins = stm32_rtc_pinctrl_pins,
 	.npins = ARRAY_SIZE(stm32_rtc_pinctrl_pins),

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
