Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DBBC0F063
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 16:45:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FAFDC60490;
	Mon, 27 Oct 2025 15:45:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D8E1C6048B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:45:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso68089255e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579909; x=1762184709;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OicQ1OKV8T/1KX5QBfxYsQT9BwdWiJOdtGfcmUcFvvk=;
 b=U2k33IjyaC3iqnYBQegd5evMFJeDvvvsNM7gO5vO2qs9b6VZergMc9Qc7rYIfwRar0
 Mef7jGomK77RFfxM8R5C+BP9zxp7B8qIHUj68QwCFVAmxu6SyCgl5lz4zUKfMFlKJEcH
 MBp70OMACji/l03LU7n4vURlY1VPAJMJofc5CyQ0wtt6wjKT21g8H75SNa5CTJ9uEF7L
 u+UE6agNfzB1tE4FA+rovIDa7JiW0Qxij4fA9nqGAJccNVsMfMG947YHcRWeSwZawy/P
 +vk9TO5ktMn1+VQbMRoJe78lCOWo6V7yv52AlODIq9Ru+yvt3z5G0TTiFA+LGyFV1AxO
 rAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761579909; x=1762184709;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OicQ1OKV8T/1KX5QBfxYsQT9BwdWiJOdtGfcmUcFvvk=;
 b=LtUtksfMA7R55ZvgdJz0091KztWJKF07iCnhQoIZb8uW2ch8cvBo/wZrAYBIYs/SPj
 DbZL9+DXfPJzLeJaqQZ7tWlphciVtR5lg2JSnf38PVtB6qw50w0sgLJFpLlOHuvQfNl8
 XzSiM8mOzO1ybNqPam7tpEsRhvs9or2PgBG95SQL892GgmItQcMSKeL8bPu1QwrOqeME
 9ZwctQqZoOenLzEeKFPr7F67Adxx2e+DOK+sgOu9N+T1dS9Znp07lzjWoS3ElBT0f/yn
 Lpfu/D5SoeB0Yg1+eqyuzaPJjohNxJbGDnWosNmM46YDgKdZV0r08oTfmZVYMtfa4NzY
 noNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqPTAlwGybooTndDFqPoSU0eaM1otUDvHjw7J66rlNuV9iVkdbJnANj2eQE7u9CNQdbmXi7V1FvgkH/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzpI9MXGO1kVH5hw0ZSvkgTVOfmuLXCyo65UXKIoG8XvpwHyh6O
 zjSEH9608rgDFJj//U7KaGQHA4RZKZHoUO542bF/YLgycKiLTL6YzBaYfCYfptm/MGs=
X-Gm-Gg: ASbGncsmqJ9006Hyz7zFO3ndaJqTSG9d6BV6Je0CUrBTZTgvI2dLDzhrscA2dG8XHVV
 2ZxN81ZcVPNXvYibyq3OTok3HZ87TT+1N8sOqTsJnE7NY6dlLd1uETbDHGaTTa4qhwONLgxDRrz
 Rzv+8I1TuWpvMMzAnTyS0nckcHoc/fjGc5etQ+2NRHEUmuTIgpFU12WeBUoMzdcVTCnXblNJSt+
 dIOqrXKs+pKWv9xt81txuNnK/0ugW35T52w9+SAmWWlRR92Np07n9YHU6fo/4noH7TImJIpyGpu
 eZ02BHOI8LUknzsjTWJZmooQ6I/WpVysQOw7PR5FvIENgklJFYNNkkFxdG5r6w54U6lmrP0LerS
 kJw1S9ZGOBFjF0ebJKiMImROZUYVZo6aFVvjRQPPUnyWsGbL3M80Mlzp8ubev8jW4QpbpQ08=
X-Google-Smtp-Source: AGHT+IGnURDzCL6EXlYFgChfMetXN9DLHbDSZlPkZ7qshRFfNPQz3EB5h9snkYgIRzQ1RyekW2OGPA==
X-Received: by 2002:a05:600c:3b24:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-47717df7c8emr1161855e9.4.1761579908909; 
 Mon, 27 Oct 2025 08:45:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:45:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:52 +0100
MIME-Version: 1.0
Message-Id: <20251027-qcom-sa8255p-emac-v3-4-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cOSA+NoNF7WC2Y1gjjgtDMtaHJ+KGJ3IylBfWUELjyM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N7y18ZJr6B/GhKmUSNUtBu9u+ofCQBq/O26
 ld3TvaFaLuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 cnwoD/0cxZBAb4XAX91qdtSNuOWe6oX6jeNpN8yk7QsX2VHoodzwPCt6oj6wMspuj4vJ9DxjBPf
 AP2jLjtIoV5hqOIHm0IhgTYcYRaFDR15GH/TOam2GYeAWLV92aBYmv6IdSBjAutwJgaBc318d6T
 g2hkFviaHTZEenJLMQEnvI72Q45xskOQC+TvH/yydMDmrQbMzEHN/cFqQ4GUSWsWZm6OseMnhAa
 iUB6ippCvLUyp7heH/nCGsSHLbhV9UDlKd1JOaow2u1Ulgpx45S5axLLX9/6pqZigvs2rfHzATJ
 Le+qEqvR7+Uh2+Q9Aws6QSXWlTa4Z3iSiIy5ZbP7bAsTaq9nuZsrL2kpAN1UIKoF/G6Oa7rsBgx
 +X8w0yx0w1H6U5UejolDHTeX9ZLHVoA850ctVr3h7XGjx/emlBJAo6uPxQ7VQPa0RiZeQ2E7BBE
 9xTyHHvZtzzpDpmEczdJpo8406xsjrY3v1SPmY1NOAJnThscNxNoNiUqCsyv7nUHtuxHRU7N0wN
 /aC5CsoAVcXZwPU1bJaddyFRpmB3ZzvurfMTgH9TO6Of3h56qMhET+WPorex+Xg/jPwotPdFs2b
 zsSehrtTd1JcZuqiNWbl1mYIvXuR/1nD6z8Y8l3LjqK+mOvqnUU201WCfTRZ0heDj3vpJxm6sQu
 burt8o4HoSXycxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 4/8] net: stmmac: qcom-ethqos: wrap emac
 driver data in additional structure
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 51 ++++++++++++++++------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ed799da4e4079b4da4b555dd119cce8c6591aa39..2739bc00e7525a5913bd3a5d28d9c9a8871fb7cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -101,6 +101,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -218,6 +222,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -234,6 +242,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -266,6 +278,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -301,6 +317,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -764,7 +784,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -815,13 +836,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->mac_base = stmmac_res.addr;
 
 	data = device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	drv_data = data->drv_data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	ethqos->por = drv_data->por;
+	ethqos->num_por = drv_data->num_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -849,14 +872,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -871,10 +894,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
