Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JNBFBFpeWmPwwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 02:40:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF69BF6B
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 02:40:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76D00C0693D;
	Wed, 28 Jan 2026 01:40:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BF89C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 01:40:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B2776444C1;
 Wed, 28 Jan 2026 01:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F482C116C6;
 Wed, 28 Jan 2026 01:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769564430;
 bh=BRV3NNMHXtFN28QG1LlieA/z4NRLoXX16Hu52ceP2zI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WHjFUmwgQPYSpaiLwlRr+oDhcgvtV85LuysWTTawWtHliueaNPchxBbx1YiBDBNA9
 79Q3gfNNXtPRsD9ZXv0VfX6hfmkOp6O66cvH58i6U/+ES7Q5sDrfTlLbanjNM9d5AK
 i1Td/5w9L7Liq6NVvQAddqRWgUac4gEoJUxUDSr8rnd5OQ4ASoS15zxvBqIhPFNQKR
 iPh8w3YSJ2MCQ8+mmPx4Yl/ulwN5SpmbE/knJrbDhwhYeeDOvKAnlh2pX/phIGcHt2
 9p4pUWYavRaL3f+I2KocUE7c0Bi4tIcBWt5AWmG1zAlBxeIhO2UtQQktO9DX65oC7w
 DG3YrILver3Cg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 8BC3C380AA76; Wed, 28 Jan 2026 01:40:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176956442434.1470424.17241812328293968709.git-patchwork-notify@kernel.org>
Date: Wed, 28 Jan 2026 01:40:24 +0000
References: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, imx@lists.linux.dev, netdev@vger.kernel.org,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, kernel@pengutronix.de,
 kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: don't pass ioaddr
 to fix_soc_reset() method
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:imx@lists.linux.dev,m:netdev@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: D3FF69BF6B
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 26 Jan 2026 12:33:14 +0000 you wrote:
> As the stmmac_priv struct is passed to the fix_soc_reset() method which
> has the ioaddr, there is no need to pass ioaddr separately. Pass just
> the stmmac_priv struct. Fix up the glues that use it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c      | 8 +++++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 6 ++++--
>  drivers/net/ethernet/stmicro/stmmac/hwif.c           | 2 +-
>  include/linux/stmmac.h                               | 2 +-
>  4 files changed, 11 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: don't pass ioaddr to fix_soc_reset() method
    https://git.kernel.org/netdev/net-next/c/d64f761dbfda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
