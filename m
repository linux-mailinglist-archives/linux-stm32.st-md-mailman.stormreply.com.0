Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55583386D6B
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 01:00:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A682C59785;
	Mon, 17 May 2021 23:00:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0BBBC58D7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 May 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 839496134F;
 Mon, 17 May 2021 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621292412;
 bh=zseJInV76JwddU8WjJbwFCXdZiWWLZ6gbeEwTjl1Yo8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=usc3cjlKQl8apO71D1hwDpJmrMMEVe0IhCgMwYQH7n+D3zcOYCoxoeuKHU4Ux/vHz
 pXRfyvSvAkHX+7uN8VZUNa5sPgsYjhzHhyCzh5DeyPC3sDIqCoISeLArJ0yccOemKf
 y8viuI46EMhk+KFTfxE4455auaNTfFQZA5Ez415g7c6up+CGwjun13w8577Es48YKT
 jb+Hq1x5Sf4KtlH76uFFEyZZwzPocaQwOeZx2QWSQsRKs7HuGk4coQ9mbAnXB0WRoT
 jM4/VeqLREwo9xXSRjxfkqBP9BzG7BIcDkYAwhHS35ipYHGUuZOjnvsB+5yqyQQgVj
 FbYR5yzOY1ptQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7C50A60A4D;
 Mon, 17 May 2021 23:00:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162129241250.19462.16193417271658339119.git-patchwork-notify@kernel.org>
Date: Mon, 17 May 2021 23:00:12 +0000
References: <20210517094332.24976-1-michael.wei.hong.sit@intel.com>
In-Reply-To: <20210517094332.24976-1-michael.wei.hong.sit@intel.com>
To: Sit@ci.codeaurora.org,
	Michael Wei Hong <michael.wei.hong.sit@intel.com>
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, vee.khee.wong@linux.intel.com,
 linux-kernel@vger.kernel.org, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, tee.min.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, boon.leong.ong@intel.com, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] Introducing support for DWC
 xpcs Energy Efficient Ethernet
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

This series was applied to netdev/net-next.git (refs/heads/master):

On Mon, 17 May 2021 17:43:30 +0800 you wrote:
> The goal of this patch set is to enable EEE in the xpcs so that when
> EEE is enabled, the MAC-->xpcs-->PHY have all the EEE related
> configurations enabled.
> 
> Patch 1 adds the functions to enable EEE in the xpcs and sets it to
> transparent mode.
> Patch 2 adds the callbacks to configure the xpcs EEE mode.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: pcs: Introducing support for DWC xpcs Energy Efficient Ethernet
    https://git.kernel.org/netdev/net-next/c/7617af3d1a5e
  - [net-next,2/2] net: stmmac: Add callbacks for DWC xpcs Energy Efficient Ethernet
    https://git.kernel.org/netdev/net-next/c/e80fe71b3ffe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
