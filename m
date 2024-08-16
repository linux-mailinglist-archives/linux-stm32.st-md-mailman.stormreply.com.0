Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 632C695470F
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:55:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25B19C78018;
	Fri, 16 Aug 2024 10:55:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 594B7C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:55:04 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42803bbf842so18564325e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805704; x=1724410504;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sr/Bjb9gFmI1Ph7TbTdrGjwvQKhvfIr9sm0jS+XptdU=;
 b=UdGNxkQq9+dNSgYq88FFDQ1gGhW4BJVs5De9q238Q7qHjnuAb6CAT99xNrBhW2mOl9
 ytiyMK8sjnc1r+1s1p0nevaAmLwgElMbjv+g2Tbq/S6SV9ncnmdVaJazT/L0C2plBxiz
 O78R4AwK2tJ/PxGrFgqxb2W+f9HxSt8Svy2xrGmIPyqutwvnMHWyCAfs8crrZ10Qy4p3
 PFU6dUooJITu30hzr0QHnVtwmnL6DzeNtOcaIOnRJHpkPmW01yzL9y5doWtbaGUNtO9B
 yNHnDDGVxPnb0tOt/aXPNPJPrxgzxT8D8oOn1gq4ENJ5NLbjF++9MNURs8NZqmmgoS3C
 CmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805704; x=1724410504;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sr/Bjb9gFmI1Ph7TbTdrGjwvQKhvfIr9sm0jS+XptdU=;
 b=HgW6SXMyJd6vZ+VTdek6npFwVwqkBlX3YRIaDdqrO/gEIOVtt5cvctaDK/7sQZ89od
 +bbkNJrg8VZqHjcpQx0b2m3s8x+R0uVVV9tPT+MGXscFHCZuyjiBrH/Uw65OcqYimpRL
 jn5+bASq2uQiq/geq4cw/1NZlf9teIg10ojKVqdCl+nF50HmcQShX6Lb9TDSulKK7ReZ
 /GpFNMv5n/gXw3/pkYPaQf3eDdwT369qTycZSUG7sz5Sqa+TxGQnQLCmeXZgW8359vS/
 xqiNGe/q8LEBJZYCcvqfJYNjCpbg+W15DroW9s+GyOJBvEBLSqicrcEZDNAyMlKo5VdR
 DYpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX76p79n4Gn4obqIzXOAzWpmguGyVCx+bkGy+g9KkXa5glXihBG6CDtHR2PBB0Vbbxe/IYm1mSBDfXqvtwzDdF9nXtJXDsIs8ZSJZ0Apn+4LSUutX3xc5Nh
X-Gm-Message-State: AOJu0YyUc0kzJQTqGLKw/8CL5qiErZwtcvEeCmVTGJXvSB63ndy1kko5
 FQCNX+BJ3d4B2KBHbXjSiFZ+fhR9YdpKFvlMGfI+qsIbG74RbzSuwnrKIgBsnEY=
X-Google-Smtp-Source: AGHT+IHb5s6ZOWiwXyP6F+jIPWHsZbVQ1dRLhQ/L4QjqU83lUzy6ofpXe6PirIt9dJ+aARfVbvTAsA==
X-Received: by 2002:a05:6000:ec4:b0:371:844f:e07 with SMTP id
 ffacd0b85a97d-37194315732mr1838165f8f.10.1723805703804; 
 Fri, 16 Aug 2024 03:55:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:55:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:36 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-12-9eed0ee16b78@linaro.org>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2695;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sLKW5NlUarRy9P9QN6fIhLPqmjJ63FYokcmqbGYfWRo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/xx0XSFMIPdFQTm4JsvW1nfOTyJJMoinp2O
 kk2gGkLpXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v8QAKCRDBN2bmhouD
 13OSD/4riPyN506VHZZ2EtdCDx+J9tg/8JMuyGK6I2fpgTQ/UApIm8QW28ZbKP6Gi4RGaYPLju2
 gsf2u14b70xcxQIsZQ0/4SaYjDmdyBfWtO7eiEPax9Ib3ezPylJMPsH0oSRv//ITyMXKC99xC/f
 LgjNORmCyfpeum/TIb+/wgJZfIsRcuscyK0xJVvf9KnipkclzhvsK+gZGCpj2HaXsBa3mRgBegY
 weZX5najE0BjcG+6o9LNJyCW8zuXfJ5jwNUSbG6zCGHFHV4nF+Hn6yGr9mhswoD/FQ6sl5WO2gi
 9wGfXT0evEkmVKRgBfEGpOS58HPNPidZ1vm7kOImjVP1URT47cFw0KKF0lm8B8Ah3YXo8k8Wsmy
 jvSOvU9NI5IL0iIcFM+tFqcpIz9oyg0M8bxPFDjgkXONJMDo/iDvq/LIyIzWELnYMKEbpKbnMpw
 PH84I+h5hz++T0WuBEKiwAYRBuXVsnJkMtJA7XHBjjaISe5K9a6xBYNDGkpleHhkaozEUcn7pQ5
 NyBlJOjDbmx4CPXuGGm6GKBwBCjPj1kslTvLNQUeDPaU84L+J9Q8nFNbrDS2bKjwrJ0YFx6n8MV
 71F+bp26PTcPmIYfGGMF+V0i4HBYaBDhYviK1uQE4rEP5Pu6mMVip5QJMvadXyXyCOyGSopSgoB
 muVoxO1VS66+nzg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 12/13] memory: ti-aemif: simplify with
 devm_clk_get_enabled()
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

Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
make code simpler.

Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 drivers/memory/ti-aemif.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index 360f2705b1ff..bb9c8132d8c0 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -344,14 +344,10 @@ static int aemif_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, aemif);
 
-	aemif->clk = devm_clk_get(dev, NULL);
+	aemif->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(aemif->clk))
 		return dev_err_probe(dev, PTR_ERR(aemif->clk), "cannot get clock 'aemif'\n");
 
-	ret = clk_prepare_enable(aemif->clk);
-	if (ret)
-		return ret;
-
 	aemif->clk_rate = clk_get_rate(aemif->clk) / MSEC_PER_SEC;
 
 	if (np && of_device_is_compatible(np, "ti,da850-aemif"))
@@ -360,10 +356,8 @@ static int aemif_probe(struct platform_device *pdev)
 		aemif->cs_offset = pdata->cs_offset;
 
 	aemif->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(aemif->base)) {
-		ret = PTR_ERR(aemif->base);
-		goto error;
-	}
+	if (IS_ERR(aemif->base))
+		return PTR_ERR(aemif->base);
 
 	if (np) {
 		/*
@@ -376,7 +370,7 @@ static int aemif_probe(struct platform_device *pdev)
 			ret = of_aemif_parse_abus_config(pdev, child_np);
 			if (ret < 0) {
 				of_node_put(child_np);
-				goto error;
+				return ret;
 			}
 		}
 	} else if (pdata && pdata->num_abus_data > 0) {
@@ -391,7 +385,7 @@ static int aemif_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			dev_err(dev, "Error configuring chip select %d\n",
 				aemif->cs_data[i].cs);
-			goto error;
+			return ret;
 		}
 	}
 
@@ -405,7 +399,7 @@ static int aemif_probe(struct platform_device *pdev)
 						   dev_lookup, dev);
 			if (ret < 0) {
 				of_node_put(child_np);
-				goto error;
+				return ret;
 			}
 		}
 	} else if (pdata) {
@@ -420,21 +414,10 @@ static int aemif_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-error:
-	clk_disable_unprepare(aemif->clk);
-	return ret;
-}
-
-static void aemif_remove(struct platform_device *pdev)
-{
-	struct aemif_device *aemif = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(aemif->clk);
 }
 
 static struct platform_driver aemif_driver = {
 	.probe = aemif_probe,
-	.remove_new = aemif_remove,
 	.driver = {
 		.name = "ti-aemif",
 		.of_match_table = of_match_ptr(aemif_of_match),

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
