Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2431E290
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Feb 2021 23:40:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1111BC5718D;
	Wed, 17 Feb 2021 22:40:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E975DC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 22:40:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6F97064E2E;
 Wed, 17 Feb 2021 22:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613601607;
 bh=h4GGmCDmodDTOfcOMQkHVeIRed8RvDWc90CgF6SA0HM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=c/HdA/KW6OQP1U1BG9/G/gpNhbgo4UMSFY34Sb4UmJqCbSz5y+UljgD0C6Zg0u+2w
 4oHz3qrjM0XTh4xN2dfSMgkXDA7V1Q6BLpbk9+xo6aFPIpiqnj4mzvm886IPiAnyCy
 07Fq4kxjyUo3Xh391HRYb5eAWwKVuuFISX1Vgqu524kcwkwAurJi0hrwFAFQjJ+hbg
 9ODkUJ3UV7ffRt9gfQVvaMvCa0blsdbsdxw9WvjhgfBBR8+kuQbuCLMP3I15idmA43
 +oA1fti9kYyYTRPkvtkntd0enSV9VVgf5A0p+slYEBNJCJi/sClb50fPBJ+Rg+FyGt
 ZLuG3uchB97Mw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5F10D6096D;
 Wed, 17 Feb 2021 22:40:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161360160738.1867.9252976425152960129.git-patchwork-notify@kernel.org>
Date: Wed, 17 Feb 2021 22:40:07 +0000
References: <20210217095705.13806-1-vee.khee.wong@intel.com>
In-Reply-To: <20210217095705.13806-1-vee.khee.wong@intel.com>
To: Wong Vee Khee <vee.khee.wong@intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Add PCI bus
 info to ethtool driver query output
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

On Wed, 17 Feb 2021 17:57:05 +0800 you wrote:
> This patch populates the PCI bus info in the ethtool driver query data.
> 
> Users will be able to view PCI bus info using 'ethtool -i <interface>'.
> 
> Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    | 1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 4 ++++
>  include/linux/stmmac.h                               | 1 +
>  3 files changed, 6 insertions(+)

Here is the summary with links:
  - [net-next,1/1] net: stmmac: Add PCI bus info to ethtool driver query output
    https://git.kernel.org/netdev/net-next/c/20e07e2c3cf3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
