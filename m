Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C809BDB6B
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 02:50:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18DF0C712A1;
	Wed,  6 Nov 2024 01:50:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72376C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 01:50:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F3795C5466;
 Wed,  6 Nov 2024 01:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3BFC4CECF;
 Wed,  6 Nov 2024 01:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730857828;
 bh=y8MG1WBPKCKkhseOfwN6igxneU0mxRhDtteJDtTIZ80=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JwK13Mb+stiNLS4FappBwqATmT30X/8M77CVZWPXX0ILf0rvNKTm+fhkg8LmxGiMe
 B8oIrb9B5XKT+OAGhlLNtOnRCNUTv1Y6kzteIM8SWbTb7sEE9VMFPMdyvmJFcERcfB
 o5Sgy3AJaSZJ6uDsrtkNWdObQewVHpt/w3UVLLndy8ivr+ze04OrA05LCtihwkD2KI
 GeeNNvfQgAFGcTmUXUIBOtjvEmKxGsquWKxfn7j32Yw9lswZDsq3ylPgP2LYIl8377
 aww6Ayqqb1VebtT+WXNgvKwHIVTp1szu4MskpXIKHZ5W4LL5zRGJhcLOFpeX0gwSaS
 jAegtPvI35cgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAD233809A80; Wed,  6 Nov 2024 01:50:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173085783749.762099.1620260205741649555.git-patchwork-notify@kernel.org>
Date: Wed, 06 Nov 2024 01:50:37 +0000
References: <20241102114122.4631-1-l.rubusch@gmail.com>
In-Reply-To: <20241102114122.4631-1-l.rubusch@gmail.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 0/2] Add support for Synopsis
	DesignWare version 3.72a
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

On Sat,  2 Nov 2024 11:41:20 +0000 you wrote:
> Add compatibility and dt-binding for Synopsis DesignWare version 3.72a.
> The dwmac is used on some older Altera/Intel SoCs such as Arria10.
> Updating compatibles in the driver and bindings for the DT improves the
> binding check coverage for such SoCs.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v1,1/2] net: stmmac: add support for dwmac 3.72a
    https://git.kernel.org/netdev/net-next/c/ffda5c62878f
  - [v1,2/2] dt-bindings: net: snps,dwmac: add support for Arria10
    https://git.kernel.org/netdev/net-next/c/8bed89232a8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
