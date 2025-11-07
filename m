Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 324CBC3F713
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 11:30:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF1EEC60466;
	Fri,  7 Nov 2025 10:30:16 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 613C2C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 10:30:16 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so328813f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 02:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511416; x=1763116216;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6g7dsZ8u0SOZn4ZdglRbxzgGZbve11SxESJzoyiLLfA=;
 b=xZvs7u+DsWIhcq3rGMW7AqhsBL1JGi90hnjp/SwFWpdGagWJrNPgKWWckQb49DtgWb
 MNEqkUWpbDVlYrL/5Hg43rP6BYTT5+h5AS+xFVRvT0fGeMtRqvDVJdi9g3JC/Mr+KHTk
 jcwcf7PtcmVkgRV+Xco1S5zk1ixl1z3YnW/dWN20okamILtbESYr9sR/Y9vso2+2Nplh
 tSf1ncuip1k15zmwGpBEgDAD1IYYE6ikTq9ob8uWcllhiW/j7JokdLtVbKhG3CzsnATX
 nGy08dCQJFa32rwrXNsWbQMJq/TyOScuY4Gx+CUv9zfCfIHgbKrru+yYrx4P4alEK3vw
 +nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762511416; x=1763116216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6g7dsZ8u0SOZn4ZdglRbxzgGZbve11SxESJzoyiLLfA=;
 b=BLd2CUIg+5DDoDuSeM+jAoPRulkcNGaojas8X2OO9nRH4tKRB1v6+VIn35RqvUpWKo
 tVgjGqyqPktlQz7UebIcfnRZlNzUt46LBfYyiVGYb9jfhtNQFvVygGgNw2OaQPbJdq0Y
 XhqTsJotj9Ja1d+yHkokfw7GTqd3Q47SxJJuC0nbnxttBig3hvTDbRuJgS0tABzY5JdX
 GuT2HWOaWSWnhc2DgeI4TQGmQoLayozisyWlx3lL2SG70KVDHejWg0YiFWu+CMZRTb4o
 1OEXq34XPuURMpgxaKouxVerZAPxYLA1yzyepiCvIFziw0jBc1McUHly7OMg/vl4YC1s
 tpug==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7CIO6lBHHXchnO973JHfCKHXEt5/eiT+fX1jnzBXt+LF+Am4m/e31qGs/UD1/5tdS48Viv7MWdn48iQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy1iwSxeg6rMTRQa/FmiUSfaZ8+6kis+HHaAsDuU5Xr1+PE7RsN
 ytKEMIm833GDllCan3BO4dYp8EF7aRyMJLkgUZWkjqle5WvZn/7lcrt0Jt1ydC4zuVg=
X-Gm-Gg: ASbGncvtFICRuZQOvijEWRssMDWqQAGA6nGi8pmEmLW3hhmct0KxQRdzNTVQ0/G7+rq
 le9aXdeqZ8YrDhtX2OaFM/AlWLezZFWcqCjkwdR8ixZufFf/UKRFw0U7ZJSB0FbvIZxgNljPyz8
 9hEfrabOgs130uaWWpEN0LRCzBMgbf0Xi6+WEzE6HNla4sEMHO5pS0qZeMarOuPVTwlKiAHCmuN
 SN9kvVNSVbbmfD7wyKJFJ//rrZVWIWIb1NYB2aeH8TV1EQI1R/oNHThfwGxgLmyPs6zhXCi7ZbB
 tbYRbxJSTlB+n96NvEen9APOaAlnEQKg4I3x73kh/B80sqpo4ue2/7H6ggcf7NCKOntrCI32ebg
 ERkAU4OsY/3V/hgyd0mLgHffQz+K8zvtdCaNkUAbNaPQAVC6cihWsvy6w9IoQkU6QtZ8m
X-Google-Smtp-Source: AGHT+IGjWqT926NXSYOyJLRW80qfFEBsN3CZLG323CE3ZOxMO0Sltaq1d1IcpoU8pb1e3RtYjr7rzw==
X-Received: by 2002:a5d:5d06:0:b0:429:b751:7916 with SMTP id
 ffacd0b85a97d-42ae5ae025dmr2131435f8f.45.1762511415568; 
 Fri, 07 Nov 2025 02:30:15 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 02:30:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:54 +0100
MIME-Version: 1.0
Message-Id: <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
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
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5646;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FNtfWUOF4aoHZQXzUDVa1raYDkAAFgkdXVleG8nnhtM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcool2zGWAFikwgtdjrvFAFi5YomqW8xImQ2T
 QXlmf8S3+2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KKAAKCRARpy6gFHHX
 cl2VEACqTpc4dL47ZWZ/SzyIHTYakk3glXirLn2ZL9SFZunoJCJoi6zwm+f+1+5VDZ6j9durf5v
 A9qeHYJm1gph+hLEmyn9e9tuPDqPfh1e4v/9Wu8jIY5XD/5yoVt9kwaQ0v91D3MYV9a0ErY6oU2
 PYM1W8NkW5+lUs41TB6biM2HMQoa0VsHOa7lOdYt5nNUNhFiu0Qnu2/Z8t3GbLgSqqOCN3rFUel
 vC8iF8zUaiO8HgGEeuM+gRE7ZkLXWSg98xo+efB0A0VCEHCk3U3m6CGG/ayGpVlZtISZXa+l808
 4C1h94xXu9ajAxFFRIKRsr2DemVtJMmpG8bQyTZKrxGy/otQ0jczkYY7fusKe/uMpiVvoJvLrAu
 opLOftH0kLcleHpiNL1mp5HU1qqcishRcrZrW/T+Ud8GqJ69lgED2cGP9QX9XSGNvsOx5HUOn/j
 2q8/RwltyqNE4WAMZdZKV3FMANcxoA6GO01vGwR3O/RqRVwU90IX3/n6R45KrkLJA3TIKQwGDiF
 8tVdjAAcgDPQf5MRhK5J8LxUi7VxtbFyXgp5XRdjkFcRUJRQELIFpAKefK55JACbcH48/pZNVUx
 tm5TTJUd/CyMRnyYEufOrm94X6z0/gh1HI+vszkSpwEWnZywOTfpkOFzWwtZSK0fz7f6qE5QTz7
 OQIeaRCQnSdIlag==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap emac
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
index 8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e..9cafe101049d5412d649b3beaca350c497ffc981 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -214,6 +218,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -230,6 +238,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -262,6 +274,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -297,6 +313,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -750,7 +770,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -801,13 +822,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -835,14 +858,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -857,10 +880,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
