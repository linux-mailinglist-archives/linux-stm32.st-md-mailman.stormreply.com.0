Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DEA77751E
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:59:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 084F1C6B474;
	Thu, 10 Aug 2023 09:59:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6C72C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:59:03 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3178dd81ac4so661118f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661543; x=1692266343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OyZohlw6gTKzojkyNd13CC0T/G2VwEgEGSl6K82xhVw=;
 b=kPoib7OprwN4AKPrr0KxUaWGgeFgnFlK9LaobUpxjQMqx2tbFiGz52D9fQZ6A8LRkR
 GOCz/x8QbujG99dOHRyOW705kiQ95NvqD/JEaxpuGc7uk8+m9CMYO8e3NdBtTRFWgOI9
 rf1EZhcmo9AMJjGngTByavgqVENOgfgPg/kKTegyzQ46fI9yO/1RM+46oSlHWi9P1z/f
 183VoIrE/PlNo018lajk2rQaW7br5wfQFgoNRnNnIBxvMmvCIy0bjd4UIhp7d6gIaE35
 f4dL2WtNzwB3NOnpB/u20SOZ1rXesFtHZFMmyi7hhLcj0st1LMs9ajP6M1M8Gpi/rcdk
 NaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661543; x=1692266343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OyZohlw6gTKzojkyNd13CC0T/G2VwEgEGSl6K82xhVw=;
 b=kXx805BMnxIJKcIJRULKZMH0+O5Sb51uw2beHHSlUK9EvvyR2V/OkGR43vf3uANIpj
 sWgYL9eG7h54kBT/VPRx8E+5t/E6PL8Gc+oX4mCVznlfc5g5+65bRIVI17jjLGn+x9yf
 xnMTV01F5LJ94QyTdozohhZPADvZIu3mhK6gxFpQDB0n2RGCHWyaGVAcuqhlDyowrFAK
 XOikMUpZ3PEfJBaJKA+wea7I619t6H/548KZJfpQXKW45JM64P7rq+0BZF6pABHcKiNg
 dTCy4zIZyzJGE00dQUzNa2wpQadIronFivRyNmcElH73FKGSQluMHlX1YUI0gLuMF98L
 4ZxQ==
X-Gm-Message-State: AOJu0Yy1gLYsZ8gIgVfM/w19Ha4sbW2Np/HVzcgZXTS3LxbsgUjeyQsi
 BetSpdOQiqx1Yejivq4BpdEMyg==
X-Google-Smtp-Source: AGHT+IGzc6mKzjbukRRfGvmwrkuAhc1MC6bSGvhSgb5jSnTolx9P1KxprDSlC1+TOYUcRyOHsUMQFA==
X-Received: by 2002:adf:dd85:0:b0:314:3985:b291 with SMTP id
 x5-20020adfdd85000000b003143985b291mr1613355wrl.15.1691661543602; 
 Thu, 10 Aug 2023 02:59:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm1621372wrj.33.2023.08.10.02.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:59:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Date: Thu, 10 Aug 2023 11:58:48 +0200
Message-Id: <20230810095849.123321-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 8/9] mfd: wm31x: Fix
	Wvoid-pointer-to-enum-cast warning
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

'type' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  wm831x-spi.c:36:10: error: cast to smaller integer type 'enum wm831x_parent' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/wm831x-i2c.c | 2 +-
 drivers/mfd/wm831x-spi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/wm831x-i2c.c b/drivers/mfd/wm831x-i2c.c
index 997837f13180..694ddbbf0372 100644
--- a/drivers/mfd/wm831x-i2c.c
+++ b/drivers/mfd/wm831x-i2c.c
@@ -36,7 +36,7 @@ static int wm831x_i2c_probe(struct i2c_client *i2c)
 			dev_err(&i2c->dev, "Failed to match device\n");
 			return -ENODEV;
 		}
-		type = (enum wm831x_parent)of_id->data;
+		type = (uintptr_t)of_id->data;
 	} else {
 		type = (enum wm831x_parent)id->driver_data;
 	}
diff --git a/drivers/mfd/wm831x-spi.c b/drivers/mfd/wm831x-spi.c
index 7bcddccbf155..76be7ef5c970 100644
--- a/drivers/mfd/wm831x-spi.c
+++ b/drivers/mfd/wm831x-spi.c
@@ -33,7 +33,7 @@ static int wm831x_spi_probe(struct spi_device *spi)
 			dev_err(&spi->dev, "Failed to match device\n");
 			return -ENODEV;
 		}
-		type = (enum wm831x_parent)of_id->data;
+		type = (uintptr_t)of_id->data;
 	} else {
 		type = (enum wm831x_parent)id->driver_data;
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
