Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061E804558
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 03:50:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F5A4C6C855;
	Tue,  5 Dec 2023 02:50:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CABD4C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 02:50:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DB541CE1621;
 Tue,  5 Dec 2023 02:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2114DC433C7;
 Tue,  5 Dec 2023 02:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701744625;
 bh=0bZHE1UC4zNYDt6+dzC6pa74YJUhHbXyySy8ouGxeeQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=O/ZZ+2A4/LzMqjFfdifSg7FmWp8IuaJaF5goYRtggUZr2FxlhxL74HAHQHvY678k+
 cErMQHndtAXNRr69OrECzH8FLEX42TWGVIxNmCdxX23HlzvVrhJPmiSRInNBLcAtzC
 XFQVTzPjrooMd4Cvv8gQf5FfjwDpvT+sBgMBSnY+MhHvSneX5FFOF9ZMjbqt7MLaC1
 Q6at5rKPopJg7k0LyhKzPB+KsiPDe0SzVo+fs+b8ZWCeEyEue1TQW3NrI9qdqbfIed
 SL9wX5hjlJ8Ru6xYi7A//WGIuLpw5//1iNses7v5B6WynAw4jVcDW4Q5/movhACe7G
 kh/SQ0yNRWvFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 08101C41677; Tue,  5 Dec 2023 02:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170174462502.4521.5357100428466208009.git-patchwork-notify@kernel.org>
Date: Tue, 05 Dec 2023 02:50:25 +0000
References: <20231201055252.1302-1-rohan.g.thomas@intel.com>
In-Reply-To: <20231201055252.1302-1-rohan.g.thomas@intel.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Cc: ast@kernel.org, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, richardcochran@gmail.com, bpf@vger.kernel.org,
 john.fastabend@gmail.com, fancer.lancer@gmail.com, linux@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: EST
	implementation
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

On Fri,  1 Dec 2023 13:52:49 +0800 you wrote:
> Hi,
> This patchset extends EST interrupt handling support to DWXGMAC IP
> followed by refactoring of EST implementation. Added a separate
> module for EST and moved all EST related functions to the new module.
> 
> Also added support for EST cycle-time-extension.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: stmmac: xgmac: EST interrupts handling
    https://git.kernel.org/netdev/net-next/c/58f3240b3b93
  - [net-next,v2,2/3] net: stmmac: Refactor EST implementation
    https://git.kernel.org/netdev/net-next/c/c3f3b97238f6
  - [net-next,v2,3/3] net: stmmac: Add support for EST cycle-time-extension
    https://git.kernel.org/netdev/net-next/c/9e95505fecb6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
