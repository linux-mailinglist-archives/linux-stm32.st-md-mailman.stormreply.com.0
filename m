Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85910356035
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 02:20:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F04DC5718B;
	Wed,  7 Apr 2021 00:20:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 863C7C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 00:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 068C1613CB;
 Wed,  7 Apr 2021 00:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617754813;
 bh=KTqpuXgzrieXAX+sUDBWy1nDUfNde7siIgorhzsRH90=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OJykp99e1Jw3zhOCm6CJ8OJm1c8lPQLL5biQPIIcNeECtHwlTlnJoessSSyaZKMKU
 wc4O1YyaCKSIUPtM8B6fpYSCaJD1A9zlBGEEtfnK+HVwv0R42c419Rd3a7EFypxTJe
 o1ifbteQtDHoz9jygwnFX1q+iOQozmg6aFSgQE1rHvhvAdYEfUSGFh7HoZVqdfkVEH
 NkUjuRsfEKaySmLgeawFzizJK3CsoIQH20O2C6GcsUnrmbcJvmZtq2ypvsjEvTmCsy
 MOgXGNFAOPHZdEKnJ5mj9vwHkm0kOwpJKTOxR8u2jD6Fx8Hz/+atvLCrxe+gc0f3d9
 F7oZY6IEdzOaA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F015260A6B;
 Wed,  7 Apr 2021 00:20:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161775481297.4854.15334694335904751602.git-patchwork-notify@kernel.org>
Date: Wed, 07 Apr 2021 00:20:12 +0000
References: <20210406101306.59162-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210406101306.59162-1-andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/1] stmmac: intel: Drop
 duplicate ID in the list of PCI device IDs
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

On Tue,  6 Apr 2021 13:13:06 +0300 you wrote:
> The PCI device IDs are defined with a prefix PCI_DEVICE_ID.
> There is no need to repeat the ID part at the end of each definition.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 60 +++++++++----------
>  1 file changed, 30 insertions(+), 30 deletions(-)

Here is the summary with links:
  - [net-next,v1,1/1] stmmac: intel: Drop duplicate ID in the list of PCI device IDs
    https://git.kernel.org/netdev/net-next/c/3036ec035c4d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
