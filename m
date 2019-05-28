Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F72BCFE
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2019 03:53:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABA3EC63343
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2019 01:53:01 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04A2EC63342
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2019 01:52:59 +0000 (UTC)
X-UUID: fd636dd8cdae44f3a0da8defedf6958d-20190528
X-UUID: fd636dd8cdae44f3a0da8defedf6958d-20190528
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 97317882; Tue, 28 May 2019 09:52:51 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 28 May 2019 09:52:50 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 28 May 2019 09:52:49 +0800
Message-ID: <1559008369.24897.66.camel@mhfsdcap03>
From: biao huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>
Date: Tue, 28 May 2019 09:52:49 +0800
In-Reply-To: <20190527.100800.1719164073038257292.davem@davemloft.net>
References: <1558926867-16472-1-git-send-email-biao.huang@mediatek.com>
 <1558926867-16472-2-git-send-email-biao.huang@mediatek.com>
 <20190527.100800.1719164073038257292.davem@davemloft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Cc: jianguo.zhang@mediatek.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, yt.shen@mediatek.com,
 joabreu@synopsys.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Dear David,

On Mon, 2019-05-27 at 10:08 -0700, David Miller wrote:
> From: Biao Huang <biao.huang@mediatek.com>
> Date: Mon, 27 May 2019 11:14:27 +0800
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > index 5e98da4..029a3db 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > @@ -403,41 +403,50 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
> >  			      struct net_device *dev)
> >  {
> >  	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> > -	unsigned int value = 0;
> > +	unsigned int value;
> > +	int numhashregs = (hw->multicast_filter_bins >> 5);
> > +	int mcbitslog2 = hw->mcast_bits_log2;
> > +	int i;
> 
> Please retain the reverse christmas tree ordering here.
I'm a little confused about the reverse xmas tree ordering.

should I reorder them only according to the total length like this:

	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
	int numhashregs = (hw->multicast_filter_bins >> 5);
	int mcbitslog2 = hw->mcast_bits_log2;
	unsigned int value;
	int i;

or should I gather the same type together, and order types as reverse
xmas tree, then order the same type definitions as reverse xmas tree,
like this:

	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
	unsigned int value;
	int numhashregs = (hw->multicast_filter_bins >> 5);
	int mcbitslog2 = hw->mcast_bits_log2;
	int i;

Thank you.
> 
> Thank you.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
