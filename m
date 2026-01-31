Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDQcLNpffWnpRgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 02:50:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 774BFC01C0
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 02:50:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A9BAC56612;
	Sat, 31 Jan 2026 01:50:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E7E6C56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 01:50:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4CE7E41A93;
 Sat, 31 Jan 2026 01:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249B2C116D0;
 Sat, 31 Jan 2026 01:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769824215;
 bh=KveGONG7UJdElvqV315bWlMz8AD27Y9PZLI+Vh0KgjU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GX4SYWdycMxo+2vTLOeR/ZBoTMWGL8AgvbwdETbXxJVMdby1l6Dl/yDEby0l+bAq9
 9c6Q3Ki4B+bTUnQbsrudX3kJlBk7gdDK6na9gXWgC1zrDWUW1D8AI/xuaO62XKAHNz
 7KBl252hzYi7jCPIyLfasU49uL767ZC6Z4XMBFGqjlwJeCKovdwCkF4QZXfgLvw6ZD
 D/mcX2MYw6EilRtyq7BbVr626UBsoRRvZTRjwOMFTTTQq0bay74A5d7p/9ms1wP+5m
 xCmKiBfwRLNb5F0zTpAInNgI6E6+gWD86d68SAQ6+GF/qJ1X8ABgRJC3WNeCF52EYt
 aYEQDXnTXp2bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 8BC98380CFFB; Sat, 31 Jan 2026 01:50:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176982420710.3961929.13739265763800349219.git-patchwork-notify@kernel.org>
Date: Sat, 31 Jan 2026 01:50:07 +0000
References: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>
In-Reply-To: <20260129-stmmac-spell-v1-1-c7df9a96e482@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: imx@lists.linux.dev, linux-sunxi@lists.linux.dev, wens@kernel.org,
 kernel@pengutronix.de, samuel@sholland.org, festevam@gmail.com,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: spelling corrections
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,pengutronix.de,sholland.org,gmail.com,st-md-mailman.stormreply.com,lunn.ch,google.com,vger.kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:horms@kernel.org,m:imx@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:wens@kernel.org,m:kernel@pengutronix.de,m:samuel@sholland.org,m:festevam@gmail.com,m:s.hauer@pengutronix.de,m:jernej.skrabec@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:jernejskrabec@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 774BFC01C0
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 29 Jan 2026 17:35:03 +0000 you wrote:
> Correct spelling as flagged by codespell.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c        |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c      |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000.h        |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/enh_desc.c         |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c         |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c      | 10 +++++-----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
>  10 files changed, 17 insertions(+), 17 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: spelling corrections
    https://git.kernel.org/netdev/net-next/c/96e1c895b5ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
