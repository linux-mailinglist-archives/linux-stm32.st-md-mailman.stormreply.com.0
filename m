Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B08C4AFB
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 03:40:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74275C6B476;
	Tue, 14 May 2024 01:40:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51708C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 01:40:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D209FCE113B;
 Tue, 14 May 2024 01:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B35EFC32786;
 Tue, 14 May 2024 01:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715650830;
 bh=LpEhxwul1QYZLgIZ+U+xiw7tIybUHrsG3fa9rOq28G8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uGVPJlRcwxYOun8rX7D9nUtnTUwDWj9Qmwwwod0vwuOtQ4K6pvk/9K/KjJSvhOLww
 PudzYRzwkhjYJd6XNw+uuxiTJwqTMU+l8/FJxFGy8ASedJyMiF341kSBiv3d59nHHb
 eUx4mYSWrIjgcF/ioumhMDAjYKS8/1Jc347uBfbXbT9NdHN4QChZcfrokpHYezB9Hm
 OUW8H6bGvvLNWkO+jC5ny1uhURczj5KZiZqCddo8akP48EDSgSjvXXcDD6sT7oWuwK
 C2riQlcjN6DaHFG4kAEUM7qJjJKNq+P3xFx+zUHAt185mQTm0FVifKy28FVI9v/egc
 nni5emPqmgzxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A156DC43445; Tue, 14 May 2024 01:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171565083065.25298.6578381671622937855.git-patchwork-notify@kernel.org>
Date: Tue, 14 May 2024 01:40:30 +0000
References: <20240513014346.1718740-1-xiaolei.wang@windriver.com>
In-Reply-To: <20240513014346.1718740-1-xiaolei.wang@windriver.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: linux-kernel@vger.kernel.org, horms@kernel.org,
 bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: Re: [Linux-stm32] [net/net-next PATCH v6 0/2] Move EST lock and EST
 structure to struct stmmac_priv
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 13 May 2024 09:43:44 +0800 you wrote:
> 1. Pulling the mutex protecting the EST structure out to avoid
>     clearing it during reinit/memset of the EST structure,and
>     reacquire the mutex lock when doing this initialization.
> 
> 2. Moving the EST structure to a more logical location
> 
> v1 -> v2:
>   - move the lock to struct plat_stmmacenet_data
> v2 -> v3:
>   - Add require the mutex lock for reinitialization
> v3 -> v4
>   - Move est and est lock to stmmac_priv as suggested by Serge
> v4 -> v5
>   - Submit it into two patches and add the Fixes tag
> v5 -> v6
>   - move the stmmac_est structure declaration from
>     include/linux/stmmac.h to
>     drivers/net/ethernet/stmicro/stmmac/stmmac.h
> 
> [...]

Here is the summary with links:
  - [net,v6,1/2] net: stmmac: move the EST lock to struct stmmac_priv
    https://git.kernel.org/netdev/net-next/c/36ac9e7f2e57
  - [net-next,v6,2/2] net: stmmac: move the EST structure to struct stmmac_priv
    https://git.kernel.org/netdev/net-next/c/bd17382ac36e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
