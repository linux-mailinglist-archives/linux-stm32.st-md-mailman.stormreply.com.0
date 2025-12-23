Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D25CF2263
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3ECEC5F1FB;
	Mon,  5 Jan 2026 07:16:25 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7147AC8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 10:13:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42fbad1fa90so4047185f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 02:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766484781; x=1767089581;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
 b=GlxNTfvN3BI7OBc+yXZqL4Q6T8ngndjDE9T8Ar4CjSJJ+TyRe7aVMSH9uMcpZr7oMp
 ZeVE1ifRZp2BIXu8UdrZ66NYIupZXUC+hSWAUG+LHh8u+ruu/x2zUAaAK7I38A/Hh9JZ
 41x+3AIbFxG2udn08hx1AWA9M2bCevsTF3DXcG2mJjWPxO4Q8QwT9v8C1A/ZmlzP8h+L
 G/EndDIGoPy+wWKM/U7QsDgLxG2bTJKtUUPc5ZGItfBmMZ/RziDM0qkEZIk/kK+NMS2b
 auhYWUA7ZYLQuUiWu7fRQwkh8ViRY/bVMRHra0DrHrfhTKHz9V42LcIuVZCaQwS69VSS
 vY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766484781; x=1767089581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
 b=QkIpfKCUVwcXMOFhm+ybRz9q8aXNtBDjyg0N8GwE7L/GS9cmL4qqpXNRNLXXzsXX68
 V9wJncf4AwecoPBFt3H2XNI1DQhfwO04Pl8dUWAq9PJaoYbbz9rHL1ZidXUqCHuZkgyh
 1Uimnnl3C6SxD6eLS9u1xvsZ0qFtzoYITcHe0EoXORiusA0spTI6b75JF5r9xsfiVqgl
 +qbsBB2p3TtbLz92KcnwxVVbBcZKltrbJ21tESj3Cs/nZ1ThnnTVFRfc9BcubwGELTRm
 LcTfClJOnzBcJ04FI1kIDRFA5oGBmarZFhetBFDwQyNr12XZE+KlPidqyWOKEiL7n2lX
 vJdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHjrkIvdPO2X5PTwfA3Zb2nLFYQmV+QRXNzmQ3nYUMdaYtqEZyjrtg27YDTFI0cJZagZso4OaiCmbjAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwpbkIyD0IqTD6Bvfhl4WNmLS90F5owpS05kNbjjCEAe4OKO9F5
 DVWWC2r+A83RuR5OuAvolj3SI2ZvNKFXWNYig58NLsdpCfFRQGHQpQke
X-Gm-Gg: AY/fxX73BQqnvuzAcwNs/7GDrz0zNvtxNY1GLCPWLIUWmSfm+ZwkFVzoFPDSWy93FWz
 JuJOcGhQ99Uqa691UOXn86UW6hD/RNLaYyJX5ZSrCGF2g8Ut/ffrK2ZUaaSg5XeoSklL9CTIZmI
 M7blKHJ/s+X10jy2a6Y9LfJlpAhycHj+s6ZTEKaCAYww7E1uRKBYnVpnRxKUCFDO3c8+Bzgj8gO
 Ut19zndskY2gqfirpr/5PnNX/WbFhmMJMXsNZRH6gfV3QwoDhWiW5k3/2GTjo8Xov4y8ZzmxJHh
 7nSHBguiaV/XPGFqokEKiKf1Go8AZrqcCED16j0wBRS8sUjuRxyrclD/l5rC5vjwppyNPvFjE7t
 cX0xO1R0EYE6CMN5Dk7O27FynFcOvdrqyZNHH357MEElL412Tq4fXCttprnN8e8COjoe7W7QwgQ
 8EQWcKb9TdYW3kJhnPtKlQBi7+SQ==
X-Google-Smtp-Source: AGHT+IGF0o0X3T9TPemtGA4iv5QpXYtSLA5891eQonPhGoJJdeHdYF9/vi2taBPYEXsT/bnOH7uFfA==
X-Received: by 2002:a05:6000:188e:b0:430:fb26:3409 with SMTP id
 ffacd0b85a97d-4324e703d95mr14723855f8f.63.1766484780377; 
 Tue, 23 Dec 2025 02:13:00 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:db87:3fd:1ea8:b6eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa0908sm26759247f8f.31.2025.12.23.02.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 02:13:00 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 23 Dec 2025 11:10:59 +0100
Message-ID: <20251223101240.10634-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:21 +0000
Cc: robh@kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: dwmac: Add a fixup
	for the Micrel KSZ9131 PHY
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
