Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF5598A16
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Aug 2022 19:20:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 034E5C640F2;
	Thu, 18 Aug 2022 17:20:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6686C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Aug 2022 17:20:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D3FD61614;
 Thu, 18 Aug 2022 17:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F875C433D6;
 Thu, 18 Aug 2022 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660843232;
 bh=EXNuPGYk5JyIPmHakPo7fo+5V311YmG09WDtES+EREg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jTXuot/kf+sZsttKzZZJ5b71mGqt3hh6B+SlVMAtpPxmGld0u3bYrMvfjqDWwOhNC
 XVuBSXA5tMCbYeXx7v16OWB9kuU4IWn0H5rDodcULaVGCRR2z2bRIGP2d/gY8I+V6i
 ABXIyh9vYJUCkk3zEU5eEcL+3soiNNYXJrpTbWmteyyJaQzYQrRsJyZg+vcgJ1HeYn
 nP9qL8ZheensvzT0pLmAcYHuEQWRAQ7aON/vHoI5x4Bo9eld3lq4QbHG+YkQHStkeS
 YX3QswabGngKZNuEM+/Cj9Dl+2VlG5MemBsKWmXGM7YQP1f8/nw55gUWw+xCV5VJgZ
 vgRUot5GgoriQ==
Date: Thu, 18 Aug 2022 10:20:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <20220818102031.5be300f5@kernel.org>
In-Reply-To: <d7c8c1dadf40df3a7c9e643f76ffadd0ccc1ad1b.1660659689.git.christophe.jaillet@wanadoo.fr>
References: <d7c8c1dadf40df3a7c9e643f76ffadd0ccc1ad1b.1660659689.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] stmmac: intel: Add a missing
 clk_disable_unprepare() call in intel_eth_pci_remove()
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

On Tue, 16 Aug 2022 16:23:57 +0200 Christophe JAILLET wrote:
> Commit 09f012e64e4b ("stmmac: intel: Fix clock handling on error and remove
> paths") removed this clk_disable_unprepare()
> 
> This was partly revert by commit ac322f86b56c ("net: stmmac: Fix clock
> handling on remove path") which removed this clk_disable_unprepare()
> because:

I'll take patch 1 in now, please repost patch two in a few hours
after Linus pull net (or just tomorrow if you don't wanna try 
to track it down).

Please avoid posting fixes and cleanups in a single series.
They go via different trees.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
