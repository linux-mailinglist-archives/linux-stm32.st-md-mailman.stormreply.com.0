Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D14DC727
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Mar 2022 14:00:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 835A1C60496;
	Thu, 17 Mar 2022 13:00:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A178C6046B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Mar 2022 13:00:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2598061670;
 Thu, 17 Mar 2022 13:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 817B2C340EF;
 Thu, 17 Mar 2022 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647522010;
 bh=yV5Jc/gBBDkmafjLLLBbIHDho+86bn0+HPLxHDuESuk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=i7kCys/S82opt7twEnwe3E5pOF1Eu0Iu/wGbHYWM4Rr0HCwmCtmIBQZsp6ivfDP4x
 YdCv6GjKp28OwXTIgzfEQT7Rw4z7YxKKIqkblSiYziORuUaK+mtAu7cS5r8i3q1CM3
 lAOXygUkfoLgn2cUEVbDFRQHFyiPS7Axgi2//Ahre7Oy1IORBycxrQnLXMw5q4JboO
 g9PCvscoFF2mbJiYUSGE5OU3KllCctiFc+oYKguyjWwtYJJdmR7Qocjcm61kcKzCUa
 ZFfjOHHoKZuVB3kMZD0U2DJj0kGyPo61cMBLU80naZrjp2qwiLMnHbgeAb8XQL/SYh
 LsMoLeSxTgnrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5A76DE6D3DD; Thu, 17 Mar 2022 13:00:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164752201035.1459.5576780774534521056.git-patchwork-notify@kernel.org>
Date: Thu, 17 Mar 2022 13:00:10 +0000
References: <20220316083744.GB30941@kili>
In-Reply-To: <20220316083744.GB30941@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: clean up impossible
	condition
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 16 Mar 2022 11:37:44 +0300 you wrote:
> This code works but it has a static checker warning:
> 
>     drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1687 init_dma_rx_desc_rings()
>     warn: always true condition '(queue >= 0) => (0-u32max >= 0)'
> 
> Obviously, it makes no sense to check if an unsigned int is >= 0.  What
> prevents this code from being a forever loop is that later there is a
> separate check for if (queue == 0).
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: clean up impossible condition
    https://git.kernel.org/netdev/net-next/c/58e06d05d43a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
