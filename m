Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D3A9F7174
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2024 01:42:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 605F7C78012;
	Thu, 19 Dec 2024 00:42:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE734C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2024 00:42:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D8395C277B;
 Thu, 19 Dec 2024 00:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7C6C4CECD;
 Thu, 19 Dec 2024 00:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734568928;
 bh=ETOdpjMOcIfpgrnZ8m3rcLo9Y44+EC3i/OGlHZ4PawE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HWT0ap6pyizLpwwjBoNr1Yr8mFmNZZZQQSoqoKIFOy7TEMmR71Nl8EqtWPIAKUchQ
 MpotDbqhht18A7Je6NT6D5zGZwpLFe2J9/yIiRq9a5611Xdl8IMO8xQkIJF8Y2vWFb
 HFDu5dR7NpHGdOWURBAFavSEhkddjfp9fR0SfqWaUiv0y5KvUflQZpru1q6do4GSRl
 jvZl49pfQpvS53dnm3wg00Xhi6O1/hCEV/3G4Vzc17BVB/vqWq2ouUW2rASfsIaFdG
 q/D3yzIOw4O0Ks96lWlwUH69vfJhiW01Xe+P+xv2lSq17eb/ZWbRftM/mvHniyb600
 T89VQeH6ODj5A==
Date: Wed, 18 Dec 2024 16:42:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Message-ID: <20241218164206.437fcedc@kernel.org>
In-Reply-To: <b2ae6b80-83e3-4b22-8301-c91569c89494@intel.com>
References: <20241218083407.390509-1-0x1207@gmail.com>
 <b2ae6b80-83e3-4b22-8301-c91569c89494@intel.com>
MIME-Version: 1.0
Cc: Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Drop useless
 code related to ethtool rx-copybreak
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

On Wed, 18 Dec 2024 16:48:38 +0100 Alexander Lobakin wrote:
> If sizeof(dma_addr_t) == 8, you're clearly introducing a 4-byte hole
> here. Perhaps you could reshuffle the struct a bit to avoid this.
> 
> It's always good to inspect the .kos with pahole after modifying
> structures to make sure there are no regressions.

Pretty off topic but I have a dumb question - how do you dump a struct
with pahole using debug info or BTF from a random .ko?
Ever since pahole got converted to BTF modules stopped working for me :S
I never cared enough to check as most interesting stuff is built-in
in Meta's kernels but it annoys me every now and then..
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
