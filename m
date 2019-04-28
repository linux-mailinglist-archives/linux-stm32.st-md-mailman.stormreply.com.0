Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BABEAB63F
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Apr 2019 18:37:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F0ECC36B3F
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Apr 2019 16:37:13 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 261A9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Apr 2019 16:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uoSXhyD3TOK7i4eaxOafe7KFL4hfzJB0aeciU8oRpF8=; b=FP3HHRzzpWRywBh93FGqVkg6WT
 VQ741RPEI3K435alYDJFEzFaFh//UpVWpB0PhdXWmLbW5JqY/9XW4Lyc8aNvIWrci3qXgoVwdXGgE
 js4/0at4IXwEHMGAbwXjNUrbbm/glQmhXL5LUrUBsSg9qfgaiiAIFB6lVLpxONw76LGo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hKmnZ-0000m8-Rk; Sun, 28 Apr 2019 18:37:05 +0200
Date: Sun, 28 Apr 2019 18:37:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <20190428163705.GH23059@lunn.ch>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
 <1556433009-25759-6-git-send-email-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556433009-25759-6-git-send-email-biao.huang@mediatek.com>
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

On Sun, Apr 28, 2019 at 02:30:08PM +0800, Biao Huang wrote:
> +static int stmmac_c45_read(struct mii_bus *bus, int phyaddr,
> +			   int devad, int prtad)
> +{
> +	struct net_device *ndev = bus->priv;
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	unsigned int mii_address = priv->hw->mii.addr;
> +	unsigned int mii_data = priv->hw->mii.data;
> +	u32 v, value;
> +	int data;
> +
> +	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
> +			       100, 10000))
> +		return -EBUSY;

Hi Biao

readl_poll_timeout() returns an error code. It is better to return
that, than make up some other error code. Yes, i know the C22 read
returns EBUSY, but we don't need to copy that behaviour into C45.

> +
> +	value = 0;
> +	value |= (prtad << priv->hw->mii.cl45_reg_shift)
> +			& priv->hw->mii.cl45_reg_mask;
> +	writel(value, priv->ioaddr + mii_data);
> +
> +	/* delay 2ms to avoid error value of get_phy_c45_devs_in_pkg */
> +	mdelay(2);

Please could you explain this a bit more?

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
