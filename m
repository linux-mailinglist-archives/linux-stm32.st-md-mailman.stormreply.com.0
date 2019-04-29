Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308CE3A4
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 15:23:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB487C35E07
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 13:23:37 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AC4FC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G9+UVkmUelZPc/fq6yyI9wbOx04gDxUNqmqWJk98Nkg=; b=UJxTcsu3QVfNUjU0YZtQzi6U3y
 wqS5EGC5LSO/GkxW9xCydVDvbZ1fs37BBldYsyRB4/OLeWLrobP38ZeMf/gS1JrYsru+wKb40eq3m
 ceOmhYYufSpplKctvC8LKsMTHYMWy3AnrSfh9BAbBMXdDsP07MKex5LVfvQ4FhluvDmg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hL6Fj-00010z-OB; Mon, 29 Apr 2019 15:23:27 +0200
Date: Mon, 29 Apr 2019 15:23:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: biao huang <biao.huang@mediatek.com>
Message-ID: <20190429132327.GF10772@lunn.ch>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
 <1556433009-25759-6-git-send-email-biao.huang@mediatek.com>
 <20190428163705.GH23059@lunn.ch>
 <1556517925.24897.17.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556517925.24897.17.camel@mhfsdcap03>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: jianguo.zhang@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 yt.shen@mediatek.com, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/6] net: stmmac: add mdio clause 45
 access from mac device for dwmac4
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

> > Hi Biao
> > 
> > readl_poll_timeout() returns an error code. It is better to return
> > that, than make up some other error code. Yes, i know the C22 read
> > returns EBUSY, but we don't need to copy that behaviour into C45.
> > 
> OK, will return error code here.
> > > +
> > > +	value = 0;
> > > +	value |= (prtad << priv->hw->mii.cl45_reg_shift)
> > > +			& priv->hw->mii.cl45_reg_mask;
> > > +	writel(value, priv->ioaddr + mii_data);
> > > +
> > > +	/* delay 2ms to avoid error value of get_phy_c45_devs_in_pkg */
> > > +	mdelay(2);
> > 
> > Please could you explain this a bit more?
> when of_mdiobus_register is invoked,
> the C22 PHY addr information will be obtained in device tree(reg = xx,
> no need through mdiobus),
> but C45 PHY addr should be got through mdiobus->read according to
> current flow.
>     of_mdiobus_register -->
>     of_mdiobus_register_phy -->
>     get_phy_device -->
>     get_phy_id -->
>     get_phy_c45_ids -->
>     get_phy_c45_devs_in_pkg
> 
> In my platform, mdio bus read will return 0xffff or 0x0000 for C45 in
> of_mdiobus_register callstack, and that's not the expected value. 
> So that the mdiobus register fails.
> 
> We took some time to find that only after adding 2ms delay here,
> the read action will be stable and return the expected value.
> 
> did you try C45 support in your platform? I can't tell whether it's a
> common or specified issue.

It sounds like you need to put a logic analyser on the bus and see if
it performs a C22 transaction, or an invalid transaction, without the
2ms pause.

This sounds like a 'silicon' bug. There should not be a need to pause
here. And the comment should talk about this silicon bug, not
get_phy_c45_devs_in_pkg(). It will fail for all accesses, not just
those for get_phy_c45_devs_in_pkg().

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
