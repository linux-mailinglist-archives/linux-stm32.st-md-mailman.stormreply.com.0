Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF31C73B3F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Nov 2025 12:25:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2785FC01FB6;
	Thu, 20 Nov 2025 11:25:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72DBEC01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I74Dh3fe1nd1qM9odpuS+mcbUWvWRMt3SuKencBCa0w=; b=wjwFfMHDty7Mh+4HM2YmddQuhO
 N98gvzXouRClO5etfYxAAE5I5e45H2GNUkbkc/Q7jZ3K98/0G5d1RzvUoYJO+/EITYdKOms7A1+ws
 M5LKu3QCETnz7XDxwGmCZJ9RbQ33RBX1VeAQQp+6WVcAwT3JIwqHqiMYYD2JUkTHTnTY/T+rdAzqZ
 n7rriE6JwbgXl7vdzc9PWYqCy625RocMYVzMsxLwdA7hQXYuphkr/DEzPLrExuiiXoIXrqsKDTVuc
 Dfzhnq8Jhm9WkuXmm0hvTLpUfWeeLZQ0g2GLOKiAz4zTxSEVCDBkmc3EijCpqkTbL0TTPpCtKhDhX
 Yxpw0mGw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51756 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vM2mr-00000000682-2vyX;
 Thu, 20 Nov 2025 11:25:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vM2mq-0000000FRTi-3y5F; Thu, 20 Nov 2025 11:25:16 +0000
In-Reply-To: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vM2mq-0000000FRTi-3y5F@rmk-PC.armlinux.org.uk>
Date: Thu, 20 Nov 2025 11:25:16 +0000
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/3] net: stmmac: qcom-ethqos: use
 u32 for rgmii read/write/update
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

readl() returns a u32, and writel() takes a "u32" for the value. These
are used in rgmii_readl()() and rgmii_writel(), but the value and
return are "int". As these are 32-bit register values which are not
signed, use "u32".

These changes do not cause generated code changes.

Update rgmii_updatel() to use u32 for mask and val. Changing "mask"
to "u32" also does not cause generated code changes. However, changing
"val" causes the generated assembly to be re-ordered for aarch64.

Update the temporary variables used with the rgmii functions to use
u32.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1a616a71c36a..ae3cf163005b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -116,21 +116,21 @@ struct qcom_ethqos {
 	bool needs_sgmii_loopback;
 };
 
-static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
+static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
 {
 	return readl(ethqos->rgmii_base + offset);
 }
 
-static void rgmii_writel(struct qcom_ethqos *ethqos,
-			 int value, unsigned int offset)
+static void rgmii_writel(struct qcom_ethqos *ethqos, u32 value,
+			 unsigned int offset)
 {
 	writel(value, ethqos->rgmii_base + offset);
 }
 
-static void rgmii_updatel(struct qcom_ethqos *ethqos,
-			  int mask, int val, unsigned int offset)
+static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
+			  unsigned int offset)
 {
-	unsigned int temp;
+	u32 temp;
 
 	temp = rgmii_readl(ethqos, offset);
 	temp = (temp & ~(mask)) | val;
@@ -300,8 +300,8 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	unsigned int val;
 	int retry = 1000;
+	u32 val;
 
 	/* Set CDR_EN */
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_CDR_EN,
@@ -535,7 +535,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	volatile unsigned int dll_lock;
+	volatile u32 dll_lock;
 	unsigned int i, retry = 1000;
 
 	/* Reset to POR values and enable clk */
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
