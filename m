Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B27C73B36
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Nov 2025 12:25:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F741C01FB5;
	Thu, 20 Nov 2025 11:25:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 643DCC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 11:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UkLGBPuD+ixBnCg1mbudIHuw5SJRJWUumiTRns1X5cM=; b=vp0FG/ZSDnOUiIL9iiqoV5ayuk
 SJQEPugj2vrczSLx79vtXHFfQH1aGPfaIPWQ1wgAHiwqKRAw+wuYHEXtmOx4hbpRZrkGIb4ue43uq
 AcSbL9nNO79PNgBD6VL6ZjmTg1vDdbZ56TixNQehTPGDew1eDz1zDTTbS4UdTjKj8druki9UBzMTk
 UbO+nznjzrCIv+Ac2tO1V+oDPfU11k1iZvdGRG8rAWaaf0RbFA+15B/fv/eAeF+/zw+s9jbQLEzi3
 mdkB4sefXGAj7CAnb7qu6vUOTJRTW3SylPRQ7OUE1rRxr218Et5c+JbCqolBbAA8B5hWBdIjx6l6L
 4H5rnRLg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60982)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vM2md-0000000067m-2B0R;
 Thu, 20 Nov 2025 11:25:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vM2ma-000000004L9-0XuL; Thu, 20 Nov 2025 11:25:00 +0000
Date: Thu, 20 Nov 2025 11:24:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: qcon-ethqos:
 "rgmii" accessor cleanups
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

This series cleans up the "rgmii" accessors in qcom-ethqos.

readl() and writel() return and take a u32 for the value. Rather than
implicitly casting this to an int, keep it as a u32.

Add set/clear functions to reduce the code and make it easier to read.

Finally, convert the open-coded poll loops to use the iopoll helpers.

Note that patch 1 has a checkpatch warning concerning "volatile" - I'm
changing the type here, and the "volatile" is removed in patch 3. I do
not feel it is appropriate to remove it in patch 1.

v2:
 - remove double-spaces in patch 2.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 245 +++++++++------------
 1 file changed, 110 insertions(+), 135 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
