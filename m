Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113AAD62A9
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB05EC36B24;
	Wed, 11 Jun 2025 22:42:41 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 897C6C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:40 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-40a4de175a3so219807b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681759; x=1750286559;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=;
 b=wDkLbH03jJHpgZtioGtU8tzQrSaznugvdqk6yoWpFMI+lc2aIvSZW8+0bjk2OTRH3F
 eGvrUkrO/Wecg9AbkirW0Rmlfi2dQ+ExUSczL3/DsMQpSbQhGihwRc6KDmPdtYdddFRz
 DZJsvzOd4EyOrnpnVxzBTXftddYIOP6ruB+YIf3e1GGPxJcR/eel9yFlWm8LCpxSLDRs
 wNOp70gsKBzd5IHkejJgbEsdfv8O5glppPTQ3H9alSADYdU27cHAZU+QeUPhwIcAIpCs
 wSSLWc6A3GodkUcxy2XXTpzWb2EvSH96FY0RTv7xA+dOAmSWQx1FV7oNVH3P1nhXjQ1j
 6vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681759; x=1750286559;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=;
 b=lSIDGXbhvc8fC0QBbVegDmhi1R8Pa34gjsl+6kIIZ+rttFk2NChii1dKd/2Fkn+czI
 m5Nh5Myplo9REEvM+CoddD+jLw6OJxtSu/wAREsCqvSHdZZJnDt0akVloBhxbICjz/pD
 7F5YdXz+ORhXOUf2WQAvf08nLgsG7rX4bJez2tgqpFY0Y0LfntegR9xhSiQWNiaztKFy
 iskjl+hOg6PEyWSmaASa6SQF2gc+TY0Fh8uNS4TyBBetmTll5wESz+ynT+vi/Rt2XQHi
 t2VXdIFJIx2zte/Jd7EQwSD4ydEelKc4RtISCReZJcgqQF1tNHEtJa/mW0RSAHPMqXrx
 pZug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr0BKK8wKBQNNv0GLK9yHCD9uHUcL6ftgU0nltzb0TBrpv3o8CLGXzeUootZrhNKgpLlTEe7gN1hasmA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYxFeiE+ozT+GwJS498fkwN9GV5rErFPZWacLmsyLU4eax8E7h
 rxZu/HTIZxVqOtzhh3CojUBWcoPF1dvrnmNZjwolCiy03yb/vIXahhDk4iWRPL2o3zU=
X-Gm-Gg: ASbGnctthJocXGXShduRH8fA7JOnP2tipSPVjYuF5ju+Qx9yMCU76U70SzibugsAQxT
 rmDIwaJB+6EI3JN8yXP/ZCaeycDwwczA0RXGzlePS4StttwR5i2xd/jZFVGwMG59mhHwO4FS8jq
 DuRHl65T5jsbvo/uTpJ7IFzYmibjjXem1FpX1ta4+d3+KdTk2BHhCzmxleIWZyycGDnZ5tgxJ7E
 MsOhEsHXUIxdCZDQNxy6You8k8vRMdT5j63O79g5FlRUGLehBzJoMWiIaUo5m0P/SVibPdr+puh
 fs6yepQ4DK9AyxvQmcNhtQakE45cvdWTYUQLX7/1jFkuYK6/Id0OK9wsv71yP7r0F3ScWiaPHQ2
 iYC4=
X-Google-Smtp-Source: AGHT+IErlYL4bsSFy9ngVg9McugAmwec16wRc+73AVkKa1/aJVelh+e5fLLya/tzgRaNA/PwviOmtQ==
X-Received: by 2002:a05:6808:2213:b0:406:6dd2:5eb9 with SMTP id
 5614622812f47-40a6609c56cmr824967b6e.26.1749681759456; 
 Wed, 11 Jun 2025 15:42:39 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:03 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-11-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=yBs3XS+1GgmnqB6Z/LBOG9076RbaTKgSQXFeV9Rx9Tg=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXMR0GMvFJcokv5VGg+Ekcm/aUw3x65eQXt5
 Qau3vKbyEKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFzAAKCRDCzCAB/wGP
 wEqYB/0aWaPu55zIJCA1+8Yh+2nKwvk/9shr5lt8X2HMjBVuKIJBARV1Ihwlk9gBU3FIMvsGMgJ
 W4gNnxW2ahFYBRU9X6NIB7qIDdnlu9FLgIBs+7HvG5ZrFCdOT1vleHncGAZvz81Lg/RtNlspo6w
 s1e4DQd9TKIrPHH4VDXiTl3tRfJ9p25SdmwrE3UDuHM6w2LPmkgKoeJBV8Q9r3QX0867CsQZJaL
 9H8G6DUTaF7neBW/gG1OOaACNgb6ckSo1vV7pvEjTzFp78nLZuf8MaSYHl/PCQHCKhEakB8WqjH
 9f3O2YBAUgw4FjBIASvaE7wTglESbk23by+IQjvgTwOJGF9M
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 11/28] iio: adc: ti-tsc2046: use = { } instead
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
 drivers/iio/adc/ti-tsc2046.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti-tsc2046.c b/drivers/iio/adc/ti-tsc2046.c
index c2d2aada6772aae6fc8d01c3878d6e869d413bc7..74471f08662e0291b097fcb277b8ad9cb6df200c 100644
--- a/drivers/iio/adc/ti-tsc2046.c
+++ b/drivers/iio/adc/ti-tsc2046.c
@@ -276,7 +276,7 @@ static int tsc2046_adc_read_one(struct tsc2046_adc_priv *priv, int ch_idx,
 	struct tsc2046_adc_ch_cfg *ch = &priv->ch_cfg[ch_idx];
 	unsigned int val, val_normalized = 0;
 	int ret, i, count_skip = 0, max_count;
-	struct spi_transfer xfer;
+	struct spi_transfer xfer = { };
 	struct spi_message msg;
 	u8 cmd;
 
@@ -314,7 +314,6 @@ static int tsc2046_adc_read_one(struct tsc2046_adc_priv *priv, int ch_idx,
 	/* automatically power down on last sample */
 	tx_buf[i].cmd = tsc2046_adc_get_cmd(priv, ch_idx, false);
 
-	memset(&xfer, 0, sizeof(xfer));
 	xfer.tx_buf = tx_buf;
 	xfer.rx_buf = rx_buf;
 	xfer.len = sizeof(*tx_buf) * max_count;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
