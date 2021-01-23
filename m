Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82497301243
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Jan 2021 03:30:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27CF7C424BE;
	Sat, 23 Jan 2021 02:30:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81BE7C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Jan 2021 02:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id ED7D923B55;
 Sat, 23 Jan 2021 02:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611369010;
 bh=LOIOXfspCXmNEKWExfVa6HeC2JfufFMepdIvAt/GA7Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Vk0DzkrU+HRg+syBoG9CYeaR61h8Pqf95mQ9wp2Q9RCQPZzTdF59fzvqxNkXMV3MB
 zZ45tiX9js+juPiOPnmyF25ztzVc55SG8rXX7O+T+MHbOeD8NQF5dnb7pkMoFP7rmz
 i/qzA/cMhuP9TrBLyQ16JQPf8il4L5kL3cwqycdeAlacVpaJSMPhzR2Lib/il9HagK
 cTjfdpiH6mAkX5eRsge8av7Q17vPPxuzvTOmxA/YyfjQUxNPclzqiQu342OThKmOtS
 FKNCmoOdzpBpfqZxzzW1hKEnygdTFJHXHspkYnGYS6XjzsAId+AW0HBJF9yj7FGTcV
 WiU46N/qfCV4g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E047F652DC;
 Sat, 23 Jan 2021 02:30:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161136900991.8400.5085131401439003900.git-patchwork-notify@kernel.org>
Date: Sat, 23 Jan 2021 02:30:09 +0000
References: <20210120110745.36412-1-bianpan2016@163.com>
In-Reply-To: <20210120110745.36412-1-bianpan2016@163.com>
To: Pan Bian <bianpan2016@163.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 rusaimi.amira.rusaimi@intel.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 vineetha.g.jaya.kumaran@intel.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-intel-plat: remove
	config data on error
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

On Wed, 20 Jan 2021 03:07:44 -0800 you wrote:
> Remove the config data when rate setting fails.
> 
> Fixes: 9efc9b2b04c7 ("net: stmmac: Add dwmac-intel-plat for GBE driver")
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - net: stmmac: dwmac-intel-plat: remove config data on error
    https://git.kernel.org/netdev/net/c/3765d86ffcd3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
