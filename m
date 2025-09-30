Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F3BAADB5
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 03:20:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37451C3F93C;
	Tue, 30 Sep 2025 01:20:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0D12C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 01:20:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CDAF2602DC;
 Tue, 30 Sep 2025 01:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81021C4CEF4;
 Tue, 30 Sep 2025 01:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759195254;
 bh=X22pEFpCAgMRW1UK5UodG0zf7Y6uxPShDgKLYOKw3ZI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lZXEQkeO2EVxyntPgxq6Gql93fRNspkOZNZtbl+lq1HcCX92H2oyukLagXeNja6BX
 4DDkkDTh73oK4NoG01u8DTfeIjtW62B/F3nHksUOqYE0Ikz0jyXEHFEAVgFZU5Ryi9
 ACauuux9ZdMqfLx0/QTD9HyfbDKCEE3uCtnnSeEk1qBglr9aJc/BSpZNQlSEsJf68U
 tlIfrR5E//B4cHQJko8c+fR6qhncw/ghsPML0WHBQ1d3RypmPoK4d6Bcq6jq4AjPje
 Ud1xR/NDusWUt73DHEwJFJQNzWE2j3b9VKO4O0aypsg+oCLCXkG41Aq1Z8p25T70Fi
 4AfClI+xAaAVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 346C139D0C1A; Tue, 30 Sep 2025 01:20:49 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175919524773.1775912.3053137579146685906.git-patchwork-notify@kernel.org>
Date: Tue, 30 Sep 2025 01:20:47 +0000
References: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
In-Reply-To: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
To: G@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 Thomas@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 Rohan <rohan.g.thomas@altera.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, matthew.gerlach@altera.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/2] net: stmmac: Drop frames
 causing HLBS error
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

On Thu, 25 Sep 2025 22:06:12 +0800 you wrote:
> This patchset consists of following patchset to avoid netdev watchdog
> reset due to Head-of-Line Blocking due to EST scheduling error.
>  1. Drop those frames causing HLBS error
>  2. Add HLBS frame drops to taprio stats
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: stmmac: est: Drop frames causing HLBS error
    https://git.kernel.org/netdev/net-next/c/7ce48d497475
  - [net-next,v3,2/2] net: stmmac: tc: Add HLBS drop count to taprio stats
    https://git.kernel.org/netdev/net-next/c/de17376cad97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
