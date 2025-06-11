Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4930AD62A6
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D6D3C36B24;
	Wed, 11 Jun 2025 22:42:36 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07E5DC36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:35 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-40656384d30so225652b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681754; x=1750286554;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DVj0z+6x0ImArb5yGvcedbePq6HiJkWaJeSxbPqOIBs=;
 b=LtrU2lqSaKoKf8qz06vy65TapC0+7hh4XkBr71jiEfb8mUq14Ix/0B/V6jN/dUrPG+
 KyEjA//ooLowWw3psEcZhgFqEI2UUECUc5UaHqbeXtUzIk276fIQligkT/mSMJIitUj7
 iFcA/LirS046C/Rzw/A/yOlzkYOhlOedhO55FfOgGF9t5lUJvImUpRaypY9xZVoy8HYV
 iBG0X+DcRA4wwmDAilCD8BTKmY6whGC/F+LKtOW7Ci+u4Bh8O/W+QX1HHj8pPOBBxi1b
 TnFk7Zkn7UaYnogmCGkJfTa3H/rBiMTE2eCcydFD4jT4IwawgjNBo1WltAzBLppqtKeq
 oKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681754; x=1750286554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVj0z+6x0ImArb5yGvcedbePq6HiJkWaJeSxbPqOIBs=;
 b=dT3c4HxKwKler1Q0ApAursmaIq1ZkAKyHwfSC7J9BXMvQ8Je+MIeI1+SeZcnsFVgjz
 lRsHwlwm0jvTFiQwoHiA++zlXNsN1UF0SyB1XmMgT/tjXBDmlY5bEt/XwaUSrs6eG9yK
 pkf1HciyAZJ0g9/DDd0WNhlTC7TAuBnSwK6aEw31TKLsv5YSyKvxh0Y0OQ6z2dhqWn/s
 SHJYXpOKiHSU8AEsRibDePN+aXfmtYOPuTmZEUZPLMfddLeFd1cbDDSZTTfBpkt7QGaH
 CJa6uS3BGrBBe9jvlWEXNLKpscF2l9ddmpyW5Ju8uF3Rjz7d/QFLL33XH87nRMFiNhaS
 CAYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlhTwQK7UhTjiThsilGm9rUvuy82PkmNcRDFAJZOv6Be+gMsKNDVRqiooZjTR9VRtGkt2dDyij/wDxiQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywc7reFYWxXGnUbZMxbzjHYH23w0INJUsaBNivB+tAE4tHi0MY5
 KCqap5Nyqk2WJ3DQyZIbRarTjdcsONc/KKbVNb8BKxvjIG204C2gOlcNMUwbt00q1rg=
X-Gm-Gg: ASbGncserMeavE9ma4u2UwIMQThxQfMZerEe4c99zs/qch8i2ceyySm99PbLjMu2jBu
 Opigbz5CO4b8A+50hFLribb8bAYc4bG1447Y7O+pAF2Fc+lPkU9qESYen1NsApwzOaINEGptL4O
 P3FO4K7WhSFfC80a+LzxCuNPfINXAqdoL5ybJ5aQQ/JefUSQ+QfSHFtNn/PlRbHTs6fEbShHR/0
 iAqiEB1okmy7VWAoiZP5jUklfEXj0I0uiA4jyG6VxMcazkmPAM6ZfuiXUBtTm5Sdmdt+QP+3IdM
 mVh3aBQRFDQK8XC9q7Fi0TcgyNYqEFGpLN7Jss/OugDrgqczqZ4cbQml7gimaYP3KSuq
X-Google-Smtp-Source: AGHT+IGDN/KHxz9Bnp8yALdHvhwtdj8HwBIeOVLJvupWPyPhdbyamlXaAmqI6CHUMik81UZ3hpwyHA==
X-Received: by 2002:a05:6808:2223:b0:403:34b3:c986 with SMTP id
 5614622812f47-40a5d0b202cmr3734055b6e.17.1749681753896; 
 Wed, 11 Jun 2025 15:42:33 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:32 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:00 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-8-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=847; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=WSd14gc0IglioCpRcpapejeZeHyJEdiW3ePuDI+8374=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgW5Ygza7kmThbyisDqsWQsptmTBU8wIgMgQE
 pxnhMsh/S+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFuQAKCRDCzCAB/wGP
 wKntB/97ufnI2T1BvBKlrPPhGQWGDqAjoQSkW1QKpcvqm5JNUoqkex0I8noUiFjQLHt6g8Fwi0r
 VqqpMFbpUdF1MKsd5VP5Zb7DZxC2kjDp6jL041HzjfWKWjfXVH15wEqbhi9WhO8WDjGwDbAlCsC
 xF7XmULVO9O8XVbEX2VK3nCtJNrC1K8evAkSlACFG8ZzKinPcoB1k9qYzM5sU87+WFtHVkD0AZc
 Qeah+fJkaOfF+P+wux9OLYTxPFsUcmD0IHW5EsI2+Tkmo1808IBnI/YGG1DoVdGBoAdPrE3h6Cr
 QU+mELE3P/nwI+trrPO3SatKUUCLCkgwZTzH+YNm4fFPbrtC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/28] iio: adc: ti-ads1015: use = { } instead
	of memset()
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads1015.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 21181cc3bd852ba3bb05b295c98b3530d8c07d3d..48549d617e5fdc363a5ff583a2b303cc8adc9eae 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -450,11 +450,9 @@ static irqreturn_t ads1015_trigger_handler(int irq, void *p)
 	struct {
 		s16 chan;
 		aligned_s64 timestamp;
-	} scan;
+	} scan = { };
 	int chan, ret, res;
 
-	memset(&scan, 0, sizeof(scan));
-
 	mutex_lock(&data->lock);
 	chan = find_first_bit(indio_dev->active_scan_mask,
 			      iio_get_masklength(indio_dev));

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
