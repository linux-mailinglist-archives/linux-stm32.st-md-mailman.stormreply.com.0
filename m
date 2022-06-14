Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC4D54AF43
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jun 2022 13:22:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01F23C6046A;
	Tue, 14 Jun 2022 11:22:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05C62C6046A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 11:22:46 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id q15so4470887wmj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XAi7yYw1KbeaAyG4ORCQsljXN7rpKYz0Lgy/6AMChJQ=;
 b=lUPqteObQGzNdhBASmGAVQhbq/1XEP2Lgp5ACwtc4/b4EseGatsEeRcX8qyteDH4JS
 6X5v60mLdnJtv+/AL1muJL+qbU66mhcG8567Sjo3K2W+iPJXcBEsrR5SUn2Z4cFrKXID
 NJ6wTbdGksyQz+uh7JcF9ckSL8wwhqHhIyO0jCxFOUJPq8oWy2u0OBYUpNItg56iDvDA
 wEoCY0NE8jkl/HB3Ga81kjJ2tzdzZHQIbKRF1Ni4DCS9QFsvsx1N9OxosJn10TG/LHl3
 cjpzmhfMOPgsHyr57ckAijWy0sOTcORIV4OlKPACSQ6jdYNir1ZVZ9mqW6/RPh1rbAm/
 76Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XAi7yYw1KbeaAyG4ORCQsljXN7rpKYz0Lgy/6AMChJQ=;
 b=M4Dlr3M0KAu+5Feu9lFKc685SNnXl12mooO6UPsrQMyDgKhz+sMe/TaPezg9fruWFe
 7TeUw/Zu2LC8TSS7X7K9VhLVNdPHEhe1jOBfu2ormGHz3d8dgQofFeZcVxGfMeXbnh3y
 I/QGD2De7RHI+7KlPhdB5R6RM006+uEjxeab7p8dL5Ky3f60nZ18jnD3x9eB6KWICkvM
 V6VzO1n/TORrmDPNSKC4Z2OGajD297X4ETE5Z/D3reXnjtsPIlpUJH0WTESZHyCvWIiR
 ZMIqRIdBpxV8MCs0MGfVF291xi3TO92/54Q7CMGW/3uKgxVaR8p3IgcVwLhMd21Q/cv5
 6HnQ==
X-Gm-Message-State: AOAM5308+vS4HLqx/j3FGZSoSBc3+J9cnJwXVQjhuL2cRSs+GhWl+Itq
 En61U3/xKRldyyIZ5oRMBQH6XhoX90g=
X-Google-Smtp-Source: ABdhPJyPIX1VeSzfEnAnyUHfwwBxOlzTXFdDjygeX1gNCUoQDW/NrvecGfaXgomSrSNZoXGvW+e/fA==
X-Received: by 2002:a7b:c110:0:b0:39c:8270:7b95 with SMTP id
 w16-20020a7bc110000000b0039c82707b95mr3601441wmi.41.1655205765413; 
 Tue, 14 Jun 2022 04:22:45 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 o19-20020a1c4d13000000b0039c60e33702sm12497390wmh.16.2022.06.14.04.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 04:22:44 -0700 (PDT)
From: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 14 Jun 2022 13:22:28 +0200
Message-Id: <20220614112228.1998-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220614112228.1998-1-ansuelsmth@gmail.com>
References: <20220614112228.1998-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>,
 Mark Mentovai <mark@moxienet.com>
Subject: [Linux-stm32] [net-next PATCH v2 2/2] net: ethernet: stmmac: reset
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
v2:
- Fix reference leak for 'fixed-link' node

 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 832f442254d8..e888c8a9c830 100644
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
 
@@ -253,6 +264,55 @@ static void ipq806x_gmac_fix_mac_speed(void *priv, unsigned int speed)
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
+	of_node_put(dn);
+	if (ret) {
+		dev_err(dev, "found fixed-link node with no speed");
+		return ret;
+	}
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
@@ -400,6 +460,10 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
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
