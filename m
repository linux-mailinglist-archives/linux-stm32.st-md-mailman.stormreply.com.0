Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA359A11735
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 03:20:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E8ECC78F65;
	Wed, 15 Jan 2025 02:20:09 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E718AC78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 02:20:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E8975A41275;
 Wed, 15 Jan 2025 02:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379E2C4CEDD;
 Wed, 15 Jan 2025 02:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736907601;
 bh=k5zcdfRd+dirvcL8WCDgycvlSRDQLgmbaRl4EKUNh8k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F18nyyAYLuvENyVSSD71xF45K2a6V9tKMNA9Jg5utrotWZdfHvUhkle8ERQPMAF/j
 9X2YVem+hIZKDHX+CHUCaSP6kW3XEbjsX5mky8Vn6aLbtV64WIqrAGZrJjMtsjnGFV
 5WbNyMLFhHYZBf5qz7P5JbXLAqZkSKdbBIb9aBJ5Sfv+VGkc/i5LchZZeCX0/w3uMn
 Kve9q964/87EekbJHWGGPpvg55HqskaqJHZHXsn9kEkCMjJ2u9A7+WVPXrWxqRZdER
 yloi7L0GfaMhe0P/MDptWxXLeLmsW2lHzpEUmYIOcKRo3nDtt+qF6jCBpotrYlorde
 FXY4LTwo5Yu9A==
Date: Tue, 14 Jan 2025 18:20:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joe Damato <jdamato@fastly.com>
Message-ID: <20250114182000.4ca2c433@kernel.org>
In-Reply-To: <Z4bzuToquRAMfvvu@LQ3V64L9R2>
References: <cover.1736777576.git.0x1207@gmail.com>
 <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
 <Z4bzuToquRAMfvvu@LQ3V64L9R2>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Optimize
 cache prefetch in RX path
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

On Tue, 14 Jan 2025 15:31:05 -0800 Joe Damato wrote:
> > @@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> >  
> >  			dma_sync_single_for_cpu(priv->device, buf->addr,
> >  						buf1_len, dma_dir);
> > +			prefetch(page_address(buf->page) + buf->page_offset);  
> 
> Minor nit: I've seen in other drivers authors using net_prefetch.
> Probably not worth a re-roll just for something this minor.

Let's respin. I don't know how likely stmmac is to be integrated into
an SoC with 64B cachelines these days, but since you caught this - 
why not potentially save someone from investigating this later..
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
