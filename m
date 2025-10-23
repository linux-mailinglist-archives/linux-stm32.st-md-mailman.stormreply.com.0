Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A6C0097E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 12:58:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 890D4C5EC60;
	Thu, 23 Oct 2025 10:58:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AF3DC5EC5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qNGKgnMkm6N0a34ArXOzNjX3fTe4GCYWTtnKll+z7TA=; b=Vo4MIiRfyHNRUscorfDM2/WOE+
 41TOMbZ/qQpN4QtO+oFf2EFpHe03toytLAivMuDtRJF6x8M16xbeVOrA8JQl8HwymcoIzP4c4O6Jf
 NCAmA6iZQ5I6/8i/xZbPnXziAmvjlSFD974zsQ2/HEPYDv5NqJKlQO+ZhzwQcfh05YCVc750IXVm0
 3EybN0Xz1J5Hg7BMUp3kY2o+Sw54x9cx8nXnxw/Z+fnxc5i0T1zuxhvLhtmHfjUgBE5/GfIKvhyCc
 r8HPePXiy+8MBBJilicxlzwsXUqg0E5L0uuE6n89f2TKdJliV0ncU+TVqkTMHhaw3jZAvBu0nJrdL
 aJCwddtQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58128)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vBt19-000000006Dh-3jCL;
 Thu, 23 Oct 2025 11:58:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vBt17-000000001cq-0c85; Thu, 23 Oct 2025 11:58:01 +0100
Date: Thu, 23 Oct 2025 11:58:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <aPoKOIfCGvDEIWS7@shell.armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
 <aPI6MEVp9WBR3nRo@shell.armlinux.org.uk>
 <ac0a8cd8-b1bc-4cdb-a199-cc92c748b84b@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac0a8cd8-b1bc-4cdb-a199-cc92c748b84b@altera.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN
 offload tag length for maxSDU
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

On Sat, Oct 18, 2025 at 07:36:26AM +0530, G Thomas, Rohan wrote:
> Hi Russell,
> 
> Thanks, I'll update the commit message.
> 
> On 10/17/2025 6:14 PM, Russell King (Oracle) wrote:
> > On Fri, Oct 17, 2025 at 02:11:20PM +0800, Rohan G Thomas via B4 Relay wrote:
> > > From: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > 
> > > On hardware with Tx VLAN offload enabled, add the VLAN tag length to
> > > the skb length before checking the Qbv maxSDU if Tx VLAN offload is
> > > requested for the packet. Add 4 bytes for 802.1Q tag.
> > 
> > This needs to say _why_. Please describe the problem that the current
> > code suffers from. (e.g. the packet becomes too long for the queue to
> > handle, which causes it to be dropped - which is my guess.)
> > 
> > We shouldn't be guessing the reasons behind changes.
> > 
> 
> Queue maxSDU requirement of 802.1 Qbv standard requires mac to drop
> packets that exceeds maxSDU length and maxSDU doesn't include preamble,
> destination and source address, or FCS but includes ethernet type and VLAN
> header.
> 
> On hardware with Tx VLAN offload enabled, VLAN header length is not
> included in the skb->len, when Tx VLAN offload is requested. This leads
> to incorrect length checks and allows transmission of oversized packets.
> Add the VLAN_HLEN to the skb->len before checking the Qbv maxSDU if Tx
> VLAN offload is requested for the packet.
> 
> This patch ensures that the VLAN header length (`VLAN_HLEN`) is
> accounted for in the SDU length check when VLAN offload is requested.

Please put that in the commit message, thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
