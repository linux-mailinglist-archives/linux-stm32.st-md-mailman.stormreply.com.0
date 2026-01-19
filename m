Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC75D3ABAB
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 15:22:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79ED5C36B3C;
	Mon, 19 Jan 2026 14:22:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6801C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:22:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C38C46014E;
 Mon, 19 Jan 2026 14:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E53C116C6;
 Mon, 19 Jan 2026 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768832570;
 bh=iel0DGd+o7YdAm/0CQY6DbLhXg4Ch8q2C+sIyw5cVsc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pmUW/8TuBqOMdEh45Xlya+A5LFhiUXZft+YkLYZz4MX4TTLLgBukSekW26UUGCdkX
 qfIn6ICpmnU59KzLoU2ByoGuW6poqy/zlv/SpaKB4T0Um/6RZ9vdGfFy5EeZQD0JhP
 mm9x6VxltaUS7QnJ8v++HTqT8EYHEMKgxuMLsGbYTAyrI0mYLU91wXq89X1VzT3/LE
 fcjZ/XowaofkMOrgURSQlr6CRWBHZq5GRuAGsADPX9WvlvKAgKu763o3oQ4TPM8twP
 rQ+ziX0YQ2wCJh7uFYWF4sQM0U2ybqAFvhr5TpmUDL+cSustp0arkyYD81hX7RJUMo
 Vo5eGNM5rFnVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7891E3A55FAF; Mon, 19 Jan 2026 14:19:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176883236002.1426077.3751892963025257662.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 14:19:20 +0000
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix dwmac4 transmit
 performance regression
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

On Fri, 16 Jan 2026 00:49:24 +0000 you wrote:
> dwmac4's transmit performance dropped by a factor of four due to an
> incorrect assumption about which definitions are for what. This
> highlights the need for sane register macros.
> 
> Commit 8409495bf6c9 ("net: stmmac: cores: remove many xxx_SHIFT
> definitions") changed the way the txpbl value is merged into the
> register:
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: fix dwmac4 transmit performance regression
    https://git.kernel.org/netdev/net-next/c/5ccde4c81e84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
