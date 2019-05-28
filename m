Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6622CC47
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2019 18:40:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 915FECA8E6E
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2019 16:40:41 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18F57CA8E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2019 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5O70O6OB10YmWngTAKAkcQIdQ8sIfTqZZD+NK309vZU=; b=XDQ9N9RTp0puDZabOwzrob//Kv
 y5oy66ii5xp4F7st5YdpcGsQfHk49y6kt4E3Nzy9SeaASuX4lI0LHIfxYYfomjcKTlLGyWF2elUYj
 DESlvmLxyQMfXIHDIaQ9P/Wb7VkStdDsD43MTeQEvS5DmeCYX7npfkM0NZCBD5mlRUME=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hVf99-0000Gw-95; Tue, 28 May 2019 18:40:19 +0200
Date: Tue, 28 May 2019 18:40:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: biao huang <biao.huang@mediatek.com>
Message-ID: <20190528164019.GR18059@lunn.ch>
References: <1558926867-16472-1-git-send-email-biao.huang@mediatek.com>
 <1558926867-16472-2-git-send-email-biao.huang@mediatek.com>
 <20190527.100800.1719164073038257292.davem@davemloft.net>
 <1559008369.24897.66.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559008369.24897.66.camel@mhfsdcap03>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: yt.shen@mediatek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, boon.leong.ong@intel.com,
 joabreu@synopsys.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, jianguo.zhang@mediatek.com, peppe.cavallaro@st.com,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com
Subject: Re: [Linux-stm32] [v3,
 PATCH] net: stmmac: add support for hash table size 128/256 in
 dwmac4
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

On Tue, May 28, 2019 at 09:52:49AM +0800, biao huang wrote:
> Dear David,
> 
> On Mon, 2019-05-27 at 10:08 -0700, David Miller wrote:
> > From: Biao Huang <biao.huang@mediatek.com>
> > Date: Mon, 27 May 2019 11:14:27 +0800
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > index 5e98da4..029a3db 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > @@ -403,41 +403,50 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
> > >  			      struct net_device *dev)
> > >  {
> > >  	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> > > -	unsigned int value = 0;
> > > +	unsigned int value;
> > > +	int numhashregs = (hw->multicast_filter_bins >> 5);
> > > +	int mcbitslog2 = hw->mcast_bits_log2;
> > > +	int i;
> > 
> > Please retain the reverse christmas tree ordering here.
> I'm a little confused about the reverse xmas tree ordering.
> 
> should I reorder them only according to the total length like this:
> 
> 	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> 	int numhashregs = (hw->multicast_filter_bins >> 5);
> 	int mcbitslog2 = hw->mcast_bits_log2;
> 	unsigned int value;
> 	int i;

Yes.
	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
