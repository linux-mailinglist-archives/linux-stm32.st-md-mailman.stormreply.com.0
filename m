Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A2A93E86
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 22:00:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A2EAC7803A;
	Fri, 18 Apr 2025 20:00:11 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97DFAC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 20:00:09 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-72c27166ab3so1393806a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006408; x=1745611208;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QlEEHDv/JjD6VH/F564VEg6t5ixWWwDpak4BAWMlBsA=;
 b=2OChE8pf1Nvfd68lnJjZwwB4/8ktAPrW4AsICB/bdMKEFMMrkjPjvADJHMtQdcxdjc
 zm7VDh9IfYMrKEUO/KnQliuEwzYg190AICJKwQzkdSicjStQWZ6Al+zcDd0uIMdZqZOx
 Tgzhw3UtgSh23ttWrf4EPk28scADQ+imdHYsKpSIDZjmKX0Dj67htqz1HHTREwziDRxP
 S4Bz4k5gNaU1IZlce14R/siC7xPEvRdXObSW9Ni1PmAAjJnTWgZsIqFQUFTBSyX/SmTb
 Z3iFTcdgzTi6m9wbBveW34eKn4cGxjPDNVFxuef9/A1s1clyL21CG16sGHAci/nb+MNl
 ZS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006408; x=1745611208;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlEEHDv/JjD6VH/F564VEg6t5ixWWwDpak4BAWMlBsA=;
 b=kzC2bPSeGpTeO7HT+bBY5g0IZUeFOrpGZ50dr5EE2ufB+v29Nl+gR0Y9MnGYl/oW5k
 4MX9WW3+ir5sQWbLuBSChfIWpm5LCtxsRUpMh40xks5E6v4t++FnNryJhrUhuejy/Zya
 2Dw6wOF/VSIx2xl56JLj9wXYICCkoi0O+MRWqp6+sDIg+jUNEqo1z42Lgwk6USaiZNbn
 y23Nxyq1qvMJsgCePk/5W/6BVi+Cp3k1K9hnwD4b6AVT83sFcq4iUIIEe/aa/2Po3YqN
 htJkbhBGvRYVQNsAkhPCRKoiRNnX/aFMQ1wACXrEfvWpwOeGJHcvxCcAT8AzInIqAqhq
 5F8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYHnT/GPGYcSWrs3kv9lVQfy3dNDiql8j0H2LbH08VMtVO4iPsR5rB2el/tftmChLsRc5SFYsJsMQb3Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywa9OIYI4Z5fZB0ApmXAtD59gsdd23VYrvVpZ7UMCx/5jNdh5BB
 fRll25rNBs4Pz8UMBwbojPLKK5yt3vYLdK5pQBKd3xxigzBiZhR12IihWVvMguw=
X-Gm-Gg: ASbGncsbd4qZUybZjzEBcTMu1rVexi4i19u3WlLE6ybUda0lWK/v3mOtylbtzv6bi9X
 l+07qS4oFo+gLuowUI2liOVGy8cisvbkeRwQKeVJHG9XKmQhTY5zxoxP3nnTj0I41Z+rIob+QqT
 +zyQ5jrM8gR4XzOFHxXQYy/kVVQNZcUgnsNZuj5MpS0dIFu4A2o4QT7mJKmvMF2qET2Dznz4Rbk
 etIVheG6JydwVwKG1h4w9DxIEWEEabo4F3pJsWFvLh2lfISpJLrXJboorRsnVMnb6ExPUJn/8wr
 jb9SmfM23k7NJluJab6wsDhafoQpCQwFNCpgA2DraQFVryC6v9p/8dAaCw==
X-Google-Smtp-Source: AGHT+IGr6jWJlv3BH4w4Ps2j1330V0WmKydx70JnXcNoazpPHvVerIJTYwy+J7D4DhPX9Wk8OvfSYw==
X-Received: by 2002:a05:6870:ec8e:b0:2d4:c55b:199a with SMTP id
 586e51a60fabf-2d526af63cbmr2074229fac.18.1745006408488; 
 Fri, 18 Apr 2025 13:00:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 13:00:07 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:29 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-10-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=anywE7XPQeNCDKeK0PUagrE9N3D2Cd5D3ok+OCQfyOY=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8nzp0+Cmfo0t99KU1QNh1dT37rrLQG2SzNH
 U5outJwJB6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvJwAKCRDCzCAB/wGP
 wKuNB/9sC6Bs/gHTswHlJCsOQM/Cjv9JBeFqLqwPG/EH6lPVnuMM2r0CjXLaKZ6Sod/kwk+E4pt
 PNtFh4rt+VvxCpXg1H0wPTud1mMFV0tkDA7sJwxDGX3Z94mw+p7WvzEoCCCx9HSBkorH5YUMaBP
 FCGeNDyvZQ9+L3skA4biUuoQKswoX/yqxNlCaGcY5dG++zXclH3PsId+6ITHnGlrGoHnpFcs0Tk
 2lRJbQaIhxof9SiZNt0q9xABQZsm6NFC63JdQGq9OgxSD7qaa/0W45hSH8XuZCCJndZw/VVEDwj
 Yi1sy0l4M68NpXKzIiV1vXzyy+beWErhT1Jlka5PNTGLOmpl
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/10] iio: chemical: atlas-sensor: use struct
 with aligned_s64 timestamp
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

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/atlas-sensor.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/chemical/atlas-sensor.c b/drivers/iio/chemical/atlas-sensor.c
index cb6662b9213740f4a88b8412e6a0f01bc5a314d6..a67783ce7f1b68135e05d3afc05533d400d4a052 100644
--- a/drivers/iio/chemical/atlas-sensor.c
+++ b/drivers/iio/chemical/atlas-sensor.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/trigger.h>
@@ -91,8 +92,10 @@ struct atlas_data {
 	struct regmap *regmap;
 	struct irq_work work;
 	unsigned int interrupt_enabled;
-	/* 96-bit data + 32-bit pad + 64-bit timestamp */
-	__be32 buffer[6] __aligned(8);
+	struct {
+		__be32 data[3];
+		aligned_s64 timestamp;
+	} buffer;
 };
 
 static const struct regmap_config atlas_regmap_config = {
@@ -455,10 +458,10 @@ static irqreturn_t atlas_trigger_handler(int irq, void *private)
 	int ret;
 
 	ret = regmap_bulk_read(data->regmap, data->chip->data_reg,
-			      &data->buffer, sizeof(__be32) * channels);
+			       data->buffer.data, sizeof(__be32) * channels);
 
 	if (!ret)
-		iio_push_to_buffers_with_ts(indio_dev, data->buffer,
+		iio_push_to_buffers_with_ts(indio_dev, &data->buffer,
 					    sizeof(data->buffer),
 					    iio_get_time_ns(indio_dev));
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
