Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 985A5B30FF7
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57EA2C3FAD5;
	Fri, 22 Aug 2025 07:08:41 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2610AC3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:52:04 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so1658339b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834723; x=1756439523;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=49sb8pd+Y6b5PW3M0gBrDMMusN8J4nmn5BPMHLBEa5M=;
 b=LFb6s7M7b1EbMDNXeHp6T5L41cqKi08ge42hTG5n39/Q/02r4NnwraaV02YPuVlmNy
 FZIqpM1zHSkBDGKvMwgwtebMN9fxVaDjXTW7tnrVYwnGIbIXsh9P2a0n/ekxEjmzM60K
 jGg1pYipdksvv3XgPHh+6yB7rc730upgkULH8QGDAQ3s9ford3WkZQ4MW3j0tzQvtOP1
 aOuEiGZefdZigE0JKOu5ldZJ6vmVRGt8gDy7p7U6D55xab8Rs2WFDv+/ziI5pRSp8Xq7
 3Ab3FikxHQIsrOmjhxJ6+p7nhaucdqu+EVzi9GZiS0usk3YBYikc44olmsPe6d5eaQDM
 Q4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834723; x=1756439523;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49sb8pd+Y6b5PW3M0gBrDMMusN8J4nmn5BPMHLBEa5M=;
 b=ngKPecgDIQLZoHxYzWVKLJMm7WK6muLGujo1rJb4wYYtMhkk/m4rl+42CZj/CmnfQs
 bkEXR0XLKsQAPrgwXRC6JNXOv96yfD0gJSm7pHwIaBusuhbcHcBglNSZw+14qJSwuKP5
 xD09uYrQsnfQMijYfM0kQ04SYxDlCmNCiva6R8HcwIwlBy0b0H0Scw2UUfYsIDJdm6fg
 QIqLCIqkTI1/9ncyuEXORY5W9KvSsEP4m7FjLEAYR5WZUq5Fck3toABcuztgbIK3h+Hu
 ioGPzSRTvYo/SyfeS6dNGDp4xrZ0jyvQPw7kuXISCvuZbQgeSI14vtEzz7zll39Btl2L
 04tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXtnRIuGlU3VbQAirQVi0mrlfb2boqkatuaXyyyQzON9MRmGBKy0bYgXKamqAmu3qiDWuVYMu6hg00bg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxcaby4lHGxisS9ShlZ9YlnX3rtjk889vgZ8cW9l4vozq3OLtcX
 CWbXEdwBuuSDEwAzR32I5SQpCjTWrZO3ZzQNAtwMqhilOwpWCyMjOWfq
X-Gm-Gg: ASbGncvx3rjnmtTbU/tBdvlJhk993k+EHokXve5K0Kmwj8i/tg8hyJhBcogFNl5thtm
 t3klIul0WZjPAR8C0z530ZzIxYAVGxb2+9cXxmOvscFPR0JY5kLgpVYUVUNr1RhWBsOd1dOutfs
 AfhI8OjSgvrHy3oEVVLZJfXRS5M46iZ6LRmg8J9R6lwJ26bzTq9efkmQDvc4JKD0ZHxAvB6OxLS
 9HK9/Mqj3Qm2wqDrp+mMd4WFyroTr30Hzt2LQu8yJiTQAqWFFC4OH5xMJMiDvg1O9nZYBm2EV0D
 z8eN08UubbRmDM0Zl03mlOlegEjbZXnUzeDuXah7OHcMjjFWohSmEcaGCwQzu+xohfd0rhjinoe
 LK3OEZ/VI/0X6v43zvSMq0/YK8EoD
X-Google-Smtp-Source: AGHT+IE/XZWblGeCYZs22CUnDKwXULfC+6SOqnh7RXjuAgW/Urgwc5sc12Db+DpiqPeiba2SievDcA==
X-Received: by 2002:a05:6a00:1742:b0:76e:99fc:db91 with SMTP id
 d2e1a72fcca58-770305105c8mr1796426b3a.3.1755834722669; 
 Thu, 21 Aug 2025 20:52:02 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:52:02 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:58 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-10-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=910;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=/52vRgIJUjMO/j9jQkvKz+7tt80vmSfVQHF7sXmO88g=;
 b=aO9X2tBzsuRCvTKvElyomG3RIlmdjR2h4cNhhqfgx56wssi9qwsbgRVsLxnMuUkDukkoN2haD
 KMTw66khfeTCy0kwjT6Jv3/dYxro2mv3JCJumcVZAKzBT0O80Sr5yzs
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/10] iio: temperature: Drop unnecessary
	-ENOMEM messages
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
 drivers/iio/temperature/mlx90632.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature/mlx90632.c
index ae4ea587e7f9..c4bf5dc2f266 100644
--- a/drivers/iio/temperature/mlx90632.c
+++ b/drivers/iio/temperature/mlx90632.c
@@ -1178,10 +1178,8 @@ static int mlx90632_probe(struct i2c_client *client)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*mlx90632));
-	if (!indio_dev) {
-		dev_err(&client->dev, "Failed to allocate device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	regmap = devm_regmap_init_i2c(client, &mlx90632_regmap);
 	if (IS_ERR(regmap)) {

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
