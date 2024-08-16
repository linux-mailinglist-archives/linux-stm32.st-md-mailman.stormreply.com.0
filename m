Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDA3954703
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:54:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5888C7801F;
	Fri, 16 Aug 2024 10:54:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 247BBC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-428163f7635so14321135e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805691; x=1724410491;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ps5OVwPQda0LMKMNWr2tdKZsG2I+Nc7kykB2orG3PFk=;
 b=ySqgEMBRtC4mgnUqW0sbkHarM/MZmU/nM0qSVMpvSSImyiK2srkjzIq3Xecv2e2NkX
 DtGmxgV/qV/5BuDjVjmVxGpjEhpu36d0KQ/2HJFt56V/FEoh7lv4lVruQ2bmfE/TLqXa
 fI0XvFT9yUhlTCtVnr9b9/xZQqNYeL9jKSjXhcOukhL+vFjMBf8oMuMB7kR3tZP3Mw9h
 jxhF/WFX4MOyjgLvm3zzlvwJXPHtizko0W5ili7XHO1delj7qJRkwhZjLGfRIvIz6zpL
 6RzZXR51dQDXLmse9oG/XYjnN2ilJMscCkQ/EfBTkT7JSVSFEFcyNDEz5x+sSDFdclLM
 sA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805691; x=1724410491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ps5OVwPQda0LMKMNWr2tdKZsG2I+Nc7kykB2orG3PFk=;
 b=eXJs9dTUzCI8T3zFaJi703S7lBlIQGvn4T07chuu2+5iif4MtQzoByJknS4hRb4hnS
 Oe+itCMWO+0nQ+rrkrw+UJt+Cqua+znO3fcw9En6m4rqZg96zwFvhoesKP6Kf4N1oWvG
 CORSdNq2kZla4KY8cfnU/7CUXYKub7oEbGlqXHkH7SLxZkqSiNdryNAiFlOpmKbSoSVE
 /q+z2xqMssn2GUTpfq94XJI+RwfdD1yeBoDzj1ckevlqBq8QUveb3mip4OYP7u0Pg+jv
 ZXRmoTd4kNPgzCqpLNOiA5cAQ3xv9kdAu3q40AZijG+z+//r4vGuGiiam0en5zmKFzkR
 ZTsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXdcYJNcVYxcxUZNFjZ6TR8VvoQBOUoiOaiaBYCo9XZKaCnrLlvN7UhTJ8ykctNm6QH293tEgd1CWDiLwxbdrumiNtiPx4gZ3pDPq7NOBnfM71uZygxmSq
X-Gm-Message-State: AOJu0Yzd2dpMtkmT/dfZAmVKr6Fypjpzxlo2qXTAEdQO24jyJAZ+hhf9
 UgYnB4M6DvpeE5DOZAyvk4t0vWjHBQdpCiX6CXA8kGZjiDQM3LofCHYyEOF3QdQ=
X-Google-Smtp-Source: AGHT+IHxdhvK1ECKqUfwiSpYS/cvX8viRntSwBf6ySKhzTK46bfJHN/AjQbBdfp89HO0dgJRuKS1sA==
X-Received: by 2002:a05:600c:4e8c:b0:426:6ed2:6130 with SMTP id
 5b1f17b1804b1-429ed79d9d6mr15821505e9.14.1723805691544; 
 Fri, 16 Aug 2024 03:54:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:28 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-4-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2879;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aOG0FNkWr7wWqxbaC9hbRdBtAW+4DKmOSIujr3Va07A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/qic+gJt3V9XC+/wcsbOscwI6XAJiI5CIZ0
 cpgP5XqjV6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v6gAKCRDBN2bmhouD
 1x5hD/949WpMkITwA7QhSsLEYr1aaqTVr+5IEE6h37JucIjQbSTWkGgK4m/wf3YQv8/aUa+1Swx
 hc3s4GGsYlwauOMNbRde2juds7Grplj5jSnR1lazEcz8YNZqV7tHdU5X6SCzFwiEacMwYyaIvLf
 e0hh9aN4lUSN00pQs7bioG3RP2muok3RivVx1DJSgRADr4zt36pXwWpX55dGUCVW5E/Kw0LCfvC
 CoKTtOojcKBWbyzj4NWXYjmogE5RfcYSKDc3SQsy7aFMlkw9P593FVbHNYB74NbU72eJSvNNwGA
 7+PMvNWtHxR1i7ri1Mht8Bq2PIKlWZIz4pC8JSdyTY++hvWyo+/xpNIgcvomfls33V0CG1t2fgQ
 GPd+q+U208qLx/yp4THm/GReEuAQYLpGUwXF959Yl52Kytcqc94QW1QaTIYeMPQpU6J5b8cQi4L
 /ImmAa+9xuVkX9Tx6IqRXfpbbzwE5RSXP0R+SX4hqxWxQ0Vc0qJGW7yxpQs3O4XIxHxRxo27xan
 BNDOdFigoQxxzPBwdnhM3wiSsAzztF1+d6tXYUlsdwt2+K9N7iFvlOBBjJPtMGTE5nSZAc8K45t
 daUn0t1W965yCXgeSR/uDoPi6XSGhNLJ1aVOLyixXuIjkPiiTFpmZaW+j7tGB+oZqF5G0K/iO7O
 ajmcbr4B7MWf2kA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 04/13] memory: samsung: exynos5422-dmc: use
 scoped device node handling to simplify error paths
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

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Wrap line before of_parse_phandle()
---
 drivers/memory/samsung/exynos5422-dmc.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 48ef41b8eaa0..7d80322754fa 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -4,6 +4,7 @@
  * Author: Lukasz Luba <l.luba@partner.samsung.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/devfreq-event.h>
@@ -1178,10 +1179,10 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
 	int ret = 0;
 	struct device *dev = dmc->dev;
 	int idx;
-	struct device_node *np_ddr;
 	u32 freq_mhz, clk_period_ps;
 
-	np_ddr = of_parse_phandle(dev->of_node, "device-handle", 0);
+	struct device_node *np_ddr __free(device_node) =
+		of_parse_phandle(dev->of_node, "device-handle", 0);
 	if (!np_ddr) {
 		dev_warn(dev, "could not find 'device-handle' in DT\n");
 		return -EINVAL;
@@ -1189,39 +1190,31 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
 
 	dmc->timing_row = devm_kmalloc_array(dev, TIMING_COUNT,
 					     sizeof(u32), GFP_KERNEL);
-	if (!dmc->timing_row) {
-		ret = -ENOMEM;
-		goto put_node;
-	}
+	if (!dmc->timing_row)
+		return -ENOMEM;
 
 	dmc->timing_data = devm_kmalloc_array(dev, TIMING_COUNT,
 					      sizeof(u32), GFP_KERNEL);
-	if (!dmc->timing_data) {
-		ret = -ENOMEM;
-		goto put_node;
-	}
+	if (!dmc->timing_data)
+		return -ENOMEM;
 
 	dmc->timing_power = devm_kmalloc_array(dev, TIMING_COUNT,
 					       sizeof(u32), GFP_KERNEL);
-	if (!dmc->timing_power) {
-		ret = -ENOMEM;
-		goto put_node;
-	}
+	if (!dmc->timing_power)
+		return -ENOMEM;
 
 	dmc->timings = of_lpddr3_get_ddr_timings(np_ddr, dev,
 						 DDR_TYPE_LPDDR3,
 						 &dmc->timings_arr_size);
 	if (!dmc->timings) {
 		dev_warn(dev, "could not get timings from DT\n");
-		ret = -EINVAL;
-		goto put_node;
+		return -EINVAL;
 	}
 
 	dmc->min_tck = of_lpddr3_get_min_tck(np_ddr, dev);
 	if (!dmc->min_tck) {
 		dev_warn(dev, "could not get tck from DT\n");
-		ret = -EINVAL;
-		goto put_node;
+		return -EINVAL;
 	}
 
 	/* Sorted array of OPPs with frequency ascending */
@@ -1241,8 +1234,6 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
 	dmc->bypass_timing_data = dmc->timing_data[idx - 1];
 	dmc->bypass_timing_power = dmc->timing_power[idx - 1];
 
-put_node:
-	of_node_put(np_ddr);
 	return ret;
 }
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
