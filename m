Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17625B30FF0
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA851C3F95F;
	Fri, 22 Aug 2025 07:08:40 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10C96C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:50:46 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so1657815b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834645; x=1756439445;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SWhZhPrOG/QAlgX04rUzc0hrbfIiVcVzkp3PRYw6Qbs=;
 b=Qx62JJHNFk7RhE3R4xq7mnK0lXuktUy1cpUmUJPAhzHmgxOtb06o6Sibx1xanht+6E
 UdaYr0QJkZ5pxvBa/C7J1QLVIYsi2BkLaWkxyHCI4sq6ABo+VNkb8Ns+0GEx2gr/hlcv
 2vppwzDXkOaVf3eI7obIu4jmxldCgamMA3hi0MJqBXnqFRWch3E7Dln6q1QIDmYsCFbX
 vFtmgxxzrRgJD9ZWdB2OZIpayj9OVq0TWkMUVOEsZnG+ms8FFErPXpgaFfb+fbOMklpk
 SDDJcXhyhFvl8+AbRXDUZM2mD3WDsDhTd1xXYqoyOT0MkYa7ZYENHqw3iK1u7Rpn76Yq
 +Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834645; x=1756439445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SWhZhPrOG/QAlgX04rUzc0hrbfIiVcVzkp3PRYw6Qbs=;
 b=SCxsAQM8z3tfoG4uLiSKG25+M0es7D8SURHCBk8eoSFIM3s/jniT9jKEP0nVrr4Ih2
 2U5oCEdKea8P16YJsuRA9AjVTRn2k08RgOpBvnEGgqvAqPBEYb2TfOKcrv0X8bhEgc3O
 WBhg22Za6874W/7RCAdqPCeIpUP4v0MJK5caR1MyXq8IHiPHO/kjsogipyFw+Xa3oS63
 Zg9De/TReHHR6v4WHxU7kBU3Ho9/ACi4v9X6fM01jUE02tsMERdZnsfuqlu0+gYl3bX7
 VnZjESL3P8z/kO3ALM9wf1sS1JqIwa8Xj3A8Xb/d4iyQCqbz7eP8os1dSXs/zej+9mHM
 i1Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdRMltiOGkNIVQEeKX2xNmAcTq+ZQPsbfDNg3a2cC13AigNh2R6WAioOhVq/tBcY+Z4/ST9fivhvJ35Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxrvtJ/z8q+r/JBOitltUa1wmCsIwVuaoT6wOfsz7rINNPW3eJ8
 r0wx/P997Nnslo4fNQkj7eEKzNSR9lPbaqdP33/h9gFuyvOYk5rruwnJ
X-Gm-Gg: ASbGncvLFo9+U5qt7d+lpnP33iGeiCfv/4nFM8qPb4T0Yo94T0HcZwJnhB6XXCcTvPW
 y4gEJ8iSS6pkTFupQRgzcY6DVyb9fTIFGlRjW5IlH/ORtBiVrQUS1AdpjMtXPFRgubzl5RZ7w69
 Vj6PEumHbMbPTO9HmkU2gECfPVTHSgERIybJgNvaa7beJzqn3TS7LMjt1pdccs4XuQkdfbFSZFp
 v1iLDm0wIgO95dJ1c2bb2Y3qsy1PjGD0hExCVjZHmQkDD+9ud0Ab+XC/XaPwjGHMWxaeHfjXfmJ
 tL5lcPlTRnIr7QjAmo6+rjGOGBZdBsxyqT9CsSs3/Wo/14sV1IxMb0NnYWrUxBh1HoZDDpAGFXA
 GXAOlTWcsISlMbilzg8azLtusNRB8
X-Google-Smtp-Source: AGHT+IHkP7IcI6b0w4x7HvhyRCGL8lDQ0eb2HC3aGo0CeMkwIFIX7qo+gbx+sa5/Xre12VY1dmNs5g==
X-Received: by 2002:a05:6a00:8ccb:b0:76f:73be:5c40 with SMTP id
 d2e1a72fcca58-76f73be5d38mr3282271b3a.0.1755834644500; 
 Thu, 21 Aug 2025 20:50:44 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:50:44 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:51 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-3-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=3064;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=1K93tVeoPiLj/0fP86BU3YSmIy3OX+Xeg+DZkIsbkCY=;
 b=JROXYfDq1SqDL2ylheHeUCGY4etunQkZ/BgczFT/HiSsDjSgLfD+vVQv/PUGbpM0DntA8c+rO
 /vK5LfYFZBAAFXCYy4qQHdS9WRP7YF9lw/jPh6v3LyPjytsGbwnqVdv
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 03/10] iio: dac: Drop unnecessary -ENOMEM
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
 drivers/iio/dac/ad5380.c     | 4 +---
 drivers/iio/dac/ad5764.c     | 4 +---
 drivers/iio/dac/ds4424.c     | 4 +---
 drivers/iio/dac/ti-dac7311.c | 4 +---
 drivers/iio/dac/vf610_dac.c  | 4 +---
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/dac/ad5380.c b/drivers/iio/dac/ad5380.c
index f63af704b77e..ffb8c676c7a8 100644
--- a/drivers/iio/dac/ad5380.c
+++ b/drivers/iio/dac/ad5380.c
@@ -371,10 +371,8 @@ static int ad5380_probe(struct device *dev, struct regmap *regmap,
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
-	if (indio_dev == NULL) {
-		dev_err(dev, "Failed to allocate iio device\n");
+	if (indio_dev == NULL)
 		return -ENOMEM;
-	}
 
 	st = iio_priv(indio_dev);
 
diff --git a/drivers/iio/dac/ad5764.c b/drivers/iio/dac/ad5764.c
index 26c049d5b73a..fbbd7105a80c 100644
--- a/drivers/iio/dac/ad5764.c
+++ b/drivers/iio/dac/ad5764.c
@@ -278,10 +278,8 @@ static int ad5764_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
-	if (indio_dev == NULL) {
-		dev_err(&spi->dev, "Failed to allocate iio device\n");
+	if (indio_dev == NULL)
 		return -ENOMEM;
-	}
 
 	st = iio_priv(indio_dev);
 	spi_set_drvdata(spi, indio_dev);
diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
index a26a99753418..a8198ba4f98a 100644
--- a/drivers/iio/dac/ds4424.c
+++ b/drivers/iio/dac/ds4424.c
@@ -221,10 +221,8 @@ static int ds4424_probe(struct i2c_client *client)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio dev alloc failed.\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	i2c_set_clientdata(client, indio_dev);
diff --git a/drivers/iio/dac/ti-dac7311.c b/drivers/iio/dac/ti-dac7311.c
index 3d2ce61f0db6..5c1c5213962f 100644
--- a/drivers/iio/dac/ti-dac7311.c
+++ b/drivers/iio/dac/ti-dac7311.c
@@ -242,10 +242,8 @@ static int ti_dac_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*ti_dac));
-	if (!indio_dev) {
-		dev_err(dev, "can not allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	spi->mode = SPI_MODE_1;
 	spi->bits_per_word = 16;
diff --git a/drivers/iio/dac/vf610_dac.c b/drivers/iio/dac/vf610_dac.c
index b30ff7bb4400..b7ee16ab4edd 100644
--- a/drivers/iio/dac/vf610_dac.c
+++ b/drivers/iio/dac/vf610_dac.c
@@ -178,10 +178,8 @@ static int vf610_dac_probe(struct platform_device *pdev)
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev,
 					sizeof(struct vf610_dac));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "Failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	info = iio_priv(indio_dev);
 	info->dev = &pdev->dev;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
