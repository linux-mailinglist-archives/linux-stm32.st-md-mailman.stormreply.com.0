Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C57F9D12
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 11:05:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C1A2C6B457;
	Mon, 27 Nov 2023 10:05:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A6DEC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=103EYSlv1xYNaveQmHKaeTchRamogG2SM3UwtD/Xhk4=; b=MOrGQ4fYYTEwLV1aLvyIHfmLI5
 r6Dn0aRMbyUAYmvG6GlrC3+61F3Rgo53yGCcSMYT9c1NOrbvdtZ3I9XCudVeqaV7mAtZL3kvUPcFO
 jUaCAZ3fx3WncjO4cSYIHX/+VLATBMhYxX2c2cgZ0ZWg1mdqTvpNGeY/LJ9GlWVem74fr3y6ioJgu
 vIzfvf4aP+GjwyJYHOqbBRLbDAHYP+/iN6A3uxlWd72WKbgcfUec0Pei2jn1b6kfzR2F+sz2n48ud
 j+hqUgRxPslp4db123Q8xE3CpsoBwRxttwodeCzeLSNhtgA2ARwjl6x3nr3PFB9dWvfOP+KPGGQPN
 JM9UGy+w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57620)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1r7YUQ-0005bg-20;
 Mon, 27 Nov 2023 10:05:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1r7YUQ-0001oH-Me; Mon, 27 Nov 2023 10:05:18 +0000
Date: Mon, 27 Nov 2023 10:05:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <ZWRp3pVv0DNsPMT7@shell.armlinux.org.uk>
References: <20231124050818.1221-1-quic_snehshah@quicinc.com>
 <ZWBo5EKjkffNOqkQ@shell.armlinux.org.uk>
 <47c9eb95-ff6a-4432-a7ef-1f3ebf6f593f@quicinc.com>
 <ZWRVz05Gb4oALDnf@shell.armlinux.org.uk>
 <3bf6f666-b58a-460f-88f5-ad8ec08bfbbc@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bf6f666-b58a-460f-88f5-ad8ec08bfbbc@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: update Rx clk divider
	for 10M SGMII
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

On Mon, Nov 27, 2023 at 03:17:20PM +0530, Sneh Shah wrote:
> On 11/27/2023 2:09 PM, Russell King (Oracle) wrote:
> > On Mon, Nov 27, 2023 at 11:25:34AM +0530, Sneh Shah wrote:
> >> On 11/24/2023 2:42 PM, Russell King (Oracle) wrote:
> >>> The next concern I have is that you're only doing this for SPEED_10.
> >>> If it needs to be programmed for SPEED_10 to work, and not any of the
> >>> other speeds, isn't this something that can be done at initialisation
> >>> time? If it has to be done depending on the speed, then don't you need
> >>> to do this for each speed with an appropriate value?
> >>
> >> This field programming is required only for 10M speed in for SGMII mode. other speeds are agnostic to this field. Hence we are programming it always when SGMII link comes up in 10M mode. init driver data for ethqos is common for sgmii and rgmii. As this fix is specific to SGMII we can't add this to init driver data.
> > 
> > I wasn't referring to adding it to driver data. I was asking whether it
> > could be done in the initialisation path.
> > 
> No, IOMACRO block is configured post phylink up regardless of RGMII or SGMII mode. We are not updating them at driver initialization time itself.

What reason (in terms of the hardware) requires you to do this every
time you select 10M speed? Does the hardware change the value in the
register?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
