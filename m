Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1133F492D
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Aug 2021 13:00:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EBF3C57B7D;
	Mon, 23 Aug 2021 11:00:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A176EC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Aug 2021 11:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CF4036138B;
 Mon, 23 Aug 2021 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629716405;
 bh=Ikhc8tu0qcR9oQ+OhMO9QJXM01eNb0Fr+KVga4JK3Yc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aIolGCdNrhzyEe3SDJP9ymLwl6PCU0Vp1ib7BB40HQewFKfeQgerhjXeBKGqfFYzz
 ncGDWb8Bu+aOEHptpodfVSiyq2VYFoPcupKLJDDmQzqcsRrQoLIC08o2graRBlvWmK
 z4/IdHFwtwbI5sj0AvLF++aWOOlDPejGjqJ0BudRvqWwUQLUrkjg5qwCjkGzXjtmAF
 JVU2AVOomZxWAZjaPoY9Q+umSab/52HiqXZrBLYI+bMvW7Oy9AvtM7Ym8ZL4JKHxQq
 o0ZyDDziashoWfbWMKYQW/DBKRKYrnwJwyHVO1SReMfX2CU6JRvkC4f/UHIHR+ATta
 /kOi1Ot5MfuIg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C147C60075;
 Mon, 23 Aug 2021 11:00:05 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162971640578.3591.684307191157307528.git-patchwork-notify@kernel.org>
Date: Mon, 23 Aug 2021 11:00:05 +0000
References: <20210820132622.4175839-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210820132622.4175839-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix kernel panic due to
 NULL pointer dereference of plat->est
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

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 20 Aug 2021 21:26:22 +0800 you wrote:
> In the case of taprio offload is not enabled, the error handling path
> causes a kernel crash due to kernel NULL pointer deference.
> 
> Fix this by adding check for NULL before attempt to access 'plat->est'
> on the mutex_lock() call.
> 
> The following kernel panic is observed without this patch:
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix kernel panic due to NULL pointer dereference of plat->est
    https://git.kernel.org/netdev/net/c/82a44ae113b7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
