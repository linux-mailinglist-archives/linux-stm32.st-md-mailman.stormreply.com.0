Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F13B53799EB
	for <lists+linux-stm32@lfdr.de>; Tue, 11 May 2021 00:20:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13B05C57B7D;
	Mon, 10 May 2021 22:20:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB221C57B5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 May 2021 22:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A0806161E;
 Mon, 10 May 2021 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620685212;
 bh=hxjZ9Sk1w+UYvHvZXxTQm/bkUKV2ua8aXwY2KQKzTv4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=j7K/5E+2nQrNR51LNKQk6M4DYl6tWdWU5Z6DvFj4cqjqbsoYQsxzHpNR4tNueYWQx
 ec+F7NMgUsZsR2jzTPwv123/yIN8JPQpSLa5TBZsZK2R1t9HZa9K2vJaZ/+VVYxBb5
 H6HjT/qwH5sfJ1JSoExra9NheWIvzrp8WDKXwCzb9tn2kOsN6rQJjrUedbR56wr1qB
 SOcHfYe5Qmz8nVgdQL64NUAbvfbP8ZGT3GRe1As05bSXJCMwG4B9FR2mIhSxSOjY11
 q1nyhNu2iw2JvYzoO1ooRVSkK5yM1VOYLWkb85Rq7hH9t7oFnzcovsHLEFgJD5UjOl
 oGf8rblRzHRpQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 30D4160A0E;
 Mon, 10 May 2021 22:20:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162068521219.17141.10735663458714364666.git-patchwork-notify@kernel.org>
Date: Mon, 10 May 2021 22:20:12 +0000
References: <20210510141002.4013-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210510141002.4013-1-thunder.leizhen@huawei.com>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] net: stmmac: platform: Delete a
 redundant condition branch
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Mon, 10 May 2021 22:10:02 +0800 you wrote:
> The statement of the last "if (xxx)" branch is the same as the "else"
> branch. Delete it to simplify code.
> 
> No functional change.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> 
> [...]

Here is the summary with links:
  - [1/1] net: stmmac: platform: Delete a redundant condition branch
    https://git.kernel.org/netdev/net-next/c/aed6864035b1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
