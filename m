Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE449546FF
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 12:54:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BFEDC78006;
	Fri, 16 Aug 2024 10:54:52 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9422AC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 10:54:50 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52efd530a4eso2991577e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 03:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723805690; x=1724410490;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Vjjz5PQxtXSt4zeT/RkSGh8NQkwY8peMKp36Eteyrx8=;
 b=xVSDcRSN9EyrGRl38XUN3JbKfdK0uxtYH1/IoLL5dqK5h8BHf0v/eHDJR06uERcFge
 4/WL4IVcJI/zMcm3ac7pZS9WbJ9K4dHb2R/op7ov/BXnf0nujhScTfV7ZVdp4x2niNA6
 nDUKP7YsENwegyYU2WdjkMkS65IwEW05HAQRjyqz451jLmIrvI85rYSHTUpcgHX1VDmd
 cuDq03qIvzQnuWZ3P6pnhqNop6p2RmWlc1CAraglwbLcGWBq6jTuGwa2RrvDDLI6+s9o
 3e6DKW4CXDoa0eZ/DeUVYmPHsYP5wNhDvurk+5FDQRCWFZlsDy5vlwZksNF1ZHEzFubo
 vqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723805690; x=1724410490;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vjjz5PQxtXSt4zeT/RkSGh8NQkwY8peMKp36Eteyrx8=;
 b=NCjz2rS09itTMGAOFEg54K2X2p9FgN3DBDRWAqjUn48P0PvzMB08g+mKNynW0PaZHL
 kOYaRsIySIJMKlwjhZDMvFtTF4i+OtU74Ssn6PmaYFRrrLtXsfz9gKv5WWGXT8BCp+aD
 rLsJoi4iQYLWLOZpr4Xntffk3dKSd9hE9J6WRrr9Tx/VeM3lqqDMb6A3h3DrxJ7E3o4D
 VGmV0u32Ai1fEZm9X8AqmLhq+pcmgWF406WLNm+5kQ6r168pDcKNXxQQcYVRp6W/3jqV
 nnhe0lXWev+pdohdJzyHAGvcO9kV9uhG6M3TdL5Y68sjmK77eWeRxF4gKTe6Gg/hO2t8
 3TVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUby9ufDkRT3iisXuDkmstL4pwieILaaAOqg8/brrmUy6+xrPmLjuzyvwxSAuggNkFUszElvuq6EXPEMtd9ZchnKxffRQI+lYIj++eS9Bd9FclSox6iNyo1
X-Gm-Message-State: AOJu0YzxnmNrLIA+C+9PsY/WQaCb5H0FC1kFSTDqxYX65t5SSiqW/KF0
 YwfmSiZqSn1Aa/0LGNNzcwXeODAkH7wE4HVyBBIJ7VgYQui5GO6zj6Usq1ccmxnUMR9ohPOwJhy
 nU8s=
X-Google-Smtp-Source: AGHT+IF98iCU21qh48ym9eALe83DFj+NaqQe0ww3kus6+d1nOigexYI9Bj36AT3UON4kRaajmBPYkA==
X-Received: by 2002:a05:6512:b10:b0:52c:859c:91dd with SMTP id
 2adb3069b0e04-5331c69592dmr1563994e87.5.1723805689671; 
 Fri, 16 Aug 2024 03:54:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:54:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:27 +0200
MIME-Version: 1.0
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-3-9eed0ee16b78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6832;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vlPrg74sTTRgZv6b3DWpJX4RlTR0m5zTMsyPufQEkhM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/psDysJ5IZQg/Exa9zRiD8qS7v1C4oWjmAa
 +iF22nhqXyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v6QAKCRDBN2bmhouD
 19SRD/9Hhb+f4qcsW1fTUSeFE2GDuq4WG6xHi1qC4sA05BAgtLQw9EEnWYmjsx1rBvDZPVfUNKG
 X/SKAfHMcVSkpntMyL+q7y3b28SBYUAkR/eGFOXcgaR2yEvn/R0A4uVgSfWQeYhlv1IZVssV4BL
 P3utZVIRzMiF6bFcOdbDNnLBI8ROVgxm6d7Q4Dj9tySZU8efIMiT9UvMAlVUjd9NtZy5dGcdSgS
 NSPvTNVXiTv2Zern8yNwUPlbogkf/qvH9qZj1oA68fS7Eh0n18grGuxS2eOAvxhsrQ5aWiO1ITk
 Va0MrmaBq0d1KoRyu3WAwXSESmwNr+rKFT+S9Zf9xiWho8o3tumEi+eqdnpOPKn8PA3TLfRJqVo
 TD5rZwqPvYaYAlhafcbh5Vd5ZXsUXhHA9hUeNPaYWuRHZFo++Kwqkk32ZE0WliNX42nBWIt1wrJ
 5UI0O3CT93wzQyoE7ZL4KSw+/xgvOs0+JkS68qR6zw3L+6ikGKUP5XT2mHZiZjfUc53IjHg1QjZ
 kzE8x9RiROA0xwLhEOgmuzmcyAtldA3XDc/Ift3Q9T7n6Ndcq8Eu2y2vrO2nejvebkVFDmdAB7o
 pp3kv7f2TiFlKGkHjkj3WB9dLwByWBYH/vU1b+QiZihk6Q0K4T9HBwvCrNM3xNjDANZkXTde50O
 kAxRJo+pBYUT3sw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 03/13] memory: samsung: exynos5422-dmc:
 simplify dmc->dev usage
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

Store 'dmc->dev' in local 'dev' variable, to make several pieces of code
using it shorter and easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/samsung/exynos5422-dmc.c | 61 +++++++++++++++++----------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index da7ecd921c72..48ef41b8eaa0 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -339,19 +339,20 @@ static int exynos5_switch_timing_regs(struct exynos5_dmc *dmc, bool set)
 static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 				   struct devfreq_dev_profile *profile)
 {
+	struct device *dev = dmc->dev;
 	int i, ret;
 	int idx;
 	unsigned long freq;
 
-	ret = devm_pm_opp_of_add_table(dmc->dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret < 0) {
-		dev_err(dmc->dev, "Failed to get OPP table\n");
+		dev_err(dev, "Failed to get OPP table\n");
 		return ret;
 	}
 
-	dmc->opp_count = dev_pm_opp_get_opp_count(dmc->dev);
+	dmc->opp_count = dev_pm_opp_get_opp_count(dev);
 
-	dmc->opp = devm_kmalloc_array(dmc->dev, dmc->opp_count,
+	dmc->opp = devm_kmalloc_array(dev, dmc->opp_count,
 				      sizeof(struct dmc_opp_table), GFP_KERNEL);
 	if (!dmc->opp)
 		return -ENOMEM;
@@ -360,7 +361,7 @@ static int exynos5_init_freq_table(struct exynos5_dmc *dmc,
 	for (i = 0, freq = ULONG_MAX; i < dmc->opp_count; i++, freq--) {
 		struct dev_pm_opp *opp;
 
-		opp = dev_pm_opp_find_freq_floor(dmc->dev, &freq);
+		opp = dev_pm_opp_find_freq_floor(dev, &freq);
 		if (IS_ERR(opp))
 			return PTR_ERR(opp);
 
@@ -1175,49 +1176,50 @@ static int create_timings_aligned(struct exynos5_dmc *dmc, u32 *reg_timing_row,
 static int of_get_dram_timings(struct exynos5_dmc *dmc)
 {
 	int ret = 0;
+	struct device *dev = dmc->dev;
 	int idx;
 	struct device_node *np_ddr;
 	u32 freq_mhz, clk_period_ps;
 
-	np_ddr = of_parse_phandle(dmc->dev->of_node, "device-handle", 0);
+	np_ddr = of_parse_phandle(dev->of_node, "device-handle", 0);
 	if (!np_ddr) {
-		dev_warn(dmc->dev, "could not find 'device-handle' in DT\n");
+		dev_warn(dev, "could not find 'device-handle' in DT\n");
 		return -EINVAL;
 	}
 
-	dmc->timing_row = devm_kmalloc_array(dmc->dev, TIMING_COUNT,
+	dmc->timing_row = devm_kmalloc_array(dev, TIMING_COUNT,
 					     sizeof(u32), GFP_KERNEL);
 	if (!dmc->timing_row) {
 		ret = -ENOMEM;
 		goto put_node;
 	}
 
-	dmc->timing_data = devm_kmalloc_array(dmc->dev, TIMING_COUNT,
+	dmc->timing_data = devm_kmalloc_array(dev, TIMING_COUNT,
 					      sizeof(u32), GFP_KERNEL);
 	if (!dmc->timing_data) {
 		ret = -ENOMEM;
 		goto put_node;
 	}
 
-	dmc->timing_power = devm_kmalloc_array(dmc->dev, TIMING_COUNT,
+	dmc->timing_power = devm_kmalloc_array(dev, TIMING_COUNT,
 					       sizeof(u32), GFP_KERNEL);
 	if (!dmc->timing_power) {
 		ret = -ENOMEM;
 		goto put_node;
 	}
 
-	dmc->timings = of_lpddr3_get_ddr_timings(np_ddr, dmc->dev,
+	dmc->timings = of_lpddr3_get_ddr_timings(np_ddr, dev,
 						 DDR_TYPE_LPDDR3,
 						 &dmc->timings_arr_size);
 	if (!dmc->timings) {
-		dev_warn(dmc->dev, "could not get timings from DT\n");
+		dev_warn(dev, "could not get timings from DT\n");
 		ret = -EINVAL;
 		goto put_node;
 	}
 
-	dmc->min_tck = of_lpddr3_get_min_tck(np_ddr, dmc->dev);
+	dmc->min_tck = of_lpddr3_get_min_tck(np_ddr, dev);
 	if (!dmc->min_tck) {
-		dev_warn(dmc->dev, "could not get tck from DT\n");
+		dev_warn(dev, "could not get tck from DT\n");
 		ret = -EINVAL;
 		goto put_node;
 	}
@@ -1254,34 +1256,34 @@ static int of_get_dram_timings(struct exynos5_dmc *dmc)
 static int exynos5_dmc_init_clks(struct exynos5_dmc *dmc)
 {
 	int ret;
+	struct device *dev = dmc->dev;
 	unsigned long target_volt = 0;
 	unsigned long target_rate = 0;
 	unsigned int tmp;
 
-	dmc->fout_spll = devm_clk_get(dmc->dev, "fout_spll");
+	dmc->fout_spll = devm_clk_get(dev, "fout_spll");
 	if (IS_ERR(dmc->fout_spll))
 		return PTR_ERR(dmc->fout_spll);
 
-	dmc->fout_bpll = devm_clk_get(dmc->dev, "fout_bpll");
+	dmc->fout_bpll = devm_clk_get(dev, "fout_bpll");
 	if (IS_ERR(dmc->fout_bpll))
 		return PTR_ERR(dmc->fout_bpll);
 
-	dmc->mout_mclk_cdrex = devm_clk_get(dmc->dev, "mout_mclk_cdrex");
+	dmc->mout_mclk_cdrex = devm_clk_get(dev, "mout_mclk_cdrex");
 	if (IS_ERR(dmc->mout_mclk_cdrex))
 		return PTR_ERR(dmc->mout_mclk_cdrex);
 
-	dmc->mout_bpll = devm_clk_get(dmc->dev, "mout_bpll");
+	dmc->mout_bpll = devm_clk_get(dev, "mout_bpll");
 	if (IS_ERR(dmc->mout_bpll))
 		return PTR_ERR(dmc->mout_bpll);
 
-	dmc->mout_mx_mspll_ccore = devm_clk_get(dmc->dev,
-						"mout_mx_mspll_ccore");
+	dmc->mout_mx_mspll_ccore = devm_clk_get(dev, "mout_mx_mspll_ccore");
 	if (IS_ERR(dmc->mout_mx_mspll_ccore))
 		return PTR_ERR(dmc->mout_mx_mspll_ccore);
 
-	dmc->mout_spll = devm_clk_get(dmc->dev, "ff_dout_spll2");
+	dmc->mout_spll = devm_clk_get(dev, "ff_dout_spll2");
 	if (IS_ERR(dmc->mout_spll)) {
-		dmc->mout_spll = devm_clk_get(dmc->dev, "mout_sclk_spll");
+		dmc->mout_spll = devm_clk_get(dev, "mout_sclk_spll");
 		if (IS_ERR(dmc->mout_spll))
 			return PTR_ERR(dmc->mout_spll);
 	}
@@ -1329,38 +1331,37 @@ static int exynos5_dmc_init_clks(struct exynos5_dmc *dmc)
  */
 static int exynos5_performance_counters_init(struct exynos5_dmc *dmc)
 {
+	struct device *dev = dmc->dev;
 	int ret, i;
 
-	dmc->num_counters = devfreq_event_get_edev_count(dmc->dev,
-							"devfreq-events");
+	dmc->num_counters = devfreq_event_get_edev_count(dev, "devfreq-events");
 	if (dmc->num_counters < 0) {
-		dev_err(dmc->dev, "could not get devfreq-event counters\n");
+		dev_err(dev, "could not get devfreq-event counters\n");
 		return dmc->num_counters;
 	}
 
-	dmc->counter = devm_kcalloc(dmc->dev, dmc->num_counters,
+	dmc->counter = devm_kcalloc(dev, dmc->num_counters,
 				    sizeof(*dmc->counter), GFP_KERNEL);
 	if (!dmc->counter)
 		return -ENOMEM;
 
 	for (i = 0; i < dmc->num_counters; i++) {
 		dmc->counter[i] =
-			devfreq_event_get_edev_by_phandle(dmc->dev,
-						"devfreq-events", i);
+			devfreq_event_get_edev_by_phandle(dev, "devfreq-events", i);
 		if (IS_ERR_OR_NULL(dmc->counter[i]))
 			return -EPROBE_DEFER;
 	}
 
 	ret = exynos5_counters_enable_edev(dmc);
 	if (ret < 0) {
-		dev_err(dmc->dev, "could not enable event counter\n");
+		dev_err(dev, "could not enable event counter\n");
 		return ret;
 	}
 
 	ret = exynos5_counters_set_event(dmc);
 	if (ret < 0) {
 		exynos5_counters_disable_edev(dmc);
-		dev_err(dmc->dev, "could not set event counter\n");
+		dev_err(dev, "could not set event counter\n");
 		return ret;
 	}
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
