Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196B99C3BD
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 10:42:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5293C78F79;
	Mon, 14 Oct 2024 08:42:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FB4AC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Oct 2024 21:28:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 737745C58D0;
 Sun, 13 Oct 2024 21:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD119C4AF0D;
 Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728854878;
 bh=B8D4rtkDCUvIgkAJnwHDrRoK8VWaANfpHt6JnSqvkNo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=QOBQviP8pMyYkocR/dYrePt3TOxF4ryOhIhqa7EhFJ+oZKOXdFimXxr3Z8xlRkHDl
 3gpA26xp/W//S5FmRR+H8heZsOICERBXxEtwI4HqDenNgdYcP2bwih8folFnqWd6If
 rI6ygSGPlP4WEjnmJX4Rts00i8Iqd/EGOzL0AalOubPmQ1MV2ryaCdBy1zqi7Lqek3
 OJD42OnQW+EHMPPTTSZUaqE4ELQpZhpx9di5QlFxV4OOgt6xNnjyJqFhsYWjzVjHIR
 wwXjR0HOBzHMViLTGv//IqsRBIb40n3AOOgU57o0jaZw2Z5Dl4HQ0PWTpTlg0kl24H
 r8rnt5g4UVXwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CD547CF2591;
 Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 13 Oct 2024 23:27:51 +0200
MIME-Version: 1.0
Message-Id: <20241013-upstream_s32cc_gmac-v3-16-d84b5a67b930@oss.nxp.com>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
In-Reply-To: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
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
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728854875; l=1605;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=yghcsP0rT1E+KchKPuX8DbIOCwUwU33DKX66yshrGiI=;
 b=rlFKSP5vX/qcXmdlWd4FXmmlRdEmQ1yeJaLvdVoYW0pouWkcfUFvPcxCrMwVsedbS365JSzZB
 h+dQP6P/jtsBNIya5JLVNWMXWpGB7PDdgKlyqw+3OjugSO34ce4lc7a
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailman-Approved-At: Mon, 14 Oct 2024 08:42:52 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Andrei Botila <andrei.botila@nxp.org>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 16/16] net: stmmac: dwmac-s32: Read PTP
 clock rate when ready
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

The PTP clock is read by stmmac_platform during DT parse.
On S32G/R the clock is not ready and returns 0. Postpone
reading of the clock on PTP init.

Co-developed-by: Andrei Botila <andrei.botila@nxp.org>
Signed-off-by: Andrei Botila <andrei.botila@nxp.org>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index aedd6bf80684..3daf282d8da7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -140,6 +140,18 @@ static void s32_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 		dev_err(gmac->dev, "Can't set tx clock\n");
 }
 
+static void s32_dwmac_ptp_clk_freq_config(struct stmmac_priv *priv)
+{
+	struct plat_stmmacenet_data *plat = priv->plat;
+
+	if (!plat->clk_ptp_ref)
+		return;
+
+	plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
+
+	netdev_dbg(priv->dev, "PTP rate %lu\n", plat->clk_ptp_rate);
+}
+
 static int s32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
@@ -195,6 +207,7 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 	plat->init = s32_gmac_init;
 	plat->exit = s32_gmac_exit;
 	plat->fix_mac_speed = s32_fix_mac_speed;
+	plat->ptp_clk_freq_config = s32_dwmac_ptp_clk_freq_config;
 
 	plat->bsp_priv = gmac;
 

-- 
2.46.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
