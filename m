Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A568544090
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jun 2022 02:28:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C034C5EC56;
	Thu,  9 Jun 2022 00:28:57 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9475C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jun 2022 00:28:54 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id kq6so31427097ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jun 2022 17:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iZYilu8fPT/X0/rC3yI2GAgJU7tXE0lBGVOQjpp6qfg=;
 b=Eh/MIYG2mfr8DWBEbA8RjQdvZyriooYS+sRRTbmbx0KeybrKZe2Gds8SidizZcl0uF
 Zwc0bNBw5DWZ/f3vwVvZ028NZj5qUltbENvd+jrl5410z2/pp3tbV02gdER9psqVPkf5
 /fSDZi+VeSIs3ktCmBGrGjWyOVJwfAY3zzDz4vyQHi9dB/lb9GO6VdrTPW0I5nu2DEWi
 1YgxaJEhnXrWpmMWwcu5TnUutF/t/br69v1D52bMEi89GFcZyXWxcdOIHAwuLeCKPey3
 cy8VMJXGmdGls+p7Fz4gC4vTljIMM3kIwsZtbx90SBiBSt3oxn+FeahKrNRNb1q6RBkf
 LYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZYilu8fPT/X0/rC3yI2GAgJU7tXE0lBGVOQjpp6qfg=;
 b=AhIv9riYQNByAuWFZo5xdkkfTXyrGeBpuB8insj3E42t3NZGf+UOuCvbA9wa2hb1lj
 X1eIKYM2/da2275DxSNMPa8XsZEMPC5BHgRyxGkdHq3p9TxI+B/jLfNZ2JIBMFMqMabA
 BeANRamEkUL3Lt2M1nPDakQb98daXC4R5frcQfB84UVvKTBpRVwZVkHuq+UrQ+7l45Qd
 B/oDQ3ushTZrlCYDv+QfsjEtaLtmZldJw88QW74+wDJqFZrx3q73yk58CnNPDftdXZYM
 zyjoxz50eDgc40FMFB8qEEHFp/6uRXBmbFdXGQoog/c9lzZiimjSOhW6atQzpzNmQNGl
 HYFA==
X-Gm-Message-State: AOAM5323YrAjdp/GxQSNO3SGjRrWdSvChoYecPXBsXBbq9jGGhRf3Jy9
 O5VNIXRgV2RByE4zMTPhlLE=
X-Google-Smtp-Source: ABdhPJz+2lELdvabfIWbfohoHH9dl6Q+0YhytqLPBbaw5WQ97ArKPw0ZDiQDPP9b2Y9CzTJCpKNLEg==
X-Received: by 2002:a17:906:4784:b0:6ff:34ea:d824 with SMTP id
 cw4-20020a170906478400b006ff34ead824mr34687999ejc.526.1654734534147; 
 Wed, 08 Jun 2022 17:28:54 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 g22-20020aa7c596000000b0042deea0e961sm13110325edq.67.2022.06.08.17.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 17:28:53 -0700 (PDT)
From: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  9 Jun 2022 02:28:31 +0200
Message-Id: <20220609002831.24236-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609002831.24236-1-ansuelsmth@gmail.com>
References: <20220609002831.24236-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>,
 Mark Mentovai <mark@moxienet.com>
Subject: [Linux-stm32] [net-next PATCH 2/2] net: ethernet: stmmac: reset
	force speed bit for ipq806x
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

Some bootloader may set the force speed regs even if the actual
interface should use autonegotiation between PCS and PHY.
This cause the complete malfuction of the interface.

To fix this correctly reset the force speed regs if a fixed-link is not
defined in the DTS. With a fixed-link node correctly configure the
forced speed regs to handle any misconfiguration by the bootloader.

Reported-by: Mark Mentovai <mark@moxienet.com>
Co-developed-by: Mark Mentovai <mark@moxienet.com>
Signed-off-by: Mark Mentovai <mark@moxienet.com>
Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 832f442254d8..0f2f2bc6873d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -66,6 +66,17 @@
 #define NSS_COMMON_CLK_DIV_SGMII_100		4
 #define NSS_COMMON_CLK_DIV_SGMII_10		49
 
+#define QSGMII_PCS_ALL_CH_CTL			0x80
+#define QSGMII_PCS_CH_SPEED_FORCE		BIT(1)
+#define QSGMII_PCS_CH_SPEED_10			0x0
+#define QSGMII_PCS_CH_SPEED_100			BIT(2)
+#define QSGMII_PCS_CH_SPEED_1000		BIT(3)
+#define QSGMII_PCS_CH_SPEED_MASK		(QSGMII_PCS_CH_SPEED_FORCE | \
+						 QSGMII_PCS_CH_SPEED_10 | \
+						 QSGMII_PCS_CH_SPEED_100 | \
+						 QSGMII_PCS_CH_SPEED_1000)
+#define QSGMII_PCS_CH_SPEED_SHIFT(x)		((x) * 4)
+
 #define QSGMII_PCS_CAL_LCKDT_CTL		0x120
 #define QSGMII_PCS_CAL_LCKDT_CTL_RST		BIT(19)
 
@@ -253,6 +264,56 @@ static void ipq806x_gmac_fix_mac_speed(void *priv, unsigned int speed)
 	ipq806x_gmac_set_speed(gmac, speed);
 }
 
+static int
+ipq806x_gmac_configure_qsgmii_pcs_speed(struct ipq806x_gmac *gmac)
+{
+	struct platform_device *pdev = gmac->pdev;
+	struct device *dev = &pdev->dev;
+	struct device_node *dn;
+	int link_speed;
+	int val = 0;
+	int ret;
+
+	/* Some bootloader may apply wrong configuration and cause
+	 * not functioning port. If fixed link is not set,
+	 * reset the force speed bit.
+	 */
+	if (!of_phy_is_fixed_link(pdev->dev.of_node))
+		goto write;
+
+	dn = of_get_child_by_name(pdev->dev.of_node, "fixed-link");
+	ret = of_property_read_u32(dn, "speed", &link_speed);
+	if (ret) {
+		dev_err(dev, "found fixed-link node with no speed");
+		return ret;
+	}
+
+	of_node_put(dn);
+
+	val = QSGMII_PCS_CH_SPEED_FORCE;
+
+	switch (link_speed) {
+	case SPEED_1000:
+		val |= QSGMII_PCS_CH_SPEED_1000;
+		break;
+	case SPEED_100:
+		val |= QSGMII_PCS_CH_SPEED_100;
+		break;
+	case SPEED_10:
+		val |= QSGMII_PCS_CH_SPEED_10;
+		break;
+	}
+
+write:
+	regmap_update_bits(gmac->qsgmii_csr, QSGMII_PCS_ALL_CH_CTL,
+			   QSGMII_PCS_CH_SPEED_MASK <<
+			   QSGMII_PCS_CH_SPEED_SHIFT(gmac->id),
+			   val <<
+			   QSGMII_PCS_CH_SPEED_SHIFT(gmac->id));
+
+	return 0;
+}
+
 static const struct soc_device_attribute ipq806x_gmac_soc_v1[] = {
 	{
 		.revision = "1.*",
@@ -400,6 +461,10 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 		err = ipq806x_gmac_configure_qsgmii_params(gmac);
 		if (err)
 			goto err_remove_config_dt;
+
+		err = ipq806x_gmac_configure_qsgmii_pcs_speed(gmac);
+		if (err)
+			goto err_remove_config_dt;
 	}
 
 	plat_dat->has_gmac = true;
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
