Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFJKJikfnGkZ/wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:34:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A820173F49
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:34:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 445E7C36B3E;
	Mon, 23 Feb 2026 09:34:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 133F6C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eSeyRMLB3SUn45MUgUJHBcNxiQfz2D2Rth7NtqQKeOU=; b=RYjdVN9ZmLUxUmbuZxRBsrO6rV
 VF9VZGFgnGMcQEXRoRtU1uQkAZhSNciUQOetmE7XvffD1jiGWefWNlhiG9DmmblK2g4bgwylRLLVv
 nWL+UhuPKuWlO03DmT9ACCxz92sZ9cYp8jUOcWAYf1ui6ONjWS7wH0N3yM4oXEQPBfl8nPpMkCkyF
 FVGK9oC+HQ5uM86WmmFgo669YKDsC/gWbs/25vx4PTpfjVXoP89pbZIEiBTbv4ZBePnJDbUS7Jm+0
 6jZrFjqTCt8BAXWuRJkrpXJMXK60uSf+caEBdbTj42DeEszhzxLlU4IiJ8otF1E0G7GdMlOqYNW+z
 v/mIb7Ww==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46378 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vuSKb-000000003mJ-3idD;
 Mon, 23 Feb 2026 09:34:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vuSKa-0000000ASbo-2zQg; Mon, 23 Feb 2026 09:34:21 +0000
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vuSKa-0000000ASbo-2zQg@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:20 +0000
Cc: imx@lists.linux.dev, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 02/10] net: stmmac: qcom-ethqos:
 remove register field value obfuscations
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:imx@lists.linux.dev,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.957];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,qualcomm.com:email,armlinux.org.uk:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 7A820173F49
X-Rspamd-Action: no action

Convert the register field values to something more human readable.

For example, using (BIT(29) | BIT(27)) to update a register field that
consists of bits 29:27 is an obfuscated way of writing decimal 5 for
this field. The comment above needs to explain that this value is 5.

Worse still is BIT(12) | GENMASK(9, 8), which is used to hide the
decimal value 19 for the bitfield 16:8.

Fix these, and a few others by using FIELD_PREP(). While it means we
have bare numeric constants, this is more preferable than having the
obfuscation.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 690bd5c7e1a6..50b95fd19f9d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -361,10 +361,12 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 			      SDCC_HC_REG_DLL_CONFIG2);
 
 		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_MCLK_FREQ_CALC,
-			      0x1A << 10, SDCC_HC_REG_DLL_CONFIG2);
+			      FIELD_PREP(SDCC_DLL_CONFIG2_MCLK_FREQ_CALC, 26),
+			      SDCC_HC_REG_DLL_CONFIG2);
 
 		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SEL,
-			      BIT(2), SDCC_HC_REG_DLL_CONFIG2);
+			      FIELD_PREP(SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SEL,
+					 1), SDCC_HC_REG_DLL_CONFIG2);
 
 		rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
 			      SDCC_HC_REG_DLL_CONFIG2);
@@ -425,11 +427,13 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		if (ethqos->has_emac_ge_3) {
 			/* 0.9 ns */
 			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-				      115, SDCC_HC_REG_DDR_CONFIG);
+				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+						 115), SDCC_HC_REG_DDR_CONFIG);
 		} else {
 			/* 1.8 ns */
 			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-				      57, SDCC_HC_REG_DDR_CONFIG);
+				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+						 57), SDCC_HC_REG_DDR_CONFIG);
 		}
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
@@ -451,7 +455,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
 			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
-			      BIT(6), RGMII_IO_MACRO_CONFIG);
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_2, 1),
+			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -464,7 +469,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
+			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
+					 5), SDCC_HC_REG_DDR_CONFIG);
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
 			      SDCC_HC_REG_DDR_CONFIG);
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
@@ -487,7 +493,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
 			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
-			      BIT(12) | GENMASK(9, 8),
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
@@ -499,7 +505,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 				      RGMII_IO_MACRO_CONFIG2);
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
+			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
+					 5), SDCC_HC_REG_DDR_CONFIG);
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
 			      SDCC_HC_REG_DDR_CONFIG);
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
