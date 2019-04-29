Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 563F6DD02
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 09:39:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 250D8C32EA0
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 07:39:08 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 663FCC35E04
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 06:05:32 +0000 (UTC)
X-UUID: b952677fe0ec41e19dd2a36adff33e10-20190429
X-UUID: b952677fe0ec41e19dd2a36adff33e10-20190429
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 948546939; Mon, 29 Apr 2019 14:05:27 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 29 Apr 2019 14:05:26 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 29 Apr 2019 14:05:25 +0800
Message-ID: <1556517925.24897.17.camel@mhfsdcap03>
From: biao huang <biao.huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Mon, 29 Apr 2019 14:05:25 +0800
In-Reply-To: <20190428163705.GH23059@lunn.ch>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
 <1556433009-25759-6-git-send-email-biao.huang@mediatek.com>
 <20190428163705.GH23059@lunn.ch>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 29 Apr 2019 07:39:05 +0000
Cc: jianguo.zhang@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 yt.shen@mediatek.com, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
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

Hi Andrew,

On Sun, 2019-04-28 at 18:37 +0200, Andrew Lunn wrote:
> On Sun, Apr 28, 2019 at 02:30:08PM +0800, Biao Huang wrote:
> > +static int stmmac_c45_read(struct mii_bus *bus, int phyaddr,
> > +			   int devad, int prtad)
> > +{
> > +	struct net_device *ndev = bus->priv;
> > +	struct stmmac_priv *priv = netdev_priv(ndev);
> > +	unsigned int mii_address = priv->hw->mii.addr;
> > +	unsigned int mii_data = priv->hw->mii.data;
> > +	u32 v, value;
> > +	int data;
> > +
> > +	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
> > +			       100, 10000))
> > +		return -EBUSY;
> 
> Hi Biao
> 
> readl_poll_timeout() returns an error code. It is better to return
> that, than make up some other error code. Yes, i know the C22 read
> returns EBUSY, but we don't need to copy that behaviour into C45.
> 
OK, will return error code here.
> > +
> > +	value = 0;
> > +	value |= (prtad << priv->hw->mii.cl45_reg_shift)
> > +			& priv->hw->mii.cl45_reg_mask;
> > +	writel(value, priv->ioaddr + mii_data);
> > +
> > +	/* delay 2ms to avoid error value of get_phy_c45_devs_in_pkg */
> > +	mdelay(2);
> 
> Please could you explain this a bit more?
when of_mdiobus_register is invoked,
the C22 PHY addr information will be obtained in device tree(reg = xx,
no need through mdiobus),
but C45 PHY addr should be got through mdiobus->read according to
current flow.
    of_mdiobus_register -->
    of_mdiobus_register_phy -->
    get_phy_device -->
    get_phy_id -->
    get_phy_c45_ids -->
    get_phy_c45_devs_in_pkg

In my platform, mdio bus read will return 0xffff or 0x0000 for C45 in
of_mdiobus_register callstack, and that's not the expected value. 
So that the mdiobus register fails.

We took some time to find that only after adding 2ms delay here,
the read action will be stable and return the expected value.

did you try C45 support in your platform? I can't tell whether it's a
common or specified issue.

our version is 4.21a.
> 
>        Andrew


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
