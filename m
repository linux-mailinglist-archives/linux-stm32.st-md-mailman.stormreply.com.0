Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A6D6977DE
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A133C6A5F9;
	Wed, 15 Feb 2023 08:18:42 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DC6AC65E73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 14:39:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jzi@pengutronix.de>)
 id 1pQUZ6-0004Qk-Qt; Fri, 10 Feb 2023 15:39:52 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <jzi@pengutronix.de>)
 id 1pQUZ2-0040F9-QF; Fri, 10 Feb 2023 15:39:50 +0100
Received: from jzi by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <jzi@pengutronix.de>)
 id 1pQUZ3-00EPFb-2Q; Fri, 10 Feb 2023 15:39:49 +0100
From: Johannes Zink <j.zink@pengutronix.de>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 10 Feb 2023 15:39:37 +0100
Message-Id: <20230210143937.3427483-1-j.zink@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jzi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:40 +0000
Cc: Johannes Zink <j.zink@pengutronix.de>, kernel@pengutronix.de,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net] net: stmmac: fix order of dwmac5 FlexPPS
	parametrization sequence
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

So far changing the period by just setting new period values while
running did not work.

The order as indicated by the publicly available reference manual of the i.MX8MP [1]
indicates a sequence:

 * initiate the programming sequence
 * set the values for PPS period and start time
 * start the pulse train generation.

This is currently not used in dwmac5_flex_pps_config(), which instead does:

 * initiate the programming sequence and immediately start the pulse train generation
 * set the values for PPS period and start time

This caused the period values written not to take effect until the FlexPPS output was
disabled and re-enabled again.

This patch fix the order and allows the period to be set immediately.

[1] https://www.nxp.com/webapp/Download?colCode=IMX8MPRM

Fixes: 9a8a02c9d46d ("net: stmmac: Add Flexible PPS support")
Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
---

This fix is not super critical, but if you do another cycle anyway,
feel free to take or review it.

drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 413f66017219..e95d35f1e5a0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -541,9 +541,9 @@ int dwmac5_flex_pps_config(void __iomem *ioaddr, int index,
 		return 0;
 	}

-	val |= PPSCMDx(index, 0x2);
 	val |= TRGTMODSELx(index, 0x2);
 	val |= PPSEN0;
+	writel(val, ioaddr + MAC_PPS_CONTROL);

 	writel(cfg->start.tv_sec, ioaddr + MAC_PPSx_TARGET_TIME_SEC(index));

@@ -568,6 +568,7 @@ int dwmac5_flex_pps_config(void __iomem *ioaddr, int index,
 	writel(period - 1, ioaddr + MAC_PPSx_WIDTH(index));

 	/* Finally, activate it */
+	val |= PPSCMDx(index, 0x2);
 	writel(val, ioaddr + MAC_PPS_CONTROL);
 	return 0;
 }
--
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
