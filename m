Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB032F517
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 22:10:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E367BC58D40;
	Fri,  5 Mar 2021 21:10:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3915C57B7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 21:10:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 108C465085;
 Fri,  5 Mar 2021 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614978609;
 bh=V2uqA/sr/GCzFs1Q1+s+pr6cqye/+w6MJ7zr3hsw+Zg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VUx+pTi7ptAjG/FnNg+eIQqCPPMBDBFiZ13ji4TqX+nRZPKF+LYILMx0+pZNsIAK7
 lWVcD2EhA6e5/LlBNY56h7AUA4G4o5Yv8UGZZa8mMLyWeovRDc6DI3za7WBnnjgTIB
 QTQQbVR8St0ht/K+CLiQsW/1zAeMiPPdJCZqVCmP+iDcrsAONvaVOD1lwgMZWMPcRV
 nRzJw5ucDQ2mBjbfEU353NWKFVoG8aAAHMFhZ7LA3WvggONmwl/adlO10XkD/fS6GU
 dttUEuV7TZ9K4N03fhF7ULFMei2JzW0onSqFlWU9ELBVBuKrhWA4eyzOjBqtiP5pgr
 qYpmo/EMj3+NQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 04FA060A13;
 Fri,  5 Mar 2021 21:10:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161497860901.24588.8524291949132206114.git-patchwork-notify@kernel.org>
Date: Fri, 05 Mar 2021 21:10:09 +0000
References: <20210305060342.23503-1-boon.leong.ong@intel.com>
In-Reply-To: <20210305060342.23503-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] stmmac: intel: Fixes clock
 registration error seen for multiple interfaces
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

This patch was applied to netdev/net.git (refs/heads/master):

On Fri,  5 Mar 2021 14:03:42 +0800 you wrote:
> From: Wong Vee Khee <vee.khee.wong@intel.com>
> 
> Issue seen when enumerating multiple Intel mGbE interfaces in EHL.
> 
> [    6.898141] intel-eth-pci 0000:00:1d.2: enabling device (0000 -> 0002)
> [    6.900971] intel-eth-pci 0000:00:1d.2: Fail to register stmmac-clk
> [    6.906434] intel-eth-pci 0000:00:1d.2: User ID: 0x51, Synopsys ID: 0x52
> 
> [...]

Here is the summary with links:
  - [net,1/1] stmmac: intel: Fixes clock registration error seen for multiple interfaces
    https://git.kernel.org/netdev/net/c/8eb37ab7cc04

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
