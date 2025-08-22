Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D979BB30FEE
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C890C3F95B;
	Fri, 22 Aug 2025 07:08:40 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CD94C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:50:23 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-770305d333aso316639b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834622; x=1756439422;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zktb9gNCV40fpMD00X6p5W7la95jm4sktu3txkhmc0k=;
 b=BQ/sepLhgMzqI/Czr/Eig2FGLACQalkV++8VGncSnGKw1OuXmqX7H9RNFy+D7Fo8op
 6Sqi9Z7Ew1V/IT98pm10dUjbmbh9b7PWO3e8YSCPdWq66JoudhtrN5jhbo7j5E5G0Mdq
 ku3zOYws/CtaK86rlO0JeZ0oeMYP30GUHZ4pm3lte35HVL08KALX6E4ndhG6FaUbXFFR
 Z1rCtLb83Ofp1Mhz0674+Te/V5sTm77ibvKZGfAPlWUHz3lRj/ZsHrUA4mKAGZxBW5wU
 tLT9fKF7EYEwzIA8bslePRxvRgC1mp2HdHg23rYI4INevzd7fIDWS6S7yEowO5X1NDrf
 TFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834622; x=1756439422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zktb9gNCV40fpMD00X6p5W7la95jm4sktu3txkhmc0k=;
 b=nKLfuIPUvsuniS0s2/CtW0o752pGHQBiaoAEdF+i9Ni1R/4E/VVtnXDwCPtwmuBgG4
 upfhEcMbxUOjZVHN1pBKvJD/MrA8a9kGRI0P8UpIbn+S39t04HLk09AC4SiuP0S3yp3L
 AEnPSo6Kmmtu4QQnJrK0fZiWCo7/IJqSMWcbeIEYQyqwBkdrsUJJf3LFeqXEctc4xDKR
 GUG4X9eZVG5d54adgn/ihuIjo9PwgX+DpwKPU6IAZoq4bwdENqliWwK6tP2dffDNMYJ1
 oeY26JoCjcKlnCeyP2Exk76YBUSBOu76w0C9ibFMQkvxUWxIGjmIr41SBW0LdCOGzRv6
 wQSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuQS92V9v1fU4S45TjflawLR5lvtPmE2GOEVAOVWkM5iWyvFFVkhrdw+j/qJSx6gu1ezvmds/fOQgFbg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzH/TY0nIzy/6Hqsz6LR1u6JiX9TWbfrhnedxG0g46/+fTt4qQh
 OKt53o+QeSInKj09jQIrneQBPCuNF3QnJBGMB5Y5/7aFPuqOuhXQ4Iue
X-Gm-Gg: ASbGncvZVJFdYCQJfYConTWn/mC+qTb9wfELxmOQIFaDGpw9BY9QeU+Sox0aiJqh+ko
 7ohIPEbUDo7aQ+DDEOI+7FDwE43EMa9QaeGG2UHIhMiVG2TPQHQqZlkqAxzn0IBZu4NFTL8sq/Q
 8HMzBMkO/lGAl56jaVe6j2VdLwYg7IlCiazLq+ntByz1yHmQr9ZWWIVzaCIBh3ILqVO7Qw0oHPV
 ppPOnczWQmlSRxHYjMAtQ7lUI3yl23mRRC/rkEir6MuDor/1HAg3zw7rz6GY35Xt9ls04bHUinU
 8DdDO5VGYN+XMDlPCuMQQ3xHoVNE25n7CC1pW5sxtVbi6qTDy5ndyPbuGGkK6dX4BTewGclRfOE
 T3esL4C3fepTKZXPha7KMnTLyMr/b
X-Google-Smtp-Source: AGHT+IFDoZyIz0WRIUaxN7FXYxLo2r7HqUuxevy2n8ltiyBxZUhzirU0KHdL7UEIoextymafrEyd3g==
X-Received: by 2002:a05:6a00:858e:b0:770:3663:d7ed with SMTP id
 d2e1a72fcca58-7703663e373mr162150b3a.8.1755834621826; 
 Thu, 21 Aug 2025 20:50:21 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:50:21 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:49 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-1-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=4894;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=AwWtPL38y1r0iJuhWRg453I1C8i8OfauDf6niMfJUko=;
 b=HyArtRPdcLffakDtLhClwxTdP+mH4OjolmAEC2kl0Ef9kkGBHqmafuOPvQlafSR3649vcC4lc
 /gRsKN/en8vAYGKTMMFbugkLJ14LDuKTxUNJK79Mcbj67+WHGSq6Qtv
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 01/10] iio: accel: Drop unnecessary -ENOMEM
	messages
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

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/accel/bma220_spi.c | 4 +---
 drivers/iio/accel/dmard06.c    | 4 +---
 drivers/iio/accel/dmard09.c    | 4 +---
 drivers/iio/accel/dmard10.c    | 4 +---
 drivers/iio/accel/mc3230.c     | 4 +---
 drivers/iio/accel/mma7660.c    | 4 +---
 drivers/iio/accel/stk8312.c    | 4 +---
 drivers/iio/accel/stk8ba50.c   | 4 +---
 8 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/accel/bma220_spi.c b/drivers/iio/accel/bma220_spi.c
index 38f7498431ee..01592eebf05b 100644
--- a/drivers/iio/accel/bma220_spi.c
+++ b/drivers/iio/accel/bma220_spi.c
@@ -255,10 +255,8 @@ static int bma220_probe(struct spi_device *spi)
 	struct bma220_data *data;
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&spi->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->spi_device = spi;
diff --git a/drivers/iio/accel/dmard06.c b/drivers/iio/accel/dmard06.c
index fb14894c66f9..33f225d73e7b 100644
--- a/drivers/iio/accel/dmard06.c
+++ b/drivers/iio/accel/dmard06.c
@@ -137,10 +137,8 @@ static int dmard06_probe(struct i2c_client *client)
 	}
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*dmard06));
-	if (!indio_dev) {
-		dev_err(&client->dev, "Failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	dmard06 = iio_priv(indio_dev);
 	dmard06->client = client;
diff --git a/drivers/iio/accel/dmard09.c b/drivers/iio/accel/dmard09.c
index 4ec70ca6910d..d9290e3b9c46 100644
--- a/drivers/iio/accel/dmard09.c
+++ b/drivers/iio/accel/dmard09.c
@@ -95,10 +95,8 @@ static int dmard09_probe(struct i2c_client *client)
 	struct dmard09_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/dmard10.c b/drivers/iio/accel/dmard10.c
index 71cd1928baa6..575e8510e1bd 100644
--- a/drivers/iio/accel/dmard10.c
+++ b/drivers/iio/accel/dmard10.c
@@ -191,10 +191,8 @@ static int dmard10_probe(struct i2c_client *client)
 		return (ret < 0) ? ret : -ENODEV;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/mc3230.c b/drivers/iio/accel/mc3230.c
index e2853090fa6e..3e494f9ddc56 100644
--- a/drivers/iio/accel/mc3230.c
+++ b/drivers/iio/accel/mc3230.c
@@ -169,10 +169,8 @@ static int mc3230_probe(struct i2c_client *client)
 	}
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->chip_info = chip_info;
diff --git a/drivers/iio/accel/mma7660.c b/drivers/iio/accel/mma7660.c
index d0a16f227903..be3213600cf4 100644
--- a/drivers/iio/accel/mma7660.c
+++ b/drivers/iio/accel/mma7660.c
@@ -192,10 +192,8 @@ static int mma7660_probe(struct i2c_client *client)
 	struct mma7660_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/stk8312.c b/drivers/iio/accel/stk8312.c
index dfac2e44191f..305d88b1ae0b 100644
--- a/drivers/iio/accel/stk8312.c
+++ b/drivers/iio/accel/stk8312.c
@@ -505,10 +505,8 @@ static int stk8312_probe(struct i2c_client *client)
 	struct stk8312_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/stk8ba50.c b/drivers/iio/accel/stk8ba50.c
index 05d4fd540eb2..0f984b72a35b 100644
--- a/drivers/iio/accel/stk8ba50.c
+++ b/drivers/iio/accel/stk8ba50.c
@@ -386,10 +386,8 @@ static int stk8ba50_probe(struct i2c_client *client)
 	struct stk8ba50_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
