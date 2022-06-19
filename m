Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4003055096D
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jun 2022 11:00:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCC2EC03FC7;
	Sun, 19 Jun 2022 09:00:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D34DC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jun 2022 09:00:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4994C60FD0;
 Sun, 19 Jun 2022 09:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97FCAC341C6;
 Sun, 19 Jun 2022 09:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655629212;
 bh=ZhYCdmPIkvBb4HiRdGew2hPBVtn9FRzBnCVE2BGxsRA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hYe2MYazvyublmt1ixzcq923LmVnDEdkkvnqgdvDIGqFWp42osp/nXF+UvgDXQFmG
 bDLJMaUN4pPhOBMPuhkKMj3/+HHun4fcmrhD6WGC5iMthMtwHs+ylPW+98zE2JEIWK
 elqxQXAyuz6ZwWRR9h/389RkXGsZ1XEoOGSNvz2lqb2zFRoQtt9OLs0qhsHwX3h0ss
 To9I+vnqI9YbfIAutQLa5hJ1cDLa/pEUV9hHXSReX8yr9P8UBEJ9+0v6mt8IVs2c/4
 LXHFSbEIYx5kwnit4oORiNbkhO+xZA/6wnCuLtPgZhzwlA9tJKqbaKXv8AMi9QFlIQ
 hot8l6tweGRvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 80133E7387A; Sun, 19 Jun 2022 09:00:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165562921252.21034.212967862593750465.git-patchwork-notify@kernel.org>
Date: Sun, 19 Jun 2022 09:00:12 +0000
References: <20220616221554.22040-1-ansuelsmth@gmail.com>
In-Reply-To: <20220616221554.22040-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-kernel@vger.kernel.org, lkp@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH] net: ethernet: stmmac: remove
 select QCOM_SOCINFO and make it optional
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
by David S. Miller <davem@davemloft.net>:

On Fri, 17 Jun 2022 00:15:54 +0200 you wrote:
> QCOM_SOCINFO depends on QCOM_SMEM but is not selected, this cause some
> problems with QCOM_SOCINFO getting selected with the dependency of
> QCOM_SMEM not met.
> To fix this remove the select in Kconfig and add additional info in the
> DWMAC_IPQ806X config description.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 9ec092d2feb6 ("net: ethernet: stmmac: add missing sgmii configure for ipq806x")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: stmmac: remove select QCOM_SOCINFO and make it optional
    https://git.kernel.org/netdev/net-next/c/c205035e3adb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
