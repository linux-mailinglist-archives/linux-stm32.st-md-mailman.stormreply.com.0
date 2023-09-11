Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C70FC79A9A1
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 17:28:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B75DC6B46E;
	Mon, 11 Sep 2023 15:28:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 584F0C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P6DsgJ0EF8GDgyic7GQZdDjnAhVZ69mVqqsinIQxsnI=; b=xZu3Ajjq2TSvy0DyIJCfkWSo3k
 7br7UoFE1XZmxm0LZPslxVl5WlKtO0zNzP8jZUZn4Jefzkq3tqRdEM3PpdZu1+SAuegInzBDn5/k3
 7BUf2CFw9jyeSA8B88ekRLYE81o94jBtRcEkiM8rvUA5CwDrXBNS9vJ0QNwHFK6SqBM35GtTDPlW3
 t1oiqyAHxta6r1R41wrx/OaqBetCbZJz3VVS1vQ4Z71jCVNokwNI2qQPImYz2+59N6Yla55ST+0zm
 yFhg6D8WE2nUMcNzufxbPZhl5dcwbfg3iMXn/DldsWreh2uFhJf1pte5RrR3lXzS2swfMsAT0kgac
 HHpFES6Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57004 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qfiq7-0008Bi-1y;
 Mon, 11 Sep 2023 16:28:39 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qfiq8-007TOe-9F; Mon, 11 Sep 2023 16:28:40 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qfiq8-007TOe-9F@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Sep 2023 16:28:40 +0100
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Daniel Borkmann <daniel@iogearbox.net>,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Fabio Estevam <festevam@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jesper Dangaard Brouer <hawk@kernel.org>
Subject: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add platform library
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

Add a platform library of helper functions for common traits in the
platform drivers. Currently, this is setting the tx clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
 .../ethernet/stmicro/stmmac/stmmac_plat_lib.c | 29 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_plat_lib.h |  8 +++++
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.h

diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 5b57aee19267..ba2cbfa0c9d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -6,7 +6,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
 	      mmc_core.o stmmac_hwtstamp.o stmmac_ptp.o dwmac4_descs.o	\
 	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
 	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
-	      stmmac_xdp.o \
+	      stmmac_xdp.o stmmac_plat_lib.o \
 	      $(stmmac-y)
 
 stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c
new file mode 100644
index 000000000000..abb9f512bb0e
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c
@@ -0,0 +1,29 @@
+#include <linux/stmmac.h>
+#include <linux/clk.h>
+
+#include "stmmac_plat_lib.h"
+
+int dwmac_set_tx_clk_gmii(struct clk *tx_clk, int speed)
+{
+	unsigned long rate;
+
+	switch (speed) {
+	case SPEED_1000:
+		rate = 125000000;
+		break;
+
+	case SPEED_100:
+		rate = 25000000;
+		break;
+
+	case SPEED_10:
+		rate = 2500000;
+		break;
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	return clk_set_rate(tx_clk, rate);
+}
+EXPORT_SYMBOL_GPL(dwmac_set_tx_clk_gmii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.h
new file mode 100644
index 000000000000..926fdce379b3
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.h
@@ -0,0 +1,8 @@
+#ifndef STMMAC_PLAT_LIB_H
+#define STMMAC_PLAT_LIB_H
+
+struct clk;
+
+int dwmac_set_tx_clk_gmii(struct clk *tx_clk, int speed);
+
+#endif
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
