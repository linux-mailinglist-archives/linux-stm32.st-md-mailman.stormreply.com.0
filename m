Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E00AD62A2
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E200C36B16;
	Wed, 11 Jun 2025 22:42:28 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65EB2C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:27 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-40a4bf1eb0dso173267b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681746; x=1750286546;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3nA/Lk9tPGfFaI22ceEDpAoxrxXFiJ/9IsqCSjqV/LI=;
 b=l7WPUXhBkV6AFfOreWiK7azLrkFoPS0srCAPIsMArx8CEb7Def1qx9WwBZQMZs4u6T
 Q9+69LgASK3VhAJuc6ezJ0GbNfd3TM0mO/NMcaGxx7msNeoIz+oWblGRuAlTwMcXV4jF
 QzZwK1fzAn1jYJqh6j/ECsvCyVB/aS4Pfx/IWJYqZTnvmE90Tf2GijQS4D3DF0HXYywi
 N7Xc36stvItTmNRAcfzHk6Rmo+wkamKhHW3/E3KUKVPltgfvOUEcXGae55BgRJE7yF41
 kvjAXTLA79WIfc315S2R4+MtAVqt6lzl9OZp4P3eqaleWru8w7O9xsxw4kK/zsePcPIY
 LsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681746; x=1750286546;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3nA/Lk9tPGfFaI22ceEDpAoxrxXFiJ/9IsqCSjqV/LI=;
 b=ncoPveAW4LaxD/XauzulwukeaT61WY1JJLNymtdWB7feZtiGYOYlY62WMz9TUgyRfu
 lNOn++M85CQEGfCjQGdXCBmv+toLxiDmEYl4a/uxsN7nAFnzS0sDScUAKHL5wFyKXR4V
 CljVUJrpM235NgkzJ6Oe83+doxZsS1PAnmudTm4vpMQmH+FJGXPg8C9SwUHKKzFMlZUV
 ddHsXkGhlCHwiqwLjDU7b6oEgBER2I9JpeOM+mdS24LK+2/mbUbUxYn/GjTP3s8SejRw
 B7I8YIgXQCTDHOxY6Ny4/cNiBKbv+2JEJfmMli7xEOxKiIdClvory0UjRQZeH4ii58iH
 ry0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIhcE6RWG8eW3wMq93uqfQzJ7O5cHiKbVqXol4WPRI80OUgOgiMXQ/x1cybUxK5/HCA4f4rrW+7clx6w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yycp70lyPYimO1ay1ZHCRgemM/TMjR4s8f2okYZs0R+KYGaRaSM
 xBmcCjOI3L2cxm1oDnkFHv3NWNMIZAuy+ZtkLMY8JR8FBJYxV4Edy9uDthFphBKbQ7M=
X-Gm-Gg: ASbGnctjeCQ9rFrSu6GEzX5IUS5MKFZoy2cVUe6+GWBwAVVukaP+/qWWpzaXUQnaSev
 yYvryyLu8cCeJaT52Wspxz2zsT5oVPMH56Nbu6l6HvDENvR36w95ZKqjH6hHxtdiVigv/awsaC4
 czKQIRRkO9MUHmu5tfXwz6MPFJ1i74Ouwb9NDdxTErlhXYSNGOPcfGhYr0GjCzS/Yns4vEZVxTD
 G3BEZ90lfx3/ZeTRbF+s9zBP3NqVeTUOOZe3sJBlelb10AttFuhZsieSuy49F5VnsqBuW5nDQfV
 qTO3nuo5q9iTkgbExcnhh+p8iLTrAHpClOwaro4DxOiRJSjBNBrm14up31Ohyc9jgFfy
X-Google-Smtp-Source: AGHT+IG0W8cN0RBqzvza6bDhDRqg08z0+EUeK0uOjK7EVtYqqJLeVsRO4zcpkxGJblg1Kp+3B4rIBQ==
X-Received: by 2002:a05:6808:2186:b0:403:3c95:3684 with SMTP id
 5614622812f47-40a66a419c9mr505006b6e.1.1749681746196; 
 Wed, 11 Jun 2025 15:42:26 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:25 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:57 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-5-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=859; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=5Dt8chRh9Q9zFfR+o0HlVC5RLtjfsBgIEofeyEgWWKs=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWkPxj+ITtdzYFOhYRqZrV7rzI2N1a8bxnjv
 BHEMh8oTqiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFpAAKCRDCzCAB/wGP
 wPI1B/9lozodgbkP5rQVG6ALBHKR3d7hz5SMy/uywa3QBiiLmgj5QX1cAyGMFHI7hO3uO3aQSl/
 mDQT4eItTwkjzu/N/k2p6HIl0UyXa2lwFwPguAh6Fco94W+bqLyMiXXgd04TmGW4jedL9LbPCgY
 07pa9FRxuw8J6Kg4xZzUitsXeewyNtdFUuzGLvmvEY9oqh7A/1iuMLVZyNULwWAqpBbAvI4BDWY
 mrWqXne1TqcmnTZJBaLxnti67Z2+Kmlj8oL+TyU8uXKtKa9kYw2cN9r+8cjaEZt5I4qaauKXSq4
 I+XFZqyqUd67pwca8QgxuwJVoQn6LMRTdn54nn8A0dcTI+q1
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 05/28] iio: adc: rockchip_saradc: use = { }
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
 drivers/iio/adc/rockchip_saradc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 325e3747a1345c84cddcfe9a455da6ccf655447b..bd62daea0a3e5b879a8a970d107e3342fda7b8c0 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -404,12 +404,10 @@ static irqreturn_t rockchip_saradc_trigger_handler(int irq, void *p)
 	struct {
 		u16 values[SARADC_MAX_CHANNELS];
 		aligned_s64 timestamp;
-	} data;
+	} data = { };
 	int ret;
 	int i, j = 0;
 
-	memset(&data, 0, sizeof(data));
-
 	mutex_lock(&info->lock);
 
 	iio_for_each_active_channel(i_dev, i) {

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
