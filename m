Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E69D4A55AF6
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 00:40:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFC99C78F83;
	Thu,  6 Mar 2025 23:40:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD98FC78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 23:40:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB4345C5AEA;
 Thu,  6 Mar 2025 23:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF55C4CEE0;
 Thu,  6 Mar 2025 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741304404;
 bh=2QSee9WokSYspQJ+xRHNNYB0mN5bS+JLoP/ZWB/o79g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rhc1fDh67EBOuiKV1bApq40dxAjAq5x/hauy5rCh6DpnHSwhNcSTIFmjmPMQpai5C
 shJSi+TKWch6PItoD7htSicRlB2sHSCDkYo0guwyt7ogxakmmmycXo37+hRMcO2b0n
 c5v1gFuSk2PyInqkK3UsRmzbhdaPO+Ru6N5lCGl4KTPc4IydcEnDrTsWqsYXqDv1wz
 B4Arp2PgfIzhYVegzstUmNjA814/2FXMYtdwpXPktI0C+Roxlb+0KkLmJitsH08GPD
 Ak0a47mxubiTcIVi43Ktk11jaij8nSVZbHLzyXeqzq9YTeR1VPXg3wIay6yL6pJUXb
 TXn9plJ9h1pyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAFC6380CFF6; Thu,  6 Mar 2025 23:40:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174130443748.1819102.11441827117696182422.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 23:40:37 +0000
References: <20250305091246.106626-1-swathi.ks@samsung.com>
In-Reply-To: <20250305091246.106626-1-swathi.ks@samsung.com>
To: Swathi K S <swathi.ks@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 ravi.patel@samsung.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, pankaj.dubey@samsung.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 0/2] net: stmmac: dwc-qos: Add FSD EQoS
	support
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  5 Mar 2025 14:42:44 +0530 you wrote:
> FSD platform has two instances of EQoS IP, one is in FSYS0 block and
> another one is in PERIC block. This patch series add required DT binding
> and platform driver specific changes for the same.
> 
> Changes since v1:
> 1. Updated dwc_eqos_setup_rxclock() function as per the review comments
> given by Andrew.
> 
> [...]

Here is the summary with links:
  - [v8,1/2] dt-bindings: net: Add FSD EQoS device tree bindings
    https://git.kernel.org/netdev/net-next/c/1f6c3899833a
  - [v8,2/2] net: stmmac: dwc-qos: Add FSD EQoS support
    https://git.kernel.org/netdev/net-next/c/ae7f6b34f5cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
