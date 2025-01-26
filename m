Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6F3A1D37C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2025 10:32:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EBC7C78035;
	Mon, 27 Jan 2025 09:32:59 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B97CC78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jan 2025 08:41:29 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 18FA92540103;
 Sun, 26 Jan 2025 03:41:27 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Sun, 26 Jan 2025 03:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1737880886; x=1737967286; bh=HftiZnevtp2qsnswvVZXprhygnVO8ILoeqm
 v/RLP7DQ=; b=ghCz0DMHEyWWC3P4FQncx+iKypq2RfrGaudZw7qPikAVrYP5SwZ
 QqHH8AD13TlGQIK45fiecOhOQ+MR7XQx1mdMGSSsZ/ACh6Gm0HQMyOsLdBGYNnwO
 yz7n2jlZ6i/8nUAd3qbmSjcK5nmfA7v2mAfVldbxTYiK+qvm077iPn2+DUwXnDrY
 3R+FasvmpRUGlU+gY3ceEOVtNNpNzgyd+HyHsTA4SNBxXSqEXq4XxuioWKp+IeXi
 oXqkJqdT5Wh+WMhIQ4/9nNN+kx8tHgzM59DuF45tPWHw3NrqfLLyGyCeNIka2X+0
 unRuexvZamJouX19sI2prUzLN8qmyHCSgKQ==
X-ME-Sender: <xms:NvWVZ0GRQYxjN6EG78mYvtoUJtC_ZiT3Nz5Ielkg8WTBSZPiqzj0lg>
 <xme:NvWVZ9VaTS6rBkMbcs6FBEe_iRUj6vurXEom1CZvZhizN2lcgmneeBZp_cW03KxHJ
 icjy_K5ISVFAec>
X-ME-Received: <xmr:NvWVZ-JiR6BmOphchStlHlgASuJae87b5-qgMN4Clstgr8x6KXBPCRlwxtsV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgleektdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpefkughoucfutghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrd
 horhhgqeenucggtffrrghtthgvrhhnpeehhfdtjedviefffeduuddvffegteeiieeguefg
 udffvdfftdefheeijedthfejkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihguohhstghh
 sehiughoshgthhdrohhrghdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpoh
 huthdprhgtphhtthhopedtgiduvddtjeesghhmrghilhdrtghomhdprhgtphhtthhopegr
 nhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegsghhrihhffhhishesnhhvihguih
 grrdgtohhmpdhrtghpthhtohepjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhr
 tghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
 eplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghp
 lhihrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
 hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
 sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvghkshgrnhguvghrrd
 hlohgsrghkihhnsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:NvWVZ2GSd8rk6Q76dOpZQVJFjbCP83n5WvR-tm9AO6WUJTCBEp_oaA>
 <xmx:NvWVZ6U9HO7GkxTTz7l2XFE8pYwGF8Ea_Brtb9sX78E8xo2LsSofpw>
 <xmx:NvWVZ5MZayxKuK-jiCAay_c4NJHybliV6nwQ_NEUwGE6oOYXn34uaA>
 <xmx:NvWVZx2HtaJT4RUf0DUY4FfOYjvzUe6p6IH6tR2genF6FfOmYRQPnA>
 <xmx:NvWVZ4Yxox-UqScH-CKvvBbjRcJSxt4_PDvqf-1AqmL7Qg46l4QJ_VMC>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Jan 2025 03:41:25 -0500 (EST)
Date: Sun, 26 Jan 2025 10:41:23 +0200
From: Ido Schimmel <idosch@idosch.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z5X1M0Fs-K6FkSAl@shredder>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
 <20250125224342.00006ced@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250125224342.00006ced@gmail.com>
X-Mailman-Approved-At: Mon, 27 Jan 2025 09:32:58 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

Hi,

On Sat, Jan 25, 2025 at 10:43:42PM +0800, Furong Xu wrote:
> Hi Ido
> 
> On Sat, 25 Jan 2025 12:20:38 +0200, Ido Schimmel wrote:
> 
> > On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> > > On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch>
> > > wrote: 
> > > > > Just to clarify, the patch that you had us try was not intended
> > > > > as an actual fix, correct? It was only for diagnostic purposes,
> > > > > i.e. to see if there is some kind of cache coherence issue,
> > > > > which seems to be the case?  So perhaps the only fix needed is
> > > > > to add dma-coherent to our device tree?    
> > > > 
> > > > That sounds quite error prone. How many other DT blobs are
> > > > missing the property? If the memory should be coherent, i would
> > > > expect the driver to allocate coherent memory. Or the driver
> > > > needs to handle non-coherent memory and add the necessary
> > > > flush/invalidates etc.  
> > > 
> > > stmmac driver does the necessary cache flush/invalidates to
> > > maintain cache lines explicitly.  
> > 
> > Given the problem happens when the kernel performs syncing, is it
> > possible that there is a problem with how the syncing is performed?
> > 
> > I am not familiar with this driver, but it seems to allocate multiple
> > buffers per packet when split header is enabled and these buffers are
> > allocated from the same page pool (see stmmac_init_rx_buffers()).
> > Despite that, the driver is creating the page pool with a non-zero
> > offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
> > headroom, which is only present in the head buffer.
> > 
> > I asked Thierry to test the following patch [1] and initial testing
> > seems OK. He also confirmed that "SPH feature enabled" shows up in the
> > kernel log.
> > BTW, the commit that added split header support (67afd6d1cfdf0) says
> > that it "reduces CPU usage because without the feature all the entire
> > packet is memcpy'ed, while that with the feature only the header is".
> > This is no longer correct after your patch, so is there still value in
> > the split header feature? With two large buffers being allocated from
> 
> Thanks for these great insights!
> 
> Yes, when "SPH feature enabled", it is not correct after my patch,
> pp_params.offset should be updated to match the offset of split payload.
> 
> But I would like to let pp_params.max_len remains to
> dma_conf->dma_buf_sz since the sizes of both header and payload are
> limited to dma_conf->dma_buf_sz by DMA engine, no more than
> dma_conf->dma_buf_sz bytes will be written into a page buffer.
> So my patch would be like [2]:
> 
> BTW, the split header feature will be very useful on some certain
> cases, stmmac driver should support this feature always.
> 
> [2]
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index edbf8994455d..def0d893efbb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2091,7 +2091,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>         pp_params.nid = dev_to_node(priv->device);
>         pp_params.dev = priv->device;
>         pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
> -       pp_params.offset = stmmac_rx_offset(priv);
> +       pp_params.offset = priv->sph ? 0 : stmmac_rx_offset(priv);

SPH is the only scenario in which the driver uses multiple buffers per
packet?

>         pp_params.max_len = dma_conf->dma_buf_sz;

Are you sure this is correct? Page pool documentation says that "For
pages recycled on the XDP xmit and skb paths the page pool will use the
max_len member of struct page_pool_params to decide how much of the page
needs to be synced (starting at offset)" [1].

While "no more than dma_conf->dma_buf_sz bytes will be written into a
page buffer", for the head buffer they will be written starting at a
non-zero offset unlike buffers used for the data, no?

[1] https://docs.kernel.org/networking/page_pool.html#dma-sync
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
