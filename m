Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02760B30FEF
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 948F8C3F95D;
	Fri, 22 Aug 2025 07:08:40 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA068C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:50:34 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-76e2e89e89fso2281175b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834633; x=1756439433;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qqTeTmuPyRyJ3pkNoYGDtSBuc00zqnBTdwwG/CzasEM=;
 b=BKORr8Q360oVOrVkJBsBWAD/e1jzOXNPEIYM6AdgfeRadzK6bqRkvt8NXG98Y6qpUf
 kkOCvUOGk1gzd8bqoYcKpxK8vf3fkPmj6ak7jlFcOZYVnatxGSpMNI9gbyy+lJjgG1Fl
 edjo/JHBcSaKx4+anWVx2TGV/WyoySlKs4VNmYMPPAR7gMf6Ix3usBUoCyACWjPF1IU8
 UoZ1gLWvsDH4jV0vERWPFl85pdz7n51+Gtq4hLYFMe8VGBG4xhU+Kj7Y3BImRm7C/jOf
 sKPLuoEP/dtJmt6vHYmHqNGyzcrHZRpqFxmrT3mh7RtwiDWT8wqyAYHU5TvdQXEqsu9Z
 +s/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834633; x=1756439433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqTeTmuPyRyJ3pkNoYGDtSBuc00zqnBTdwwG/CzasEM=;
 b=Z8Ma87YI978BzLcK+xO26bOS8FQ1smlI38OpSmCVJb+tPVPTF8s1yQ6n/P6ZhDlezQ
 ucIi3MQoDLEZsxDkWYzMFdHz/cMaGVJJhil+sYTlN051miM33YoUBLg0XKwqHkfgmRdH
 2aiSkG0q9CfbAL8Ip6Qk7GSKtO6eUU0Gv3ml3V87tCOsvccXUTnpeMK3W6lGCH5tcai3
 xbC474Ad4TzFEvz9FhoEk+jF/JNcSRd9rfukM6EhGeAtKGK7mGjahA22+Y2WsK5QeEjf
 NK3TmaqhgT26vG3h4jDtdMKK+QOm8eCvnIH2dNRR5teEZTPfFzWzsgFpkMDDXcw73k17
 zKZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFlAcJOwyFsRr/T3eC8FxIsjuAI+9nhrN3BvzubYewxv84OwmoEBMmNDma8hOAyBUk9o6Xt8nUZwNUbg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjcxCk9YPzvPWpoXKsDzvMxxqdI0G/MfJOLAei38E1f2YOZ02K
 yeikxot3yMW3wv55YzAfP8VtMf3eEkOz+OGpbba06IRBQn4ZifixA2F/
X-Gm-Gg: ASbGncvSTrI3v0i+TZwrPpOlsR6UCdobKSLuuL/LbihfSd2nGSycourefYM1B4FlEuV
 oFCSKbRYxms+QObga/sqcSjC6VGAJe1hBqYARouEz1iZ3rMkbMT3KrvoDHsUclIgh8y1r7YI2Ik
 le3WaNHg+e7V58nFOqOMDp4sax2kwPR655PIWWlICkS29t4nho1BsUb1ZFaWJ2qNDN+N3y1mysn
 FkQzmipZGntcRUQTgwVYoC1NkXd0ecvFFO9iQdEUQEtSMVu5zJu2dOT++Y7rjd6qWLNrO6/CcAq
 s+bIKc5MSVyjDDihRejXpJSJJb58ciHnHdLQKsvFhoadYVXKE2PYd7GOR3Y7SvoX1cVLW+sIZNu
 SqqWUYtGQUnQazOzXW8FewvCN9I9p
X-Google-Smtp-Source: AGHT+IERxoDtaVf+dbrrvbv5pjZ4KSfLrglqW2Pvw+HdC3IHQrRaPUrXlowMN+IZs1D9wMCBHplfUg==
X-Received: by 2002:a05:6a00:bd12:b0:748:2ff7:5e22 with SMTP id
 d2e1a72fcca58-7702fa057b7mr1767050b3a.10.1755834633167; 
 Thu, 21 Aug 2025 20:50:33 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:50:32 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:50 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-2-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=11663;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=AGu9ZkRHfhF6t137X8zXcHpvsGhVHMDMV1L9x/K150I=;
 b=hqMnjGHFYKykrgn5xbxcJprX4HQtBsNcj5+80fgC7kDWczGc3DTikdedYtP4NDO6fK1WjM8Zu
 VyzP4w7grMLBiK5eg6NuTBqN9ITKDUplHn5PYIrJsgtmxIdUR2wy7HO
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 02/10] iio: adc: Drop unnecessary -ENOMEM
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
 drivers/iio/adc/ad7949.c          | 4 +---
 drivers/iio/adc/bcm_iproc_adc.c   | 4 +---
 drivers/iio/adc/cpcap-adc.c       | 6 ++----
 drivers/iio/adc/da9150-gpadc.c    | 5 ++---
 drivers/iio/adc/dln2-adc.c        | 9 +++------
 drivers/iio/adc/exynos_adc.c      | 4 +---
 drivers/iio/adc/imx7d_adc.c       | 4 +---
 drivers/iio/adc/imx8qxp-adc.c     | 4 +---
 drivers/iio/adc/mxs-lradc-adc.c   | 4 +---
 drivers/iio/adc/palmas_gpadc.c    | 4 +---
 drivers/iio/adc/rn5t618-adc.c     | 4 +---
 drivers/iio/adc/stm32-dfsdm-adc.c | 4 +---
 drivers/iio/adc/stmpe-adc.c       | 4 +---
 drivers/iio/adc/ti-adc084s021.c   | 4 +---
 drivers/iio/adc/ti-ads131e08.c    | 8 ++------
 drivers/iio/adc/ti_am335x_adc.c   | 5 ++---
 drivers/iio/adc/twl4030-madc.c    | 4 +---
 drivers/iio/adc/viperboard_adc.c  | 4 +---
 18 files changed, 24 insertions(+), 61 deletions(-)

diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
index edd0c3a35ab7..4407828b4fc5 100644
--- a/drivers/iio/adc/ad7949.c
+++ b/drivers/iio/adc/ad7949.c
@@ -317,10 +317,8 @@ static int ad7949_spi_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*ad7949_adc));
-	if (!indio_dev) {
-		dev_err(dev, "can not allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	indio_dev->info = &ad7949_spi_info;
 	indio_dev->name = spi_get_device_id(spi)->name;
diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index f258668b0dc7..6426c9e6ccc9 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -511,10 +511,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev,
 					sizeof(*adc_priv));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc_priv = iio_priv(indio_dev);
 	platform_set_drvdata(pdev, indio_dev);
diff --git a/drivers/iio/adc/cpcap-adc.c b/drivers/iio/adc/cpcap-adc.c
index ba7cbd3b4822..d9ee2ea116a7 100644
--- a/drivers/iio/adc/cpcap-adc.c
+++ b/drivers/iio/adc/cpcap-adc.c
@@ -953,11 +953,9 @@ static int cpcap_adc_probe(struct platform_device *pdev)
 	int error;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*ddata));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed to allocate iio device\n");
-
+	if (!indio_dev)
 		return -ENOMEM;
-	}
+
 	ddata = iio_priv(indio_dev);
 	ddata->ato = device_get_match_data(&pdev->dev);
 	if (!ddata->ato)
diff --git a/drivers/iio/adc/da9150-gpadc.c b/drivers/iio/adc/da9150-gpadc.c
index b99291ce2a45..625e3a8e4d03 100644
--- a/drivers/iio/adc/da9150-gpadc.c
+++ b/drivers/iio/adc/da9150-gpadc.c
@@ -308,10 +308,9 @@ static int da9150_gpadc_probe(struct platform_device *pdev)
 	int irq, ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*gpadc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "Failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
+
 	gpadc = iio_priv(indio_dev);
 
 	gpadc->da9150 = da9150;
diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index 9dbd2c87938c..a6f3746b6f13 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -586,10 +586,8 @@ static int dln2_adc_probe(struct platform_device *pdev)
 	int i, ret, chans;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*dln2));
-	if (!indio_dev) {
-		dev_err(dev, "failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	dln2 = iio_priv(indio_dev);
 	dln2->pdev = pdev;
@@ -630,10 +628,9 @@ static int dln2_adc_probe(struct platform_device *pdev)
 	dln2->trig = devm_iio_trigger_alloc(dev, "%s-dev%d",
 					    indio_dev->name,
 					    iio_device_id(indio_dev));
-	if (!dln2->trig) {
-		dev_err(dev, "failed to allocate trigger\n");
+	if (!dln2->trig)
 		return -ENOMEM;
-	}
+
 	iio_trigger_set_drvdata(dln2->trig, dln2);
 	ret = devm_iio_trigger_register(dev, dln2->trig);
 	if (ret) {
diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 4614cf848535..32cfc4002b1b 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -798,10 +798,8 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	int irq;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(struct exynos_adc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	info = iio_priv(indio_dev);
 
diff --git a/drivers/iio/adc/imx7d_adc.c b/drivers/iio/adc/imx7d_adc.c
index 09ce71f6e941..039c0387da23 100644
--- a/drivers/iio/adc/imx7d_adc.c
+++ b/drivers/iio/adc/imx7d_adc.c
@@ -482,10 +482,8 @@ static int imx7d_adc_probe(struct platform_device *pdev)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "Failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	info = iio_priv(indio_dev);
 	info->dev = dev;
diff --git a/drivers/iio/adc/imx8qxp-adc.c b/drivers/iio/adc/imx8qxp-adc.c
index be13a6ed7e00..427ee9f24408 100644
--- a/drivers/iio/adc/imx8qxp-adc.c
+++ b/drivers/iio/adc/imx8qxp-adc.c
@@ -315,10 +315,8 @@ static int imx8qxp_adc_probe(struct platform_device *pdev)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
-	if (!indio_dev) {
-		dev_err(dev, "Failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(indio_dev);
 	adc->dev = dev;
diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index 92baf3f5f560..dda5182a5076 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -697,10 +697,8 @@ static int mxs_lradc_adc_probe(struct platform_device *pdev)
 
 	/* Allocate the IIO device. */
 	iio = devm_iio_device_alloc(dev, sizeof(*adc));
-	if (!iio) {
-		dev_err(dev, "Failed to allocate IIO device\n");
+	if (!iio)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(iio);
 	adc->lradc = lradc;
diff --git a/drivers/iio/adc/palmas_gpadc.c b/drivers/iio/adc/palmas_gpadc.c
index 7c01e33be04c..3f433064618e 100644
--- a/drivers/iio/adc/palmas_gpadc.c
+++ b/drivers/iio/adc/palmas_gpadc.c
@@ -885,10 +885,8 @@ static int palmas_gpadc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "iio_device_alloc failed\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(indio_dev);
 	adc->dev = &pdev->dev;
diff --git a/drivers/iio/adc/rn5t618-adc.c b/drivers/iio/adc/rn5t618-adc.c
index d6f6b351f2af..f78fc795b69a 100644
--- a/drivers/iio/adc/rn5t618-adc.c
+++ b/drivers/iio/adc/rn5t618-adc.c
@@ -199,10 +199,8 @@ static int rn5t618_adc_probe(struct platform_device *pdev)
 	struct rn5t618 *rn5t618 = dev_get_drvdata(pdev->dev.parent);
 
 	iio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc));
-	if (!iio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!iio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(iio_dev);
 	adc->dev = &pdev->dev;
diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index f583924eb16b..92e5159793eb 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1763,10 +1763,8 @@ static int stm32_dfsdm_adc_probe(struct platform_device *pdev)
 
 	dev_data = of_device_get_match_data(dev);
 	iio = devm_iio_device_alloc(dev, sizeof(*adc));
-	if (!iio) {
-		dev_err(dev, "%s: Failed to allocate IIO\n", __func__);
+	if (!iio)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(iio);
 	adc->dfsdm = dev_get_drvdata(dev->parent);
diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
index b0add5a2eab5..8e26c47edc08 100644
--- a/drivers/iio/adc/stmpe-adc.c
+++ b/drivers/iio/adc/stmpe-adc.c
@@ -267,10 +267,8 @@ static int stmpe_adc_probe(struct platform_device *pdev)
 		return irq_adc;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(struct stmpe_adc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	info = iio_priv(indio_dev);
 	mutex_init(&info->lock);
diff --git a/drivers/iio/adc/ti-adc084s021.c b/drivers/iio/adc/ti-adc084s021.c
index 50a474f4d9f5..a100f770fa1c 100644
--- a/drivers/iio/adc/ti-adc084s021.c
+++ b/drivers/iio/adc/ti-adc084s021.c
@@ -200,10 +200,8 @@ static int adc084s021_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*adc));
-	if (!indio_dev) {
-		dev_err(&spi->dev, "Failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(indio_dev);
 	adc->spi = spi;
diff --git a/drivers/iio/adc/ti-ads131e08.c b/drivers/iio/adc/ti-ads131e08.c
index 085f0d6fb39e..c3bf0ed46690 100644
--- a/drivers/iio/adc/ti-ads131e08.c
+++ b/drivers/iio/adc/ti-ads131e08.c
@@ -807,10 +807,8 @@ static int ads131e08_probe(struct spi_device *spi)
 	}
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
-	if (!indio_dev) {
-		dev_err(&spi->dev, "failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	st = iio_priv(indio_dev);
 	st->info = info;
@@ -841,10 +839,8 @@ static int ads131e08_probe(struct spi_device *spi)
 
 	st->trig = devm_iio_trigger_alloc(&spi->dev, "%s-dev%d",
 		indio_dev->name, iio_device_id(indio_dev));
-	if (!st->trig) {
-		dev_err(&spi->dev, "failed to allocate IIO trigger\n");
+	if (!st->trig)
 		return -ENOMEM;
-	}
 
 	st->trig->ops = &ads131e08_trigger_ops;
 	st->trig->dev.parent = &spi->dev;
diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
index fe1509d3b1e7..99f274adc870 100644
--- a/drivers/iio/adc/ti_am335x_adc.c
+++ b/drivers/iio/adc/ti_am335x_adc.c
@@ -631,10 +631,9 @@ static int tiadc_probe(struct platform_device *pdev)
 	}
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc_dev));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
+
 	adc_dev = iio_priv(indio_dev);
 
 	adc_dev->mfd_tscadc = ti_tscadc_dev_get(pdev);
diff --git a/drivers/iio/adc/twl4030-madc.c b/drivers/iio/adc/twl4030-madc.c
index 0ea51ddeaa0a..fe3b31ec976e 100644
--- a/drivers/iio/adc/twl4030-madc.c
+++ b/drivers/iio/adc/twl4030-madc.c
@@ -758,10 +758,8 @@ static int twl4030_madc_probe(struct platform_device *pdev)
 	}
 
 	iio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*madc));
-	if (!iio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!iio_dev)
 		return -ENOMEM;
-	}
 
 	madc = iio_priv(iio_dev);
 	madc->dev = &pdev->dev;
diff --git a/drivers/iio/adc/viperboard_adc.c b/drivers/iio/adc/viperboard_adc.c
index 1028b101cf56..9bb0b83c8f67 100644
--- a/drivers/iio/adc/viperboard_adc.c
+++ b/drivers/iio/adc/viperboard_adc.c
@@ -113,10 +113,8 @@ static int vprbrd_adc_probe(struct platform_device *pdev)
 
 	/* registering iio */
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	adc = iio_priv(indio_dev);
 	adc->vb = vb;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
