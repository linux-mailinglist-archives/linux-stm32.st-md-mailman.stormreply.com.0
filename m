Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DE7BA846E
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Sep 2025 09:44:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07231C3F92E;
	Mon, 29 Sep 2025 07:44:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71A1DC3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Sep 2025 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AZ7xCl2wQqwqFo37e1wZWKGTGABfy99i1vqF6wtYlaY=; b=PvKEk3awO1om3h6K37Kd+aGVTP
 3iH+zwB8JaNnXrRJKI5aFojaxxzNwuDmpEqKWgXPpGymWoLYxDbwvLw8lcujRbLN/+Bh0DyvDV+WA
 tIIuIKzguIB76P7Arlqz+cjxipozoPL/s37GvxgzOeu2bME+KzXPtrpfWustiAknfkSm3ZRVp+Y8x
 QVKh16WjpClYRLRwuUxcLF1N+VPKEgsXtM+U1CPAZos7pLV21Eml+NnF4f5HO3cHtQwgsS2GXd69P
 EQsj31cl9lzbLFr+k8gApPoPe1Rryr/sxrY6uLeQ+q4ww25s3y/4rd017e470tvbFI4b/T1N9rGJ+
 7jRUoHeg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51940 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v38Y8-000000006KV-2uOd;
 Mon, 29 Sep 2025 08:43:56 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v38Y7-00000008UCQ-3w27; Mon, 29 Sep 2025 08:43:55 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v38Y7-00000008UCQ-3w27@rmk-PC.armlinux.org.uk>
Date: Mon, 29 Sep 2025 08:43:55 +0100
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: remove
 stmmac_hw_setup() excess documentation parameter
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

The kernel build bot reports:

Warning: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3438 Excess function parameter 'ptp_register' description in 'stmmac_hw_setup'

Fix it.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 98d8ea566b85 ("net: stmmac: move timestamping/ptp init to stmmac_hw_setup() caller")
Closes: https://lore.kernel.org/oe-kbuild-all/202509290927.svDd6xuw-lkp@intel.com/
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index be064f240895..650d75b73e0b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3400,7 +3400,6 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 /**
  * stmmac_hw_setup - setup mac in a usable state.
  *  @dev : pointer to the device structure.
- *  @ptp_register: register PTP if set
  *  Description:
  *  this is the main function to setup the HW in a usable state because the
  *  dma engine is reset, the core registers are configured (e.g. AXI,
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
