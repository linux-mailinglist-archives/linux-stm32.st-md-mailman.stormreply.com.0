Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1266D9C0E
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 17:20:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61E0EC6B441;
	Thu,  6 Apr 2023 15:20:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1ED7C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 15:20:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A115C6493E;
 Thu,  6 Apr 2023 15:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09F81C4339B;
 Thu,  6 Apr 2023 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680794418;
 bh=+bs09GQCF5hAOkAMz+tvy22Eo6BudBimhC/cySd7K8g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HQmmceVBx10JdKaeVzq1b/zZepoaadnmjvytEbXpCpYO7wLztHY6I2yPdASPXNifc
 dElaVEtrjzESJjng1jtThKMlNDhzvEYamEwoUZCi+VXK3MitdsoMJ5OHsEeyZ8nKUa
 8LR3ukZ7xuRpygFdjVNqakEpbfp9vSVu3LlEOGzTgrFgahvw9yFG7lzjdhEa+4zjXv
 mOL2IsgOORuxKmAwAnwgsXWa2LP9mlfNPx63LnVj0DbN3HLuGP79I99OXFi94EK371
 f31mYR3K21sbzZfdPa+IlA8IaK4/XXh2HOpMP+ENccR4p1SFr6q7TeYZPeJ/5xXFAa
 Ae98HiVZ+PGog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E0175E5EA85; Thu,  6 Apr 2023 15:20:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168079441791.8535.15515583518065122316.git-patchwork-notify@kernel.org>
Date: Thu, 06 Apr 2023 15:20:17 +0000
References: <20230406024541.3556305-1-michael.wei.hong.sit@intel.com>
In-Reply-To: <20230406024541.3556305-1-michael.wei.hong.sit@intel.com>
To: Sit@ci.codeaurora.org,
	Michael Wei Hong <michael.wei.hong.sit@intel.com>
Cc: andrew@lunn.ch, weifeng.voon@intel.com, peter.jun.ann.lai@intel.com,
 edumazet@google.com, boon.leong.ong@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, m.szyprowski@samsung.com,
 hock.leong.kweh@intel.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, martin.blumenstingl@googlemail.com,
 Shahab.Vahedi@synopsys.com, hong.aun.looi@intel.com, tee.min.tan@intel.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, muhammad.husaini.zulkifli@intel.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [RESEND PATCH net 1/1] net: stmmac: check fwnode
 for phy device before scanning for phy
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

On Thu,  6 Apr 2023 10:45:41 +0800 you wrote:
> Some DT devices already have phy device configured in the DT/ACPI.
> Current implementation scans for a phy unconditionally even though
> there is a phy listed in the DT/ACPI and already attached.
> 
> We should check the fwnode if there is any phy device listed in
> fwnode and decide whether to scan for a phy to attach to.
> 
> [...]

Here is the summary with links:
  - [RESEND,net,1/1] net: stmmac: check fwnode for phy device before scanning for phy
    https://git.kernel.org/netdev/net/c/8fbc10b995a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
