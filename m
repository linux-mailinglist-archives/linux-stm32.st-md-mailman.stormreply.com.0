Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A66AD62BA
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:43:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97EF0C36B16;
	Wed, 11 Jun 2025 22:43:04 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6C84C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:43:01 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-407aaace4daso173834b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681780; x=1750286580;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0/fyvlcVM1ITpV4doxg6wZond1KIaJ0G2TrYPww/yVY=;
 b=Q3HnU12PNlh0h8JcpVzZ9S3cYEBypEhS7WyIDYvdcW8zZmvXe7NQwH/42Df+io06i6
 LaD/A0sIuoMzBbZu1AZvqPXkXGdync+7daYIP3REYDYUMo60rn8IsUbF5ZaGDL7EvLRi
 zb5GQtFvHlibYQTQFp6RW6bb9uCC7wcaKoQe3V7lYGcLdwWliiK2Wg30DiYb+fgAZv6b
 aIVdtvyWwYCsmubwTBNH1I2Ray+qLsPd8rdCkyHo5c5rA0cvkeDx8DS3R9L3iTlgiaD8
 VsFQw+TsMZky/VfMyk02lSMRApr6f/d05vNfyFcMvz9/JgXPG2HoErJISlAHFne9dyWh
 iNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681780; x=1750286580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0/fyvlcVM1ITpV4doxg6wZond1KIaJ0G2TrYPww/yVY=;
 b=ITIYWnF8wDXlEAmOpGMuGrjITB1K2/pxiVPa29tsqbqrNoZIKW6y/F+Qa+R+9Wm6Wv
 IKM1cBWeHoVjG2hP/arSALIlX03Mj/xf3c7bULaNNmoMxQSwYpqUjbwDDiw00nQoi0sE
 k5KzFBIAsZPz4TfeDtXTVy+h5SsEs7lbU99Hs8u8j+XKi7Qy1BSTsTGevy0mfP2X8c3l
 pFcy96N4OK70EwyCZx9+wHCM9giVA2/ZztnhhvGsmxSLCYtcdHecwVBtIesRFkMQUtXJ
 DuRyfgJFgRS6XnzrRQ8t8prLmgWb+AwqgtS+9WSVV3/LJDOHpuNUJeRo1f3LsX6HRyJm
 OjLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEaF/MGpj1bc9Hu8SyRQU9WqC8r7puB7G8yMEt5Z5IyjF4Et2ievTuG7FgoDTai0VwQwzDlI4nIC85iw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUD18j+U2Gdd9K4lMs/fIQSeye2wYDkQ5dk+DE74IZE6d7tLr2
 IV4WfAnWbjy5UEGGs/iz8S+7LxGiYwKomLLFVdUPKoQqIlr1IMTewllFwRNw9uYdCTo=
X-Gm-Gg: ASbGncvIZr6eP+Pqd8die5m3n/u5vrm+pddWhpqs2ncPhCI3KPnrzj5b8I4pFzT1XOx
 6A+rMY3Q891rOf5GONgV6xUIpTNxfqku0YaIfGZ8TaLYl3IruWO6h0FlHREFNKqZjFiLe4yahKv
 JuOt8wKo6GWFy4KH5thPrHdt6YnJ3g8b7p2n3dCr09LRBWm2H3SWh6rfcrpaK6nv8gjxfq0PClC
 X3kH/O1E1zSSSNQbC0z7r8nZ4X2P/L49/VzSG57pqhKvSSP+eWypSwCuKEhJrKAnuQk6MRZ2XRu
 I4/s6gD9fA+G2IZqtS54Hwdb0eGp0a9hSYtdG6sc72Y+34HkfzvJ/1f7vWr7EmX45NTS
X-Google-Smtp-Source: AGHT+IG6Fb6ruVGlbHN4wGtZayIBTNPpt4aY0XQOYZxYfr6Numkaii3iELBWcumofDFYzCahxlkCgA==
X-Received: by 2002:a05:6808:199b:b0:404:f14a:1345 with SMTP id
 5614622812f47-40a66b0ca19mr438688b6e.20.1749681780657; 
 Wed, 11 Jun 2025 15:43:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:43:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:15 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-23-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=jR04YIdN9O2ZMn6ou5NomkQoDwMcMUyRaU/L4iFhuwQ=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYdm0BKld1aGwa/n8Ufra0S7lpef2bRmG8sm
 XrxLOEC2AGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGHQAKCRDCzCAB/wGP
 wHmNB/9z/ZKAzqrCy6jCj9Nu3CwEx8km3zZWktgGGSTTwtSfGw/x5LdCO3sFLygxQWItan+1Ich
 yO8fN+fnbDRpUq82KyKlfgXYeZ2fx7BLOWimk7amjtwwGL7GwFtoDG6M4WAYuoSlfZDY4Z559WI
 avlUzdpOOZ0uGVROXj1yJsI9B8t1XZCb7Vcuz9L61yMgAPtHcR5MOGVBvenewxkzOS4/+HGapl9
 U67xnC/8UibkMOEViHKdq5RBSx4DBeDzP4zUfHQD1dbiPQO+Rqo8SfdFfQMLRFMpM2NE1QQXecV
 eoiNvbO76iaTybSyC3JuboXfNbd7tzFGUfKYhLRg4vDgwf0R
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 23/28] iio: pressure: bmp280: use = { }
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
 drivers/iio/pressure/bmp280-core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index f37f20776c89173b0b2a8e28be0ef9aa30ceea53..74505c9ec1a08cf3ffdb55bf578d40ede3cc5d00 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -1234,12 +1234,9 @@ static irqreturn_t bme280_trigger_handler(int irq, void *p)
 		s32 comp_temp;
 		u32 comp_humidity;
 		aligned_s64 timestamp;
-	} buffer;
+	} buffer = { }; /* Don't leak uninitialized stack to userspace. */
 	int ret;
 
-	/* Don't leak uninitialized stack to userspace. */
-	memset(&buffer, 0, sizeof(buffer));
-
 	guard(mutex)(&data->lock);
 
 	/* Burst read data registers */

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
