Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B057477DD8
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 21:51:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C6D8C5F1D9;
	Thu, 16 Dec 2021 20:51:45 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD834C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 20:51:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 936E7B82644;
 Thu, 16 Dec 2021 20:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDAF6C36AEE;
 Thu, 16 Dec 2021 20:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639687900;
 bh=Ud7JEZsgfXJLxq8d3PVyQQhBSvG6W/4Xe5JpvEINbpY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ACk2ZAjMluqh/Ro4YXUl4Ntia5uwxYnXNQEu+tvecRNud+n7900O7s48InNPUlcgr
 ie/q4Up5cBG6UW2/vTOHK9lXcT1tEGq2AIDOZDlGieRpDp0YoEDlADNFYVSFLrSzIw
 1wV/KHUQwp90Fnn6UoF9GIyRjyvPPRYyv8oQf1LoH9JMdyyVyec0xIqCVg2B1QjN3U
 QzE9PrMjXcgoAzzxhNK/ftV7S0LKMYbiLU/bLReE18Ekm/uuXTaYxcly266u5NwGNg
 cr1i9iW20Dk9AP5GjhNHfKbsUaaxJaQ/0f0sqv0fFiS3PGaooP7modkYncRJDBH6WX
 aX6RhElbPkuGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B00FF60A4F;
 Thu, 16 Dec 2021 20:51:40 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163968790071.17466.7200435085941937139.git-patchwork-notify@kernel.org>
Date: Thu, 16 Dec 2021 20:51:40 +0000
References: <20211214191009.2454599-1-john@metanate.com>
In-Reply-To: <20211214191009.2454599-1-john@metanate.com>
To: John Keeping <john@metanate.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 david.wu@rock-chips.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 joabreu@synopsys.com, ezequiel@vanguardiasur.com.ar, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix oob read in
	rk_gmac_setup
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 14 Dec 2021 19:10:09 +0000 you wrote:
> KASAN reports an out-of-bounds read in rk_gmac_setup on the line:
> 
> 	while (ops->regs[i]) {
> 
> This happens for most platforms since the regs flexible array member is
> empty, so the memory after the ops structure is being read here.  It
> seems that mostly this happens to contain zero anyway, so we get lucky
> and everything still works.
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-rk: fix oob read in rk_gmac_setup
    https://git.kernel.org/netdev/net/c/0546b224cc77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
