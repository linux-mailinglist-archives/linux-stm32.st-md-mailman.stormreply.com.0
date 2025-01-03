Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A07A002D4
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 03:40:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FDD7C78032;
	Fri,  3 Jan 2025 02:40:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3072AC78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 02:40:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E0CC5C542B;
 Fri,  3 Jan 2025 02:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53661C4CEDD;
 Fri,  3 Jan 2025 02:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735872013;
 bh=1AsWfbNlCFqQvnlvtsPVgikvB2lUrOXRFL1YevhcMMU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VfqpTpl52QaJnDjBIN5um7S7uyLHmJb5+j7M1m8QAzcoxZXmswSSq84GKmN0cBaP+
 60J6UjSOP+NvkxqzihFtakqs/RT5wNtzoIJ+nOeH0/HjEOaa1K+uPXNdjtl+AJxz7S
 7LIeCiJr8ovcowX7pDwi+GASl+R7tcSggKZ9GmxzUVb3zcJ3OPt+xZwq+L6Noa/CwM
 86KYotsciFyBGuE2YofuGrU2C4BtV61I43zjO+EBXgXVIx7uReLGhZ1SJHLHkXXGUt
 anlOvqUbIzaPHcpFAqg7optk2U2zzT8rKaJvlOsT1P+HDIVqNkcOeIaLYJ0S7LSuKD
 7/VRy+Ld5uEfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EADF6380A964; Fri,  3 Jan 2025 02:40:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173587203350.2088679.877800854993230996.git-patchwork-notify@kernel.org>
Date: Fri, 03 Jan 2025 02:40:33 +0000
References: <20241227095923.4414-1-othacehe@gnu.org>
In-Reply-To: <20241227095923.4414-1-othacehe@gnu.org>
To: Mathieu Othacehe <othacehe@gnu.org>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 festevam@gmail.com, s.hauer@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 shawnguo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: dwmac-imx: add imx93 clock input
	support in RMII mode
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 27 Dec 2024 10:59:22 +0100 you wrote:
> If the rmii_refclk_ext boolean is set, configure the ENET QOS TX_CLK pin
> direction to input. Otherwise, it defaults to output.
> 
> That mirrors what is already happening for the imx8mp in the
> imx8mp_set_intf_mode function.
> 
> Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
> 
> [...]

Here is the summary with links:
  - [v2] net: dwmac-imx: add imx93 clock input support in RMII mode
    https://git.kernel.org/netdev/net-next/c/94c16fd4df90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
