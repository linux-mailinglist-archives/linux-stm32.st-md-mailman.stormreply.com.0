Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B5F24D
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 10:56:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB3C8C35E03
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 08:56:09 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEBF9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 08:56:07 +0000 (UTC)
X-UUID: 660ccab875084f589928a94b3a8c365e-20190430
X-UUID: 660ccab875084f589928a94b3a8c365e-20190430
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 562232972; Tue, 30 Apr 2019 16:56:02 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 30 Apr 2019 16:56:01 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 30 Apr 2019 16:56:00 +0800
Message-ID: <1556614560.24897.31.camel@mhfsdcap03>
From: biao huang <biao.huang@mediatek.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Tue, 30 Apr 2019 16:56:00 +0800
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B46DDF0@DE02WEMBXB.internal.synopsys.com>
References: <1556518556-32464-1-git-send-email-biao.huang@mediatek.com>
 <1556518556-32464-2-git-send-email-biao.huang@mediatek.com>
 <78EB27739596EE489E55E81C33FEC33A0B46DDF0@DE02WEMBXB.internal.synopsys.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Cc: "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "yt.shen@mediatek.com" <yt.shen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/4] net: stmmac: update rx tail pointer
 register to fix rx dma hang issue.
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

On Mon, 2019-04-29 at 08:51 +0000, Jose Abreu wrote:
> From: Biao Huang <biao.huang@mediatek.com>
> Date: Mon, Apr 29, 2019 at 07:15:53
> 
> > Currently we will not update the receive descriptor tail pointer in
> > stmmac_rx_refill. Rx dma will think no available descriptors and stop
> > once received packets exceed DMA_RX_SIZE, so that the rx only test will fail.
> > 
> > Update the receive tail pointer in stmmac_rx_refill to add more descriptors
> > to the rx channel, so packets can be received continually
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 97c5e1a..818ad88 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3336,6 +3336,9 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
> >  		entry = STMMAC_GET_ENTRY(entry, DMA_RX_SIZE);
> >  	}
> >  	rx_q->dirty_rx = entry;
> > +	stmmac_set_rx_tail_ptr(priv, priv->ioaddr,
> > +			       rx_q->dma_rx_phy + (entry * sizeof(struct dma_desc)),
> 
> I think you can just use the "rx_q->rx_tail_addr" here. It'll always 
> trigger a poll demand for the channel.
Yes, will use rx_q->rx_tail_addr here.
> 
> Thanks,
> Jose Miguel Abreu


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
