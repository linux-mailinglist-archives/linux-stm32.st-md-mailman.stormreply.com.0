Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A64A9AD7D
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 14:32:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0ADBC7803A;
	Thu, 24 Apr 2025 12:32:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 896FCC7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R7E0igRN0goWZT53emNsgMknLEdpCU0Z3PHf0cpn4M4=; b=M34qZugqYq7x6S26YtmcPCqPio
 KuZCRgcANW1O/zmu9txnWc/YLvQN/nqtoLgXeJd4f+LegtaBStGFX/csqPrJVBh12ei7nywbk6UXg
 fbRBYUKIqedh4axwO40A94m7GYV3fU2H/6tBF+D80hFG4I9Q8n8zHX2y/jEdmztulzaEfyWhugqsL
 AX6GZ23Abwl1o+To2QruXtMYavNx3xHhZZ1beN/SoG+ZMHy3u/s1BPzmihD+53DIi4zdAdYmdAhbZ
 2M6mCZFbF6TRkS0KhJBMX+7RS+V1AwRdvz8SyRqRjfsUjw4Hy3DUFc9f0zabaLP5+gHC3aRRGiKIQ
 n+OGfgyg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39516)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u7vkY-0007Mr-0A;
 Thu, 24 Apr 2025 13:32:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u7vkU-00015d-0J;
 Thu, 24 Apr 2025 13:32:14 +0100
Date: Thu, 24 Apr 2025 13:32:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <aAovTY6Q-4S__0Mh@shell.armlinux.org.uk>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-2-boon.khai.ng@altera.com>
 <43ef6713-9ae1-468c-bc43-2c7e463e04f4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43ef6713-9ae1-468c-bc43-2c7e463e04f4@redhat.com>
Cc: Furong Xu <0x1207@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Mun Yew Tham <mun.yew.tham@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Tien Sung Ang <tien.sung.ang@altera.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 G Thomas Rohan <rohan.g.thomas@altera.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/2] net: stmmac: Refactor
	VLAN implementation
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

On Thu, Apr 24, 2025 at 02:04:04PM +0200, Paolo Abeni wrote:
> On 4/21/25 6:29 PM, Boon Khai Ng wrote:
> > Refactor VLAN implementation by moving common code for DWMAC4 and
> > DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> > DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> > for the VLAN ID and VLAN VALID bit field.
> > 
> > The descriptor format for VLAN is not moved to the common code due
> > to hardware-specific differences between DWMAC4 and DWXGMAC.
> > 
> > For the DWMAC4 IP, the Receive Normal Descriptor 0 (RDES0) is
> > formatted as follows:
> >     31                                                0
> >       ------------------------ -----------------------
> > RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
> >       ------------------------ -----------------------
> > 
> > For the DWXGMAC IP, the RDES0 format varies based on the
> > Tunneled Frame bit (TNP):
> > 
> > a) For Non-Tunneled Frame (TNP=0)
> > 
> >     31                                                0
> >       ------------------------ -----------------------
> > RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
> >       ------------------------ -----------------------
> > 
> > b) For Tunneled Frame (TNP=1)
> > 
> >      31                   8 7                3 2      0
> >       --------------------- ------------------ -------
> > RDES0| VNID/VSID           | Reserved         | OL2L3 |
> >       --------------------- ------------------ ------
> > 
> > The logic for handling tunneled frames is not yet implemented
> > in the dwxgmac2_wrback_get_rx_vlan_tci() function. Therefore,
> > it is prudent to maintain separate functions within their
> > respective descriptor driver files
> > (dwxgmac2_descs.c and dwmac4_descs.c).
> > 
> > Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> 
> This patch does IMHO too many things together, and should be split in
> several ones, i.e.:
> - just moving the code in a separate file
> - rename functions and simbols.
> - other random changes...
> 
> > -	ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> > -				 !(val & GMAC_VLAN_TAG_CTRL_OB),
> > -				 1000, 500000);
> > -	if (ret) {
> > -		netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> > -		return -EBUSY;
> > -	}
> 
> > +	for (i = 0; i < timeout; i++) {
> > +		val = readl(ioaddr + VLAN_TAG);
> > +		if (!(val & VLAN_TAG_CTRL_OB))
> > +			return 0;
> > +		udelay(1);
> > +	}
> > +
> > +	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> > +
> > +	return -EBUSY;
> 
> ... like the above on (which looks unnecessary?!?)

Also looks like a backward step, because we ask people to use the helper
macros where possible.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
