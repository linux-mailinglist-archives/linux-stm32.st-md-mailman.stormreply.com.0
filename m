Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F0AD62B0
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CA96C36B24;
	Wed, 11 Jun 2025 22:42:49 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59D12C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:47 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7304efb4b3bso237721a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681766; x=1750286566;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LiF2DulFgRfRNMjiDxreAgm5rKmLlr34bZCxk6U0CK4=;
 b=kGBgEO2sWtu9KdKtn3FAxmZQxVb7BBM5PmdOXEFFscb1zu7x4eZvLZo9H1QsqHyjsU
 55ZH/XjvqjuhKDjnkAd2+hIHqKA+MINR3T+gmOOGsLeUVea+KjDFQh64XpSA3QIt0F/e
 9Av6GbtrY557Hl2EbFHRz+041Cn+/9LLu5c2240CboSiGtcMiVBl8M+lZfy3bLriCToK
 Qtd5hgdlbwYvtrUOrBQfc4/z+VKtHTk8sOkZ2jCbtSs945W8BSV+mjvp5Pd8V8+GrTL3
 nTiTmyosr/4uIpDFjtWsd2VYcKgLbuvJrj1GjhLelXcHzk/9LDE+tktJGt3FHLJjVgRV
 9TbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681766; x=1750286566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LiF2DulFgRfRNMjiDxreAgm5rKmLlr34bZCxk6U0CK4=;
 b=bBR13ilXlxGUB81ETxgk5ThtablkYnNZLyujeac9HfxAJCXAjzmVMh2Zd7VbpNlQ7G
 zqzr82/Lh9E2ZOwuZA7Xx1uOkNyH5q8tX+8PmosHFrxycz1/V3LbuV2RkRdlPN2p44Bj
 oZfedDvSa+xb0YtlvL3Q2tnBbR/XyxSGZohfw5Z7OMpkiD6wgj4fjEZitAqcU0zjbsav
 V3JQ6VVC+hqM9Iz+zGYhn5ej/dxpsAsTfi2xWfAPJY9VQpqpl+NnQ0jyJjHgBM5GnrPE
 a05mrfNCD2keF5CL0mRAY1nLPud9d+Vut1negspM5D7D1Y2GzH67TP3u2tgMThls4Aqz
 EvRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4ESihAOGSXz69kYldtRvuW/9UkJroRio9NQ+7p5KUz2ezydzOeUR9S57iRqmzDzpPhg8Qu8kigIyIoQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwhObLI4S+cQA4EjY976H0Z3eVEtfdVjSiJ6Lgjs0QmbCTmAoj+
 INpUS4MeCcKHBcHc2XkFOf8GmZR7LPiDwZlucbWRTNLKD8+7/sZwIuakV5YmCbWgfyI=
X-Gm-Gg: ASbGncvhxZWSL4UGaedoUypokOJbx0R4S5zMhSlQnze6owfeOYO4rsSexYUbyVK7NnK
 QanDRCywoViqC+ylM2iMdL9VPvk/n0Q7mhsnOWi/xszB3u9lVp6amGuNjChEyM2HmOqYyUG+K1C
 MdDcYCl1RJ4NRFZ/lP1hk5hPhLIYe5U0ZLdK3XRYut91LuGAL2ROCqHRAi8XdzwocwFOZAe5bkd
 M9WZNYtp83/8U1X08WGT+zuVzns2HYyMApGL1ehxBd3nwYSZWxLCg0VWfJ/H8BTOreuGFtnx42n
 U55XcKp52S0tM3Hmm3vpZmBSKox77PWnTpSI+lUGGJuxiv+RxvRquc/JXURdcCfcnLhcIIoY/3a
 Rj+Y=
X-Google-Smtp-Source: AGHT+IGZSFpZmGlN0w2Un5vLT2W24kqk9q0DeivfstNV8sNtHQdO7UhGZijU6igQSf2A4dpARH8gnw==
X-Received: by 2002:a05:6808:3086:b0:403:3814:b2b1 with SMTP id
 5614622812f47-40a5d081c0emr3858130b6e.10.1749681766169; 
 Wed, 11 Jun 2025 15:42:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:07 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-15-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=UJXbN0f/Sc264QMDW6dBftvYOYfvz10QBoW4bFVFUX4=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXmmJnXqBUX52BnBQ8vdrjyxdthhoLPWdbRL
 R+WVVgUfXeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF5gAKCRDCzCAB/wGP
 wAHpB/9uvsuwsxPRCNHjRwNuY0qyeu9AO2EJoyNvSVzZWpvJJXh6el4lDtmSOYf7BNiSzxoL7GH
 ZA9fAXagxB/cnJd0lWxqHu6IllSBT9tS7KDugmBh+2loJ450FcplnrPuRlzFJx5QRs7XWieNUFB
 MXxCk/XXt6zIf+oAV23jZWywwUtyAzZ6IAh9PIHNdcMrm/xyZ/gKGv3UMTkLdL5rp5SJBwxh4cc
 00NEmMDVhDI8758T0v6AVJa5hRW1epfYSYXca9HF6od0VNpE0B2edgAefLgFuwdtJeZH/7Ms8qJ
 Qcdf79QFtQZEJjej/ETfZd9QxjJxo8qX5fR8v+r3taHVCkrk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 15/28] iio: dac: ad3552r: use = { } instead of
	memset()
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
 drivers/iio/dac/ad3552r.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/dac/ad3552r.c b/drivers/iio/dac/ad3552r.c
index a44b163f318315cec179aa2ac9d66883a327ebb9..93c33bc3e1be438c2e10c1ca990d8046ba87c9d0 100644
--- a/drivers/iio/dac/ad3552r.c
+++ b/drivers/iio/dac/ad3552r.c
@@ -293,10 +293,9 @@ static irqreturn_t ad3552r_trigger_handler(int irq, void *p)
 	struct iio_buffer *buf = indio_dev->buffer;
 	struct ad3552r_desc *dac = iio_priv(indio_dev);
 	/* Maximum size of a scan */
-	u8 buff[AD3552R_MAX_CH * AD3552R_MAX_REG_SIZE];
+	u8 buff[AD3552R_MAX_CH * AD3552R_MAX_REG_SIZE] = { };
 	int err;
 
-	memset(buff, 0, sizeof(buff));
 	err = iio_pop_from_buffer(buf, buff);
 	if (err)
 		goto end;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
