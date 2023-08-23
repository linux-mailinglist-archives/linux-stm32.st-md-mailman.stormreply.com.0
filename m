Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53915785655
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 12:58:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13C7DC6B44C;
	Wed, 23 Aug 2023 10:58:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A52FC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 10:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QpqzTXlkvfTZwb/qvLffSgOkdmA3MgzLw1gYn4Tft4k=; b=s/9kx6+CR/fuCvSdzEXiuQjEfZ
 EdboCKEcmE68sjpbz32RSMAnopH5pDf5FWnykSJznpjzbcLne2CEzF/ettMHvNxEZRwVE84hajdMi
 NK88pFfypItbIjF3cChnkLE6vL2H8WQit9euN7sWPjMxwQjzOiSPZy+En65nCYIFEk6TejmTV9yxc
 3BSESc8hQZqVZH1d4SKqulITtnWdmHws66OttGpvKlGtRUzwVgj0iPKwY9vYa3HaysPc7b6n/z0i8
 NGnex4U5VnAjp6bSr3FR0EK+NP/LM8+C51OLtz2klZ/imZyb1e7HMGAHvV3sPD3iiYaiy3BRUCxJY
 ikXoj3uA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42594)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qYlZJ-0002eW-1e;
 Wed, 23 Aug 2023 11:58:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qYlZI-0006lA-Js; Wed, 23 Aug 2023 11:58:32 +0100
Date: Wed, 23 Aug 2023 11:58:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZOXmWLB4TKGKvkiE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Synopsys XGMII MAC and USXGMII interfaces
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

Part 2 of the discussion...

A similar issue applies to PHY_INTERFACE_MODE_USXGMII, but is reversed.
USXGMII supports 10M, 100M, 1G, 2.5G, 5G and 10G. Phylink allows all of
these because that's what the appropriate standard says. dwxgmac2
initialises config register settings for speeds from 10M up to 10G.
However, the PHY_INTERFACE_MODE_USXGMII switch() block in
stmmac_mac_link_up() only handles 2.5G, 5G and 10G. Shouldn't it handle
the other speed cases - it looks like the MAC does support them.

The initialisation done by dwxgmac2_setup() does setup control register
masks for everything from 10M to 10G, so on the face of it, it looks
like a mistake in stmmac_mac_link_up().

If it's something outside of the MAC that doesn't support these speeds
when operating as USXGMII, then that needs to be handled.

The other weird thing is that when using PHY_INTERFACE_MODE_USXGMII
with XPCS, XPCS supports 1G, 2.5G and 10G ethtool link modes, but not
5G. So combining the implementation in stmmac_mac_link_up(), that
means only 2.5G and 10G can actually be functional. Is that a fair
assessment of the USXGMII situation with stmmac?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
