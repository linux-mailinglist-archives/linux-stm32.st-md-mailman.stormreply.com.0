Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72023348477
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Mar 2021 23:20:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21E87C57B5E;
	Wed, 24 Mar 2021 22:20:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8CA2C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 22:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 480C961A1E;
 Wed, 24 Mar 2021 22:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616624409;
 bh=gJ1PPArMw5fS2CP20SG1uAqkL+e+zCYT9MIaZZmYLos=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OFq1wA/wVFzvhhhD7C34xUDEPdUzVXYoSzJs7zTrirSYFqRjp1DbKMRgr+YXnYzr4
 WcF3MyZyGdiF9q49jbKTRwRh2Wz/yY8vGM4cK0o691A8NuKHSQBG+yEnvf+/86fETv
 WJHb1bGSFfLAt5ShfL2X1BJ/MQGz+7OAlDNA2zilwrK7nUTigQMKJjtWMW3sKBUxKt
 aXEgq1Nv5JRXUHcxPEgZV0UTiZ5kBFiGod2160Qgz0dQBWgv5LXoa2iyskMg1slS2e
 Iv0JMH6l7Wzu+1kY4CBVsC2y5PsYTQYO5erDq9Fkqr2xPLr12NMFyzOmr+IT1jTkyS
 GgRGG0dE3BDxg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3D1E260A6A;
 Wed, 24 Mar 2021 22:20:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161662440924.20293.18389068518220557834.git-patchwork-notify@kernel.org>
Date: Wed, 24 Mar 2021 22:20:09 +0000
References: <20210323110734.3800-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210323110734.3800-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Add hardware
 supported cross-timestamp
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

On Tue, 23 Mar 2021 19:07:34 +0800 you wrote:
> From: Tan Tee Min <tee.min.tan@intel.com>
> 
> Cross timestamping is supported on Integrated Ethernet Controller in
> Intel SoC such as EHL and TGL with Always Running Timer.
> 
> The hardware cross-timestamp result is made available to
> applications through the PTP_SYS_OFFSET_PRECISE ioctl which calls
> stmmac_getcrosststamp().
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: Add hardware supported cross-timestamp
    https://git.kernel.org/netdev/net-next/c/341f67e424e5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
