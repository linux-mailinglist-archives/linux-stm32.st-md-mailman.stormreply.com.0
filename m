Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F3ACF2E4E
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 11:02:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE35EC32EB0;
	Mon,  5 Jan 2026 10:02:53 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1FD1C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 10:02:52 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso6338598f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 02:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767607372; x=1768212172;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
 b=ML1dJRGUjxKiGGEIH8grEuyyxKW1ZAJCRBHyZy1rFZl8oZ2Ujo3Y/4A5f8PqnbAJ9B
 5zLlCWEKBU0BlB+S07hSpwgEZ1cotTritYHgkfydZ3qTba3yAgVj74Hc0cqrUHF68SPF
 VQy+3gPmzv0gmo2MsZNTmYiZ+dqChlTPRm8Q3Oe+Ux6rTj1D4IxMs5yalwH7QUO5N3Og
 RKKc1b6ij1clvo7wWEZYjmhsGxjiwe+k8SI57Y2j4bKBqsU8lTSYJbRn6tsK9/WgaOp/
 vUBPTB0t1bKVaT9KMNDEYxt+eoDk4vcair/UO7FBIwBtBLvuRlxL+2g1dJwTGhOtWMTx
 fs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767607372; x=1768212172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
 b=wo8iihRV4+2Zly0eboyAAAH1lhnXgnqx2BBjuPVPKRutIHZ5nUwgUUqX7O9J9nsDHc
 VHzZm+rJF2G1wl8xL5fwQy05AZmiMyhEhHmvnZ5wPm51bMuKgEdV3nArlG+q7ewH3ajh
 0IOAjjA9YSOP5GSvHZljMTlWZyZ0ijEFP52TcD+bjXMAHgTsMXK8u6UH2RQSafEX4SIH
 oG79JpAPi0ad5e3L3H5JfOfFlm/yLQ4NVYxUUja7S8DNZle/YX1Wbz3rwKOcFBk/P+u8
 g5O9emQA8DV1f3RXOoZV5T05Zi26KKbpjd9FcM6zRTqmK7JnKtpfzvKO7OZdf6ybsupP
 Oljw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF/Q0Pu+N21vFEOmmghZNZvBPLQVjEcPin8GGQMZZjFGc5yaSFCDA9gG/ej3teHV/1T+y8w8KRZve8ng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0bdIwFWZ9CVeMsmsaRlhlPwUbYocgOs1ziuSnBjol03vEvaNa
 5GcF6ylttfsV0IN2ZrylK93WjSRZEwpxlFpgMlJesKT8rM1rkQ0O80rB
X-Gm-Gg: AY/fxX7mHeyZu4dVFHVd5iryYnR7AxRNkp3JCkaRpO4uI84Mx9YvxpZUSsqVLa0xIjX
 khW977XTdVVTiNcEinPBRbeHJ5O0ZbSDMOPoyRUPSll0iHVP0OhOt7SC22LoJZYnMZ3eMEfyXkI
 nQlTiLg2eCWx20agoQW15tZ8cOW+c6AYjfWPt/diPTh+U5SGuI+yIi+ud+6uktOFDh4hWg8ICRx
 eW37RCr8bqB7xlJlcXY62xNBTTjUSZKdAKX896s06eZRC9QeiMIMk9m1srQpjLJkCc2Q9v2aep+
 8k2V+hbe0ZeymKhullYEjRp+y/vOgXs0D2AE76yF2d1p6fEWTGySZe59qhiCnAPQH2IjdG4xVTm
 CB7wdk05Ry7rbLG0liCtdgbCssgbKjsOlalW6mjTf8N9JQwNLtFZO18enZZcklTmdoWOvP3IQs9
 F4rQ0UJLaYf0oA6ZUXqCCFeH21
X-Google-Smtp-Source: AGHT+IFKkMH1ZSx5o/rB6BTbeL4h1LkJTSLLqMkYzmB0QdI0255AUuWQv6qVkyZaadRtjHotP2jJUg==
X-Received: by 2002:a5d:5d87:0:b0:432:8651:4071 with SMTP id
 ffacd0b85a97d-4328651421amr32457140f8f.18.1767607371844; 
 Mon, 05 Jan 2026 02:02:51 -0800 (PST)
Received: from eichest-laptop.gad.local ([2a02:168:af72:0:20bb:19ed:fbb2:7e2d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b36fsm99270630f8f.5.2026.01.05.02.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 02:02:51 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Date: Mon,  5 Jan 2026 11:02:23 +0100
Message-ID: <20260105100245.19317-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: robh@kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a
	fixup for the Micrel KSZ9131 PHY
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add a fixup to the stmmac driver to keep the preamble before the SFD
(Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
used on an NXP i.MX8MP SoC.

This allows to workaround errata ERR050694 of the NXP i.MX8MP that
states:
ENET_QOS: MAC incorrectly discards the received packets when Preamble
Byte does not precede SFD or SMD.

The bit which disables this feature is not documented in the datasheet
from Micrel, but has been found by NXP and Micrel following this
discussion:
https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032

It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
10MBit. Without bit 2 being set in the remote loopback register, no
packets are received. With the bit set, reception works fine.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
Changes in v2:
- Use phy_register_fixup_for_uid() instead of adding a new device tree
  property
- I will send the conversion of the micrel.txt binding as a separate
  patch series
- Link to v1: https://lore.kernel.org/all/20251212084657.29239-1-eichest@gmail.com/

 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 56 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index db288fbd5a4df..23bc917d3f0bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/stmmac.h>
+#include <linux/micrel_phy.h>
 
 #include "stmmac_platform.h"
 
@@ -39,6 +40,12 @@
 #define RMII_RESET_SPEED		(0x3 << 14)
 #define CTRL_SPEED_MASK			GENMASK(15, 14)
 
+/* Undocumented bit of the KSZ9131RNX in the remote loopback register to keep
+ * the preamble before sfd. It was reported by NXP in cooperation with Micrel.
+ */
+#define KSZ9x31_REMOTE_LOOPBACK			0x11
+#define KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE	BIT(2)
+
 struct imx_priv_data;
 
 struct imx_dwmac_ops {
@@ -282,6 +289,30 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 	return err;
 }
 
+static int imx8mp_dwmac_phy_micrel_fixup(struct phy_device *phydev)
+{
+	struct device *mdio_bus_dev = phydev->mdio.dev.parent;
+	struct device_node *mac_node;
+
+	if (!mdio_bus_dev || !mdio_bus_dev->parent)
+		return 0;
+
+	mac_node = mdio_bus_dev->parent->of_node;
+	if (!mac_node)
+		return 0;
+
+	if (!of_device_is_compatible(mac_node, "nxp,imx8mp-dwmac-eqos"))
+		return 0;
+
+	/* Keep the preamble before the SFD (Start Frame Delimiter) for the
+	 * Micrel KSZ9131. This is required on the i.MX8MP because of errata
+	 * ERR050694.
+	 */
+	return phy_modify_changed(phydev, KSZ9x31_REMOTE_LOOPBACK,
+				  KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE,
+				  KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE);
+}
+
 static int imx_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -389,7 +420,30 @@ static struct platform_driver imx_dwmac_driver = {
 		.of_match_table = imx_dwmac_match,
 	},
 };
-module_platform_driver(imx_dwmac_driver);
+
+static int __init imx_dwmac_init(void)
+{
+	int ret;
+
+	if (of_machine_is_compatible("fsl,imx8mp")) {
+		ret = phy_register_fixup_for_uid(PHY_ID_KSZ9131, MICREL_PHY_ID_MASK,
+						 imx8mp_dwmac_phy_micrel_fixup);
+		if (ret)
+			return ret;
+	}
+
+	return platform_driver_register(&imx_dwmac_driver);
+}
+module_init(imx_dwmac_init);
+
+static void __exit imx_dwmac_exit(void)
+{
+	if (of_machine_is_compatible("fsl,imx8mp"))
+		phy_unregister_fixup_for_uid(PHY_ID_KSZ9131, MICREL_PHY_ID_MASK);
+
+	platform_driver_unregister(&imx_dwmac_driver);
+}
+module_exit(imx_dwmac_exit);
 
 MODULE_AUTHOR("NXP");
 MODULE_DESCRIPTION("NXP imx8 DWMAC Specific Glue layer");
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
