Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D88A94EE43
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04020C78027;
	Mon, 12 Aug 2024 13:34:27 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 700BAC7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:25 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f15dd0b489so55907891fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469665; x=1724074465;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SQA/PjjohkpV6TqZg91y0zhylBtn0W2KyopE+/TT64c=;
 b=R5l3W0E1MQbrIT9E9FfYMUMY7IvI60dB5fAd/gSuVXRzZ3kGQ/3HlwZP9PLHLm8q0A
 jW7aJWDPZmjM4fFCoBLl8zL92gsXViglw5QuSQ9RaA8skgSiTTyMSBTobtom4fejt2r5
 P8i7e+HcdiydnE9y772gwVSh+9/WGCtsnLLOuPanDwg0JB2i4QHFkuyB7RW4nBq7lfBW
 cZPUKJV7ZS/dosmdBy2VB06MJRu/GCD7xV6d2ARyR4DNxRHpBWok6P07Hwth6aBIHiXX
 eslAR5Ubp4oc2wNpi25JFa2ZX+YpqlaYm9eDYcm3OZn5TqCBg5mQgSTGo9Doy7E6SyLR
 n4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469665; x=1724074465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQA/PjjohkpV6TqZg91y0zhylBtn0W2KyopE+/TT64c=;
 b=UYABqR8CvDQo5mAmv5wZ0n2bXDM26ZxKNoLUUfg8TrS5T9BPMcld33yqDAVEMz4vUT
 i0BfdBOEaFTqmZ2BvtnX2j1WlmgrusK+DpSNHVDk+j4LEOob/yGiZK5gIofkKS3rzTgh
 aIFh5v9gQekitgK65peP2MAlJjd4fmyjPTB7ZtJF6Wl/JCnXdbAbLYSeM4EMKkAqzMRu
 /4GsxBHiXU3B4PuUZMISkC6hgnm7nB9or/H6aI74S2vc2vVyaSiqErm8b7HhDI6ruxeV
 k2UcehdXTujufjUD88IeDQnlSUDrilvkJu2ohLCJDGoycdd6WTIAZufmJSzWHSM6VqOA
 7rYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhCpY/Qjwdlz70wLPub5ewcm6jPBlOH/nV7uQyA+EEss8DS91nRNxvqdT6mYCyinEd1DGcDaKBP04+OgSO6swr38BRf9MITpiNTPjTYIKyl5KLH1NHrtbg
X-Gm-Message-State: AOJu0Yy0PQz/p9n3/o/IH3XHcWxIl55Y8cHRFsElR3gcVW/R7Pu+peD1
 2/jRsuO1p/YWJX/imkK7biVSNXHT/MJkBaG5jmRrE4kt9biWMFbuf/Mg45Iuysc=
X-Google-Smtp-Source: AGHT+IFuG2qd+DzlKsP6QmlNw7cGw4vQwIOF5kCUyHlkAobIrwVs2DCtPwAfbJ5IawKIByi9iNKEWA==
X-Received: by 2002:a2e:d11:0:b0:2f1:9248:c325 with SMTP id
 38308e7fff4ca-2f2b717bb9dmr2097961fa.31.1723469664458; 
 Mon, 12 Aug 2024 06:34:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:33:57 +0200
MIME-Version: 1.0
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-3-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZuL1arzThZP1bH0X88EKns0i/Pwsb1RnCMJkbCddCK8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9THrzP+A1BH/yeTSMDTHI9G2M6wGjffRCSn
 dlrxuuifPyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPUwAKCRDBN2bmhouD
 188OEACJwoc0GJ4OOrq04S9Eqnai7E1TmoY+QS6g/X4/oh4fUgYz6R5MGupwE7ya/svO86v4gOl
 OLe8SdJZKjvqK76134ROWFAUJfVnt+x5RIg6hxI7LsqUOCxd4+P35lymy4T1T6M1Wm1YD+bzZcT
 b+hJuth2lbekjBDszhBlcuwsLCR+eP4qOP4X60dIIz/DTwLKRIsNKi1ZzceLBcnU3FxO29VYJo7
 gPDrthDsbabgcU/p+jDKZpqlwyVbYPGmOwXrB+qA/6UpNUkSgS3rEBGULDktmxaOWiCVYAf/uxU
 hnIEBvoqeT7dGdF/zxzP4IXa33L8dQ3nEhTktFn/KUFO7KSP0npI9YqxGe2wTq4U1Iu5Vv280pp
 ebL96l+uGfl7yGN0vm3XsrETWTo9jkdwTEC6nNhFbXQbMeZfppqiXSnheVM6pyTepzKzcHhmXOo
 0BysbLIOGMoxpcppLMfsoaimruRVTEn8PloUDzWjtD16zDFGKzngIrJuXFP0QKUiK7nLK+tFGiT
 kt4gMkJiRZCBIxDLPT2HkMhtyfSZMcKX/sIsKruL/TqdZ2oD4zY3RiNFWtZ9NDMNRI2wQP/yB6X
 Jbg4bT8+JbyRvvxHwF0/F4UaF2Wz9fGUB/XnfSw5mFRgs6GJP2sFYXsymEwhYpm/d8s6rmdQ643
 NIuOrNP6Z8e6AGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/9] memory: samsung: exynos5422-dmc: use
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/samsung/exynos5422-dmc.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index da7ecd921c72..d3ae4d95a3ba 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -4,6 +4,7 @@
  * Author: Lukasz Luba <l.luba@partner.samsung.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/devfreq-event.h>
@@ -1176,10 +1177,10 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
 {
 	int ret = 0;
 	int idx;
-	struct device_node *np_ddr;
 	u32 freq_mhz, clk_period_ps;
 
-	np_ddr = of_parse_phandle(dmc->dev->of_node, "device-handle", 0);
+	struct device_node *np_ddr __free(device_node) = of_parse_phandle(dmc->dev->of_node,
+									  "device-handle", 0);
 	if (!np_ddr) {
 		dev_warn(dmc->dev, "could not find 'device-handle' in DT\n");
 		return -EINVAL;
@@ -1187,39 +1188,31 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
 
 	dmc->timing_row = devm_kmalloc_array(dmc->dev, TIMING_COUNT,
 					     sizeof(u32), GFP_KERNEL);
-	if (!dmc->timing_row) {
-		ret = -ENOMEM;
-		goto put_node;
-	}
+	if (!dmc->timing_row)
+		return -ENOMEM;
 
 	dmc->timing_data = devm_kmalloc_array(dmc->dev, TIMING_COUNT,
 					      sizeof(u32), GFP_KERNEL);
-	if (!dmc->timing_data) {
-		ret = -ENOMEM;
-		goto put_node;
-	}
+	if (!dmc->timing_data)
+		return -ENOMEM;
 
 	dmc->timing_power = devm_kmalloc_array(dmc->dev, TIMING_COUNT,
 					       sizeof(u32), GFP_KERNEL);
-	if (!dmc->timing_power) {
-		ret = -ENOMEM;
-		goto put_node;
-	}
+	if (!dmc->timing_power)
+		return -ENOMEM;
 
 	dmc->timings = of_lpddr3_get_ddr_timings(np_ddr, dmc->dev,
 						 DDR_TYPE_LPDDR3,
 						 &dmc->timings_arr_size);
 	if (!dmc->timings) {
 		dev_warn(dmc->dev, "could not get timings from DT\n");
-		ret = -EINVAL;
-		goto put_node;
+		return -EINVAL;
 	}
 
 	dmc->min_tck = of_lpddr3_get_min_tck(np_ddr, dmc->dev);
 	if (!dmc->min_tck) {
 		dev_warn(dmc->dev, "could not get tck from DT\n");
-		ret = -EINVAL;
-		goto put_node;
+		return -EINVAL;
 	}
 
 	/* Sorted array of OPPs with frequency ascending */
@@ -1239,8 +1232,6 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
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
