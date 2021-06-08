Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A87E3A0807
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 01:50:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B6CCC57B79;
	Tue,  8 Jun 2021 23:50:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5914CC57B75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 23:50:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7921F61364;
 Tue,  8 Jun 2021 23:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623196204;
 bh=3qZVdO8JJlicODgnOb7ivyERyp17IaM46xEbA1u3zfk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=t0EFD+neQTCPNIIzlizY/jvpn1WE/6TF7hk8uXMrRK2Mpmnn57CMpZCtIYynucJgk
 9El+KEXD3o29oNRdkzaAvv3Z5WXyuV1Pc3udghccmxakFTTKysS13DGoVmbgA83lQm
 chk0s0syWHHPo+ftcixUEGLB+/w9UMMBV5tDqbEe6XT+b6W/LJqjIxGSgtExQko8es
 MobMI8lhRrAK3H4Kkf7GI/YeinBymto3fya7eLQXoS/ClIy2m65uKLEqCaYApVjp6X
 W30TDrED44iBM6GoKt5gg4vCd0Mp5rBL2L+9INqCysnB5bIyr2X928tnji2KNfg8EL
 uvSsgS4cwHGSA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6EE21608B9;
 Tue,  8 Jun 2021 23:50:04 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162319620444.30091.10501807716630909257.git-patchwork-notify@kernel.org>
Date: Tue, 08 Jun 2021 23:50:04 +0000
References: <20210608185913.3909878-1-mnhagan88@gmail.com>
In-Reply-To: <20210608185913.3909878-1-mnhagan88@gmail.com>
To: Matthew Hagan <mnhagan88@gmail.com>
Cc: , vee.khee.wong@linux.intel.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, weifeng.voon@intel.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, tee.min.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 bjorn.andersson@linaro.org, vee.khee.wong@intel.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net,
 michael.wei.hong.sit@intel.com
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: explicitly deassert
	GMAC_AHB_RESET
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

On Tue,  8 Jun 2021 19:59:06 +0100 you wrote:
> We are currently assuming that GMAC_AHB_RESET will already be deasserted
> by the bootloader. However if this has not been done, probing of the GMAC
> will fail. To remedy this we must ensure GMAC_AHB_RESET has been deasserted
> prior to probing.
> 
> v2 changes:
>  - remove NULL condition check for stmmac_ahb_rst in stmmac_main.c
>  - unwrap dev_err() message in stmmac_main.c
>  - add PTR_ERR() around plat->stmmac_ahb_rst in stmmac_platform.c
> 
> [...]

Here is the summary with links:
  - [v3] net: stmmac: explicitly deassert GMAC_AHB_RESET
    https://git.kernel.org/netdev/net-next/c/e67f325e9cd6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
