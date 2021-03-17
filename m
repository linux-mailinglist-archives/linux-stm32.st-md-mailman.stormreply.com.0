Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A93333F8CA
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Mar 2021 20:10:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C090C57B79;
	Wed, 17 Mar 2021 19:10:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A0E1C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Mar 2021 19:10:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 333A864EC4;
 Wed, 17 Mar 2021 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616008209;
 bh=GVu/ESRM2qGynOK7RfgL/yy6B12R+6ZanQ9WH7/Wf9A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MXaxK5J8cShy4IqDXXjjKAwKPuFemzWY9azouoDzumjohoBSmn3UVxTzOYmu1r+iC
 d9Ce1px8crmPZiUeYtRojD7X6+ZqnZp7dsPhqWEgSjfg/VhCuoO2o2zvI0+VozX7Ob
 sbBDxsIOlURERvt6z/gTEX3Vmadif5AjOn+qacNDIA5t7sotXYnXSXp8x8Xpi+9Vtq
 3k3pzvxJ7aTLHVfVNAr3tfHhKxlebV4PX0oMpSzTylwET0ArezNdoO2d89nAGaLEI5
 +X6mm9xbHbOj2/UlOFzuq2r4vujVoE3JZfimoBReQFpZjDfNPfWY1tHCQIuZIckh7O
 qehe0ogCznM8A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 29C9360A3D;
 Wed, 17 Mar 2021 19:10:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161600820916.10311.6670976012285886015.git-patchwork-notify@kernel.org>
Date: Wed, 17 Mar 2021 19:10:09 +0000
References: <20210317040904.816-1-vee.khee.wong@intel.com>
In-Reply-To: <20210317040904.816-1-vee.khee.wong@intel.com>
To: Wong Vee Khee <vee.khee.wong@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: add timestamp
 correction to rid CDC sync error
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

On Wed, 17 Mar 2021 12:09:04 +0800 you wrote:
> From: Voon Weifeng <weifeng.voon@intel.com>
> 
> According to Synopsis DesignWare EQoS Databook, the Clock Domain Cross
> synchronization error is introduced tue to the clock(GMII Tx/Rx clock)
> being different at the capture as compared to the PTP
> clock(clk_ptp_ref_i) that is used to generate the time.
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: add timestamp correction to rid CDC sync error
    https://git.kernel.org/netdev/net-next/c/3600be5f58c1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
