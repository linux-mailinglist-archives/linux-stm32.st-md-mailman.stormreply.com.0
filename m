Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E77A5CC1
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 10:40:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C546C6C821;
	Tue, 19 Sep 2023 08:40:28 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F16EC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 08:40:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EF45ECE123B;
 Tue, 19 Sep 2023 08:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55EA9C433CA;
 Tue, 19 Sep 2023 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695112822;
 bh=Omy2LUg3uWH1pkOVY4vjdkn5QW6igyJTSPgKd0JcqqA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NabwgZalixdVnMCJQGMY5fHyowm94ENXgA9GQpnn0eqYrBXHp6meiXaFdiCMtU6RL
 hawFjKZelXREnGLpBm4SZbXxfUQ2sMN6hUzm6VrVSLkhCTwAszul/hkmO1KbwZzuYj
 N1ElyvnGX0zBi5rKztKHmx84J+zdfVp7QtMPCuhxEInF7eREv0BIiKNXND1q4aWFrG
 1glOcYf/PvfxBSATEKH5el1w/fF5aWx/FIx47KIFLo4MBY/h43dQrmP/J08KFdOlRt
 3TT/pcuia0tmo4gvhDinLFfTAi9ZKKv1VYthquugVRHFLce5HLQjMz6cohfSdzvEk3
 cKrY0d1Omp21w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3955FE11F4A; Tue, 19 Sep 2023 08:40:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169511282223.26432.8274174696059034896.git-patchwork-notify@kernel.org>
Date: Tue, 19 Sep 2023 08:40:22 +0000
References: <20230917165328.3403-1-jszhang@kernel.org>
In-Reply-To: <20230917165328.3403-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, samuel@sholland.org, netdev@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 jernej.skrabec@gmail.com, wens@csie.org, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, johannes@sipsolutions.net, pabeni@redhat.com,
 linux-sunxi@lists.linux.dev, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix incorrect
	rxq|txq_stats reference
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 18 Sep 2023 00:53:28 +0800 you wrote:
> commit 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics
> where necessary") caused one regression as found by Uwe, the backtrace
> looks like:
> 
> 	INFO: trying to register non-static key.
> 	The code is fine but needs lockdep annotation, or maybe
> 	you didn't initialize this object before use?
> 	turning off the locking correctness validator.
> 	CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc1-00449-g133466c3bbe1-dirty #21
> 	Hardware name: STM32 (Device Tree Support)
> 	 unwind_backtrace from show_stack+0x18/0x1c
> 	 show_stack from dump_stack_lvl+0x60/0x90
> 	 dump_stack_lvl from register_lock_class+0x98c/0x99c
> 	 register_lock_class from __lock_acquire+0x74/0x293c
> 	 __lock_acquire from lock_acquire+0x134/0x398
> 	 lock_acquire from stmmac_get_stats64+0x2ac/0x2fc
> 	 stmmac_get_stats64 from dev_get_stats+0x44/0x130
> 	 dev_get_stats from rtnl_fill_stats+0x38/0x120
> 	 rtnl_fill_stats from rtnl_fill_ifinfo+0x834/0x17f4
> 	 rtnl_fill_ifinfo from rtmsg_ifinfo_build_skb+0xc0/0x144
> 	 rtmsg_ifinfo_build_skb from rtmsg_ifinfo+0x50/0x88
> 	 rtmsg_ifinfo from __dev_notify_flags+0xc0/0xec
> 	 __dev_notify_flags from dev_change_flags+0x50/0x5c
> 	 dev_change_flags from ip_auto_config+0x2f4/0x1260
> 	 ip_auto_config from do_one_initcall+0x70/0x35c
> 	 do_one_initcall from kernel_init_freeable+0x2ac/0x308
> 	 kernel_init_freeable from kernel_init+0x1c/0x138
> 	 kernel_init from ret_from_fork+0x14/0x2c
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: fix incorrect rxq|txq_stats reference
    https://git.kernel.org/netdev/net/c/8070274b472e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
