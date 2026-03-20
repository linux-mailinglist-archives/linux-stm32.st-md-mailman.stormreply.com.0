Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHbOASeVvGmE0wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 01:30:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5F2D473C
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 01:30:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 269B4C87ED5;
	Fri, 20 Mar 2026 00:30:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 830A1C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 00:30:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 62D9A60097;
 Fri, 20 Mar 2026 00:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176A8C19424;
 Fri, 20 Mar 2026 00:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773966627;
 bh=e00VxEjfVLHb2cCGEacgmrXQHfHXzKuxaGfyE9rbWAc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ddiSyLJn/161inpllbDVZpBtaV3o7frFGCIuu8taIPumvJfxkZQMTuAv62oRuAywm
 DebB73JLuYuB5TumObxCIOcfSy8yD0kVCzgrRFqYBwz9o4xhHNDIqTGQPkvg51++Ht
 ieXj3bT8VoNTwwLJ/wA/hVes/F/kbUYheRDKKkbaUkGbxFnvDcyyYDIfufoTeh3g+R
 Mgwf2Eta3Brk6/F972blvl4qZv1z5O/AFfnLjZqKuJ9tNn8H0+eVNqug2fdgGpySyP
 vi/ZOpa7gEdGdtFjzLQgw4g1ErwTOf0a2R0L7v07VRK5wnsgdbL6ynmY0j0eAEXunE
 Vml8NhhcvmCUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02E8A39302F6; Fri, 20 Mar 2026 00:30:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177396661753.1861152.5017426942573909830.git-patchwork-notify@kernel.org>
Date: Fri, 20 Mar 2026 00:30:17 +0000
References: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
In-Reply-To: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: descriptor
	cleanups part 2
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[netdevbpf];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.629];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 91D5F2D473C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Mar 2026 18:26:13 +0000 you wrote:
> Part 2 of the stmmac descriptor cleanups.
> 
> - rename "priv->mode" to be more descriptive, and do the same in
>   function arguments.
> - simplify descriptor allocation/initialisation/freeing
> - use more descriptive local variable names in stmmac_xmit()
> - STMMAC_GET_ENTRY() doesn't get an entry, it moves to the next one.
>   Describe this in the macro name.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: stmmac: rename "mode" to "descriptor_mode"
    https://git.kernel.org/netdev/net-next/c/1939749ce92d
  - [net-next,2/5] net: stmmac: more mode -> descriptor_mode renames
    https://git.kernel.org/netdev/net-next/c/33be7846e4be
  - [net-next,3/5] net: stmmac: simplify DMA descriptor allocation/init/freeing
    https://git.kernel.org/netdev/net-next/c/e73b19baa3b1
  - [net-next,4/5] net: stmmac: use more descriptive names in stmmac_xmit()
    https://git.kernel.org/netdev/net-next/c/b4df951549dd
  - [net-next,5/5] net: stmmac: rename STMMAC_GET_ENTRY() -> STMMAC_NEXT_ENTRY()
    https://git.kernel.org/netdev/net-next/c/6b4286e05508

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
