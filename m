Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B590CAD629C
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF64AC36B27;
	Wed, 11 Jun 2025 22:42:18 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81349C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:17 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-40a4bf1ebb7so195027b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681736; x=1750286536;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zveqOADtHS31WFyPmzToD+nPl3JZ4+wju2m9sYArtpc=;
 b=C3uaQJGNMBuNOGMS0KBQVpJWxsQPtFxMHhDcjfuzxJ+CTTLNMoJuFZHOTrJ22+70aC
 UJ01pFn9+ON629M3jwYshQgxeWl1bTCZI+HBUxYZPZEmnjCz7n4GNcA1fHp8Z3t7enx4
 gVLCyPzH54NmOFlj0k8Bp/fk+Hozx7tFq1hWvA/21DwISSW06f8gypOQos3gqqYmao0C
 43sT09EqoTrQbgNVzfPVtGfL+0ZvD5BUQaEiw0Bpo6wXoefQrnqQ0lKamGl3JpXgcnaG
 WzCyGOE83uOpNaiMjH5nLPIG2kbwbN5sqxrqCm12lgaXYq8NUr0fCV+ghA9qdxSs1PvJ
 lz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681736; x=1750286536;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zveqOADtHS31WFyPmzToD+nPl3JZ4+wju2m9sYArtpc=;
 b=Kj95FgHqHPphxvuqvVT9DRDUTVVpRLGf68szaOlTKImBNSq3Xmy5qx+vnh32LLCYP1
 4rxH97pvU6E+gng1LLhL8Cr3/IgigLQ3AeDemH2FHQSjQX4H3yWm2VdjvunsVwDQyctL
 YtJjwW3kGHc8GB7wC/Kg4zJ4w6ZlpkPYIE9uGU9Idncrmzyk++9wEeqdrSLlhl/7Hkoz
 77aGWhdUn42Gkj8NlH3rgtnXakIqStQhAo9RWa4I7EBOkTNdI+9a/jyulCeLBcRoa+u3
 Be4FaZyoP5RkM/L0rQUI0Qf260HptvNxkKX+9XClQ6o2V0HO1mrdxINUel3VWkLNPa5d
 HZKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIC5obcZzw8vfr0Te/qefuht62Wp5F3GrP71hX9BVsAnX7IksIb0faXpY/fAjV7pXxNSfaJGfMHSimaw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxZzjM+aMPlzWrNl7zeJG3uYFPvQaVCkQ0z+cil9G/Utrx9DD6E
 B+c+9eHdvakJoZyivQoflX4NdBpX0jrojbBuppQnoGE8jcF7PgGOes/tsFJJFfh0BzE=
X-Gm-Gg: ASbGncvj7sD3m/ABOB9YPncV774yVCUpcSsAHvB/e36+uPInsV/sUygtJugdwPok7LY
 p7FHxX2QXX26fvAMABfe0llF0CPt6G2vSJODL2P2mLgw4yW44YZy3EiAMcRPiZAPL/OeyN4gfSv
 FsHQ2FrbN4uyndpnA/CcSqL9cTnPbYFEKaUQ9oZZC2kpR8apfo0jhlOD7Z/wiNn+zwTDTu+kp4O
 faTNTZjCXdlzjtC2A1FWeG6C65VTqExtZVhWBz8ui3z7VXjJkCsm9AyMwzOiP0LZj3jdRZBMArS
 FGrp4EH+Lkt0ZB1pRX4+6UcD2i+2mG5Tfh2qJYS/RF/P2F0YH7vsp7PQ9xxfEeRi7F1Q
X-Google-Smtp-Source: AGHT+IGIpzPnDrmzBmfsC4tKKskTV7D3wfzLsNC4g3WTLnbA1Yephi0RklISAXQUfRO/ncM9aBfPJg==
X-Received: by 2002:a05:6808:6a93:b0:403:3fb7:3870 with SMTP id
 5614622812f47-40a66a5b32emr592491b6e.10.1749681736398; 
 Wed, 11 Jun 2025 15:42:16 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:53 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-1-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=OtTTIp23r83l4FPUg27mf0gCVgpkwXuq0SNiBdQqXRI=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWKKhpCfFTksDG9gr+9eawR0jxJfSx6dAJNM
 0SZmsoqdzqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFigAKCRDCzCAB/wGP
 wCJwB/4gUJ8t7UOdIfHCp1gF5oikHABa4eS0J2FUBt6zWTkee4P4bV5tDwfS1kcYHllaJBX/CtO
 7HxkjtZxmdIfL2tBgPZCBP8S01Mg+OXaLOQaEx17gLl45c23P1lCfWSYP+PhWq/8KoX2NIR7n4F
 9oees3ltMwkbduWFqU3iEDQB0oXjzl94CRk6aPeSRv1xieFkbXgD4FSutJmNiyViLOv2q4OqnYa
 4gaqd53Li0HDnpieOacuZPGeu3GoPzOXOtMsI7N1pk1zfWsrHFkxI3Yw04/HUQokzunQaFQaFF+
 HR9AsvwTdenSczLxmQcrifmcH2iDoIhYwK3xodh8KKtXzNMd
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 01/28] iio: accel: adxl372: use = { } instead
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
 drivers/iio/accel/adxl372.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/accel/adxl372.c b/drivers/iio/accel/adxl372.c
index 961145b502934674e7655573b12121fffb2328db..46d518a2a029179bdd2cc2b9e98f09b6b9854fba 100644
--- a/drivers/iio/accel/adxl372.c
+++ b/drivers/iio/accel/adxl372.c
@@ -600,10 +600,9 @@ static int adxl372_get_status(struct adxl372_state *st,
 
 static void adxl372_arrange_axis_data(struct adxl372_state *st, __be16 *sample)
 {
-	__be16	axis_sample[3];
+	__be16 axis_sample[3] = { };
 	int i = 0;
 
-	memset(axis_sample, 0, 3 * sizeof(__be16));
 	if (ADXL372_X_AXIS_EN(st->fifo_axis_mask))
 		axis_sample[i++] = sample[0];
 	if (ADXL372_Y_AXIS_EN(st->fifo_axis_mask))

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
