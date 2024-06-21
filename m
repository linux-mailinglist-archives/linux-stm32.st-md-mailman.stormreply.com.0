Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD79911906
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 05:30:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2166C7128D;
	Fri, 21 Jun 2024 03:30:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B69F2C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 03:30:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7D9B6CE291F;
 Fri, 21 Jun 2024 03:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1425C4AF07;
 Fri, 21 Jun 2024 03:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718940628;
 bh=4igYeq9AhDffzOuooujPnWPIYLV5UN9rJkXkaVNxy4Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WYExPkhz59XvGZklX917Akgqfp6D+1+Lq+KfwV2VOFbaRjKexkMzb7QxuxuzX8bYT
 D+XrZ+upqLw2550LidgGzUR8kOhDhiCBDDKe4zKzVBiB7r50K4+atnVrut9/BMgizD
 8Ztsfzg07JukntP0JrEpPhSgwx/qqB7FZpBv4Opm7CkJsQ7pADiltqzI6J2bqnaRvI
 V6LRPKYEKCZxGZVEt0e9ymkkJ9ITrp0AH01Opy2lw2kz5rY3rF33rInC+097IZ2VVM
 2cfPWigZDdzyfX5/Pe5J9JSJSnx+fvTQnlVWOZGZvN896FJzF5IaU5ajukcZaH8Gsu
 jGU+G57t6iqBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9F888E7C4C5; Fri, 21 Jun 2024 03:30:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171894062864.32761.4672204591779196223.git-patchwork-notify@kernel.org>
Date: Fri, 21 Jun 2024 03:30:28 +0000
References: <20240619140119.26777-1-brgl@bgdev.pl>
In-Reply-To: <20240619140119.26777-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, bartosz.golaszewski@linaro.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: unexport
	stmmac_pltfr_init/exit()
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Jun 2024 16:01:19 +0200 you wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> These functions are only used within the compilation unit they're defined
> in so there's no reason to export them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: unexport stmmac_pltfr_init/exit()
    https://git.kernel.org/netdev/net-next/c/d21a103b612c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
