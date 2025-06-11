Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CEAAD629E
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27F16C36B16;
	Wed, 11 Jun 2025 22:42:23 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED8CDC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:21 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-40a4de1753fso197441b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681741; x=1750286541;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=it4RuztzhdZ8XnjsMEgLrvbjv0hSp4aT2tXycz5bWd4=;
 b=oQ9riKgAErw1lGZujNPt/WdOxzTvxlmDV5Ygxyfcjbsv7482czXmCZYehzf/373C9O
 yBgGlPqEoBv90PAdpZCzHdt4eG9vYPolwd3+126AxMnb2HLCeOuQKDZ/xrU0LDKE47T9
 FFkhIn88ZhvOosbSetyRixgt4+gjIPaRC/SlRPVH/m9lFZL6VaQYDPvq9TwiuzPsSzMG
 jFxMaECv9p2PGgG/IKnPlmRb2uV82gnzpBkcz7MeMMFQIRlAwRkL91snh3/1yKVcY8jL
 +hPtXFz+DZhHLV8wguawKMzRC/sHT238U8TOS7sFa25Xeq/w189nD+lNjhJ2lWnzOsYF
 xnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681741; x=1750286541;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=it4RuztzhdZ8XnjsMEgLrvbjv0hSp4aT2tXycz5bWd4=;
 b=JGs3tE/tSvrzo4nvx8ir0qV9gSPg5cD4QhSv7FeiDKQ3vRsf6SYDUF0I75cbVV+6Ih
 Vx8ZGILp1DaNREVLmUSkNcnn0eji9y9dDMtFOWZ5czEgFirNCtXtTA1yzEzJHEY+VybU
 IF1zbLFTAqzyIcRoVvbcbNiZ8ISXwJhbyLRgBOciOgMY92NXQzF20NgK61fD2IJtSRXF
 yxAydIb8Gn9Ike7zLliYlTDQZeATHpttOQYiO640lrKKOt0NXX87hPQtExnBPmQYXOJ0
 zt33tPRZKbWmflUCyBJ37NMtx4bD9asP6ZMOGhtkCOfQd6OtQuvPO2wBQnDKTSDgMbTb
 raOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbmKpOXpQ5Z6V9akweeVuNn1pauIKkpK5rrJttkFWmFFTFVLJ8FLL/dvTOp1vRbZx1JrmxWhvbCeMOZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxuy79uY+RXCyZ+1aoCBqYHdKZ7AzgNGFDbja1oHj81BXHhLNjD
 HA0xxG+8LjJOkpO/3o4GFOPJr4bw9XbXnsvWm5tlCNyyr9+gugu8yLBp4kHGSS/ZZYXE5J29Otc
 w+iOL
X-Gm-Gg: ASbGncsHGhu/uUdmXHBNub/Pfny3VZTugSnSNY4vicEvRwUFWXateoknzWScaeWrYXF
 oY/QNNtyIH8ddft4tEmbGlc/Hl+6y4WtcalL/DVvAPyxE9frqj1CtO+uJ4h14oUeCFVtgGH/jLA
 jcWjoeNra6GQ84qpl0ofkE2cKblBA2J+AEDx/okzZGmILjeNiG07kBENlfQhxEZiHia/UtnIpcz
 nc+BW/zttvr/Gt0vOIVTk1WgraBoMVt6Cz0FbWRAtuRyB3TIdwXbyTKU0DwkjwpUKQvauTx9Bfc
 AJGeZEANI6Exer1P0MqC+LTlACWIRvxNonUs+5OOIyNSZv+sReL9avPIwnkOxhE2aE4q
X-Google-Smtp-Source: AGHT+IGNZz5p3ryOjEvuo2EytJHiwibtf40ayr30CzxMgaTKJOSM2lK2oXZ9zl2uyt/uz+jI4tTCtg==
X-Received: by 2002:a05:6808:4fe9:b0:3f8:18a3:b1cc with SMTP id
 5614622812f47-40a6603250bmr879166b6e.12.1749681740764; 
 Wed, 11 Jun 2025 15:42:20 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:19 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:55 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-3-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=GVMTt5HV+6sU3Z7U1BlFtbwhTBkXJGR3/GKRAQsHmF8=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWXt88+FiMtb/ry4nJTdUhGkqkIB1L+peIvw
 BF0bdO4H0GJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFlwAKCRDCzCAB/wGP
 wOiFCACM1Flijyrlz3Ef6dBSmJytrbKIx/vklETWdfDCxgwR2zDSTX9DMY/Av6gM1UoiYnRF3oF
 7aNaVMVunV9IUE2l696XaykH/jPIiR1wt6QjtWaDFVJgm8mdU7qE25z4A8m0SjqHGOePx0/mn4a
 VQidG4ET9kCPSiYMAX7fH+jc6NgevlNMrrYmCgPdpO4/Or9RGrSLyhebufoZoeKn/L+CoasNkBz
 Ss7ip82sa/hjy5YFdj15avGsrWFIqCVjLbKr5nP/k4kJFOUeDKQsJ37NFU85Z6iBC06G751GT3n
 MOCLdFgqv1rPFyxcOt4HLY50/hztFVr8zuzyZfjp6XcROfG5
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 03/28] iio: adc: dln2-adc: use = { } instead
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
 drivers/iio/adc/dln2-adc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index 9dbd2c87938c23d91fc93269763263fe73ed5206..5aea7644780f8b32ca6ed80b79afd07220d46a5c 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -467,7 +467,7 @@ static irqreturn_t dln2_adc_trigger_h(int irq, void *p)
 	struct {
 		__le16 values[DLN2_ADC_MAX_CHANNELS];
 		aligned_s64 timestamp_space;
-	} data;
+	} data = { };
 	struct dln2_adc_get_all_vals dev_data;
 	struct dln2_adc *dln2 = iio_priv(indio_dev);
 	const struct dln2_adc_demux_table *t;
@@ -479,8 +479,6 @@ static irqreturn_t dln2_adc_trigger_h(int irq, void *p)
 	if (ret < 0)
 		goto done;
 
-	memset(&data, 0, sizeof(data));
-
 	/* Demux operation */
 	for (i = 0; i < dln2->demux_count; ++i) {
 		t = &dln2->demux[i];

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
