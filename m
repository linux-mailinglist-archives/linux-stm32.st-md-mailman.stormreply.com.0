Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37584BC3C83
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 10:18:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2F06C46D55;
	Wed,  8 Oct 2025 08:18:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3DBCC46D52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 08:18:11 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so5561300f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Oct 2025 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911491; x=1760516291;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K5ZbnZbGKkG8LBPBH3Ir29b+fdJ02lrKRlpbmxW9/T8=;
 b=rtKz1is0oQ1P6pXRHFImDW7s6kSYys8to7jpHs9rureqRtlJ/PYwFos4xL60MiGYgY
 tw3dBaZzjdaF02pR3MsHwdQcwdfqL/IU03+KwrKhJrh9hFgNuS5zMIjXm1NOPIVQHNrd
 QHBJGosD4u6tqMlN4kLoKTqKOC2ndgmXzX4DSZ6SIZu6YERVNG+L4dIhq2zX6L0XpXxV
 scek6fMw2CrGf/kCXsSI3ZnWAkpbU2JOjdQ2QBRLJuGThnqN16zhc3USfhHnvNpKT/pG
 LyJ4a/tiLZUN9SoeB52DGMfZZogJtPg+GR5KaR9qJEALVL1uAQLwb1Z4QiCthPIUYe7d
 JWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759911491; x=1760516291;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K5ZbnZbGKkG8LBPBH3Ir29b+fdJ02lrKRlpbmxW9/T8=;
 b=fUjUU5PgfZtYCPd+g01mkk+3HIqHs2mIBG+t78jDywN6T5GDIL9DkCFp9maZ+dRMlW
 bkgF0fJGGMKoBfgfM7nK6N53QvP7/uQ8KJtiwIUF163nDto6ywy+8o4kI1QAEGYNGs1u
 PHQ0itRds5gADpjDXjq/PGXMfIh+QRM1Yzs0EscDQcabiAEOa8EWM/Qh2HxyA9caMOiI
 +hoEjSjbeSbttsm9bsdzmfb6CHz2eaWuVzaLVT/k1STnJKvLMrKYC0zdcbDq6kapIcL7
 mrC5bZE5iQZmMwc14HoaJys3eLbj0nu11r6EwYELUPHauZAgZ9wRxnzVhd88eu9EliH2
 RAdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7xr8Pr655lD2nDNyq6RipGb4fSic5D5IaB47xQRWa83unCCPWbL9saqt/oq5ohJfxkufTSssJ5tgaEA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyUpjH3vzWUqcNcEkJdpsXQinJJ/mLLKzk2pNT/EG1WxVNFNm92
 n6wuHOx6U5XCL5e30fQ8ZwOqm2S3DWm7p4sn497J9Rk165k82j9Nm9yY34h/Hnfl5R8=
X-Gm-Gg: ASbGncukBrW4v6spAAafzOJr4lONjWj/9q/RRUXcHlLd2XIXZauVFots8gfXSBp9dD7
 nEgSqELMq+omCZ3BUoSXJc2nOEfkNFp3Me2poozswo5PZtgUkyNchvb8J9Ja64gGG1JZUTYnKGr
 AYxDsYisiV/M4qtDNUp9Rmrqwn5KQEH+TRR8v8becYHXoz9M8JVlwbboF3rIUq893KeSYs5B7k8
 MBv+OHIn1SQv5U2V07RqjYAVxcLLFzIi+D6YM3kTAKOeHbOM7kBLOuV20lm0PCbCzUZ33sjYiq/
 wImuFrF3BvgkEu48KfDU5WQdz4HZdPX9nHMaYbB4S2nt5zTQZTpeLLHJjwyofv1PRNAUEDnxdq8
 YFikTnMI3D5wa8SHDRKrw+k3L2crKBV2TCKxzny+imw==
X-Google-Smtp-Source: AGHT+IHkwtqy2vb9uxT6M7LtlQU6zwCjb9IR5rIG74fXz3TalugvLB02SuzmrQY3nea1fwBLGELWhQ==
X-Received: by 2002:a05:6000:1845:b0:425:8bc2:9c43 with SMTP id
 ffacd0b85a97d-42666ac4502mr1491294f8f.1.1759911490600; 
 Wed, 08 Oct 2025 01:18:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:18:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:52 +0200
MIME-Version: 1.0
Message-Id: <20251008-qcom-sa8255p-emac-v2-5-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3478;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=QXDtZJBSeiuTqR9NRW8KT3qs59BPygxIGrInXJc2Y/o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h42Xak+xMy0XGVbg60nsHByk/5QWfRt+MQk2
 tRZVAmURSeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNgAKCRARpy6gFHHX
 ci7yD/9T88d234rhjtNAnU5hIUiy2KPa1vwStmh6rzlpiBEAYQWJ7n0qtpVAahYHWOUDFfpCxbX
 qwsLaWX2pQdosbU2lkFdffA5lYMtlXOH6J6GUvcdj0SWTSPeHuhvGaoQjr7rMYT7wVScdfK/f0T
 Q1CKPK/+i7nlZ2XpFhFSHcPcHMwzGmSe7yNtxWyMhmTZEv8xPu9N45yE6Rkw1f4qtdQujoBZ/wk
 ViGxpFT6K2MmqD7NkTEgzs6EwNBhKII+UCC0hlGskAB5N8PiTaE4r7rPLvA/B79t2fjd2o6Gdqm
 kD1Qhk73OktYQEiw64TAkceahph3P7g2PKW5p8whO3jVBKsjKRnG8RPhrtkPoV/muXooK+UnYXv
 mmYJvnC8pUx3BXZGy0PMtyN8HuSK05GDhscy0T/HJaRGcw9bpg777ge6XlAfW1BxNTP8nVndOD2
 C63+OilZ0jPj8BKIQyY88Mudny2/zvh9bu44+UKEa54IJUn5ZuGUZDWUHhFH3Qcgs7Ha3ampG1u
 g/o2E0tK5wZcBSN0d0YwtACEOcKuLIBBakebxgraxUV5tByTHxwOPcMoVU2nHMyVfZM5riUXQgJ
 klzu9ahNp03ITcGbo5/lCY3N3M4bAkCKevXvcNQXc+oXsr/KMNhSmNINpCoZrlbCTLyp/r4mwsi
 fNcmzHN7Zq/n+Zg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/8] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
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

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index dcee5c161c01124ea6bf36ceaeca4cc8ca29c5d5..d4ddf1c5c1bca2ae1fc5ec38a4ac244e1677482e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -95,15 +95,19 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	bool has_integrated_pcs;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -297,7 +301,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.has_integrated_pcs = true,
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
@@ -319,8 +322,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -787,11 +795,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -839,6 +849,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -846,7 +859,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
