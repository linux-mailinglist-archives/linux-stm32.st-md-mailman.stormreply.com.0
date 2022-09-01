Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6947E5A966D
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Sep 2022 14:12:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33611C03FDB;
	Thu,  1 Sep 2022 12:12:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBAD0C03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Sep 2022 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Z32zyNm2q9oNI20LFO4oRcR+yDJE4HnerOl4N12iFtc=; b=HMmdDxmavhLwaqId+oNxLibqnx
 oQUdQEd2uBcf1xjgqu5yuxKOo2Uq7B27yE1CoyTv8xmgv0P28FQEERnsyRbFbIxM1eEcdLA6x0+mL
 dPMCHdB5TeibVefHYtyVJmIwnvh4uk0M8UgS9em0LaXYS7CdRQm5URcdi6KByaNE1W3w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oTj3k-00FIiu-A7; Thu, 01 Sep 2022 14:12:36 +0200
Date: Thu, 1 Sep 2022 14:12:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jagan Teki <jagan@edgeble.ai>
Message-ID: <YxChtBzavS1Fooxs@lunn.ch>
References: <20220829065044.1736-1-anand@edgeble.ai>
 <20220829065044.1736-2-anand@edgeble.ai> <Ywy6o2d9j4Z7+WYX@lunn.ch>
 <CA+VMnFzNcPesS8Mn2mwr-RDXf5sRz-2A3K+syDmpCo1va6JwMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+VMnFzNcPesS8Mn2mwr-RDXf5sRz-2A3K+syDmpCo1va6JwMw@mail.gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 David Wu <david.wu@rock-chips.com>, Anand Moon <anand@edgeble.ai>,
 linux-stm32@st-md-mailman.stormreply.com,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: ethernet: stmicro: stmmac:
 dwmac-rk: Add rv1126 support
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

On Thu, Sep 01, 2022 at 12:56:09PM +0530, Jagan Teki wrote:
> On Mon, 29 Aug 2022 at 18:40, Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Mon, Aug 29, 2022 at 06:50:42AM +0000, Anand Moon wrote:
> > > Rockchip RV1126 has GMAC 10/100/1000M ethernet controller
> > > via RGMII and RMII interfaces are configured via M0 and M1 pinmux.
> > >
> > > This patch adds rv1126 support by adding delay lines of M0 and M1
> > > simultaneously.
> >
> > What does 'delay lines' mean with respect to RGMII?
> 
> These are MAC receive clock delay lengths.
> 
> >
> > The RGMII signals need a 2ns delay between the clock and the data
> > lines. There are three places this can happen:
> >
> > 1) In the PHY
> > 2) Extra long lines on the PCB
> > 3) In the MAC
> >
> > Generally, 1) is used, and controlled via phy-mode. A value of
> > PHY_INTERFACE_MODE_RGMII_ID passed to the PHY driver means it will add
> > these delays.
> >
> > You don't want both the MAC and the PHY adding delays.
> 
> Yes, but these are specific to MAC, not related to PHY delays. Similar
> to what is there in other Rockchip SoC families like RK3366, 3368,
> 3399, 3128, but these MAC clock delay lengths are grouped based on the
> iomux group in RV1126. We have iomux group 0 (M0) and group 1 (M1), so
> the rgmii has to set these lengths irrespective of whether PHY add's
> or not.

So this is just fine tuning, in the order of pico seconds?

If that is all it is, then this is fine. It becomes a problem when it
is 2ns.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
