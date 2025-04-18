Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFAA93E77
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 21:59:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CAC0C7802C;
	Fri, 18 Apr 2025 19:59:46 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C4DEC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 19:59:44 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-72c40235c34so620320a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 12:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006384; x=1745611184;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YmmSWVD/KnfQRR0lXdQfI2NY4p1aeZqi5eQuD3R6P3s=;
 b=rQoZj0YHxE7ukLAg5bC/doyjJ63Z9nD23W2FykHv58t4e9bD4ky8SpagI1AUMETW9y
 fo0UM5FT6WG5yo85wG5FGPhy+Hs871Vaj6KPfiuYsys8vlD73Hq3VF6EXthMzNTZnYLh
 ukSlVf+noM2klf82VsDG2qQ3lCrFmIR1UkVMPrBgo5Lq1wtU36YH5QXucT77DUl3qvkF
 E8xk5t0vyB6HRCglrRLWPbQEfX1BiGXf6dh97eBI/Rah7ttZuFuKz+NXBdbLZQA9uIeN
 E/g39GCml3Fvw7+SdEN14umRyFHlfqQNdCE+6gf3qob1pAAFMHo8VFt3i0IyDUycdABL
 fU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006384; x=1745611184;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YmmSWVD/KnfQRR0lXdQfI2NY4p1aeZqi5eQuD3R6P3s=;
 b=ncczk1jCD48s2p0hHdO7tb2sB9sl8njaLQY+znQuyDQdNLOD6ROhyrKLhzq9H+bu7n
 TshHC3K4AD5eg0RiaSmGfQOipmCHDTeZ1cTpQZ6CQE95k/qBpiWki1PDC3TJNEQexW4f
 8axGjqz7gLAcTFXQe79d/I9Rdhk+fxcdhsvK2xtGBgX7aj7keHCaAB5UOeWaMm3v6nne
 /E819yHfGbYTcK0VerjknERQq1rH95fSdTofwCasCytZPtJG65DAlKiXiTZYtEgaI06q
 mqQ1UhZm0G7SazgqQXIx+Ta7gHGDFsvcuYGNJdmatRjRVMSiSm+O4OH8Gf63GZqc7q+1
 9PDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGsG0cvLntMkwGP/2JuSCceVafAFFO/MSzET7CrXw6NpLyTRA9r2XTCrBa223yYNoWTAAHCE+9u2zA8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwmJoFDrSkz0sGS+jWjACM1hMRIAAjNTXF2DYOsrZAtSiPd9bZV
 agbCQMshL/fBv37XMEnPXkV29UEGgvH6QaLF0UyHonXSKC66ANEIRa7rLHJSqto=
X-Gm-Gg: ASbGncuswlESAE6Xp2kJDIen7hQ5Ajk/tRHf+ZCYoWQKIt8i7gZYQMzxbF9GZVtAE66
 Fb/LmHZZK8fLAjnJ0Enu2NkytwcIiuZLVtzLteYnWIWtrPATrW49EPHOm4mDianyNfLr2STKJHx
 82RFPk65MM6p70FJ3/eojfmxBQpg4+IhLRHAxkoeMY1QjXonW4Sgtuwju7lfiCg++zbpG8tZsqv
 8+rHJHIA5I4r3KBuJF8u6co4NDx1h6FEUKCCOR3dg5A5GgqMYATX7XmcmTpu58Y5mH248VkDBCl
 ql4Q4F4JiHpnSPxdEv8wOO5r2LocbneH54t0X4ctj6yT04k0Mj7vijkJqg==
X-Google-Smtp-Source: AGHT+IE1JV++hrIuNq9D0jBDQ/Srd/Ed37K3O3K1ORXsYIsyBfKxhQg+AMkCv8MVywxJHp/QiJCrhA==
X-Received: by 2002:a05:6871:d80a:b0:29f:97af:a1a0 with SMTP id
 586e51a60fabf-2d526e52d74mr2078884fac.24.1745006383679; 
 Fri, 18 Apr 2025 12:59:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 12:59:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:19 -0500
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANyuAmgC/x2NUQqDMBAFryL73YUoiUivUkoJ+tQHNUpWpCDev
 Wk/B4aZUwyZMLlXp2QcNK6pQH2rpJ9jmqAcCkvjmuB83Sm56pYxImt8c0oYXtZ63bnA9rhsOgK
 tRx+Cd0FK5ifz8188ntf1BWOJoylyAAAA
X-Change-ID: 20250418-iio-prefer-aligned_s64-timestamp-fee64ec55405
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=UBqn5bW8JlebHL48mzy3xeZcYGQz9C2ibThs3AwnfeA=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7iX3vVh6HbKghORnQaUNUs3qmv+Z7Wgd/GA
 jKkcJhJyz+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu4gAKCRDCzCAB/wGP
 wNK7B/oD9hYWgmMum8g2S3GqXecVvn47S0oXLC6LbK6795AZQkuclOHHYnzART6dICtWW+OsbU/
 53u8n5rr4nLwY1M0qnPWJjrh/SQnett1Z58YOW+zbajkwDAVxnnkb+PA6KC1QdLPRHlwr78+tFY
 RiBokIVauO+51eK8ktGUgxF75cdFs9iIPKi3d46uRh7RrpMzgC+vpVOH32B6m6UUY0L3S+EU9tj
 FIpn2YwXXei8wmFT15vzNiZ8YB3xvPCwILzuirKOJ0aY7WZTBA2hx3G/2FixxUc9vWOrcquoKy6
 IEo4Q3X5jLyvWmhxPiUfP7nxQqNqrrTNO4DD+B+TRc3Lv7Fp
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/10] iio: prefer aligned_s64 timestamp
	(round 1)
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

While reviewing the recent conversion to iio_push_to_buffers_with_ts(),
I found it very time-consuming to check the correctness of the buffers
passed to that function when they used an array with extra room at the
end for a timestamp. And we still managed find a few that were wrongly
sized or not properly aligned despite several efforts in the past to
audit these for correctness already.

Even though these ones look to be correct, it will still be easier for
future readers of the code if we follow the pattern of using a struct
with the array and timestamp instead.

For example, it is much easier to see that:

struct {
	__be32 data[3];
	aligned_s64 timestamp;
} buffer;

Is an array of 3 32-bit, big-endian raw values plus an aligned 64-bit
timestamp than:

/*
 * 3 words for actual data, 1 word for padding for correct alignment
 * of timestamp and 2 words for actual timestamp.
 */
__be32 buffer[6] __aligned(8);

There are plenty more drivers where we could make similar changes, but
this is enough for one week of reviews.

---
David Lechner (10):
      iio: accel: sca3300: use struct with aligned_s64 timestamp
      iio: adc: at91-sama5d2_adc: use struct with aligned_s64 timestamp
      iio: adc: hx711: use struct with aligned_s64 timestamp
      iio: adc: mxs-lradc-adc: use struct with aligned_s64 timestamp
      iio: adc: stm32-adc: use struct with aligned_s64 timestamp
      iio: adc: ti-adc0832: use struct with aligned_s64 timestamp
      iio: adc: ti-adc12138: use struct with aligned_s64 timestamp
      iio: adc: ti-ads124s08: use struct with aligned_s64 timestamp
      iio: adc: ti-ads8688: use struct with aligned_s64 timestamp
      iio: chemical: atlas-sensor: use struct with aligned_s64 timestamp

 drivers/iio/accel/sca3300.c         | 18 ++++++------------
 drivers/iio/adc/at91-sama5d2_adc.c  | 25 ++++++++++---------------
 drivers/iio/adc/hx711.c             | 11 +++++++----
 drivers/iio/adc/mxs-lradc-adc.c     | 13 ++++++++-----
 drivers/iio/adc/stm32-adc.c         | 12 ++++++++----
 drivers/iio/adc/ti-adc0832.c        | 15 +++++++--------
 drivers/iio/adc/ti-adc12138.c       | 12 ++++++++----
 drivers/iio/adc/ti-ads124s08.c      | 18 +++++++-----------
 drivers/iio/adc/ti-ads8688.c        | 12 ++++++++----
 drivers/iio/chemical/atlas-sensor.c | 11 +++++++----
 10 files changed, 76 insertions(+), 71 deletions(-)
---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-prefer-aligned_s64-timestamp-fee64ec55405

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
