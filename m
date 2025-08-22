Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5474FB30FF3
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EB01C3FACC;
	Fri, 22 Aug 2025 07:08:41 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 311AFC3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:51:21 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-32326e09f58so1939963a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834680; x=1756439480;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=np6SZ5B7upvOBORmSoVmVjKcF6KBdFBAeJOHZZ+4P0U=;
 b=V2h+GHDrj6wXHoMAG6oYHXiesqJqK0aTqAtnDvjQpeAhIRGkC/dk3GpTf2TZ4hLkSc
 /zTbWdMDzHR0ftysk81CPwSHQzekwZrvF94pusNbgk/W/2XG1makVoM5zzK6xMKOBM50
 /x9GDOtv1nPlEOaWqAs00zfdaNotz8YbakQSPu909SyqV6oI10iwCVlXPIzeiETmpSOn
 mVM0vhaj9GbXAps2nI9YjA/JPqUnEVzsugJeWBetLTatfSlEknMNKtk0823dPXHT8WHC
 bS4Zj1qiGwzzRHi0D7KdRxVxKChdNdpKodImbXSbZ7TUaEU+DagRZjCPywObyhKhwpVK
 TlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834680; x=1756439480;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=np6SZ5B7upvOBORmSoVmVjKcF6KBdFBAeJOHZZ+4P0U=;
 b=a1x3BQ3v0zpslLZOZ+mY2gKC9lF15S8kQg2657S3L839/pLY8Hr/HkDYS0hhIexqcT
 NyUGQw2kUX6yTR3vLWaVsDQvOB9p6qlXa+k5ioG1vAVoZ3IpNo8852J8LpFPNl2KguIt
 awX8/wClp4S1EjdQNYkHGvD3GCdHRBoNwK4tpbD+mYKZguQ61kw2uhMalOnk5/pInXy7
 1CcSed+Y2ejn5/PKuT15YFafFvklXSguC2/Kzc453KceaaozNdqKtSELNyLgMO6sg8CJ
 47FEMS3ABM7H4nM7Ezwsto6AVDSc9NPzPi5CpUKbQKKjHkNNL8iG9J1lOsPeIUKMlptt
 BV9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrKOIfDxFqxi0QqfMFpMPHksM3O8FzNPLJDMa574P8snEourfCtOsD5uQPp+AJkV9rG4riWefM8NGzDw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwFULk3YEJri+7SRaj5u/rC44/tawQhmi4PJY36h8wWAVmcfx2e
 HekPZ/viJs0z6ns1tdAnkGpxEizeUtaq1OAjeXUHxY0w6teDBT7exoZv
X-Gm-Gg: ASbGncs/iYSujGBtl89oej004SO2SkPQOXuagy9dlmu3uBdI+9Q+HZlRopN+QVXYNNS
 kPRBUq8Rbl3h+9QyhoaLqQaRKXf8pKiyT8QtGjBtrUZg6rB4xo/CDl5lbjkIBpzb1ARmrmtNeuj
 BqpiVcVAeprU9l1j3xGmLkJ2kgIy4Gcs0liq8/aVaMQY7IqesHkXh9zscrurBGyM7jNscN0anZn
 JWPZVN5hcZZ8c+/+diS7M4/IOz9SYezFcEECK//h+pcCSFWQ/ENDnAZ9daU9ptnzaMz0mp6uUgK
 D5COFLkmMXLbUdr9uG0iTS/Q0iZkt9rbZRGv6pXkywpXxsPYE7CNYIhebS1fCmFjalz2z0ZYCCt
 mpQHMQqs5JyCHszNP5EqhPEEUPjOR
X-Google-Smtp-Source: AGHT+IF0W1wMk0TjpqOG5yWpDYSHE+kGycH9vB3pAPEZix8kJbdhTkbj67P4mBR5VUeKZQKxuFXy/Q==
X-Received: by 2002:a17:90b:2f47:b0:31e:cc6b:320f with SMTP id
 98e67ed59e1d1-32515ee3cf2mr2179359a91.5.1755834679733; 
 Thu, 21 Aug 2025 20:51:19 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:51:19 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:54 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-6-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=855;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=pH5Ai2hUrCDisN8BOZgbmkwzCO0ZlcGH3OL3twprr98=;
 b=Y4ggOYOq64L6yz5Aop13NAzu+enc9eQG0wtQN7sAaQGY/CtYvE7KKRmnVjQ/LyhlGnFPJNk+s
 4PGO2+PkJQrCiL+ev9sp3RlbFbdj4x77C3RhVe0TX59MpA67qjAQTzb
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 06/10] iio: light: Drop unnecessary -ENOMEM
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
 drivers/iio/light/stk3310.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index deada9ba4748..c7ccf58e52d7 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -609,10 +609,8 @@ static int stk3310_probe(struct i2c_client *client)
 	struct stk3310_data *data;
 
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
