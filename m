Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652F8C3300
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2024 19:50:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08979C6907A;
	Sat, 11 May 2024 17:50:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7533C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=kGaJZOB8xwTriljjslRKC+hBQsPPqyV+ILWDtae2JQY=; b=SOsZuazOcT8hf6p0za4IL+Cq4n
 rwXdOeyvV9AUqMQUGvYvejxlj2Y7/mExGSmrSMVcho/+dLImIGasUzlR4jr14gHYQ9BrlyBLnTYNk
 ykyGmPzwdKnvbxI7ImGTZf3LLl9vThkHZy8GnZnm29CNiW2MrM0q5VFQI23WcISi7ZjE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1s5qrD-00FCyO-4C; Sat, 11 May 2024 19:50:03 +0200
Date: Sat, 11 May 2024 19:50:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <08b9be81-52c9-449d-898f-61aa24a7b276@lunn.ch>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
 <4ede8911-827d-4fad-b327-52c9aa7ed957@lunn.ch>
 <Zj+nBpQn1cqTMJxQ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zj+nBpQn1cqTMJxQ@shell.armlinux.org.uk>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
 2/2] net: stmmac: PCI driver for BCM8958X SoC
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

On Sat, May 11, 2024 at 06:12:38PM +0100, Russell King (Oracle) wrote:
> On Sat, May 11, 2024 at 06:16:52PM +0200, Andrew Lunn wrote:
> > > +	/* This device interface is directly attached to the switch chip on
> > > +	 *  the SoC. Since no MDIO is present, register fixed_phy.
> > > +	 */
> > > +	brcm_priv->phy_dev =
> > > +		 fixed_phy_register(PHY_POLL,
> > > +				    &dwxgmac_brcm_fixed_phy_status, NULL);
> > > +	if (IS_ERR(brcm_priv->phy_dev)) {
> > > +		dev_err(&pdev->dev, "%s\tNo PHY/fixed_PHY found\n", __func__);
> > > +		return -ENODEV;
> > > +	}
> > > +	phy_attached_info(brcm_priv->phy_dev);
> > 
> > What switch is it? Will there be patches to extend SF2?
> 
> ... and why is this legacy fixed_phy even necessary when stmmac uses
> phylink which supports fixed links, including with custom fixed status?

And now you mentions legacy Fixed link:

+MODULE_DESCRIPTION("Broadcom 10G Automotive Ethernet PCIe driver");

This claims it is a 10G device. You cannot represent 10G using legacy
fixed link.

Does this MAC directly connect to the switch within the SoC? There is
no external MII interface? Realtek have been posting a MAC driver for
something similar were the MAC is directly connected to the switch
within the SoC. The MAC is fixed at 5G, there is no phylink/phylib
support, set_link_ksetting return -EOPNOTSUPP and get_link_ksettings
returns hard coded 5G.

We need a better understanding of the architecture here, before we can
advise the correct way to do this.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
