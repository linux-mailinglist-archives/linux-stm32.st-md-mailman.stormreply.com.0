Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1C66B7E57
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:58:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6202BC6A610;
	Mon, 13 Mar 2023 16:58:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA987C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678726704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVl6orxzuvHm+XLKzWjqWDvJoROxMGFFnqYcN6mqTg0=;
 b=ROZPTdhzrcCv0QSoDy3Gaj9y++PWq92/JP+PMHRYx+b+3V82XKOH3nn/mvhb27Me2WZuiZ
 nf6pVU1qGFuH/DoYDOg5AYLDVzeAuU5d31e+/9AHRZgBrlsXab8Wpo81NIVwGrKiR6BerU
 CkZ2++J4Hcz3Ab3DyKzI+BAVPNdAokk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-Cfl5xUzdP3qUBKJUPAo3cw-1; Mon, 13 Mar 2023 12:58:21 -0400
X-MC-Unique: Cfl5xUzdP3qUBKJUPAo3cw-1
Received: by mail-oi1-f198.google.com with SMTP id
 z18-20020a056808049200b00383b7de8124so5625998oid.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVl6orxzuvHm+XLKzWjqWDvJoROxMGFFnqYcN6mqTg0=;
 b=h5FNN3clSl4SCu7OZXIzribjbquJ6L2P6bdUhy3U1c6gbX+R7hDakqz/xnN2POrY1J
 Mb9q04tMtsKKiEtwOT44Xbbrf7EEi8QI8C2QbaH9MGQsBon2eotN2xRmF4mjnmM/+yfs
 DQ0KqEpvhx1mPResHX6R2RZGbicVlCbWpdoLwsJlyfOOqL8rMqIH9leXmNa23F3/3IdN
 0AlPKSiARUK1dU3UuXG7GYijmzsff4gqQ6DXsKfgCbanKF7NOQFM4w3lSCs4N+XEFgse
 7FF+EWOz2wGr6ffFjLlkSQKtNqvydIM63+mvb/VFsVSfblBnXVIynnaZtamNqTgs8SDr
 A9Xg==
X-Gm-Message-State: AO0yUKWXWcy5KO4IbJ189+9hMbLB1IMaAByF2PZ4agU8arc0u6An3R3C
 sSv01eaFioKPsxtGcgXfdR0gsRymsFbf38zCt0X9LHlOMH/apZ1LHZr0jofdSkQlPqIxIYwQj/Q
 vJiygCe/oKZEjDt7bEllC3cy0fGX8RLq/Js34IDMB
X-Received: by 2002:aca:f0f:0:b0:378:2270:8876 with SMTP id
 15-20020aca0f0f000000b0037822708876mr16119577oip.29.1678726700226; 
 Mon, 13 Mar 2023 09:58:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set9aWALs6TiNTEX+C5mZJoiPJc3eHeEmHAP8Z4DcPrtItge6Uh2r4oe/Mj1CZw4H7FfOJM8Ydw==
X-Received: by 2002:aca:f0f:0:b0:378:2270:8876 with SMTP id
 15-20020aca0f0f000000b0037822708876mr16119547oip.29.1678726699920; 
 Mon, 13 Mar 2023 09:58:19 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 09:58:19 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 11:56:20 -0500
Message-Id: <20230313165620.128463-12-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next 11/11] net: stmmac:
	dwmac-qcom-ethqos: Add EMAC3 support
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

Add the new programming sequence needed for EMAC3 based platforms such
as the sc8280xp family.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 106 ++++++++++++++----
 1 file changed, 84 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 778852934e36..2b22469c59cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -11,6 +11,7 @@
 
 #define RGMII_IO_MACRO_CONFIG		0x0
 #define SDCC_HC_REG_DLL_CONFIG		0x4
+#define SDCC_TEST_CTL			0x8
 #define SDCC_HC_REG_DDR_CONFIG		0xC
 #define SDCC_HC_REG_DLL_CONFIG2		0x10
 #define SDC4_STATUS			0x14
@@ -49,6 +50,7 @@
 #define SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY	GENMASK(26, 21)
 #define SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE	GENMASK(29, 27)
 #define SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN	BIT(30)
+#define SDCC_DDR_CONFIG_TCXO_CYCLES_CNT		GENMASK(11, 9)
 #define SDCC_DDR_CONFIG_PRG_RCLK_DLY		GENMASK(8, 0)
 
 /* SDCC_HC_REG_DLL_CONFIG2 fields */
@@ -79,6 +81,7 @@ struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
+	bool has_emac3;
 };
 
 struct qcom_ethqos {
@@ -92,6 +95,7 @@ struct qcom_ethqos {
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
+	bool has_emac3;
 };
 
 static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -184,6 +188,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.por = emac_v2_3_0_por,
 	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
+	.has_emac3 = false,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -199,6 +204,23 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.por = emac_v2_1_0_por,
 	.num_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
+	.has_emac3 = false,
+};
+
+static const struct ethqos_emac_por emac_v3_0_0_por[] = {
+	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
+	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x80040800 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
+	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
+	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
+};
+
+static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
+	.por = emac_v3_0_0_por,
+	.num_por = ARRAY_SIZE(emac_v3_0_0_por),
+	.rgmii_config_loopback_en = false,
+	.has_emac3 = true,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -222,11 +244,13 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
 		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	rgmii_updatel(ethqos, SDCC_DLL_MCLK_GATING_EN,
-		      0, SDCC_HC_REG_DLL_CONFIG);
+	if (!ethqos->has_emac3) {
+		rgmii_updatel(ethqos, SDCC_DLL_MCLK_GATING_EN,
+			      0, SDCC_HC_REG_DLL_CONFIG);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CDR_FINE_PHASE,
-		      0, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_updatel(ethqos, SDCC_DLL_CDR_FINE_PHASE,
+			      0, SDCC_HC_REG_DLL_CONFIG);
+	}
 
 	/* Wait for CK_OUT_EN clear */
 	do {
@@ -261,18 +285,20 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_DLL_CONFIG2_DDR_CAL_EN, SDCC_HC_REG_DLL_CONFIG2);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
-		      0, SDCC_HC_REG_DLL_CONFIG2);
+	if (!ethqos->has_emac3) {
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
+			      0, SDCC_HC_REG_DLL_CONFIG2);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_MCLK_FREQ_CALC,
-		      0x1A << 10, SDCC_HC_REG_DLL_CONFIG2);
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_MCLK_FREQ_CALC,
+			      0x1A << 10, SDCC_HC_REG_DLL_CONFIG2);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SEL,
-		      BIT(2), SDCC_HC_REG_DLL_CONFIG2);
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SEL,
+			      BIT(2), SDCC_HC_REG_DLL_CONFIG2);
 
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
-		      SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
-		      SDCC_HC_REG_DLL_CONFIG2);
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
+			      SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
+			      SDCC_HC_REG_DLL_CONFIG2);
+	}
 
 	return 0;
 }
@@ -326,9 +352,17 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 
-		/* Set PRG_RCLK_DLY to 57 for 1.8 ns delay */
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-			      57, SDCC_HC_REG_DDR_CONFIG);
+		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
+		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
+		 */
+		if (ethqos->has_emac3)
+			/* 0.9 ns */
+			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+				      115, SDCC_HC_REG_DDR_CONFIG);
+		else
+			/* 1.8 ns */
+			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+				      57, SDCC_HC_REG_DDR_CONFIG);
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
@@ -354,8 +388,15 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      BIT(6), RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-			      0, RGMII_IO_MACRO_CONFIG2);
+
+		if (ethqos->has_emac3)
+			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_IO_MACRO_CONFIG2);
+		else
+			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      0, RGMII_IO_MACRO_CONFIG2);
+
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
@@ -388,8 +429,13 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      0, RGMII_IO_MACRO_CONFIG2);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-			      0, RGMII_IO_MACRO_CONFIG2);
+		if (ethqos->has_emac3)
+			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_IO_MACRO_CONFIG2);
+		else
+			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      0, RGMII_IO_MACRO_CONFIG2);
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
@@ -432,6 +478,17 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
 
+	if (ethqos->has_emac3) {
+		if (ethqos->speed == SPEED_1000) {
+			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
+			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
+			rgmii_writel(ethqos, 0xA001, SDCC_HC_REG_DLL_CONFIG2);
+		} else {
+			rgmii_writel(ethqos, 0x40010800, SDCC_USR_CTL);
+			rgmii_writel(ethqos, 0xA001, SDCC_HC_REG_DLL_CONFIG2);
+		}
+	}
+
 	/* Clear DLL_RST */
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_RST, 0,
 		      SDCC_HC_REG_DLL_CONFIG);
@@ -451,7 +508,9 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26), SDCC_USR_CTL);
+		if (!ethqos->has_emac3)
+			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
+				      SDCC_USR_CTL);
 
 		/* wait for DLL LOCK */
 		do {
@@ -546,6 +605,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
+	ethqos->has_emac3 = data->has_emac3;
 
 	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_clk)) {
@@ -564,7 +624,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
-	plat_dat->has_gmac4 = 1;
+	plat_dat->has_gmac4 = !data->has_emac3;
+	plat_dat->has_emac3 = data->has_emac3;
 	plat_dat->pmt = 1;
 	plat_dat->tso_en = of_property_read_bool(np, "snps,tso");
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
@@ -603,6 +664,7 @@ static int qcom_ethqos_remove(struct platform_device *pdev)
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", &emac_v3_0_0_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
