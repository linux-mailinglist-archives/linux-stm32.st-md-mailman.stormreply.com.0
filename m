Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E39098D31B7
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 10:40:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE5ADC6B47E;
	Wed, 29 May 2024 08:40:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6CF2C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GGqYkJ/tGZpnY/WgcnZmOQ8zKHDiDlrzu/r2xxt+ih4=; b=K5/BTr/741QYEBYxky6cl+xHGN
 w9QY8WJoG7BMs4m5ANlZFOW6P68m1ernMxAPLR8TaJT7IDDo/4axkjQ7mxXNWxRx6T5wQodzjiO3x
 qj9heWGrm/5b1I2mP4yZhS/PnfXkT+ssHY+/U52olcI319PLxyKeXiKy3W9ngO/oq8CrX1J7Q8gOW
 YuPmYw9zlZK+cLQNHtU9MaLdCiazgGi8tFCoT2L2IeOLwPi6/6Z7fuxC1lqJPiA4VhD1z1S+Q1IgL
 mNJkjSNgz+rCUjq3i9/K6lqJrlOA68xN41fgpnGkmRg2zkmjiXMQfSVXnIgu4CxzCIT8VCnaCNT4H
 PyXqct/Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51694 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sCErM-0005lk-31;
 Wed, 29 May 2024 09:40:36 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sCErP-00EOPl-IT; Wed, 29 May 2024 09:40:39 +0100
In-Reply-To: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
References: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sCErP-00EOPl-IT@rmk-PC.armlinux.org.uk>
Date: Wed, 29 May 2024 09:40:39 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 2/6] net: stmmac: dwxgmac2: remove
 useless NULL pointer initialisations
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

Remove useless NULL pointer initialisations for "PCS" methods from the
dwxgmac2 code.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index f8e7775bb633..6a987cf598e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1554,9 +1554,6 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.reset_eee_mode = dwxgmac2_reset_eee_mode,
 	.set_eee_timer = dwxgmac2_set_eee_timer,
 	.set_eee_pls = dwxgmac2_set_eee_pls,
-	.pcs_ctrl_ane = NULL,
-	.pcs_rane = NULL,
-	.pcs_get_adv_lp = NULL,
 	.debug = NULL,
 	.set_filter = dwxgmac2_set_filter,
 	.safety_feat_config = dwxgmac3_safety_feat_config,
@@ -1614,9 +1611,6 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.reset_eee_mode = dwxgmac2_reset_eee_mode,
 	.set_eee_timer = dwxgmac2_set_eee_timer,
 	.set_eee_pls = dwxgmac2_set_eee_pls,
-	.pcs_ctrl_ane = NULL,
-	.pcs_rane = NULL,
-	.pcs_get_adv_lp = NULL,
 	.debug = NULL,
 	.set_filter = dwxgmac2_set_filter,
 	.safety_feat_config = dwxgmac3_safety_feat_config,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
