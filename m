Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 411EB357706
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 23:40:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF511C57A41;
	Wed,  7 Apr 2021 21:40:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5A29C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 21:40:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2ADEB61165;
 Wed,  7 Apr 2021 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617831609;
 bh=71crzu6Oy2w99gLpv57xwURV2LYqBBTBQstUISuLFLc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BYZL2i7uvycn1fI+dbFI4/lrbhvVm0ECp2NT8eGM8K4OlxmqotNtcYgBhBUQ1I/9/
 6uXX0gu2ZtKETRATIX6nX7llRGkDDgVp3FskWEXw3LwoX3aL2KAOE/0duF1v4expNW
 rTPngYC5LfeDw0bUJbaBzSB35SpZRECyem2UasTD4kt2qZTVm0eTai199zktu+86lI
 4LAMBgUNWMba1Y0vsTlLtKoHioUUDg1ksO4sBB0sZpGHz9Lx9xyaKGoQWcD+YnDpVT
 NLiEbx9HvvGbcVihlrBT352DdcwQAmsZ8dYcZO7V440jchY2m3qY7rZNKhO1tzvqQi
 PVYgRPOM/qdaw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 193EB609D8;
 Wed,  7 Apr 2021 21:40:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161783160909.25121.17977461740067314533.git-patchwork-notify@kernel.org>
Date: Wed, 07 Apr 2021 21:40:09 +0000
References: <20210406013250.17171-1-weifeng.voon@intel.com>
In-Reply-To: <20210406013250.17171-1-weifeng.voon@intel.com>
To: Voon@ci.codeaurora.org, Weifeng <weifeng.voon@intel.com>
Cc: alexandre.torgue@st.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 boon.leong.ong@intel.com, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next] stmmac: intel: Enable SERDES
	PHY rx clk for PSE
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

On Tue,  6 Apr 2021 09:32:50 +0800 you wrote:
> EHL PSE SGMII mode requires to ungate the SERDES PHY rx clk for power up
> sequence and vice versa.
> 
> Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
> ---
> Changes:
>  v1 -> v2
>  -change subject from "net: intel" to "stmmac: intel"
> 
> [...]

Here is the summary with links:
  - [v2,net-next] stmmac: intel: Enable SERDES PHY rx clk for PSE
    https://git.kernel.org/netdev/net-next/c/017d6250ad71

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
