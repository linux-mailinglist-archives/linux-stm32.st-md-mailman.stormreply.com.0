Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 221509D78A5
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Nov 2024 23:43:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B582FC78F62;
	Sun, 24 Nov 2024 22:43:22 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A13F8C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Nov 2024 22:43:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9F137A41009;
 Sun, 24 Nov 2024 22:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C579BC4CED1;
 Sun, 24 Nov 2024 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732488193;
 bh=NzNnR4GIKVZyHfo3hHmIgfUcE7ydDOgKghMULW6fcWA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=HPdLj9mpHaEyDC6qtlF88wz7FyL625BhiTn8L+Hb7BL0JCj8ZqjDvWxw5uVmaaFu2
 qhIU+UfMXAc8R6cnLRfHXGGhN1gTzvtMnlActLZCpLTc5vt/cWXNBZ1dIo4cwj/fpe
 bvaSILMNA/V4g0it2grCZl8iwwv8j71q8aV5ZTUG1c1Aa3OuIC3ovQBphNChHCwxLs
 TWEZ6LUBzcqu1efuGg4OmJSdEUoWmss8dra9OKfwPCgLZf8zne5/SuMM7KCszcIG+3
 Zt/cmjWnB1SBEOZYVdRVKiTV0nLpa+FFFzx40oy2IDSioehb5FpK8hlfxIUvGLp7dn
 2FjAy6UMs+kWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B3436D3B7C0;
 Sun, 24 Nov 2024 22:43:13 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 24 Nov 2024 23:42:33 +0100
MIME-Version: 1.0
Message-Id: <20241124-upstream_s32cc_gmac-v6-2-dc5718ccf001@oss.nxp.com>
References: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
In-Reply-To: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732488190; l=2290;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=XFymp62H65MIRcMwAf+jhdS6qH2oPC0Qen8xklC1jkk=;
 b=c9a5nzfuK5IyCHSrZGqtaogzMVPqXPCKa8rHrvGWLbTHrqaYtqctToHXJKpf7unrfsIykOTKP
 cCVOwi8v22tDDRN+aELroJT/jx5qHPTCxmKarQxZLJXfvm+7RKXNish
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-msm@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next v6 02/15] net: driver: stmmac:
 Extend CSR calc support
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Add support for CSR clock range up to 800 MHz.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 include/linux/stmmac.h                            | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 1367fa5c9b8e..70d601f45481 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -257,6 +257,8 @@ struct stmmac_safety_stats {
 #define CSR_F_150M	150000000
 #define CSR_F_250M	250000000
 #define CSR_F_300M	300000000
+#define CSR_F_500M	500000000
+#define CSR_F_800M	800000000
 
 #define	MAC_CSR_H_FRQ_MASK	0x20
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3cdc3910f3a0..8304f82b3a50 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -325,6 +325,10 @@ static void stmmac_clk_csr_set(struct stmmac_priv *priv)
 			priv->clk_csr = STMMAC_CSR_150_250M;
 		else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
 			priv->clk_csr = STMMAC_CSR_250_300M;
+		else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
+			priv->clk_csr = STMMAC_CSR_300_500M;
+		else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
+			priv->clk_csr = STMMAC_CSR_500_800M;
 	}
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 75cbfb576358..865d0fe26f98 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -34,6 +34,8 @@
 #define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_scr_i/26 */
 #define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_scr_i/102 */
 #define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/124 */
+#define	STMMAC_CSR_300_500M	0x6	/* MDC = clk_scr_i/204 */
+#define	STMMAC_CSR_500_800M	0x7	/* MDC = clk_scr_i/324 */
 
 /* MTL algorithms identifiers */
 #define MTL_TX_ALGORITHM_WRR	0x0

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
