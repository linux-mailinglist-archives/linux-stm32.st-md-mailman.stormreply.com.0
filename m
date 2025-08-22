Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 415CEB30FF1
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6641C3FAC8;
	Fri, 22 Aug 2025 07:08:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37725C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:50:58 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-76e563b25c4so1233999b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834657; x=1756439457;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SPzGBFBfr9XUbrPfoGwRs/BjXqUrZ2N1GqqaLsSssIw=;
 b=J93Pqa5MLO8wb8H0ihMbM7JdAE0e11kvpo2oDngCQ2a4Mu7X5mCtTH2nyQjR5MiI7p
 z2H9MvQUfJt2Q3NEe/2/b5cP5wKyEH6fcAZs9IPWVg/bna1DVDaku4v8s7zEKV0A7r0s
 z+n1L1JKvUqztpQARxEnYfR9TIEUlgRpR2bIwq1SdTS+v3WipgIlgcd/lTprDFADfdME
 yU7PYy09S5fsxhsiz0BxIOfrytxDtRdHQ9fyExcm+Vw8ZBezgQmUEPkK+GZKALWQ3QDM
 uvnb8nKGGPBxPd9jGu9L5MdlitZpKE5Dq+9srAPdTjs8jZ7k9Ux8u9zYhlmGOue4oENX
 1IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834657; x=1756439457;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPzGBFBfr9XUbrPfoGwRs/BjXqUrZ2N1GqqaLsSssIw=;
 b=LR4UcBLx/xQjFEkA/KooJaREJOMp4Nj3oUNqLKMkipFZTWET7EI4h10fwNLZjJNB1B
 1YP+cQGdPP5xSlLm6y2T6eqWpR9Yyy6h065UlD0Bv1VzWY8zPItaKvpH3lJYaUvun4fl
 VUj7GUROU5WjkHrZVl2n/vCJ06W6Ds351rib6m+HRukbbJ3Rra90lvbTDk7ynNiQXgvd
 h2kVDZaOJSUvtwd5PMREcK16dstHM7r7wWvmmTHmZSFkVbsCsn7lMo/o/0FcKyWpDCeN
 nkAP0/CsNVmHAlB1JWB4JZkM5pYNTXf1G27KBdxuexCr7QNR82WtFMyqOxstzIoZbXzH
 HUOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS0KL9gwOrph02vodK6Bix34SvbXDwlbFOZC6zFaP+snXFYKUA3qM8wSJt6MlNVTP7cAqmZB7xPQI+Mw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwSpIBXLR91M7sS0qXHLcdCcHb7Wo9LLKv7v9ZTS9Vu+AqXqVXy
 oRrGU3U+ve0LqjBelxvRlwTBsAD2gJHGPiJMBd7EEsMHiks4C+RiA39+
X-Gm-Gg: ASbGncvxnBjaFdumhWgGaUEg+PVMKiiJNLkGdaZGeQaTM6A4Y+ICCi+pHHbiWpBiX3v
 rwzI5wLBHuxH1T69WIPa5Jdzwhg9hF7q5Q0A4jlUIViW9F8A83hCNHHIhiDOR7VK4qgKDOfMBum
 j7imH1WaLSTueXCMTbZPZI7W7ZxHxBtEonaxcON4xtp0r1WUHo/Y1ObYtffSc/k7gihKxXlzXqZ
 B6d5aCnS6RRNxWW0+JvAdn14cVzLDVL5AyrnvOB5oA1Mzbc3BsaSRvFjCRGKb4OjvJwf5Oriphu
 8p/4kgHhMyEIBKSROcMMvAE77Vm3YUNv0twaRK6VJLtKd9freaumWO7UYV+pssyN47Vdafk6Zp0
 eJ48rI/TZEQ0GkJLTwfl6+8HAageG
X-Google-Smtp-Source: AGHT+IEDplbG/6XF12lPxx9itIgjz12WwucZKRq9+cOsqGQDlvGhf+WNacIYrhLVVvaG53XeD5NjCg==
X-Received: by 2002:a05:6a00:8d4:b0:76e:7aee:35f3 with SMTP id
 d2e1a72fcca58-7702fc182a8mr2167240b3a.31.1755834656645; 
 Thu, 21 Aug 2025 20:50:56 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:50:56 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:52 +0530
MIME-Version: 1.0
Message-Id: <20250822-enomam_logs-v1-4-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=1430;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=rO9VuR/oVVGoakCjeEjj+XT6+ebILUa0tyZFOkIL2Qo=;
 b=4b2jPbSe8j92/XCjL6XXtT4A9XSafT+S4e6mVe2Kd2YIm/HD9yFiVI1p7o9NlKstS6ok8mzyx
 C9ICz5YdiGjAlatKIORLRTH1V1wdnZKz0xgwurThCEbeEno2qe589S6
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 04/10] iio: health: Drop unnecessary -ENOMEM
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
 drivers/iio/health/afe4403.c | 4 +---
 drivers/iio/health/afe4404.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/health/afe4403.c b/drivers/iio/health/afe4403.c
index 1582cfc03579..8e5db2235de0 100644
--- a/drivers/iio/health/afe4403.c
+++ b/drivers/iio/health/afe4403.c
@@ -531,10 +531,8 @@ static int afe4403_probe(struct spi_device *spi)
 						   "%s-dev%d",
 						   indio_dev->name,
 						   iio_device_id(indio_dev));
-		if (!afe->trig) {
-			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
+		if (!afe->trig)
 			return -ENOMEM;
-		}
 
 		iio_trigger_set_drvdata(afe->trig, indio_dev);
 
diff --git a/drivers/iio/health/afe4404.c b/drivers/iio/health/afe4404.c
index 99ff68aed27c..11a0f465fd68 100644
--- a/drivers/iio/health/afe4404.c
+++ b/drivers/iio/health/afe4404.c
@@ -538,10 +538,8 @@ static int afe4404_probe(struct i2c_client *client)
 						   "%s-dev%d",
 						   indio_dev->name,
 						   iio_device_id(indio_dev));
-		if (!afe->trig) {
-			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
+		if (!afe->trig)
 			return -ENOMEM;
-		}
 
 		iio_trigger_set_drvdata(afe->trig, indio_dev);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
