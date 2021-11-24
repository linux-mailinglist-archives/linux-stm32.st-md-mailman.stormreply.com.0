Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E647F45B30C
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Nov 2021 05:20:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 921AAC5A4D4;
	Wed, 24 Nov 2021 04:20:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC8A4C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 04:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D406B60FE8;
 Wed, 24 Nov 2021 04:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637727609;
 bh=Q5v1MeU6DlYweF8CqkYLXI1ffnzcKqa2LZjTsPgP5t0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cEG9q9SpXkRNfOpH1roOC60nQUqumPjKWB79CaQHJm4lzLHoXMhVBxXSSMMb8iVC/
 c7Axmp4S4FOo0dv73R4CiNM2R7FKJCRqstBkLW8rzMCNaeZWBpNNHx3QBPMkMtZnwq
 ap1aJ6cpk5FDgmNVyxgmrtP8w80lufKDO3h+Pvcbv+OAN3KWRxmkxm8xY3i13+Ms04
 m2ESzyS+wkBHdCiCoYw7GPzTC2aZ7DK3G9TSyCcDnc3DhIiCp20KFHo+qj9aoLzGor
 5HZmKV8M0X+N2zg84bUEfB3C4g0e0QcIEQtRrt7JWwrnYyM89/9EHI5ijf896Eju59
 ZSn2rOMCTM3eg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CC64F60BC9;
 Wed, 24 Nov 2021 04:20:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163772760983.14808.10753248852142083725.git-patchwork-notify@kernel.org>
Date: Wed, 24 Nov 2021 04:20:09 +0000
References: <20211122111931.135135-1-kurt@linutronix.de>
In-Reply-To: <20211122111931.135135-1-kurt@linutronix.de>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: vee.khee.wong@linux.intel.com, b.spranger@linutronix.de,
 weifeng.voon@intel.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 xiaoliang.yang_1@nxp.com, tee.min.tan@intel.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, boon.leong.ong@intel.com,
 kuba@kernel.org, tglx@linutronix.de, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: Caclucate CDC
	error only once
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 22 Nov 2021 12:19:31 +0100 you wrote:
> The clock domain crossing error (CDC) is calculated at every fetch of Tx or Rx
> timestamps. It includes a division. Especially on arm32 based systems it is
> expensive. It also requires two conditionals in the hotpath.
> 
> Add a compensation value cache to struct plat_stmmacenet_data and subtract it
> unconditionally in the RX/TX functions which spares the conditionals.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: Caclucate CDC error only once
    https://git.kernel.org/netdev/net-next/c/c6d5f1933085

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
