Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D4A2E480
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 07:51:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 275ADC78F7F;
	Mon, 10 Feb 2025 06:51:58 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8669C78F6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 06:51:50 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 8F66F1140113;
 Mon, 10 Feb 2025 01:51:49 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Mon, 10 Feb 2025 01:51:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1739170309; x=1739256709; bh=Xa+u6TSXdvpnsdktnh6Ldx8knq/jErF9o1m
 KCq6c5Eo=; b=bafjmJG+wuzoGYnXZs3OWuN0rYfKlg+z2CCIwrfj/QfDpdFjR/y
 2cOacgCL54YyWCBNjoZjaFeXcEV8V7Vo3hGDBXfeBAwgBDj7XG8lbNfhpvqcM8Lq
 MD7c6SkqSX0+jdD6DxGDhrPToD93coyrVvPRy+JS80LK5TLdD/tJ9mex2c9TXBV2
 RDi4k71i5JRRXQXGmFRFwv5x5icJjaWE4KnCK2t9wVzlmvzzp37kdp+eOYbgzEF8
 JO8yt50GMwHe0B24pDZCPQRzA3eKNhglAP28MRwvf/dteVtwIGq7wpK2m4JDES9R
 eLhGfH3PxL1+oxB1V0XXxUmbsv/nfiqzaqg==
X-ME-Sender: <xms:BKKpZyEkbPGdJbINekmZfUB-gH5gCVVDb3gdjKHA72CSOPSz_7kAkA>
 <xme:BKKpZzUk4ydXVK9ZjUS9wqvx2FVO73_J9By-pDgU08zri40YosGqHiMTatzrZnw00
 ZLfe2v0vI2btqY>
X-ME-Received: <xmr:BKKpZ8JgelyjxShIgIdKuTBZRJX7HdCtE23GhFzNUZ-5_xaMQxJoWT1i9rff>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpefkughoucfutghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrd
 horhhgqeenucggtffrrghtthgvrhhnpeehhfdtjedviefffeduuddvffegteeiieeguefg
 udffvdfftdefheeijedthfejkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihguohhstghh
 sehiughoshgthhdrohhrghdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpoh
 huthdprhgtphhtthhopedtgiduvddtjeesghhmrghilhdrtghomhdprhgtphhtthhopehn
 vghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
 hsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdp
 rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
 guvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
 vghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnh
 drtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphht
 thhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrse
 hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BKKpZ8HqxAaKpTyiU7gG7xc6MjskSyqqHjmp5EoTbdhh23xWP8oc8A>
 <xmx:BKKpZ4Ue8dCAHoq82cA_LJFEULIs1ZFVQkIxheG1OC16r3dv9aIuzQ>
 <xmx:BKKpZ_MYmJG1HtVP8iAw3V0SX2rTdKIuOKCtCPrfT69AS_SZX5GifQ>
 <xmx:BKKpZ_2CztCc2frUAkqVwVttjA0EA46oQmThzHKTpt6tyFT0gsB3Gw>
 <xmx:BaKpZ5vNx_rkiYc-31LJg39M5YTGKhVW8TNvfHujyxmwpu4E297FVaNz>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 01:51:48 -0500 (EST)
Date: Mon, 10 Feb 2025 08:51:45 +0200
From: Ido Schimmel <idosch@idosch.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z6miASgDGKfGH9qO@shredder>
References: <20250207085639.13580-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207085639.13580-1-0x1207@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brad Griffis <bgriffis@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Apply new page pool
 parameters when SPH is enabled
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

On Fri, Feb 07, 2025 at 04:56:39PM +0800, Furong Xu wrote:
> Commit df542f669307 ("net: stmmac: Switch to zero-copy in
> non-XDP RX path") makes DMA write received frame into buffer at offset
> of NET_SKB_PAD and sets page pool parameters to sync from offset of
> NET_SKB_PAD. But when Header Payload Split is enabled, the header is
> written at offset of NET_SKB_PAD, while the payload is written at
> offset of zero. Uncorrect offset parameter for the payload breaks dma
> coherence [1] since both CPU and DMA touch the page buffer from offset
> of zero which is not handled by the page pool sync parameter.
> 
> And in case the DMA cannot split the received frame, for example,
> a large L2 frame, pp_params.max_len should grow to match the tail
> of entire frame.
> 
> [1] https://lore.kernel.org/netdev/d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com/
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reported-by: Brad Griffis <bgriffis@nvidia.com>
> Suggested-by: Ido Schimmel <idosch@idosch.org>
> Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX path")
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
