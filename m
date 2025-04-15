Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE7A89E96
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 14:51:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 975FCC78018;
	Tue, 15 Apr 2025 12:51:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 242CBCFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DJelH3MXeuw+QhgIUBgXCxj63HuDy6jNjoA6xLDiFtY=; b=IpoMe21jYVhJpimOHsXYMa1CF3
 XHXMrm+vLy33Vb6lHekeOYPP6VH4bJFr6txvj63QglTwI3Ifq8dsNqSRMEGKMJDLa7RbrL4mI3yTA
 HPACRuylJqGHTUqb8RhlgqFJHdp71mSwAqNAVAJvqgUarnRE8qsqWO3XHGXWpQPUmHpYusLCFt/IF
 50BMTwR9Z6cVxXYm+HAKLaXDZchnTG9Rgtr47xJWtFESmQcTDUrIj0ppZd3+L9W3a4zACdP5u6/md
 3/Oj+K+j/wmYjZQgytD9qvBISGett6JnZKTTQse9f1tEDeCKv8EM8X+1kKloCGmJ1V4wb59mHgxkC
 RgkxXHIA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59424)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u4flE-0008AB-2Y;
 Tue, 15 Apr 2025 13:51:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u4fl9-0000Nk-1L;
 Tue, 15 Apr 2025 13:51:27 +0100
Date: Tue, 15 Apr 2025 13:51:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Eric Dumazet <edumazet@google.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: sunxi cleanups
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

Hi,

This series cleans up the sunxi (sun7i) code in two ways:

1. it converts to use the new set_clk_tx_rate() method, even though
   we don't use clk_tx_i. In doing so, I reformat the function to
   read better, but with no changes to the code.

2. convert from stmmac_dvr_probe() to stmmac_pltfr_probe(), and then
   to its devm variant, which allows code simplification.

 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 58 +++++++++--------------
 1 file changed, 22 insertions(+), 36 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
