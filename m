Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A380451D
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 03:40:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B93D8C6C855;
	Tue,  5 Dec 2023 02:40:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55052C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 02:40:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 24BA1CE128B;
 Tue,  5 Dec 2023 02:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 531B8C433CA;
 Tue,  5 Dec 2023 02:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701744025;
 bh=7qPKJ3S8i489bnlJf7/hjHyGn4ZzVXxeyHWMQ4xpB9c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oG7pXZNZFIrMvULwRVn7OecljZ6pHpBXbJVi8D3HPtCieQXObKyz7G1D4BtAlcVNl
 JapKceXN0Nfyk7jz1QPw9H/WFmNAwOhDGGOWyPE+Bl6boUvOyTVJVw69WDbDJWYANE
 oSG1pvF+Si2GOFb2pCVkCX/niRgDMXIBIErbis2orwx4QSCy6QkGi3B/QJ19IR9BSZ
 dUOqRXdQZquGaRBOEAystgW+dzDVL2d1EsGFiZpJV58Jp3nVzwOs0GH0Fniu5i8pl5
 Mfu8WfNCOuYj7A4ruEaOrVxbXzcGMO0F+ACzfa0xUvhV9eC/D7IWxx0NoGRi28Dw+S
 bwjPdUzaizKCg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2E8DDDD4EF1; Tue,  5 Dec 2023 02:40:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170174402518.31470.16495979069997859149.git-patchwork-notify@kernel.org>
Date: Tue, 05 Dec 2023 02:40:25 +0000
References: <CY5PR12MB637225A7CF529D5BE0FBE59CBF81A@CY5PR12MB6372.namprd12.prod.outlook.com>
In-Reply-To: <CY5PR12MB637225A7CF529D5BE0FBE59CBF81A@CY5PR12MB6372.namprd12.prod.outlook.com>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Cc: weifeng.voon@intel.com, linux-kernel@vger.kernel.org, edumazet@google.com,
 boon.leong.ong@intel.com, shenwei.wang@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, j.zink@pengutronix.de,
 bartosz.golaszewski@linaro.org, mohammad.athari.ismail@intel.com,
 linux-arm-kernel@lists.infradead.org, kuba@kernel.org, pabeni@redhat.com,
 ahalaney@redhat.com, Jose.Abreu@synopsys.com, mcoquelin.stm32@gmail.com,
 rmk+kernel@armlinux.org.uk, jh@henneberg-systemdesign.com,
 tee.min.tan@intel.com, Martin.McKenny@synopsys.com, netdev@vger.kernel.org,
 James.Li1@synopsys.com, horms@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4] net: stmmac: fix FPE events losing
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 1 Dec 2023 03:22:03 +0000 you wrote:
> The status bits of register MAC_FPE_CTRL_STS are clear on read. Using
> 32-bit read for MAC_FPE_CTRL_STS in dwmac5_fpe_configure() and
> dwmac5_fpe_send_mpacket() clear the status bits. Then the stmmac interrupt
> handler missing FPE event status and leads to FPE handshaking failure and
> retries.
> To avoid clear status bits of MAC_FPE_CTRL_STS in dwmac5_fpe_configure()
> and dwmac5_fpe_send_mpacket(), add fpe_csr to stmmac_fpe_cfg structure to
> cache the control bits of MAC_FPE_CTRL_STS and to avoid reading
> MAC_FPE_CTRL_STS in those methods.
> 
> [...]

Here is the summary with links:
  - [v4] net: stmmac: fix FPE events losing
    https://git.kernel.org/netdev/net/c/37e4b8df27bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
