Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDDF901DF6
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 11:19:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AAF1C7800C;
	Mon, 10 Jun 2024 09:19:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D5AEC6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ikVClAmxiAK9GuPcVRzMsjEeJjGHTMRE/DJvy6XjAFY=; b=C4phnXKbiu0jdrPxeKv5kQMRzD
 lNLth5EKWGiks2RnT1wVBw6i9ySdrmULlZ+zY4CESU/2rlSzHzWfIsO9MRjIev/icitJ7EKRLZ2EB
 9KlRhcDI73yfuZswh2dk6z/1zV2zf7IJ6upCFdZ4bVookr6sAVHY+10XuM6gEPEcq4SygNSVEfGp+
 UaoKj1XjrcqIDkgojFp9IAoQq7ETrK9QNAc0unA/q5iXhqPbLgrdm/0HFdJ4zYi3h9mBkrqrfdJil
 k9O0TQHtBLJvuvPkwIycBvO8apzm5nt/Jf0B8DEv1iSStkKf1R1GN5oG66P8smsRv7CSPnYguGJfw
 LGnSy8kg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46210)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sGbBh-0001Dt-1o;
 Mon, 10 Jun 2024 10:19:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sGbBj-0006lP-8Y; Mon, 10 Jun 2024 10:19:39 +0100
Date: Mon, 10 Jun 2024 10:19:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <ZmbFK2SYyHcqzSeK@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
 <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 3/8] net: stmmac:
 dwmac1000: convert sgmii/rgmii "pcs" to phylink
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

On Wed, Jun 05, 2024 at 03:05:43PM -0500, Andrew Halaney wrote:
> On Fri, May 31, 2024 at 12:26:25PM GMT, Russell King (Oracle) wrote:
> > @@ -335,8 +303,12 @@ static int dwmac1000_irq_status(struct mac_device_info *hw,
> >  
> >  	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
> >  
> > -	if (intr_status & PCS_RGSMIIIS_IRQ)
> > -		dwmac1000_rgsmii(ioaddr, x);
> > +	if (intr_status & PCS_RGSMIIIS_IRQ) {
> > +		/* TODO Dummy-read to clear the IRQ status */
> > +		readl(ioaddr + GMAC_RGSMIIIS);
> 
> This seems to me that you're doing the TODO here? Maybe I'm
> misunderstanding... maybe not :)

Please trim your replies.

These two lines come from Serge - please ask him why it's marked as a
TODO. I assume he has a reason. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
