Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4841FAD629B
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2B22C36B24;
	Wed, 11 Jun 2025 22:42:17 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E696C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:15 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-4067ac8f6cdso245180b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681734; x=1750286534;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7BvPO14dME7rxPy0XG4Suixfv/o3vfcBS7p0YrP3lVs=;
 b=cqnwnFge+3upCa1ZyecUuc4sxpliI3pxnFPFnECwSjB/KQy+Ph8cFmC6Vv1c7E4ZgB
 AlJkAyiRMcUrXuUKrwKmiB9JWBPqUv8/ufbzsM86luMxazy9/0jlb4q87F9a98u42OXE
 U9OsPBU7YXimjFsUheHZX1e6eN38yLCe5B5VQfRXMONc5R8ungXIh2g8RqYSqn+l/CY1
 SVUVreNEgMscLKs+23iyWRnvRkSQACeWsz87AeNj4+8qfXKGUxJXNPJYGq/WyjCC034X
 Z++AsF2+sOOgHAd/W/srtJxVBcr9S63RMUkpaVogZw8IhYfQxRB6bmIoP1AG0yy3k7WG
 Mqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681734; x=1750286534;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7BvPO14dME7rxPy0XG4Suixfv/o3vfcBS7p0YrP3lVs=;
 b=uBVPnuSCzSAYGwrWdCMwyhlRrOxyPvDJZdQARQr48/rw3S0NqygHChcXapKyn9VH+g
 ghDq7F5izzIr0Ar4I0MF+IiuoHaNZNkA+40sYoRTHA/TeuVs6BTts5WQgXKi0mD+eZV1
 At7pA9+xlUAK49uomOsFKHrQrTqpenWUhW8w9uXavQq97svHXTRcdWBGtXXWZUc+mHVU
 Bp6DVDqGNOH2Aul0D+yeKQG1bTPIxW3aDgzpSo8f/twIL70G2InxKGThmaKS44ATj5dX
 sAIKVy7ma63Mf1yqh4WZJEpBXvdtS3qKLbgAMw2gu52osMuIWjX+RL8B5VYzW8dF8cn3
 GeFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDeEjqfbr4ajK8LcGjigOB2ZIypFPIvSV3hr/O6b8LOgzYnSYeQumW5jY8kMJhUgY8IJ8h12rSnYhjXQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwR14oRQRU87IWnT0FekDQtsAayzMgTnjEPQWShDN7H28DNsI6I
 JDpYposArxFvw1/X2xUa87Q6D/3lFqiHFhhxOO1g7wbc8qtf37IwmyFEIKYfWzqffFU=
X-Gm-Gg: ASbGncvZ8N1e0vmmCf9WnFWNiRtnAsE4Kp96IGttLjI2qXWNImjZzMrgbPkVzTZZROY
 qG1L0bqUDjBpbDn3CiQqGBvVzjyHmp3O0FsqlFlqjP8Qq2fKhfoQVk9JC8S/3oGla3kcpWgU4lo
 Lll83ohgn4OpuRcZQ3YTlg6m6Rj8goeC78IVDv9FWGv2dnp+xrQE97JFca1/5L/lHFLFDIvVbk8
 SAnMR1+1SBFFqP3fKYWckGbsBNKouVk++ZcmS2jqMGOhFSxW6OdQABp8Tx7pvNuvina0lkHzClx
 LPerdr4SC40BAfbAg3UeaGv9fb2aI/0S8uI0D2uwA7X1iavsf7wlbcSS6nz7ootMGKTd
X-Google-Smtp-Source: AGHT+IF44UK8AdQd6fFvDc21ilNMu4m0bVVIKOfl5xOOjYgMQm/xz/i3oLPfD33Zol0pZXaxSSar7w==
X-Received: by 2002:a05:6808:4fe7:b0:3fc:7e1:a455 with SMTP id
 5614622812f47-40a669c01efmr518853b6e.2.1749681734252; 
 Wed, 11 Jun 2025 15:42:14 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:12 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:52 -0500
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHwFSmgC/x3NQQrCMBBG4auUWTuQCVXBq4iLmEztjzSRTFBp6
 d0NLr/NexuZVqjRZdio6huGkjvkMFCcQ34oI3WTd/7oTiIMFF61FkZGY2shPvmDNndb05C4TLz
 oYtrYJfFplHDWeKcefFWd8P3Prrd9/wGWqNUmfAAAAA==
X-Change-ID: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7ecb
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4170; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=yr3KMlpdAIDpFQpkD3xC/enXTLilJ1AAF5YBAl5/CHI=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWAfjXY88M5ZYDZ+7DX9ossNW945JAucW1/v
 jGUtSZ5M1eJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFgAAKCRDCzCAB/wGP
 wPuQB/9qvN9qaCT672/2gBbYyejlFF3k1/j6Gn/mB3Q9wXva2BfxWsvzY/aFxXDjRUixvEIYtHr
 Aa2OgjvXXp8xeKaF9+2tuO3eZMkPIlIsGMSh8RlslM5ziujYyK74q8EbozYwpwlW1iEN+nhz2d2
 veKGy321c5RC4/6ArZl7vHAkwa+0YbhQgUQMiL/p0G7uDdnZaPAOsMjP3qOZAFm5g5e6xP3QeuZ
 NXEr3Fmbf7SKpE+P8cDfUrlyI0ktmNb2LmQCFLyFLxJcwfPz1+dMjbqnyCkB+OsBvSwWgo6eIed
 GyVNvi0jVIHbMRsHldgnXbcgyInHxugOhj5ZAno4ZKQqOxLc
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/28] iio: zero init stack with { } instead
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

Jonathan mentioned recently that he would like to get away from using
memset() to zero-initialize stack memory in the IIO subsystem. And we
have it on good authority that initializing a struct or array with = { }
is the preferred way to do this in the kernel [1]. So here is a series
to take care of that.

[1]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/

---
David Lechner (28):
      iio: accel: adxl372: use = { } instead of memset()
      iio: accel: msa311: use = { } instead of memset()
      iio: adc: dln2-adc: use = { } instead of memset()
      iio: adc: mt6360-adc: use = { } instead of memset()
      iio: adc: rockchip_saradc: use = { } instead of memset()
      iio: adc: rtq6056: use = { } instead of memset()
      iio: adc: stm32-adc: use = { } instead of memset()
      iio: adc: ti-ads1015: use = { } instead of memset()
      iio: adc: ti-ads1119: use = { } instead of memset()
      iio: adc: ti-lmp92064: use = { } instead of memset()
      iio: adc: ti-tsc2046: use = { } instead of memset()
      iio: chemical: scd4x: use = { } instead of memset()
      iio: chemical: scd30: use = { } instead of memset()
      iio: chemical: sunrise_co2: use = { } instead of memset()
      iio: dac: ad3552r: use = { } instead of memset()
      iio: imu: inv_icm42600: use = { } instead of memset()
      iio: imu: inv_mpu6050: use = { } instead of memset()
      iio: light: bh1745: use = { } instead of memset()
      iio: light: ltr501: use = { } instead of memset()
      iio: light: opt4060: use = { } instead of memset()
      iio: light: veml6030: use = { } instead of memset()
      iio: magnetometer: af8133j: use = { } instead of memset()
      iio: pressure: bmp280: use = { } instead of memset()
      iio: pressure: mpl3115: use = { } instead of memset()
      iio: pressure: mprls0025pa: use = { } instead of memset()
      iio: pressure: zpa2326: use = { } instead of memset()
      iio: proximity: irsd200: use = { } instead of memset()
      iio: temperature: tmp006: use = { } instead of memset()

 drivers/iio/accel/adxl372.c                       | 3 +--
 drivers/iio/accel/msa311.c                        | 4 +---
 drivers/iio/adc/dln2-adc.c                        | 4 +---
 drivers/iio/adc/mt6360-adc.c                      | 3 +--
 drivers/iio/adc/rockchip_saradc.c                 | 4 +---
 drivers/iio/adc/rtq6056.c                         | 4 +---
 drivers/iio/adc/stm32-adc.c                       | 3 +--
 drivers/iio/adc/ti-ads1015.c                      | 4 +---
 drivers/iio/adc/ti-ads1119.c                      | 4 +---
 drivers/iio/adc/ti-lmp92064.c                     | 4 +---
 drivers/iio/adc/ti-tsc2046.c                      | 3 +--
 drivers/iio/chemical/scd30_core.c                 | 3 +--
 drivers/iio/chemical/scd4x.c                      | 3 +--
 drivers/iio/chemical/sunrise_co2.c                | 6 ++----
 drivers/iio/dac/ad3552r.c                         | 3 +--
 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
 drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
 drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c        | 4 +---
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c        | 6 ++----
 drivers/iio/light/bh1745.c                        | 4 +---
 drivers/iio/light/ltr501.c                        | 4 +---
 drivers/iio/light/opt4060.c                       | 4 +---
 drivers/iio/light/veml6030.c                      | 4 +---
 drivers/iio/magnetometer/af8133j.c                | 4 +---
 drivers/iio/pressure/bmp280-core.c                | 5 +----
 drivers/iio/pressure/mpl3115.c                    | 3 +--
 drivers/iio/pressure/mprls0025pa_i2c.c            | 5 +----
 drivers/iio/pressure/zpa2326.c                    | 4 +---
 drivers/iio/proximity/irsd200.c                   | 3 +--
 drivers/iio/temperature/tmp006.c                  | 4 +---
 30 files changed, 34 insertions(+), 85 deletions(-)
---
base-commit: 4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
change-id: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7ecb

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
