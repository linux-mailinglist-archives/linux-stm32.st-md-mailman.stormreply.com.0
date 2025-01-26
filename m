Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1155BA1D37E
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2025 10:33:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF342C7803C;
	Mon, 27 Jan 2025 09:32:59 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63344C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jan 2025 11:35:51 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B9F90254015C;
 Sun, 26 Jan 2025 06:35:49 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Sun, 26 Jan 2025 06:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1737891349; x=1737977749; bh=/spJSHqIQvCifSPNA5IORZa7iILcSbhvBOG
 PaB29zc0=; b=Y8tmgiwrz6KcJXnRZjLSOg+mPrFgoJjHoRFJ90cUjs7pBizfn31
 JSTsv+sqG5ucSP+iXM83meBKt1kDutS/Sut2VTfg19vExS73lsIYnBmudDLDHIDw
 fWTUNKW3br6oYNEDlSVEdLAk744nvdTUVvxXF8N2BwwlWwKhFYxluqk3y3iytkL/
 0R5HvA7eIGpCcG7oepVIo9+n+n2VzdWOBDtfeM0o5SLgkWiC2JyV59KoIvbpOtyC
 qCN8/ZJ3BfTpBNzjJ2gyaN6yGikklG9GQP7uE2WVOXPG8nf9Cn2tqMwEFJL6ZI8L
 0X6pDgHkXEYIOcPcr7QMsYtRJ6urHVDQtPw==
X-ME-Sender: <xms:FB6WZ8f-WLkuDXLB2EXrNz9FAGBL96J2UpBbmEIiSX4DBLuV3JV6QQ>
 <xme:FB6WZ-NgNZlYbTyyhf_7z936gWiqD1VX6Vk-r1zUfsveBTwo309CSlFiawwFXfzSO
 QTRNb7NixPyJuE>
X-ME-Received: <xmr:FB6WZ9iKalO6abMZGMMJ8QS6oyltvuPLAuGJ2FhR2zyLiBBCHrpUIlSTLXM6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedguddtudehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepkfguohcuufgthhhimhhmvghluceoihguohhstghhsehiughoshgthh
 drohhrgheqnecuggftrfgrthhtvghrnhepvddufeevkeehueegfedtvdevfefgudeifedu
 ieefgfelkeehgeelgeejjeeggefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepihguohhstghhsehiughoshgthhdrohhrghdpnhgspghrtghp
 thhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopedtgiduvddtjeesgh
 hmrghilhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphht
 thhopegsghhrihhffhhishesnhhvihguihgrrdgtohhmpdhrtghpthhtohepjhhonhgrth
 hhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdr
 khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmug
 dqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtoheplhhinhhu
 gidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtg
 hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
 tghpthhtoheprghlvghkshgrnhguvghrrdhlohgsrghkihhnsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:FB6WZx-aHtGWYiUFgCgFz4FgkhYngiTxV03FHG6t-oTqAsi6uuJWGg>
 <xmx:FB6WZ4s9V7tFbW6AZMlzX70tSyZdSKYJTXRti6ivZXnY4hts3FyPqw>
 <xmx:FB6WZ4GyeuzP7gvhy1ZZhuxFbHvK_bAkdIRbIWdKDUzyVz07W6kc_w>
 <xmx:FB6WZ3N4J8wUCnlwi038MkgNoyBawDrI15wgkw7ZvHFgpxP2FfQ5rQ>
 <xmx:FR6WZ4SOy9OOXHnaFL47e6lgU4uX-1dkcioxVmPJM-eiyALH1GhPpZIE>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Jan 2025 06:35:47 -0500 (EST)
Date: Sun, 26 Jan 2025 13:35:45 +0200
From: Ido Schimmel <idosch@idosch.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z5YeEVrI3zx4VOtF@shredder>
References: <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
 <20250125224342.00006ced@gmail.com> <Z5X1M0Fs-K6FkSAl@shredder>
 <20250126183714.00005068@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126183714.00005068@gmail.com>
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

On Sun, Jan 26, 2025 at 06:37:14PM +0800, Furong Xu wrote:
> The "SPH feature" splits header into buf->page (non-zero offset) and
> splits payload into buf->sec_page (zero offset).
> 
> For buf->page, pp_params.max_len should be the size of L3/L4 header,
> and with a offset of NET_SKB_PAD.
> 
> For buf->sec_page, pp_params.max_len should be dma_conf->dma_buf_sz,
> and with a offset of 0.
> 
> This is always true:
> sizeof(L3/L4 header) + NET_SKB_PAD < dma_conf->dma_buf_sz + 0

Thanks, understood, but are there situations where the device is unable
to split a packet? For example, a large L2 packet. I am trying to
understand if there are situations where the device will write more than
"dma_conf->dma_buf_sz - NET_SKB_PAD" to the head buffer.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
