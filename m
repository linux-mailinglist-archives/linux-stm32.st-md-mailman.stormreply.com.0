Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0057CA1D37D
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2025 10:32:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 907ACC78032;
	Mon, 27 Jan 2025 09:32:59 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0A3BC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 10:20:44 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id B7DEF138016A;
 Sat, 25 Jan 2025 05:20:43 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Sat, 25 Jan 2025 05:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1737800443; x=1737886843; bh=wfvSpCX+V5zYmBnjZfj8HnP796xfwBWgA/B
 GlazT0N8=; b=Liy6QBKKq1vNslG0frNNQ8ZOZF4YVO28jfSlWo/+BChqGJ9nMuY
 PIhEdzwsITQ/MTcZerYpypwH3iSKKukVDIIU9ZHpNMVj49a8PZpPL2G6wLcv8CI/
 ctsQoxXEAwTbL/zFKgj4PE1pWTWtkV21mcYjMnTyoZGA0u+O4edtNhXPBAg5E4V0
 vBJ0tZZYNpQZ2/4SQhjjR6Mrl78uoUfyZEeApow7TRE7UUVMepOe0c8q3CCh+ax/
 nwXiBjePKol90O9nv4jBsxZPY+nlf+3xM4bXoj5PSxerJkzx6h+5AUBr37C+TAyP
 QLcdJSHO2OH5GcSFHS1C7fq5sThA2EE7ngQ==
X-ME-Sender: <xms:-rqUZ2YMP4eMQkA9PwoRDquitQv8LWBv4bIbsMKroykPh4tsCPFsxA>
 <xme:-rqUZ5YH-mRh6rN3RejNVMY2WFRU059L7CQj7w7BwzCU2yOlh4kXC4b8cXeYw3OGa
 8DzNRs9NDg1WO0>
X-ME-Received: <xmr:-rqUZw9X7qoxovCS-1F2_Xel_tMnaev6tiHbmmxDmsukOHy2X_BRaUqnfQq21QNW-gvdnMBA0nDQSn1r4hAvl3xAuy_ynw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgjedufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpefkughoucfutghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrd
 horhhgqeenucggtffrrghtthgvrhhnpedvudefveekheeugeeftddvveefgfduieefudei
 fefgleekheegleegjeejgeeghfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehiughoshgthhesihguohhstghhrdhorhhgpdhnsggprhgtphht
 thhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptdiguddvtdejsehgmh
 grihhlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthht
 ohepsghgrhhifhhfihhssehnvhhiughirgdrtghomhdprhgtphhtthhopehjohhnrghthh
 grnhhhsehnvhhiughirgdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqd
 hmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopehlihhnuhig
 qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
 htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
 phhtthhopegrlhgvkhhsrghnuggvrhdrlhhosggrkhhinhesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:-rqUZ4r3aXKJCGS03zlXoSDGv-ALNpPNWBnJHO0xsV8nQHDYy4CIEw>
 <xmx:-rqUZxomAAfsoCiaBh8luWaktb77QMLNqWymjbIWlgZOiDtQZnRTHg>
 <xmx:-rqUZ2QxKkrfCRmjI2btgCo-I5egxZ0KJbMZAgE6oImhMvsAfLBlIw>
 <xmx:-rqUZxpxJC_77A3I1JfEIDCMeXO5pza8XHbENEUeokqmimNPCe2K0Q>
 <xmx:-7qUZw-X2p7RTI4nSrbACn3sVCY2G7iwO7hQ0e3D7H5fq0AnGAzFxI4Q>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 05:20:41 -0500 (EST)
Date: Sat, 25 Jan 2025 12:20:38 +0200
From: Ido Schimmel <idosch@idosch.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z5S69kb7Qz_QZqOh@shredder>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250124104256.00007d23@gmail.com>
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

On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > > Just to clarify, the patch that you had us try was not intended as an actual
> > > fix, correct? It was only for diagnostic purposes, i.e. to see if there is
> > > some kind of cache coherence issue, which seems to be the case?  So perhaps
> > > the only fix needed is to add dma-coherent to our device tree?  
> > 
> > That sounds quite error prone. How many other DT blobs are missing the
> > property? If the memory should be coherent, i would expect the driver
> > to allocate coherent memory. Or the driver needs to handle
> > non-coherent memory and add the necessary flush/invalidates etc.
> 
> stmmac driver does the necessary cache flush/invalidates to maintain cache lines
> explicitly.

Given the problem happens when the kernel performs syncing, is it
possible that there is a problem with how the syncing is performed?

I am not familiar with this driver, but it seems to allocate multiple
buffers per packet when split header is enabled and these buffers are
allocated from the same page pool (see stmmac_init_rx_buffers()).
Despite that, the driver is creating the page pool with a non-zero
offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
headroom, which is only present in the head buffer.

I asked Thierry to test the following patch [1] and initial testing
seems OK. He also confirmed that "SPH feature enabled" shows up in the
kernel log.

BTW, the commit that added split header support (67afd6d1cfdf0) says
that it "reduces CPU usage because without the feature all the entire
packet is memcpy'ed, while that with the feature only the header is".
This is no longer correct after your patch, so is there still value in
the split header feature? With two large buffers being allocated from
the same page pool for each packet (headers + data), the end result is
an inflated skb->truesize, no?

[1]
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index edbf8994455d..42170ce2927e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2091,8 +2091,8 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.nid = dev_to_node(priv->device);
 	pp_params.dev = priv->device;
 	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
-	pp_params.offset = stmmac_rx_offset(priv);
-	pp_params.max_len = dma_conf->dma_buf_sz;
+	pp_params.offset = 0;
+	pp_params.max_len = num_pages * PAGE_SIZE;
 
 	rx_q->page_pool = page_pool_create(&pp_params);
 	if (IS_ERR(rx_q->page_pool)) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
