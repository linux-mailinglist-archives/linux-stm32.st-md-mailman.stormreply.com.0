Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5959BAF6E4
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Oct 2025 09:35:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A740EC349C0;
	Wed,  1 Oct 2025 07:35:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4D43C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 01:50:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 73932402AA;
 Tue, 30 Sep 2025 01:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8F6C4CEF4;
 Tue, 30 Sep 2025 01:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759197042;
 bh=fmcYjWJAnGdhbsMUxYEUP6vCOJjyb2KhW72GCar/ySs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=F2d+73AKmrnqDc7leXgfFj8Ctj5ugwep7vPk45YGtVuyDgqU2H/TyHTucnswLXSq2
 Wkjv07XWjUdSg/DBJ56ecR4SRsYSfNGm67CWRMgIaQX+rWDhBy62n1peZyw2ZFWn3a
 tOHo8qlPPBsN/mnWLSIdrjLzQBkUqJQhPgCbJ4LccSzWKOfMYdBAIxgY2UAJ2USNXA
 Lhrer1U2Pwa/D1szx7USSgVbnWT2HPoVkWCkmFnTgT5z4f8gPOVfeEVhS3nWXdWfMG
 USbIerc7boAKmG9Q2iIYUtSF6dD2jYOzWSHoExc6KgGteHuEHt1E17ovQMzeY4w2oX
 26aCfJqcn8kDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EADFB39D0C1A; Tue, 30 Sep 2025 01:50:36 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175919703549.1783832.10169355846256119327.git-patchwork-notify@kernel.org>
Date: Tue, 30 Sep 2025 01:50:35 +0000
References: <20250927081036.10611-1-0x1207@gmail.com>
In-Reply-To: <20250927081036.10611-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
X-Mailman-Approved-At: Wed, 01 Oct 2025 07:35:37 +0000
Cc: horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, xfr@outlook.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: Convert
 open-coded register polling to helper macro
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

On Sat, 27 Sep 2025 16:10:36 +0800 you wrote:
> Drop the open-coded register polling routines.
> Use readl_poll_timeout_atomic() in atomic state.
> 
> Also adjust the delay time to 10us which seems more reasonable.
> 
> Tested on NXP i.MX8MP and ROCKCHIP RK3588 boards,
> the break condition was met right after the first polling,
> no delay involved at all.
> So the 10us delay should be long enough for most cases.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: Convert open-coded register polling to helper macro
    https://git.kernel.org/netdev/net-next/c/9dd4e022bfff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
