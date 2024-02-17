Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 466EB8591D9
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Feb 2024 19:50:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9C25C69066;
	Sat, 17 Feb 2024 18:50:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B8A2CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Feb 2024 18:50:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 297F961260;
 Sat, 17 Feb 2024 18:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C59E3C43390;
 Sat, 17 Feb 2024 18:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708195825;
 bh=tDHoBtrkxZ/0jzu6S3iKZ2VIA9W0xR3UxtvM71RgyeQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uUcVBUDUh/5Qu6NcsXej5qk2ggMnUtyzEFashF4WpcCPX9ABF2o6VQkc/gokvfcRk
 Lq07Ojgiy2ippKfN+pgDxJbpF0w861xfTYr80XgImvSESf7CXpzdk/g9B+UrNtf7MX
 5PO2EqNj+0X9AqmGDItvvGHZb9l2Q/TWMNImwHmwrVgIDYqo36AEZ6azuR7x4UlQZa
 uhcDpUVRbkEmsmJgROzGJGWs+Sgil+JonBoKxUrpP0Cl5pCmEeUgF1vvGoWTx/fyFx
 p9CkdaG6Lpx7vkKWBqMrbTRfRCg6Uz/kt6F7g/THmw0hZeMuiNhPil78Dso/36mRG3
 lbzoMRS9bvBGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 ADF62C04E24; Sat, 17 Feb 2024 18:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170819582570.11703.17257609518253001084.git-patchwork-notify@kernel.org>
Date: Sat, 17 Feb 2024 18:50:25 +0000
References: <20240214092718.331891-1-p.sakharov@ispras.ru>
In-Reply-To: <20240214092718.331891-1-p.sakharov@ispras.ru>
To: Pavel Sakharov <p.sakharov@ispras.ru>
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, khoroshilov@ispras.ru, horms@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 lvc-project@linuxtesting.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Fix incorrect
 dereference in interrupt handlers
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 14 Feb 2024 12:27:17 +0300 you wrote:
> If 'dev' or 'data' is NULL, the 'priv' variable has an incorrect address
> when dereferencing calling netdev_err().
> 
> Since we get as 'dev_id' or 'data' what was passed as the 'dev' argument
> to request_irq() during interrupt initialization (that is, the net_device
> and rx/tx queue pointers initialized at the time of the call) and since
> there are usually no checks for the 'dev_id' argument in such handlers
> in other drivers, remove these checks from the handlers in stmmac driver.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: Fix incorrect dereference in interrupt handlers
    https://git.kernel.org/netdev/net/c/97dde8402633

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
