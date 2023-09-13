Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C798879EB8D
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Sep 2023 16:50:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A559C6B46F;
	Wed, 13 Sep 2023 14:50:02 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC850C6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Sep 2023 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=AKHZcby/SaXTGDFhOnska1CWWaoisj9GGC+K/yEWJ4Q=; 
 t=1694616600; x=1695826200; b=ijd+vcjU+UoemGk+JHVDJKQ8QQiZ3hoSsIPszpTqYWQohBo
 fkLfP3u5vRp75kO1yVpQEh7lry+oc57BRdPSw6Vur/oTOhHQWJAe7WFB63oL6Q6k5M34eBAwWy2nW
 LKC66XppqQEVj7sC0e0c13Kz9AKTcWN++MHMx/PTlGofbJWYZ507sp+9XfOXe/ttiOAM0hkcqKF6v
 DLmNFARjtW4hr4MYJUnGCKIgoLPHleDF8wZ8gazcWPsHYQpniy2NNIZGxLzfp9m4RL6mekb6NsBJo
 cqIJ7tJKRV+XiHbImkHR2WrTZlRb32qckwMyo7yzRiY3KmmNMzlft+pamQW4Bezg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qgRBU-00F30o-2d; Wed, 13 Sep 2023 16:49:41 +0200
Message-ID: <27579950c5a5f9221e7b52524cbc8de97d8b90e0.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Jisheng Zhang <jszhang@kernel.org>
Date: Wed, 13 Sep 2023 16:49:39 +0200
In-Reply-To: <ZQHIgmcnCNoZwtwu@xhacker>
References: <20230717160630.1892-1-jszhang@kernel.org>
 <20230717160630.1892-3-jszhang@kernel.org>
 <20230911171102.cwieugrpthm7ywbm@pengutronix.de> <ZQAa3277GC4c9W1D@xhacker>
 <99695befef06b025de2c457ea5f861aa81a0883c.camel@pengutronix.de>
 <20230912092411.pprnpvrbxwz77x6a@pengutronix.de>
 <2fcc9fb0e40ceff8ea4ae55cca3ce0aff75a20ca.camel@sipsolutions.net>
 <ZQHIgmcnCNoZwtwu@xhacker>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Cc: Paolo Abeni <pabeni@redhat.com>, kernel@pengutronix.de,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [REGRESSION] [PATCH net-next v5 2/2] net: stmmac:
 use per-queue 64 bit statistics where necessary
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

On Wed, 2023-09-13 at 22:34 +0800, Jisheng Zhang wrote:
> 
> Since we are in rc1, I need to fix the bug with as small changes as
> possible. so another solution could be: replace rx/tx stats structure
> with pointers, then setup pointers in the new allocated dma_conf with
> the old one as current code did for dma_tx_size/dma_rx_size in
> stmmac_setup_dma_desc():
> 
> dma_conf->dma_tx_size = priv->dma_conf.dma_tx_size
> 
> Is it acceptable?

I'm not sure who you're asking of all the people in this thread, but I
honestly don't understand much about this driver other than what I
gleaned in the few minutes looking at it with Uwe ... so I don't think
I'm able to answer that question :)


You could also just move the stats out of the structure entirely, I
guess? And perhaps even start some new structure where more things might
move in the future that shouldn't be reallocated?

I'm all for not moving things now that haven't caused problems, but I
guess doing a minimal fix just for the sake of being minimal in -rc1
wouldn't be my preference.

johannes
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
