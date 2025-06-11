Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACCEAD62AE
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F185DC36B16;
	Wed, 11 Jun 2025 22:42:47 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BD67C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:46 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-404a5f4cdedso100856b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681765; x=1750286565;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l2UNg6SvTUsLvS4xPi0bVdlEHCiUbwbx1DnGSz9PULU=;
 b=o6a7kBDDKrY8EE9IvIcny0EKHjt66Gqt+ax2qg+CLr+c8H0kjUa3W9pHfzBfBc963k
 yx8o6Fq8OZfUkfi64ySIDPN765bkXyxIUyamabF0Kq7kmBS+b5JEVna3o0chUEFEj/dU
 k4+RriU+eV7oXCp18F1Nuu1UIoM3+t7rj4gampy+UR0zbht78bMYUf+9ZPoai+JIuae+
 DYRupf6TqTsKMkPqY9BZoRvQQlIb/uaGLfSOe9rGWnm8iALRZ4ZhdI+BSIBuLYsW9klB
 PuhL1UVVHrjjsyFK2Ra8oNXqWWeggH9RYmqloHVp9IoBekU1BVbR0tDq6Eit9giIcfJO
 73Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681765; x=1750286565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2UNg6SvTUsLvS4xPi0bVdlEHCiUbwbx1DnGSz9PULU=;
 b=YgvjOnX3QpTeaO8JcXixzOcGqQzqK/xEMFmuqOo19PrMB42Q+IWzmlr5o8Z0kiAXve
 w8eCn7BAXj7zRp4DGLRJ6lW2ENe678gvDD9CXwVb65WQuwKaUXjV0f9kWsp7D2ha4+zx
 nAdOL3TmH8oJF4miGYtaud1wYKutNNonvr+64/vrjII1/xr89MMKJicD9W2P3bLlPTJu
 8iMWh2k4t72RX6CNprP+UyhDwRD+UsPWq8LelnmcNbMcDF+S2FbWKrA5HAXSUsvA8Ekf
 fwjfDlEzeG04M8IVjoJ+7Nk4FhZF5F/EO8g1wsZXzBhfQZLhAiiXWLfYQRlaMPGd8SNn
 6kpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJdd8r9QbaHldE/Qa+kPuUzX994EQS0ifJXxwhGqV3DKktNOrAEPng8iS0kqvxwDCIhjcdTvUiq/aNIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSy3nTCBeidpYBb5DnnTeigipSVTXCbc2yTjxWJ0sYYWgdNu2M
 nPaTlfie9rwBiYhbLgpCx+1fSIdeFOkaCZwSsaxWwL6MxD1bPrkWcjOFhc3WCbJaMv8=
X-Gm-Gg: ASbGncsAWeFIjfKtQjknq0T4+XzOdRLptyqj16ujzIMDtzSsQWKVojSsc5xnJl52L5z
 ij2MTliGWsTI86midkbYRHhZlHgi15kJAkK70WRQLeooJ4YYB0FsKugRamhrymS/0rQbjdgeDmf
 Jazym7d6kq+X8bz5L+DTt1DupoPvufNb7eGzGKXAfCbZr9TkQFHFEA0CTbo6SkOUvErO+Dltj1v
 9DCk+9ptQ/fVKmo8rXkRz0kte60UAKPUHmVZ9x3o7d8fuLIpXCTFk7n4jdA+1fCPgdGJXnHNPbQ
 8oyBlZATycY5CLr7Zl5Psr4AkbqVwsPEbHEI4lynmv6N1H4Y52HMpX2JayG0lQ7PS8nT
X-Google-Smtp-Source: AGHT+IFtdjG7FJlzUxyoQdzNSopQXJAu7gY8CXP2Gzp1csbup6tf9jsf+umiF0SzQmKRhZKr02rKRw==
X-Received: by 2002:a05:6808:23c2:b0:407:a47e:6e43 with SMTP id
 5614622812f47-40a65f9214fmr957924b6e.1.1749681765005; 
 Wed, 11 Jun 2025 15:42:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:06 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-14-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=/BUF3sI3UgUZuWXo/TdJaTMxjYqN2OTvccYkHdo0CWU=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXgx0zbHn3Oo3OHG9JE4qdzOSIeNJ0xKf9sX
 wnfAW8aNIqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF4AAKCRDCzCAB/wGP
 wKEOB/4rZj/0DQjmcBcARn4a2juCsZtjNAGxZS6Gnnpvb9lBcZ/M7WLd2TJ1FU4tng8kNtGsdpl
 xxpYcw9zUa03RA+T15dk478hNrBOrf2769q/x+Z1ASRK6yXK3oE8+pjK5cy1Um2YQXRWQEm59/3
 /79KeHDmQDe11sPIhDQI+6E6v3n71Dc3Iy4yldkp7noMM0+e6hb79BqwrA5FGzOlOZWqtZlPc2T
 +cXsU8GS8cJdJPtJ2N+qcs/bXCjapsQgI4a2JVuet7WD3ZhgXF0vk5hcotnb2Rx0o1conJ7TdH3
 UiMPLiwJFamoQtn4+HaIKDh9EXnxtMphf1igA9vqBfUQt1tI
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 14/28] iio: chemical: sunrise_co2: use = { }
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
 drivers/iio/chemical/sunrise_co2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/chemical/sunrise_co2.c b/drivers/iio/chemical/sunrise_co2.c
index af79efde37e89170128ef9351bf1ad8b993d4a2d..158be9d798d26199cfb40ef0d294f967ba8a737f 100644
--- a/drivers/iio/chemical/sunrise_co2.c
+++ b/drivers/iio/chemical/sunrise_co2.c
@@ -51,13 +51,12 @@ static int sunrise_regmap_read(void *context, const void *reg_buf,
 {
 	struct i2c_client *client = context;
 	struct sunrise_dev *sunrise = i2c_get_clientdata(client);
-	union i2c_smbus_data data;
+	union i2c_smbus_data data = { };
 	int ret;
 
 	if (reg_size != 1 || !val_size)
 		return -EINVAL;
 
-	memset(&data, 0, sizeof(data));
 	data.block[0] = val_size;
 
 	/*
@@ -88,14 +87,13 @@ static int sunrise_regmap_write(void *context, const void *val_buf, size_t count
 {
 	struct i2c_client *client = context;
 	struct sunrise_dev *sunrise = i2c_get_clientdata(client);
-	union i2c_smbus_data data;
+	union i2c_smbus_data data = { };
 
 	/* Discard reg address from values count. */
 	if (!count)
 		return -EINVAL;
 	count--;
 
-	memset(&data, 0, sizeof(data));
 	data.block[0] = count;
 	memcpy(&data.block[1], (u8 *)val_buf + 1, count);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
