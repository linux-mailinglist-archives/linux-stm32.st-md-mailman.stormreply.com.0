Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C1C3A33C
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 11:23:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9639DC349C4;
	Thu,  6 Nov 2025 10:23:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52E6AC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 10:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OMLwGIoNYOp5BTjdjZEw24Nsm4q49zJb/gk4akyApJw=; b=0iLpV6p5k1d8XZXOo/2wtp0gck
 ILbjL960etTl/6BeAYcs/QMyVWExZWDAeMF+oAHtNoYiCOzpV5QEOK4xqvkNFufxXQLqyzGbQBefM
 RMMUgqcuHBZILrfmsDw4z2NejnvVU8Hm2SpjN5ogRVj7gLLFUL2K2PAffbccV3OjkNb2m18CB79uP
 FvsNUheSqT9dqIqb9Fh7EFTQB6NFTndHHzvyonYwYhVF9TCkkiuD+LsYjMhlZRojbmghmFQcT0Ovd
 ddYUd8ebcYjWLWluaPZO6Z3gdr6TwOZwoNfT6l56QjcsOeGh0yBA8Zxiph5QFPw4PZGaHrUspZwtC
 /wDPW3Dg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60346)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vGx8z-000000004nS-3qZ9;
 Thu, 06 Nov 2025 10:23:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vGx8w-000000006ZU-32os; Thu, 06 Nov 2025 10:23:02 +0000
Date: Thu, 6 Nov 2025 10:23:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aQx3Brj6t48O6wPg@shell.armlinux.org.uk>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <6ad7667a-f2be-4674-99a2-2895a82b762a@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ad7667a-f2be-4674-99a2-2895a82b762a@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/11] net: stmmac: ingenic:
 convert to set_phy_intf_sel()
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

On Thu, Nov 06, 2025 at 10:57:55AM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 06/11/2025 09:55, Russell King (Oracle) wrote:
> > On Wed, Nov 05, 2025 at 01:25:54PM +0000, Russell King (Oracle) wrote:
> > Convert ingenic to use the new ->set_phy_intf_sel() method that was
> > recently introduced in net-next.
> > 
> > This is the largest of the conversions, as there is scope for cleanups
> > along with the conversion.
> > 
> > v2: fix build warnings in patch 9 by rearranging the code
> > 
> >  .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 165 ++++++---------------
> >  1 file changed, 45 insertions(+), 120 deletions(-)
> > 
> 
> Damned, missed that V2 and started reviewing V1... I'll resend the tags
> for V2.

Yes, Jakub reported build warnings on patch 9 last night, followed by
the kernel build bot reporting the same thing. The dangers of not
building with W=1, but then W=1 is noisy which makes spotting new
warnings difficult.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
