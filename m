Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77887AD62B5
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3895DC36B16;
	Wed, 11 Jun 2025 22:42:56 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 111D5C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:54 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-404e580bf09so95174b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681773; x=1750286573;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JmCWs2rPIbc+6BQsfR6o7xw9HuF4FDfGQAsK57gqrg8=;
 b=uccw+1yRHsKC8V2JbyzZouiapkFRpbW6iAIO4okOMZqOP6FFn7tUMZQsrPjYEo/N8F
 /onpWW0yWqM/zyYjibM2vPaBhw1BdMOWop5Xg7usA/LfxrIiAN+IU/uzNuf1DiKTCFpf
 ud0vdQO4+lVi5gMko9HKVfvDrEIs1/KMpbeJExOmeZq2nX0u0NV9uDL4C96nbJ5bbluC
 gbfyN2slIZKq6sTer/GyK0kZdTveNSQpDjIVUgRnfTxIn0InCAXIF2JJ0x/+Un8ak9nS
 +JVyB2iKOcC8MHOfPY6vHd2Uf2h38XoqHUG8A7aWaW9u6wh/Yln7REEaM2fPuvmoX+HZ
 pAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681773; x=1750286573;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JmCWs2rPIbc+6BQsfR6o7xw9HuF4FDfGQAsK57gqrg8=;
 b=WAUK/gh9mTZT1mG0tcI59qUfpP8bvwHTvnv4Rw6Sr1oXG4B33LQOwhmbt3++B4d3fE
 Q23KgqVVkUo8V3vfHMPv067b0Yl5WipfN/xRJOKbYc64/414li+VA1EItAigwRCL3FeQ
 3BXKF/e7A0aO67O19UW2u7Rw0KREWNYlzb4edRPXu1UQNL0ahC9lEIBU98d1jBRujqTR
 JgMCkloliVNT5ArB7WXayniEoGkbjBaGMpXPcpoA6SAUOfWLRQx2Q9+XW/H7wrdliKTP
 sCWfFNJlKX4/56w5U21AEJJQcXXcmQoyf+Z6abA+wKILZnRsb8chgD+49WckgJ24cltE
 QBhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7aqeb3IA13wwHQDzIkqN07gx6vm7XIAi5hzROVKQAg/n855r5yP/ECPh2wejR8OiPqvi1qZ7fHP9Etg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwU+HuQybMP3tCvJw++I7e3H6o3dz+j0su/k+9vbGJVVJHysd1S
 ddgPvtn894N+KtXb5QIGO3LR3BA7Emg7L469lKHFfd+JU6OPk4+31E+RF5VsUM+YHLg=
X-Gm-Gg: ASbGncud24DmTg70bdfv2LHNOpfUv/4xsZqnjJaCDFffG7TxYNLfQacr9gmuhv4HB1N
 qkJDcDmaaL8X+D+/080P2ukqBEofq1WjtZP/VaaIvZhFsWQ0BylDu9CSKv98Oe5Ya8wIHSTdt6v
 XGtyrviCjsYMwhyo4VukBzmAjb2NwExADJTmbjw0hdVPwDigVtDrmjR/6ATDSgxkZ1tu8LrQ2u5
 1160hjg1YsXLWWygAqQIdRBZ5gN0uPMuiMsCdeYFPcDUQQxi7exyO6Opkwwzann2d/SobYpu8IP
 zWBYufp1wkPzbbmgqguub0tSQXrosNc6CFW45kSFinxm8dHfkcHgIDjGnNMtRI4vb5SO
X-Google-Smtp-Source: AGHT+IHa8L4p8ghK5RcETbtRoE4Tgd0/CyY2JEUEIAGMkjSxYcjGiB/P1+veFGOZJrjbwtHUeltfLg==
X-Received: by 2002:a05:6808:2012:b0:402:b0f:4ccc with SMTP id
 5614622812f47-40a65fefd04mr787770b6e.16.1749681772858; 
 Wed, 11 Jun 2025 15:42:52 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:52 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:10 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-18-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=886; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=1a1blIlRZxXXjSZuCkjoNDJp58C2THl7ge1s5EwPmWg=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgX65p3M31ivm9edVoF5bPU2YQFaJOkLpO/9G
 NBCVXlam2GJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF+gAKCRDCzCAB/wGP
 wKzJB/907gw1xbojUL7cRNV/Dvgd0LFSxeZkF4YblcJ1Yz+0c2MtUIyS92I6I5pOn/tKJvqNWm3
 OJOzaJPV5qKYrztW7M9TNbQF8w9s9S/NwhajVc2tfvREV9bUA9SsTt65nWfJsDEEMb5Tq5278q2
 viPYYE2utKUiiA9yuxNfadtti+HV121T5zIS21mLLJ7f4ljjG9JLUI5k982MU+LRZnDJv3R6wlu
 X0mnXF+c+v+zAcup7pDNFWHXfGocmoqTfVT0p82kir3SPpz+xWHvyBSjJQUCFWQzPq8AVKiHYjn
 TyEpUDtbkf/uLkdvNbw7yzOY0jwiJn6iUuvFkTVih0RpJrWB
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 18/28] iio: light: bh1745: use = { } instead
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
 drivers/iio/light/bh1745.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
index 56ab5fe90ff9128035cf25948bba1589492e66e4..4e9bd8f831f7834dbcdbc5df4931f473d277d814 100644
--- a/drivers/iio/light/bh1745.c
+++ b/drivers/iio/light/bh1745.c
@@ -740,14 +740,12 @@ static irqreturn_t bh1745_trigger_handler(int interrupt, void *p)
 	struct {
 		u16 chans[4];
 		aligned_s64 timestamp;
-	} scan;
+	} scan = { };
 	u16 value;
 	int ret;
 	int i;
 	int j = 0;
 
-	memset(&scan, 0, sizeof(scan));
-
 	iio_for_each_active_channel(indio_dev, i) {
 		ret = regmap_bulk_read(data->regmap, BH1745_RED_LSB + 2 * i,
 				       &value, 2);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
