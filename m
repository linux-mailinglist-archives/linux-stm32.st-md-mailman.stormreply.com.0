Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C660350A1B
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 00:20:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 312FCC3FAD6;
	Wed, 31 Mar 2021 22:20:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83BD2C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 22:20:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 89A2361090;
 Wed, 31 Mar 2021 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617229218;
 bh=manWhZhu/NQAbHmtzEDKxvO3sIpDmPpIR4Wb97E++h0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JkU6l4959Uh72ZihQaglWFBFE6/bSkJALLtL/AOfUzSbpa68I0bK1MutdiqZgpXpa
 /k1EyLXkToc8CBCguYRV78RgsqxhsXb4oUtzr07mMl1AvDPa4h7hSuOYU7CZTg8pR+
 0K9X2p0BcRQfKCDZx0uRyascdoggwlNfbazb1Ik5p3/Vg0wvA+tC7bSQtFFNdhqw+r
 +50fgAh0N5TVYXTGhvcue751tNPFJXc/1x9qyV4PPXKFeoUa4+AXWlcbvRUFHQuQ7A
 /Bea1AquyiAL23Y26Lv+fjCoRqwlowPTyOs05InU9E3PUpI1eIYDgt76GOUSnL7c6m
 oqWhd+M/O8HOA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 80633608FD;
 Wed, 31 Mar 2021 22:20:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161722921852.2890.11864817205968379354.git-patchwork-notify@kernel.org>
Date: Wed, 31 Mar 2021 22:20:18 +0000
References: <20210331161825.32100-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210331161825.32100-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: enable MTL ECC
 Error Address Status Over-ride by default
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

On Thu,  1 Apr 2021 00:18:25 +0800 you wrote:
> From: Voon Weifeng <weifeng.voon@intel.com>
> 
> Turn on the MEEAO field of MTL_ECC_Control_Register by default.
> 
> As the MTL ECC Error Address Status Over-ride(MEEAO) is set by default,
> the following error address fields will hold the last valid address
> where the error is detected.
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: enable MTL ECC Error Address Status Over-ride by default
    https://git.kernel.org/netdev/net-next/c/b494ba5a3cf8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
