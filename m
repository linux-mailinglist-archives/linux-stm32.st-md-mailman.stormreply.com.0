Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF44AD629D
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B36FC36B16;
	Wed, 11 Jun 2025 22:42:21 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCF58C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:19 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-401c43671ecso185321b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681738; x=1750286538;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2KWzRpEXlRaOQy2XtO3D8TKl0onTqF9JeInDK4cRjLg=;
 b=keRJpPWtoX5AKo63BpkJ0b7Xs+BoIPti1S0I+19DdUvUqvhT8s/kJr8gdztnXXp2l1
 aBS0uo/YWOyCrpyq119Z0NBkPgFg5caW14VRKm5XtEUbMfMFS2cBSDe6EIXUOo0GRvCo
 FqAQK4R158lw4kUiRdD5pxno36mP9Op4V+n2yBu9t4SJRWq5GgygCdL6hjUq08YbVuKz
 cwVVUtlFaQbw6DMwmE64uiShY9rEERFCSt8GsHKT301tceT/QuvQD/jvf0ziIfZYI4ow
 V4iWysgiWwj3hPrOicBYABdlDnCHhkrM8GYCQ1bWDJVNJVQM7T3j0iSvgrB6A7djCucV
 1mbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681738; x=1750286538;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2KWzRpEXlRaOQy2XtO3D8TKl0onTqF9JeInDK4cRjLg=;
 b=Mv9Wbf5VF7sZNLzw87Floy+TOSNj0FJu5wsB2m306FNpWu3D0lbA3Ka8d4ZD4Gj0Bh
 xhOIJ4aFUqc/DMUWVB0teQFv4b7bvO/3sK+kZG6gGMntDlziOzz5fw/eia7o09G0hRe8
 XavjS/xqj/zg2OkbYjVs/J3kAsQp8WTZxPt3gL9pQgqPAqugM4xt4d5+X1dzGgnOncM+
 q+pLbcXNJBhOz2HCxPvFF1hLxSi0NPaUo9GB5/uIlrILi39qUNGC3YWCdSoXsJyByCih
 SrpebynrkL7LLCxIBd4Llz5YxiY4m6+2vYwcwyyN141JvPCtvRDhh7rVP5juCqw0pf/L
 UYhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgkQXqGuNr8psaJhZreffrwbKJOU/VXy7TlgUzq1N8P9u4nrbCuBqDgUhTXvjYP1ar86F/TdFWPfYWHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yydo57BqUqWDRQ2ITLsxTZIBSSYJhY0CCfYLssYbnmJ/MjXEN2j
 eeJ7FYCnbiEYnzK97GAp006LAtpLN1i0b2RHrfYcVExDyOiug3KRiBsDrCc0mHpjNnYFLI3vyzy
 k1b/f
X-Gm-Gg: ASbGncsl4smlWwkiw6RC08RjJQrbfxZOg/r5W6AkTDBKhtdv8GMnwAlxy2dfZ2C+9hF
 TRev3xjUxBV8mgWryyWu6oE9Aej1UwPhvz1fnu/7z+/TjraSCNmaaxikFwrJsS2JqNmt5RIg6xJ
 RKIBmQejGHqyUPwlUD2yKcpTcoZTkTmfjJlx3Cnox5Kpy+E/0I/uotb3u/yRFk5CT7iZRY0++iP
 QSOWyP8CiIIBfVgzRhPHfRbcJCN1MQKjDOTzxBKBjYXEas9K2RbI3n0IPuW3KX0uMj83Jcsn3kv
 9wEkR/2U5foCFj5PhkS491XaMi8IaJfFJNxb72UqoAOqxrYYSSGO5T4oa663/KFpWm2n
X-Google-Smtp-Source: AGHT+IGUaZZsecRpS6ezZKLm+idnU2IVxpLfqAg4YSBuYkt3FpO3sNHyKbW5ao3Kw3MTkHa7seuNaQ==
X-Received: by 2002:a05:6808:23d2:b0:403:304:6b06 with SMTP id
 5614622812f47-40a66015927mr932627b6e.10.1749681738571; 
 Wed, 11 Jun 2025 15:42:18 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:18 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:54 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-2-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=731; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=odIkwKy7IqDnChDxGqAGKTlpXL7zVUclleEfAo7/6gA=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWQWkEr5QWjTPvfNMocah7h8+meXXS5pWdsy
 5sDAkLdoOOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFkAAKCRDCzCAB/wGP
 wOi+B/sEIoa3eIWCvSKlVpRK8xGkIEyYTFb6Nq8IlqoeBNY05GGcL2a5hP1Gn/kmb+2MO6PapeI
 dB2wl0+dESiOgkcl+SenqcxbQRRAhbRbVRd1/Cqac8psYYmmgKDSdLHesmbAPsWPhWccCox/lvU
 N0jdZERcu8kxa9AJs3z5gfb7AoKrRAZR/Q31HaF9jMQZk9xrzgW6H7/w05EWYudtxJPdpOaPv9W
 5N4ONT005xNjYaL/6LuZKHCE9D7n0gCZPQTTr2LcZXOKPofYkVVrg6LAuac/UpQH45sM5Bykm/R
 cW7aI66fWEN0bBxgJ8Jh9VbYLcpVDvd8K/aZLgpoffJ0rwGm
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 02/28] iio: accel: msa311: use = { } instead
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
 drivers/iio/accel/msa311.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
index c31c53abc3d09f29d01efb7cfd31955cd88b9409..3e10225410e89a341411a75e544a890f45c8f55e 100644
--- a/drivers/iio/accel/msa311.c
+++ b/drivers/iio/accel/msa311.c
@@ -897,9 +897,7 @@ static irqreturn_t msa311_buffer_thread(int irq, void *p)
 	struct {
 		__le16 channels[MSA311_SI_Z + 1];
 		aligned_s64 ts;
-	} buf;
-
-	memset(&buf, 0, sizeof(buf));
+	} buf = { };
 
 	mutex_lock(&msa311->lock);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
