Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7FBB07052
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jul 2025 10:22:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5062DC32E93;
	Wed, 16 Jul 2025 08:22:17 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB7DFC32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jul 2025 08:22:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F07F8A52F6F;
 Wed, 16 Jul 2025 08:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA6EC4CEF0;
 Wed, 16 Jul 2025 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752654134;
 bh=cnOqqRyy8qapop2aj8Jh9qYqoK7bu5+GswzkuuErweY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxNr8dV8utIpB32/zJ1R+YimFzAuZwRROQZBqfJHoDS1ouPaDNML/T8mkaNtZMorC
 kPTe0Y1t6Iey7AUMZP7C5z0XxnTIjBMTw/w+h+6SFXB0B1AwAfN33HXIgy28zIE6Py
 RyPQ33zcZhyWh/Zbgw+mAuB4HhAhx+GgIkjvmpgzyIc9k5uJadbiBJyJ3TPXEiPZ+N
 gt+wfW/KeOkvC+pDiV/pYPoCG4OGTZgGyqAmSuTJyH1V1IuwYfH7Up4a+Z11t3vYYC
 a6VuvwUWYzY1djopIhfce3XbH4hsyUXakJfB45GOZK8PpEl6aE56MoeJ3BsFJ2cRnI
 MNn3jyoDwNqiw==
Date: Wed, 16 Jul 2025 09:22:09 +0100
From: Simon Horman <horms@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <20250716082209.GH721198@horms.kernel.org>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
 <20250714134012.GN721198@horms.kernel.org>
 <9f4acd69-12ff-4b2f-bb3a-e8d401b23238@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f4acd69-12ff-4b2f-bb3a-e8d401b23238@altera.com>
Cc: linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Set CIC bit
 only for TX queues with COE
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

On Tue, Jul 15, 2025 at 07:14:21PM +0530, G Thomas, Rohan wrote:
> Hi Simon,
> 
> Thanks for reviewing the patch.
> 
> On 7/14/2025 7:10 PM, Simon Horman wrote:
> > On Mon, Jul 14, 2025 at 03:59:19PM +0800, Rohan G Thomas via B4 Relay wrote:
> > > From: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > 
> > > Currently, in the AF_XDP transmit paths, the CIC bit of
> > > TX Desc3 is set for all packets. Setting this bit for
> > > packets transmitting through queues that don't support
> > > checksum offloading causes the TX DMA to get stuck after
> > > transmitting some packets. This patch ensures the CIC bit
> > > of TX Desc3 is set only if the TX queue supports checksum
> > > offloading.
> > > 
> > > Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > 
> > Hi Rohan,
> > 
> > I notice that stmmac_xmit() handles a few other cases where
> > checksum offload should not be requested via stmmac_prepare_tx_desc:
> > 
> >          csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
> >          /* DWMAC IPs can be synthesized to support tx coe only for a few tx
> >           * queues. In that case, checksum offloading for those queues that don't
> >           * support tx coe needs to fallback to software checksum calculation.
> >           *
> >           * Packets that won't trigger the COE e.g. most DSA-tagged packets will
> >           * also have to be checksummed in software.
> >           */
> >          if (csum_insertion &&
> >              (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
> >               !stmmac_has_ip_ethertype(skb))) {
> >                  if (unlikely(skb_checksum_help(skb)))
> >                          goto dma_map_err;
> >                  csum_insertion = !csum_insertion;
> >          }
> > 
> > Do we need to care about them in stmmac_xdp_xmit_zc()
> > and stmmac_xdp_xmit_xdpf() too?
> 
> This patch only addresses avoiding the TX DMA hang by ensuring the CIC
> bit is only set when the queue supports checksum offload. For DSA tagged
> packets checksum offloading is not supported by the DWMAC IPs but no TX
> DMA hang. AFAIK, currently AF_XDP paths don't have equivalent handling
> like skb_checksum_help(), since they operate on xdp buffers. So this
> patch doesn't attempt to implement a sw fallback but just avoids DMA
> stall.

Ok, fair enough.

As per Andrew's advice elsewhere in this thread.
This patch also looks like it should be a fix for net,
and should have a Fixes tag.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
