Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E641D3B77FD
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jun 2021 20:40:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 993FFC58D78;
	Tue, 29 Jun 2021 18:40:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36DE9C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jun 2021 18:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B15C361DE5;
 Tue, 29 Jun 2021 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624992004;
 bh=a7JPoup5FrRMxLLJk7Al4eaabPYZqluDRE3OC+XwA00=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tE5d4LTBfc+p5ap4sfYQ1PP7bqT4scJc+XBnD9YwFnoGu6gmvq+Fxy+QJ9z3ISURe
 PHHMtqJ2h104NgQlZilOhg0CntrW3KCUyc1+S/qsSwuMwVCWlDc7A7+DYYdTwW68oH
 ewENwlx3wrFnij7HmLzoJ1ubiQFvljcwRjnm4/yfm5Dn6OHnQupBG6Dn4sz4e/tsyg
 xB+oUDSrw6+E3VyEE0YOUUm9qT4Z8DvWAuQpN9kRkj9GkUrYhm8rkV9EUE9R3sxmyk
 XXKueyLH6qqETOj8Vl8xsll6F8EJtinBLAoeLw5wHGl2PEQ65UvptOv1GGblbEdHgu
 Bv4kdt0u3TWUw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9FBEF60ACA;
 Tue, 29 Jun 2021 18:40:04 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162499200464.24074.1612341263285192937.git-patchwork-notify@kernel.org>
Date: Tue, 29 Jun 2021 18:40:04 +0000
References: <20210629030859.1273157-1-pei.lee.ling@intel.com>
In-Reply-To: <20210629030859.1273157-1-pei.lee.ling@intel.com>
To: Ling Pei Lee <pei.lee.ling@intel.com>
Cc: vee.khee.wong@linux.intel.com, linux-kernel@vger.kernel.org,
 weifeng.voon@intel.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 tee.min.tan@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 davem@davemloft.net, michael.wei.hong.sit@intel.com
Subject: Re: [Linux-stm32] [PATCH net-next V2 0/3] Add option to enable PHY
	WOL with PMT enabled
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

On Tue, 29 Jun 2021 11:08:56 +0800 you wrote:
> This patchset main objective is to provide an option to enable PHY WoL even the PMT is enabled by default in the HW features.
> 
> The current stmmac driver WOL implementation will enable MAC WOL if MAC HW PMT feature is on. Else, the driver will check for PHY WOL support.
> Intel EHL mgbe are designed to wake up through PHY WOL although the HW PMT is enabled.Hence, introduced use_phy_wol platform data to provide this PHY WOL option. Set use_phy_wol will disable the plat->pmt which currently used to determine the system to wake up by MAC WOL or PHY WOL.
> 
> This WOL patchset includes of setting the device power state to D3hot.
> This is because the EHL PSE will need to PSE mgbe to be in D3 state in order for the PSE to goes into suspend mode.
> 
> [...]

Here is the summary with links:
  - [net-next,V2,1/3] net: stmmac: option to enable PHY WOL with PMT enabled
    https://git.kernel.org/netdev/net-next/c/5a9b876e9d76
  - [net-next,V2,2/3] stmmac: intel: Enable PHY WOL option in EHL
    https://git.kernel.org/netdev/net-next/c/945beb755633
  - [net-next,V2,3/3] stmmac: intel: set PCI_D3hot in suspend
    https://git.kernel.org/netdev/net-next/c/1dd53a61488d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
