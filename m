Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF6E8D8395
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 15:12:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60665C6B47E;
	Mon,  3 Jun 2024 13:12:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70831C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WhhGfCPkfrQU2JoEdJcZxodwFT3ecp3HOxHwD/uFSGM=; b=VZLilN100eULAlRILI4fDmUatt
 gnST2qjGNUghl9VUfc4/1jsip4W5IzU9dCyX3LAAsluelL06MIRia+4e7YBlpd98Ogv4pNbtG3MR4
 9mLtW6KfVjHiWinSCQy9pCX7/BXCGapxkz8LjNzvFjGozog+VQmfhcTXZt963k5zKwEDITkmY3MFn
 4EWCWHSvIMMIiWNZA+C7JCH3uUI4aWGJqaDu6GGREJiAyxr3HAS6Wo2V9Hf2ojr3sfRLuxVs1nJca
 o/bWHkl3Khb3amJCxKRAAJ8DfJGQWsqtwxIkUsGv7ANoEPOBaudTyqV+u6FjZopVfl8caM3+RtnEz
 ImLgMosw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36062)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sE7UE-0002lD-0z;
 Mon, 03 Jun 2024 14:12:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sE7UC-0000Sh-Sn; Mon, 03 Jun 2024 14:12:28 +0100
Date: Mon, 3 Jun 2024 14:12:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <Zl3BPHqREyZ5v92U@shell.armlinux.org.uk>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
 <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
 <d246bd64-18b3-4002-bc71-eccd67bbd61f@quicinc.com>
 <ZleLb+dtJ8Uspq4S@shell.armlinux.org.uk>
 <0ef00c92-b88f-48df-b9ba-2973c62285af@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ef00c92-b88f-48df-b9ba-2973c62285af@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Add support for 2.5G SGMII
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

On Mon, Jun 03, 2024 at 04:57:15PM +0530, Sneh Shah wrote:
> On 5/30/2024 1:39 AM, Russell King (Oracle) wrote:
> > From what you're saying:
> > - if using the dwmac1000 core, then for the registers at GMAC_PCS_BASE
> >   (0xc0 offset)...
> > - if using the dwmac4 core, then for registers at GMAC_PCS_BASE
> >   (0xe0 offset)...
> > ... is it true that only the GMAC_AN_CTRL() register is implemented
> > and none of the other registers listed in stmmac_pcs.h?
> > 
> > In terms of interrupts when the link status changes, how do they
> > present? Are they through the GMAC_INT_RGSMIIS interrupt only?
> > What about GMAC_INT_PCS_LINK or GMAC_INT_PCS_ANE? Or in the case
> > of the other core, is it through the PCS_RGSMIIIS_IRQ interrupt
> > only? Similarly, what about PCS_LINK_IRQ or PCS_ANE_IRQ?
> 
> we only have GMAC_AN_CTRL and GMAC_AN_STATUS register.
> There is no separate IRQ line for PCS link or autoneg. 
> It is notified via MAC interrupt line only.

From the sound of it, this is just the standard PCS that everyone else
would use in DW ETHQoS, with the exception that you can run it at 2.5G
without inband signalling.

Thanks for clarifying that. I think we can just use the phylink PCS
that I'm proposing for your case, with the exception of also adding
support for 2.5G speeds, which I will need to sort out.

So, I think I need to get my patch set that query the inband
capabilities of the PCS and PHY into net-next before we can move
forward with 2.5G speeds here.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
