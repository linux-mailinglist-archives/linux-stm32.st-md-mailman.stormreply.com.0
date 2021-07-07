Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD5F3BF10A
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jul 2021 22:51:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54D04C57B7D;
	Wed,  7 Jul 2021 20:51:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8080BC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jul 2021 20:51:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D795261CCE;
 Wed,  7 Jul 2021 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625691064;
 bh=KcLczx3VGsBt1P9w3VNT+56SSY+1/GyZMpqQTJ1Rgo8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QxxpIV5SkT28mPeG3EXRKSYjCHdIHfvBC+X/UjtdzzQJcwxKAOjeiLJZlRM8dXy+j
 VxjxDQ2avOUB+jOlwhPQ17SOBDY3rHrznsyD86LltL6xT5NQWkYt3EHpUOqCd2jLW7
 yN5ot77yvs5FdCrQZgQU0FcID3mubQJtKHLVwoZZOPA+v91bORNg561+dR8wCnula7
 V9dnfsPtw+1hYeaBRI/sjf/V7baEjgieGZ2AHg0twmGIOSNJXTwJG0JK9bD6EEmqVi
 0CDQyItyBzbIzlTyN8/ercPYhyd+yVD5dPL8y1afEL7t5dJf6/K2SOU18jJ3HamGwS
 Z3GIAuqvikvVg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C4A2A60A3A;
 Wed,  7 Jul 2021 20:51:04 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162569106480.4918.10877247731048790736.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jul 2021 20:51:04 +0000
References: <20210707075335.26488-1-yuehaibing@huawei.com>
In-Reply-To: <20210707075335.26488-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-kernel@vger.kernel.org, ajayg@nvidia.com, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] stmmac: platform: Fix signedness bug
 in stmmac_probe_config_dt()
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

On Wed, 7 Jul 2021 15:53:35 +0800 you wrote:
> The "plat->phy_interface" variable is an enum and in this context GCC
> will treat it as an unsigned int so the error handling is never
> triggered.
> 
> Fixes: b9f0b2f634c0 ("net: stmmac: platform: fix probe for ACPI devices")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net] stmmac: platform: Fix signedness bug in stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net/c/eca81f09145d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
