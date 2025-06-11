Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 808E4AD62B1
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:42:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1869FC36B16;
	Wed, 11 Jun 2025 22:42:51 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86252C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:42:49 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-401f6513cb2so776396b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681768; x=1750286568;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FaCqKPIs2f0ylRS6bTSnQ5BqgfESWCqO1Av05E42Aq8=;
 b=23NkMfLPpYZ599hhjckPloYrsOCA74ND4nWd2kluOpj1RjyypyrNqrgowZf/CnZfJl
 3DUS5Y2dzWpLHOTkJNgrsGNOt4DI/QbI/CaexqWGW5QCXbP78629A9AQ+h1cNVFfsFT7
 LXHfwVqp7KOkRpcmFl7Ri2DsbQYhPZP1ujmT2cyJ1WgxXy7JfYnRuG+H7TCp6ymNCe1D
 8gJe1D1pQVYRlWRF9tzwFNPS9w9j+wJe0ecLrTPLTfump7nf6ra/so0f2Uk3GPIAdATI
 xr4e2zWMQPqIwgiUDuDpcV08HK5U7muC3E9qRmuuc98r9p9HfxDsFd4amj36Pv5zOYN6
 RjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681768; x=1750286568;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FaCqKPIs2f0ylRS6bTSnQ5BqgfESWCqO1Av05E42Aq8=;
 b=h0y4YxKecZ2SJa6EGR7LG8LGnbadXuWpJYWscOrbddcjkR6AwyjwbgNpLUuwV4BMx7
 1H0G5ZpimX+gBWzddQddCQxE5UQCivvysew4gb4CY+IPJN16O5BspocxTP6ltEggwDA2
 JX9Q8tQIj2mrmkhzXZOZRCEOKxABwzFJGHvskbZerGmefoXZAS1oeGE5eafNxnQJkRBX
 2rHO9G3X2vLsclk4AADW7lMcR6sBdzEq4QburWpZOLqsUGrKf/+0n9LsgpZSS1iSg7zR
 bn373xiadGj2/Qi7ebFO3qHrmSodZ++l5Wyj7yYh2IPtniUzcR15XWfVEPE384SfI+cM
 uxAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcckp1WmSZZ/L//VP+mBdy94kiOWRzo0Fx8swMpEtwmCfdFtw7fKhsQ5FOlRp8/ILp+KqgYt5paol2Vg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyLJf7e18rD/u6Qh3w1utl72KuvyjXTnEWZx8N7z5pUcKF46gaS
 CdrdbXIaarQMl+Ha5T+GaqMakAoHo36+Cr8b+/Z+CY4lV8poynW+N+FEu7UbeASap1o=
X-Gm-Gg: ASbGnctchkPAT6MLyTLRIHt0+FrmQ8JO+vSSthFcL9iNSxQndSQWehMfusXqb9QyJ8X
 q2rRDftSJEZEkUDRjYYrYxmOw9jWI4+t6jgSa9q7cXquHRc7oHEZ0maSMTFGrGAc7K3TivecvwE
 OlJhBjuQUs9WghDWf1lUoejkFxE41IwVmU+6x41Y5g6unGTuJSgwJpPLgsw/PW4QV4A96JXzQZD
 NQ1NnJk90jOBkkq7Eh3fZe4/4wo9pfjvAayREZAFxesWnTslHtAXF3QdAQdq0C3frUPlDFAgyqE
 iOsxBpYdxPJilwvyVRCiHWZySnT7dwK9YRm6Qp+dsFr660JTdm/ix/7ODQiRSdSiE+L/
X-Google-Smtp-Source: AGHT+IEqBdswhJxFab3cfPWoCt/XhvSdy8p4DMoA4oBrcj8i32O67dKlBd9w/Xt2c78Lmmmu54g1yQ==
X-Received: by 2002:a05:6808:3403:b0:407:a0ea:a233 with SMTP id
 5614622812f47-40a66081d10mr892925b6e.10.1749681768360; 
 Wed, 11 Jun 2025 15:42:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:42:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:08 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-16-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=fAkKApzgvKKCY+4XB2hNM39jEFCTxF0PElDrgzvAlfA=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXt+4nZ+zbyhmjJNdPfIxZOtXs2Bk8+N21Ob
 xic8BlFYmWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF7QAKCRDCzCAB/wGP
 wIUNB/48BoC8ymocKlLoNu3v5QYdcqupR0Gl4uhHgWI4Jt4Brgahbb5SfPq/3olqkbiy+T1Ookv
 DWyixFwL+PnlcdEYgsS3FtkBM77VlMTSo6KPDdiudRl4FOE1D8dxwHWMFTSURf17zsYwE+dDLHp
 YZRLNMo9fWgXqlnqEsBGDUgu2l57aaQxB6TaIlukki2lYZmsUTkPQsTN9JnX1WWTeNubNgf9d9W
 0ZUaDpZW1pcDF8oQsk1+HVaB1pWPs5UwKNoW9xGgFt43NyStIN8Eb/T84MFJaOOu+ikBdQENY1a
 Diwzxh8L7c4dTlMajUB9DvjbZGuzAcjh6/xW+3qRtK6/KKlM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 16/28] iio: imu: inv_icm42600: use = { }
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
 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
 drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
index e6cd9dcb0687d19554e63a69dc60f065c58d70ee..dbd315ad3c4d2bd5085f7cd3cdc6de4391b1c896 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
@@ -902,7 +902,8 @@ int inv_icm42600_accel_parse_fifo(struct iio_dev *indio_dev)
 	const int8_t *temp;
 	unsigned int odr;
 	int64_t ts_val;
-	struct inv_icm42600_accel_buffer buffer;
+	/* buffer is copied to userspace, zeroing it to avoid any data leak */
+	struct inv_icm42600_accel_buffer buffer = { };
 
 	/* parse all fifo packets */
 	for (i = 0, no = 0; i < st->fifo.count; i += size, ++no) {
@@ -921,8 +922,6 @@ int inv_icm42600_accel_parse_fifo(struct iio_dev *indio_dev)
 			inv_sensors_timestamp_apply_odr(ts, st->fifo.period,
 							st->fifo.nb.total, no);
 
-		/* buffer is copied to userspace, zeroing it to avoid any data leak */
-		memset(&buffer, 0, sizeof(buffer));
 		memcpy(&buffer.accel, accel, sizeof(buffer.accel));
 		/* convert 8 bits FIFO temperature in high resolution format */
 		buffer.temp = temp ? (*temp * 64) : 0;
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
index b4d7ce1432a4f4d096599877040a89ede0625e0b..4058eca076d8b03a2290535eedffa0a74098d739 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
@@ -806,7 +806,8 @@ int inv_icm42600_gyro_parse_fifo(struct iio_dev *indio_dev)
 	const int8_t *temp;
 	unsigned int odr;
 	int64_t ts_val;
-	struct inv_icm42600_gyro_buffer buffer;
+	/* buffer is copied to userspace, zeroing it to avoid any data leak */
+	struct inv_icm42600_gyro_buffer buffer = { };
 
 	/* parse all fifo packets */
 	for (i = 0, no = 0; i < st->fifo.count; i += size, ++no) {
@@ -825,8 +826,6 @@ int inv_icm42600_gyro_parse_fifo(struct iio_dev *indio_dev)
 			inv_sensors_timestamp_apply_odr(ts, st->fifo.period,
 							st->fifo.nb.total, no);
 
-		/* buffer is copied to userspace, zeroing it to avoid any data leak */
-		memset(&buffer, 0, sizeof(buffer));
 		memcpy(&buffer.gyro, gyro, sizeof(buffer.gyro));
 		/* convert 8 bits FIFO temperature in high resolution format */
 		buffer.temp = temp ? (*temp * 64) : 0;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
