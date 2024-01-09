Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B88288C4
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 16:14:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DF22C6DD74;
	Tue,  9 Jan 2024 15:14:09 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EBD6C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 15:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=gRiZiJWOoVL6Oa5TlXweb+aZfLgTD3/mvROJ7Dpd6vo=; b=EhgJ5JBZ0knWO1CRq06h9bTbXZ
 ZF4H3dqITWvmqEbmUSX+49PXuSy0FBPA26c2MLmyPJtmBFYFq3bUYA6VFLywYgnE7ZlX/jh2JCA/X
 34HRmL1Sy/FR2AmKPpCon150+fczB7SXbtw4EgxEsc4X31/Dw4HSYckK4+DxBc+dvTEk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rNDng-004qNW-I3; Tue, 09 Jan 2024 16:13:56 +0100
Date: Tue, 9 Jan 2024 16:13:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <c9290a44-a239-4ccf-9e14-4647b68aac2f@lunn.ch>
References: <20240108121128.30071-1-quic_snehshah@quicinc.com>
 <4216bcbb-730d-4c51-a9ce-d3f0a0846e31@lunn.ch>
 <6f97e753-435e-4b86-bd47-290097f6a3f0@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f97e753-435e-4b86-bd47-290097f6a3f0@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: dwmac-qcom-ethqos: Add
 support for 2.5G SGMII
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

On Tue, Jan 09, 2024 at 08:22:40PM +0530, Sneh Shah wrote:
> 
> 
> On 1/9/2024 1:00 AM, Andrew Lunn wrote:
> > On Mon, Jan 08, 2024 at 05:41:28PM +0530, Sneh Shah wrote:
> >> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
> >> mode for 1G/100M/10M speed.
> >> Added changes to configure serdes phy and mac based on link speed.
> > 
> > Please take a look at:
> > 
> > https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
> > 
> > The Subject is missing which tree this is for. Also, net-next is
> > closed at the moment.
> 
> It was supposed to be net-next. Missed updating in subject.
> Sorry for that!
> If net-next is closed at the moment, how to proceed further?
> Should I wait until it gets reopened?

Yes, please repost in two weeks time.

> >>  	switch (ethqos->speed) {
> >> +	case SPEED_2500:
> >> +		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
> >> +		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >> +			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >> +			      RGMII_IO_MACRO_CONFIG2);
> >> +		if (ethqos->serdes_speed != SPEED_2500)
> >> +			phy_set_speed(ethqos->serdes_phy, SPEED_2500);
> > 
> > Is calling phy_set_speed() expensive? Why not just unconditionally
> > call it?
> > 
> It reconfigures whole serdes phy block, with lots of register read/writes.
> So I feel it is better to avoid doing this unconditionally

O.K, please add this to the commit message.

Part of the purpose of the commit message is to try to answer
questions the reviewers are going to ask when they look at the
code. Its better to put more in the commit message than less, it helps
get your code merged faster, and reduces the load on reviewers.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
