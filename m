Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12613A3B240
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 08:25:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B23A2C78F89;
	Wed, 19 Feb 2025 07:25:15 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E84D7C7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 02:40:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DB00DA41E80;
 Wed, 19 Feb 2025 02:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C97DC4CEE2;
 Wed, 19 Feb 2025 02:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739932809;
 bh=tiloIvKYtmvXtq9n1DhVPEZySCD0vWC9KJmidWCd6WI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XB+Iin3XPAjVvL9N79BtkHn77dq1a1SJnFIzHpUj16mDKcT2YG8XFxuYml5chlHL6
 aOno2cdTwrJ3pCGVsD1SWy0MpNbh3s+d6CzSmtNcY3VxWYs9OBUZWzglENxTvRk5o0
 9nKLAvNS6nefRCBLcu4r9rJPUA4TWiH+HjpA46Yowab/fx8w6ieu+vA6HfyDL/+tHT
 5SM8Ue9b+cqW4Nrcq+pUDHtwhlj+LhOF+I3sqyIcSmn/K6LdP9ySU+rgfv+Wo5Ex9f
 3cs50kXPb6OErfAJzQR83wdbHW35fJHF19A9LC9Glm58VAY4/ikfroaJjCOAnlQUMt
 hblzaZNmkiLUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EBC00380AAE9; Wed, 19 Feb 2025 02:40:40 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173993283976.110799.6484723718905539141.git-patchwork-notify@kernel.org>
Date: Wed, 19 Feb 2025 02:40:39 +0000
References: <20250217155833.3105775-1-eleanor15x@gmail.com>
In-Reply-To: <20250217155833.3105775-1-eleanor15x@gmail.com>
To: Yu-Chun Lin <eleanor15x@gmail.com>
X-Mailman-Approved-At: Wed, 19 Feb 2025 07:25:14 +0000
Cc: linux-kernel@vger.kernel.org, lkp@intel.com, netdev@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, visitorckw@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, chenhuacai@loongson.cn
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: Use
	str_enabled_disabled() helper
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

On Mon, 17 Feb 2025 23:58:33 +0800 you wrote:
> As kernel test robot reported, the following warning occurs:
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportunity for str_enabled_disabled(on)
> 
> Replace ternary (condition ? "enabled" : "disabled") with
> str_enabled_disabled() from string_choices.h to improve readability,
> maintain uniform string usage, and reduce binary size through linker
> deduplication.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: Use str_enabled_disabled() helper
    https://git.kernel.org/netdev/net-next/c/3a03f9ec5d33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
