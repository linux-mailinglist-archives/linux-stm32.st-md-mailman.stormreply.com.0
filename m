Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19BAD62BB
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:43:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6C16C36B27;
	Wed, 11 Jun 2025 22:43:05 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C6F8C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:43:04 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-4067b7d7e52so92996b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681783; x=1750286583;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XlnZuUqEMiDPyoPu1uidt8DikGLHmN/8IAgm5AlJwiI=;
 b=ehT6HeKHtJfHzNh1T7lF81q9DYtDCqfF4sx310P+V0Db6nkBmf99RHeKokYQQHoiV3
 GBhX3z2abArKSze4F4cEZFBdY+16g1YJNaK4kDJKn8uGAa50QoNgJFoDF7KcCkmakh2C
 76PWwTlWwY18IdlY9wzFE9dENnsVje2AyBETF0+oMnDvobO+APvsNapqPu5diL8mMQ4O
 JocDUVaqAv9AN/wF1KdHUiO/JBCpQ13Bxg1Bdy3OsDV7s2DZnF91chtEjGOWRRVGahgz
 cJNRHVjfVyFlPDnwFedLwf6tsIinUJ0VazHLX+xuI0uQx+TV4gHzdLrRej7Yj1fXydHQ
 kXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681783; x=1750286583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XlnZuUqEMiDPyoPu1uidt8DikGLHmN/8IAgm5AlJwiI=;
 b=AS8dLx/uHMcNcIDXZko/deebPcezhKQ57AwKLPitt2wxWHSlN8wLd/9I1lo8jbETtl
 S7maOqj2oU+pfNbBbLXrhYZ7WKRN0SO4PaI0E3lLEH+C7WGUrmFwJ/EZ8sraVuAvCHD3
 plvgWnhuKlftYD3S/C07h8NcqFVazuEh23sBjeuyN9fxcU1QU5VJKHStpsk3x/pUX8Sh
 3DvPNWPK6rDhCulbT7YoQKM7+9PIeDxvys0jSySlpxTiMde7jPYNImB45aBcaHxxEuuR
 aqD0HyCkCXSeQvx3kiwgdPnXGX46EJHdksFtMnk1H1sO2rDCsNHk2yDAbG6m3En06yu8
 ZBlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk781hmL6ZJx6OpxQiLXJBiXox9u9p10n+XYx7lGOvitARBgiTSXnern97N0p5uAGoQD7L9aw+SdiSZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzhr2tM2xPBOXq4het1LVGOsNoCZ+IK96sjrb/U1we3wjQUOOqV
 hUMnXQ4pFz5qrZ5K+HvEg0QRJKER7ZKLJ3I7hnC3xMpUpPxXHFQtBFgICQv3IFAZI74=
X-Gm-Gg: ASbGnctRFjlKl/Jj54xezHUu7aXjBpgTMM0ii3UPxyd8xCSlQshZIRkQyO26ID9ijog
 kVSUg6cScatyt44/K5Tj7UOksB1LuUDJ3PzgjiGk208L4k7v2Xke1PeB3w4pHee4yjKAeJcc8LJ
 c7HkzfPfmcU5wEqViGa2AxqXiFwfC+erF6Luz9ww5YxPeEk8qMpvJH4iH+Mh9qnZFMq4Z9icSAG
 Ltbj3QxfcezJgxzJPWnjUR/FlBe0Zq3zzk6vlgEOdvQ2vARKXsciTuCizQ3J1ydjgVvcPn0xAod
 493NyYgpFLNjygm6D4dtUC155jdMUBSnXa5giyEkjH/jhPEli/DVwipTRaq/nVQfXYoL8aqVVrO
 UHro=
X-Google-Smtp-Source: AGHT+IHanymhU6haQwMX08UaVWjgDuhrBJkJnuAw0FtFP5FomR3rskOHKaWp159bL/od+P/uW3UjAQ==
X-Received: by 2002:a05:6808:2388:b0:3f9:4f55:a002 with SMTP id
 5614622812f47-40a65fd343amr919002b6e.12.1749681782819; 
 Wed, 11 Jun 2025 15:43:02 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:43:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:16 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-24-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=F7t+iKhqynKqsGA0Dj6cleYDfnxlvUihp6+d7Cd3LFc=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYkRI+gTkzxZcqPjcDI24PviRY3280AM10XW
 Soj9nQ54b+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGJAAKCRDCzCAB/wGP
 wJavB/49bwHnqdL6jGGKc0R+tNBC8oWNqAgzFcpqGTNVFp+z2yNK0M3aP1hqPHGL2QBr2TA2lr3
 eaNmz5m1EZlIb1/czf8EL21m6pLnB/38XHfTEkuUfIR69m6fw3BS3Fc7dMyIcsr8vdRdjMxUgEx
 amFPpQ4mKamDXx1TLLaF0FtED8EH22FcU0HwsL98z1KR/0+4fZ6CTqvl2MRVikEAFvjbQdfenTc
 pegbUCdP51Apv3/KFpJJk3XTP46eI1vJ9vHFWabzWZyk42ooaanCWQC61vYb2d1I3+Qq7771tUx
 7nB5lSZddiuam+AwBUXxlh+iq8FqViKV9rtz43g/ULV3QsZ0
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 24/28] iio: pressure: mpl3115: use = { }
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
 drivers/iio/pressure/mpl3115.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3115.c
index d6715997f13727e22346a76819cb7dc58a96614e..579da60ef441482a82f3bdf4f67436a13ab3e09d 100644
--- a/drivers/iio/pressure/mpl3115.c
+++ b/drivers/iio/pressure/mpl3115.c
@@ -160,7 +160,7 @@ static irqreturn_t mpl3115_trigger_handler(int irq, void *p)
 	 * of the buffer may be either 16 or 32-bits.  As such we cannot
 	 * use a simple structure definition to express this data layout.
 	 */
-	u8 buffer[16] __aligned(8);
+	u8 buffer[16] __aligned(8) = { };
 	int ret, pos = 0;
 
 	mutex_lock(&data->lock);
@@ -170,7 +170,6 @@ static irqreturn_t mpl3115_trigger_handler(int irq, void *p)
 		goto done;
 	}
 
-	memset(buffer, 0, sizeof(buffer));
 	if (test_bit(0, indio_dev->active_scan_mask)) {
 		ret = i2c_smbus_read_i2c_block_data(data->client,
 			MPL3115_OUT_PRESS, 3, &buffer[pos]);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
