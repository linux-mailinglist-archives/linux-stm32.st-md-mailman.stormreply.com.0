Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 722FEC31202
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 14:09:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A1B4C62ECF;
	Tue,  4 Nov 2025 13:09:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17945C62ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 13:09:34 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso71208415e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 05:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261773; x=1762866573;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
 b=VubojumaR9y6dJB9vcq+grnA/uDUNTF7WC/m1f8D5DSarrVzx3GT7eevpcbVKQpU6b
 eiLBTt4ZvPtI1i0n8/2Ep2B3LrLQdMxQQXjiCLCkaj00jQvio+GhcZ+FF7tLy/ox3D6E
 ydFjVjE2lXYDDDTbMpCc9rEj636Pm2T4q+8JfSTLTs3okP9hlXD+3L6pmRpAKtvtf69l
 j5cV/uriE/v9uPD3FHpb2B9kV24+orU5IxL+gCd418TngtuA70Pq4RVOCzvqte5bLLxc
 jg01isCpD/j1rGgz7/2Q2OY0BPZTUJjZgVdb3ZhE61YrY3b/qFSoYNNDMD5k0S2OpFd0
 c8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762261773; x=1762866573;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
 b=B+ier+2Mx8Yl5anX6CPw95MnuT65g0yIUDwAmQjOtHD57ASXJ+UUpIQdOYb/RW7TG4
 7fkMqQ4NYeVCaoaOypH7MUvlFNlaWg2MSKzPt6/w3uDPaxsfJUbZF8kokrrDeDDfi0BB
 83bw3DeyGdkzgQZ+F0edw/7KyuNyuqgqVSjJXVk6CZSmLAhsgaSprIan57y7mjyFB+4g
 SsQmBiPNMSrtqNl73Bu+EdHgZUtFtNs50r3e/dRRjBXsL/8qtZsm4drqwYiI9HIXRnBT
 9RGYrNTyvTKEx5KNjnkiqgCSd0wE9Ui6DTKhVqemw3nw+x05LFzv3difvVFP9OKsh0Db
 HDQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnNwOo/hebVrk4cklRt0b5ajxPetBatmXVa8aXvGtTEv7r6WYp51klmOgWnC9QO+oM2UpzmI1lEBgbCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4PpMq7cdandeAGgVuZfCxmVauqFO25cwHTGbSZZH7GGoM7Vws
 XwEnZ/RkhbL+M/qtOvi1ldo5Y/jeCguIFsGDPCc5nL1XS14QyOYVc9qQNttEU/AF/rI=
X-Gm-Gg: ASbGncvT3W8PDMBEv4BfZxQ0W6i5Lp/K71Hz12qgubBrkn2LrLCTWA9jVNldfCW+81B
 aWLSXzBHSXh20Zck3MPxsT+xgWquS/2gbffwhKpyNeaWRcF+msPqC5PsvrWlm9xa5YOT6VYSRSK
 5RQZACLhKnTLR84vZLaEnFHQz7VrZWNJbn8BwCdCXAy4HccR/nbp7pBwc/2l+wHdUUheIrDy8Cx
 6PIZ42PfAW902HeFu9znwNuLUGFhYkoHwRVg+MdHTKk3s6I7XbcxZ5o+MmCYwXey8AjB24af4p2
 bMn+lQ4J+9LxuQkv2ywy/bma/JqsyfuM1GuCQKADe73gff9PLFjdAZsKv8Bn70ZQFVrryu1mMrQ
 be2mufCHhLpaJGHadyz7FrKoCpCNdr0DEn4tycEY76YmUZLv9Ig6V3iOnlLQh/M2w6s/e8A==
X-Google-Smtp-Source: AGHT+IHLeJTkz3Z9JUhRNQIdfiIz3zju/KKqwii1AcstjAWBhNyTLGOcii2tELicylV8dY7OWKqeQQ==
X-Received: by 2002:a05:600c:3485:b0:471:13dd:bae7 with SMTP id
 5b1f17b1804b1-4773bfb51f8mr122528535e9.30.1762261773214; 
 Tue, 04 Nov 2025 05:09:33 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 05:09:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:56 +0100
MIME-Version: 1.0
Message-Id: <20251104-qcom-sa8255p-emac-v4-5-f76660087cea@linaro.org>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GhJny0rrOhbWO9GcfNfulcQ1HGUq/SGEEOh5ESB4E5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrt1PXYHKJt2IulJ2CyvGw0mRwafmetNOR2Y
 5zJmQ+uGwGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67QAKCRARpy6gFHHX
 crVLEADE2sKmE+cnYe6vd8MrSPmBXpfZ48+xv9duA0AFvw0Jl0TIVags+e1ih+VNlrPKVQkDN1E
 4hvIVk5690c3a7nxPof8XwbSvHgwyqCuAu9+rR2qjl3J010XvLAjdjJQBWKUQXOhLWDomWEEHNG
 mgCVEHSsM8vWjKT7puhWaGverUX8oMQ1aMQt8wHHcbw0YpWz7QEI8oAduybvItGU0SS2C3tLaH7
 Jd3Eab4GHdc1anBVlXj9a71lYduzL4icKt6e2gR3cn7pTAfGEeDU8K3aXwXYyiUKaMHlDPO3AsK
 Fr+ivt8c63rfdqbPTHNjeQLAf64hx+XfXcg4DvlUImNOjGESEoJiE0fxuMaz2citgMG246tCSYU
 C5uLvQbjLqchzLfNPDaA2QihiKOQmHRRkGKcqFqk5Xhw46XlYCItAnlkMKm71+2tkb+xswW9NAN
 iwi2Tba4S6v9um/tsCcXu4R2gRT46lYwFGNHj3ndHgtdafKm3jGsLmiEDYuX6n5HPZkxm/1qQCr
 HjlYxUxuRoFDhUZ7MxewBMebBxObzXfWGg01dynSHvIzFBogam2kDjrtSCOYxEiXq7ZdTExPbzK
 z+l9sZSchK0d1c8tZffhQ/6KlCSXT79aF5UfiQJj6KCvGC5x8i7+YLETdMQ//TKcwS11rR7IXeL
 MYJ/8y8lkrz6tPA==
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
Subject: [Linux-stm32] [PATCH v4 5/8] net: stmmac: qcom-ethqos: split power
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
index 9cafe101049d5412d649b3beaca350c497ffc981..1f00556bbad997e2ec76b521cffe2eb14fabb79e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
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
@@ -292,7 +296,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -313,8 +316,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
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
@@ -771,11 +779,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
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
@@ -823,6 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -830,7 +843,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
