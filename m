Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4B95AD3E5
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 15:30:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DFBBC55596;
	Mon,  5 Sep 2022 13:30:18 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FC8CC03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 13:30:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4E4BB811A2;
 Mon,  5 Sep 2022 13:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FD81C433D7;
 Mon,  5 Sep 2022 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662384614;
 bh=7XONn9KaUTnR3WKojdkRi/lvfYNW+Pp+4J0HaSGdd2o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BvEQK6meER+TAYOo+F4z0cz9x6AQDGGcyxjPrKaHQEP+zhBoprqa1Ah47FFL06+C5
 0LcayaKEXLql+97ZPM6VRrohXS8lPJ2xcuRvySLtzZ2IWfv0ESPqDb0are/r39UjNb
 bZ9Qq0v6JFMl1mjEzdG8tyiSmxVFVn3q0PJY4CzKTS5iT3uoKJMDbpX2br+28yBtkd
 CUsqjph4ciptxSbGzHEnOcHT3LUCT4Z3EGDJh/szDA+PyGKLkycNEtWKJHIb9Uub07
 FaA4elaa6oRxlBJJlki3YTtzdmC5m21nR4IasNB2yAs21f2beK+yDCJNfgAF/8/vPx
 AF4jkjZRrHtjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 66986E1CABF; Mon,  5 Sep 2022 13:30:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166238461441.27659.12239110868917016619.git-patchwork-notify@kernel.org>
Date: Mon, 05 Sep 2022 13:30:14 +0000
References: <35ab3ac5b67716acb3f7073229b02a38fce71fb7.1662135995.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <35ab3ac5b67716acb3f7073229b02a38fce71fb7.1662135995.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: andriy.shevchenko@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] stmmac: intel: Simplify
	intel_eth_pci_remove()
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

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri,  2 Sep 2022 18:26:56 +0200 you wrote:
> There is no point to call pcim_iounmap_regions() in the remove function,
> this frees a managed resource that would be release by the framework
> anyway.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [v3] stmmac: intel: Simplify intel_eth_pci_remove()
    https://git.kernel.org/netdev/net/c/1621e70fc79d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
