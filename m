Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE41AD62B9
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:43:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7157DC36B24;
	Wed, 11 Jun 2025 22:43:02 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F054C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:43:00 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-406e31162c6so124142b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681779; x=1750286579;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9PHi9Zj9Ui/Tog0J9ameekJ7BZTN9ebJ9txjTOhyyok=;
 b=EIxFc6BdWVW/xlmf7LxJHUNoFY2h0X6V6Pha0splsKbg/7Jt1bB+sBDhimgUcVZ/9q
 FmACNeT59SQpIz4CSehCJQGECQa0AuHpJlX8SxgRYn3K+pjb0/rDxfYduLVu5NBnH13m
 uTgDqjXeVL/ISFmYgTLPhC/UeUKxHXkOjEj2lq69VFdDHywdaW4G/Ou1OgC8pSLUFlYX
 yb3hanC1VUKab7Mhyo6k6QUmThR4ZCcehtQlhEqRI4zmEcgB2IX7tmN3fQA/ZHsnXIkn
 UcsJAB1oJes/zRnRzrSzPR8U5DPPlO95N5mV70zbyBbIryUhywZdYxe/L6DFscKfLmE9
 Z/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681779; x=1750286579;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PHi9Zj9Ui/Tog0J9ameekJ7BZTN9ebJ9txjTOhyyok=;
 b=CwoQRTYeQO3FZMy14WO1M83r5VZEGN+1gdywtJYS705jB759E8soHqXggnEw5nqlwp
 tziPmLXlNm1+d9AHyOeyjISEFK5T7vCOyhBHPMzXLG6bnWw4m198YmZHh+HcXqpQwhRt
 jqXb8iDIFKNc4iynynVmM4qa+x/GTG6Gh3eXykrcCWBJ2DMeWqfcwA6qjYAZs3otj1/3
 kWq4WCMTb4rsIcFjLEZ4Hp4RL/58RUZq+9UPlLyzkgT0vSTOslWLoQu5MAS5n0HUweQJ
 LcEEG30sgPQbXZgGMgC+0c4WtUi01djzjeOf3qMgvdAo2RC/VOy3PPBtNrdoELS21ZlA
 VvSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTQMl+H4OhNPnlL+dlyxpucS7jo58hkwLJnjjjMZxTJpQFQK5OCNkbVDSSr4L8k+3qfKx05/GfP2DCEg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0C4KtJls2ABSCWfNLu+3djF8ebc8Qqjs6m1n4kSLS6HLn7yc7
 luYPAGpdPsaspjkS7sLQj42wdkGvppojLBgETOYlnDC7M6SQilP9sEIzYlVxtjsWF80=
X-Gm-Gg: ASbGncvDT5dwVnKhZojKOFKjKlxOy/auf+Bo7xj0HpLqIUeyKlFnKPFMbY9fyUh7aSH
 84lgOTeRRNdU067nSw3W1ELtpAcRM+W4XnkkvGSzx3MhX3e0dsjj+0Br2KbTO9hLufsxtskNQii
 hoPD7ahoEr/ylh2oWijbwRObM6SkA0Kn0wolg0W+qv7JLkvS2Ls9RMRCTWsfOQRzZFqzBqgYkuJ
 lF7dKpy88yZN26lUouPd5McEAn3NXZQrxlsm42wh1Zuo/1jkK1kF9e9LbDYBWAPXLXCORGeDDyX
 u+673AYprbtVxjJuqBXWvxglgm5saJ4as+9ZL8jneh1NwGOx8Xtk1+9gRAQm6+88Ud3R
X-Google-Smtp-Source: AGHT+IHKzyRz68sxYKViKX8XxVgxmO81ZgT2dv14jVru2VvIasYx7regY5fkOkngJzDhuEAN/YPCrQ==
X-Received: by 2002:a05:6808:23c3:b0:408:e68d:975a with SMTP id
 5614622812f47-40a5d16d77fmr3602477b6e.39.1749681779529; 
 Wed, 11 Jun 2025 15:42:59 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:59 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:14 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-22-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=844; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=xfo+bLocNZ+ozgq43j0BzWHfY2nDbmMn7PxtgVZEL70=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYWPB3M7jW6HKeyERo49D2SpKAeHri46eI38
 JoL31MTT0qJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGFgAKCRDCzCAB/wGP
 wPxgB/4grQvzDDyOnubC62RgBYgnw4jtW3rdAB2FG1+1ydj+0Kc43YVQztNQF+icooBBlvW5j6N
 FW4PY0Jeb0BTh9RBuXKyG7mMFgvtMx2dCggSrx6hB5UNgMYZODfVp8yw6VONYvXU+buhtXgt4D5
 qL/YfV2XT8KRBLCxk4K8o1NYevnW1tnYG/R126JosvMtbVgCNw/Dbk+m7jsH2CsB8vsr8KKQ478
 5DeyGyUBFsSiEiiP5NsqpdPDx4vcHq+LZBr9Fw0hANxaUoTgY5IhgMrcEJHSqPr5+gW9TzxR2uX
 6JcYo6fVBZyMpzSdbUsTuPWPLE/Fi7MLc5KlUVIbd9h5rmxW
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 22/28] iio: magnetometer: af8133j: use = { }
 instead of memset()
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
 drivers/iio/magnetometer/af8133j.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/magnetometer/af8133j.c b/drivers/iio/magnetometer/af8133j.c
index 192ba2da94e299d9a223a33bf15f9d6e6c29f6c7..b1768c3aa8f33c6e95e770a27f55cb357e6ac6f4 100644
--- a/drivers/iio/magnetometer/af8133j.c
+++ b/drivers/iio/magnetometer/af8133j.c
@@ -361,11 +361,9 @@ static irqreturn_t af8133j_trigger_handler(int irq, void *p)
 	struct {
 		__le16 values[3];
 		aligned_s64 timestamp;
-	} sample;
+	} sample = { };
 	int ret;
 
-	memset(&sample, 0, sizeof(sample));
-
 	ret = af8133j_read_measurement(data, sample.values);
 	if (ret)
 		goto out_done;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
