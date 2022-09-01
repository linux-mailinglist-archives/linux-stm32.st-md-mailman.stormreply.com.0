Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 330B65A965D
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Sep 2022 14:08:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E45BBC04001;
	Thu,  1 Sep 2022 12:08:45 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B3BFC03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Sep 2022 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=LaFtjcKE2V/P1S6QroWS+3k5zrDKN1D6ktj5C2pZ8Ek=; b=U6GQYqOERXA3BfsLz0EQzJErri
 lMNRyeaGK8SIJHmNPrIyRs+84fwcuZNoDn5kha7nFPApyY4FU1OcVBnb/CHF6vOBkKyqXQQjyB9ZS
 HpUPy2KGpcnKvC+bejy0wSRfHMqDxCs8cRhSa26mOJWKxkRBpnzyYijxnIyvvgWW4DK0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oTizf-00FIgL-Q0; Thu, 01 Sep 2022 14:08:23 +0200
Date: Thu, 1 Sep 2022 14:08:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Anand Moon <anand@edgeble.ai>
Message-ID: <YxCgtyqZ6+D5MBY5@lunn.ch>
References: <20220829065044.1736-1-anand@edgeble.ai>
 <20220829065044.1736-2-anand@edgeble.ai> <Ywy6o2d9j4Z7+WYX@lunn.ch>
 <CACF1qnfmzcq55GvsD=GQ+ciLRstZ-7ef1EDaBzKMqBzU0O+WRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACF1qnfmzcq55GvsD=GQ+ciLRstZ-7ef1EDaBzKMqBzU0O+WRw@mail.gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 David Wu <david.wu@rock-chips.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@edgeble.ai>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

> > On Mon, Aug 29, 2022 at 06:50:42AM +0000, Anand Moon wrote:
> > > Rockchip RV1126 has GMAC 10/100/1000M ethernet controller
> > > via RGMII and RMII interfaces are configured via M0 and M1 pinmux.
> > >
> > > This patch adds rv1126 support by adding delay lines of M0 and M1
> > > simultaneously.
> >
> > What does 'delay lines' mean with respect to RGMII?
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
> >
> These are set to enable MAC transmit clock delay set for Tx and Rx for
> iomux group.

Which does not answer my question. Is this the same as, or different
to, the 2ns delay required by RGMII?

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
