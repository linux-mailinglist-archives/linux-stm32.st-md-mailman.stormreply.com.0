Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A8B30FF2
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5A5CC3FACA;
	Fri, 22 Aug 2025 07:08:40 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86979C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:51:10 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-325195d1b1bso348977a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834669; x=1756439469;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hqrtxAz9cctGN9u8jlxCJdnxps3sEfbBI35+GThZJ5o=;
 b=YSQ8enGL4mqPbj63ETM/o1UU8kq8wVXO0J+UDAgirnIAJSkeLHTOBFlLenuvOfReEp
 j6A7qAv51bFA94xavFaIw2trhzvZjd6+0lR43mwwOTvt5omFoNwHv6/4FpvDVJG7jYBo
 vcIUyPg8b5uGwikQENLkt0ZCFwVsxSMOhM9NxDH+VeQEfhUa42Hjy9jvievR34qd8Z7G
 RoR157IUQjK/Qbo/Zm9LCAhKyi9o/mTmbCK6SksFnM9lmKlUKMqarBS6ZkQqnUxrI/Rv
 X8G9naE5dWpTqOVlk6DabD/zOO1rDjzaLR1YVf+exJiViKbF86aFR0nxmyyAJPxYhu4T
 LV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834669; x=1756439469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqrtxAz9cctGN9u8jlxCJdnxps3sEfbBI35+GThZJ5o=;
 b=bql1E8Vm4qyTFSZ1uBQ+WoYLoxTf2zIdD3egHG059hdW99LVMSs03g1q/ilFbWmMs9
 44oWcp6bLiJa4nEHCuRyff0vc5WRh6YPa+PfykyD+NcrhycpGYNrueCV6xuuOi4cCjm9
 dLne0TEMoVVhEjPFkjL0H0DjqBSyfd5RaVnbIR2MaQyONws4V2JaMvjh7y93IifbOHml
 8xeNB38ysJjUp62shmRvgVrzKBHvmBrJC2agvUxXK2wCNn04xQkeKhpRDAJZE8Pq37K8
 vjQnoAwXqaEgUxCmgzgDvAgZzz7XzmYRrro3BDS5bi5o3eM4EOi56MAgTVbTlFpttAQw
 gcwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0PxMdUaC/hyr8Xk4zYBYk6juM45z7x5CDLcA2QvWWE+CdmzYkbGjUzcl3Knnai1bNjYkOiEcsaegpHQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwrsVwT3qDx2cPg93UVe5pZAKCHkJctmED9rabajSnPYt7QTtE1
 k8mtEYJ/FF1brXtEgfhBEitJOBfpf4CATkSJbcKbvXetZknh35MQEsuv
X-Gm-Gg: ASbGncvUJ1r9wNRGpY3yTybk1W9yuwxbxpWUNIQsImvwt/qP14lXO2ajJ5pDSefKp1I
 iGne1YFG9cNmUrL9vKWQc1DzKtBRy5qnlKKnUVT1zgRkaEojLOkPbf0HYEv/u50PVZjulLbFrPV
 iSVDREfolKwIKNkdiwcIngxfJlSiBfQjAhOk/575lvoM+w31fLuAiyD2+Nk94Y4JFXFfMMdrWEj
 yrVD+hgFGVOmjFuX+xpHd2WeZcpu28Ptxyzxfy6ZkspLJj5P0objdJGMvlpyu7xfqoo4YVBtAZz
 YMIDX1WwBTZHBrcVDazLYdtmVQFEO9KtMHmSj39ZcB5LbK4SboJrewIT/Q08xoiQIZmPlEsjFie
 ie8BMcph12g/1X0CwzcMgHOuZiIos
X-Google-Smtp-Source: AGHT+IFlyHvge1r2eEDywa691vO3EH8Zw57rYlejYo//N9dseDi4JFrUwk2dU+AEjPu1HGJfNaSDAg==
X-Received: by 2002:a17:90b:278b:b0:323:7e7f:b8f4 with SMTP id
 98e67ed59e1d1-32518b80cfamr2288523a91.37.1755834669027; 
 Thu, 21 Aug 2025 20:51:09 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:51:08 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:53 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-5-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=1404;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=c8hX9rvl6rr2dhjjNLkJgB0+zkmehac1mQEbRhCM7pU=;
 b=ZgaeM24zC7IN3+he8TY2T9s8YSEkwL7SoNKuSaTSjAtLL/67LBM7qENhJcDRsU+1mIQixXTl8
 Ul2eMZUGNU4CG0gfDDCnLldXt5ixt1iTh4jFKaiKgitF507++7QKEdv
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 05/10] iio: humidity: Drop unnecessary -ENOMEM
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
 drivers/iio/humidity/am2315.c | 4 +---
 drivers/iio/humidity/dht11.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/humidity/am2315.c b/drivers/iio/humidity/am2315.c
index f021c3e6d886..02ca23eb8991 100644
--- a/drivers/iio/humidity/am2315.c
+++ b/drivers/iio/humidity/am2315.c
@@ -224,10 +224,8 @@ static int am2315_probe(struct i2c_client *client)
 	struct am2315_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/humidity/dht11.c b/drivers/iio/humidity/dht11.c
index 48c59d09eea7..cc8f02f3b763 100644
--- a/drivers/iio/humidity/dht11.c
+++ b/drivers/iio/humidity/dht11.c
@@ -296,10 +296,8 @@ static int dht11_probe(struct platform_device *pdev)
 	struct iio_dev *iio;
 
 	iio = devm_iio_device_alloc(dev, sizeof(*dht11));
-	if (!iio) {
-		dev_err(dev, "Failed to allocate IIO device\n");
+	if (!iio)
 		return -ENOMEM;
-	}
 
 	dht11 = iio_priv(iio);
 	dht11->dev = dev;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
