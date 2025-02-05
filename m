Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5DDA28BFE
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 14:41:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98B4AC78F8D;
	Wed,  5 Feb 2025 13:41:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDAA4C78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 13:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KOsTTbEIKnn1lDtoP6teYS5Q0yZvLkrVNJM/olKSH7k=; b=IJ2npVozHdBW7wFfF/cXSeTTlK
 MbS8ruqyb7O65yf/gA6tmVKBBa4Wd9H84YXRY+ngAlhEXyKOAsVuLsPBCopFqnAF/TTnhpQJGU8z7
 AprkCqpBKOT1b2aY2r6m1D6QP/jQJhqrfcbsdyvwkpuV5Ki5HMW4GSjSaIYo8jwlL3eQDyQsAnbHC
 lkX5VDyHOal4b4zezBXGiaKbRWXf1z+UqDujrdGgq7lAMOerFEl+B4VHPIOYmf4VO0XvzPyZOjfrD
 iJGGLiQwidLLLx8LeqCqmpsq8Mr6DRtH082/uVylJ2BfgQxUswi3kijn5jUWqEHtZw3l6KJfXEjld
 2b8oB4Hg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60668 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tffeH-0007Ch-0N;
 Wed, 05 Feb 2025 13:41:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tffdx-003ZIZ-JQ; Wed, 05 Feb 2025 13:40:41 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tffdx-003ZIZ-JQ@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:41 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 12/14] net: stmmac: dwmac4: clear
 LPI_CTRL_STATUS_LPITCSE too
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

Ensure that LPI_CTRL_STATUS_LPITCSE is also appropriately cleared when
disabling LPI or enabling LPI without TX clock gating.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index dc2d8c096fa3..ed42e1477cf8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -410,7 +410,7 @@ static int dwmac4_set_lpi_mode(struct mac_device_info *hw,
 	}
 
 	mask = LPI_CTRL_STATUS_LPIATE | LPI_CTRL_STATUS_LPIEN |
-	       LPI_CTRL_STATUS_LPITXA;
+	       LPI_CTRL_STATUS_LPITXA | LPI_CTRL_STATUS_LPITCSE;
 
 	value |= readl(ioaddr + GMAC4_LPI_CTRL_STATUS) & ~mask;
 	writel(value, ioaddr + GMAC4_LPI_CTRL_STATUS);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
