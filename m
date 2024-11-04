Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2859BBAF1
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:03:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67404C78034;
	Mon,  4 Nov 2024 17:03:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6E03C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2024 17:03:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 273D46000D;
 Mon,  4 Nov 2024 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730739780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDh3EdnrR/PCsOp5ZedOmai1CHRqkh3yfIKuvIijDks=;
 b=KrYfvu8UGeDJygxO2L11K7UVqHgApKJ6B5G0XrJMQIaknLfvN9O3oLj6VKn4iOwqPDa/uu
 EhN13ONnoDp3uK44HuLR8PjaIsGDhxayoGp6XlN6xWZ0vKUJlZmpk3Wef12J9DfQF4yL3o
 qM53QmE/Km5NHFcwl/T2SFrG/xo8XyMinYndAxh03PHlN/fEKtaNeL08f6hiXo0UjiniHJ
 g4rMCdzmBsX79GI2ttDupJSVo0MnV8gKUqaGKlmviuGke0jDKAJCEeZW2Jr6t66fK1lpPg
 g5r9NG9D0k7Xl4s93XjRSQ1xCkLM/8oVqsDF0yRDRzpeqQ8TVEheT5eXVlfauA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Mon,  4 Nov 2024 18:02:46 +0100
Message-ID: <20241104170251.2202270-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 6/9] net: stmmac: Enable
	timestamping interrupt on dwmac1000
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

The default configuration for the interrupts on dwmac1000 have the
timestamping interrupt masked. Now that the timestamping has been
adapted to dwmac1000, enable the timestamping interrupt on these
platforms.

On dwmac1000, the external snapshot interrupt is configured through a
dedicated bit, that is set as reserved on other dwmac variants. The
timestaming interrupt is acknowledged by reading the
GMAC3_X_TIMESTAMP_STATUS register.

Make sure that this interrupt is enabled when snapshot is enabled, and
masked when disabled.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: Make that interrupt unmasked only when necessary

 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index dbbd834f9fc8..37374f5a15c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -595,6 +595,20 @@ void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv)
 
 /* DWMAC 1000 ptp_clock_info ops */
 
+static void dwmac1000_timestamp_interrupt_cfg(struct stmmac_priv *priv, bool en)
+{
+	void __iomem *ioaddr = priv->ioaddr;
+
+	u32 intr_mask = readl(ioaddr + GMAC_INT_MASK);
+
+	if (en)
+		intr_mask &= ~GMAC_INT_DISABLE_TIMESTAMP;
+	else
+		intr_mask |= GMAC_INT_DISABLE_TIMESTAMP;
+
+	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+}
+
 int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 			 struct ptp_clock_request *rq, int on)
 {
@@ -628,6 +642,8 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 		ret = readl_poll_timeout(ptpaddr + PTP_TCR, tcr_val,
 					 !(tcr_val & GMAC_PTP_TCR_ATSFC),
 					 10, 10000);
+
+		dwmac1000_timestamp_interrupt_cfg(priv, on);
 		break;
 
 	default:
-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
