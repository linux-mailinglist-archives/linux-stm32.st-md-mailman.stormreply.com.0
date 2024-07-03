Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B92029264D9
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 17:29:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 697A1C71280;
	Wed,  3 Jul 2024 15:29:48 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30F72C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 15:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bxdhcDkewYwFgdY9moFLwqTQeQ72WrSVSCnn/Qtj+g8=; b=bRYjgpAd2CbzTLCPi2oBZpNy7k
 EZE1fgvHZXhRHtL/fa1FEh08CuKByhK0YqmxEJz5f53fhxt2AsSFLha5EECM4kJMMMHd3pEe2Lnxq
 RGRwAKbk2o91SfSqGgX8ZFUfO3M+W+KFCs4U0gzjurm9Dlv6VDht8b8Z4IrZ4oiuc6wCSqJIB1jVn
 y2rW9i4q4QltPoazXWepaUN/aGLEQ2iL/RsrX8U49bOHQBnHGj7B1FDbmXcOF2rRCd/oU5FYL3JNN
 LywtHiJ+GbUzXvZcQEQK1fEQFIq53beSP7R9N0etiXOwfJSeoGB7nBkqDdHwld6Asnj8yT5E9BuO0
 dKWKFWhg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58946)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sP1v9-0005lY-2W;
 Wed, 03 Jul 2024 16:29:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sP1vA-00031J-Af; Wed, 03 Jul 2024 16:29:24 +0100
Date: Wed, 3 Jul 2024 16:29:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZoVuVDhCDxr/wKKE@shell.armlinux.org.uk>
References: <E1sOz2O-00Gm9W-B7@rmk-PC.armlinux.org.uk>
 <c26867af-6f8c-412a-bdd4-5ac9cc6a721c@lunn.ch>
 <xgqybykasoilqq2dufnffnlrqhph2w2tb7f3s4lnmh3urbx4jd@2e7nl2qkxtrb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xgqybykasoilqq2dufnffnlrqhph2w2tb7f3s4lnmh3urbx4jd@2e7nl2qkxtrb>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 "Abhishek Chauhan \(ABC\)" <quic_abchauha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Halaney <ahalaney@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac4: fix PCS duplex
	mode decode
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

On Wed, Jul 03, 2024 at 06:07:54PM +0300, Serge Semin wrote:
> On Wed, Jul 03, 2024 at 04:06:54PM +0200, Andrew Lunn wrote:
> > On Wed, Jul 03, 2024 at 01:24:40PM +0100, Russell King (Oracle) wrote:
> > > dwmac4 was decoding the duplex mode from the GMAC_PHYIF_CONTROL_STATUS
> > > register incorrectly, using GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK (value 1)
> > > rather than GMAC_PHYIF_CTRLSTATUS_LNKMOD (bit 16). Fix this.
> > 
> > This appears to be the only use of
> > GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK. Maybe it should be removed after
> > this change?
> 
> There is a PCS-refactoring work initiated by Russell, which besides of
> other things may eventually imply dropping this macro:
> https://lore.kernel.org/netdev/20240624132802.14238-6-fancer.lancer@gmail.com/
> So unless it is strongly required I guess there is no much need in
> respinning this patch or implementing additional one for now.

Nevertheless, a respin is worth doing with Andrew's suggested change
because this patch will impact the refactoring work even without that
change. We might as well have a complete patch for this change.

(Besides, I've already incorporated Andrew's feedback!)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
