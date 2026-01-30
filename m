Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCNGEIUcfGmAKgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 03:50:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EA4B68F7
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 03:50:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9906C01FBF;
	Fri, 30 Jan 2026 02:50:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5EB5C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 02:50:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 20A5D6012B;
 Fri, 30 Jan 2026 02:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD91C19421;
 Fri, 30 Jan 2026 02:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769741442;
 bh=DDD2HhaWU8hgGNcvsxgeR8SKHG9Tsx5ygB6TGhAYZ04=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=e69iaom0KVVwNSrLlbLpYVy3WJJtrfzlkmiBdfoFdUpZCoO4RgyJ1CkGIaJ/Ik1CY
 b0Q129iqFKEDsJANqfrCLO1TS5owegvwSOQbLrEjpl8P6lpUpUQlSX0/8nY76rctyO
 2wOH8tTmpiilNk3ZvG6GtOTo7VMPqGUXf+xaItER3DuzLXhfu7xi0LFce0PCDT9lCu
 I9zVRAn6eMazlpssdqX66pNZq82Ks1jPd5r0QkNMzUQOeAlqOA2eX/Sq9YkcAxcL6Z
 5pSpPpwf+4IwzZr2nT+VcBVx5KIYPf982ywliNkwJ6SssAP18bCFtmfhfGlG50hRCr
 Ut+9fOZNRNCkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 C8D1E380CEE0; Fri, 30 Jan 2026 02:50:36 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176974143534.3149010.10116225722696356568.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jan 2026 02:50:35 +0000
References: <aXnpTy6XckPGcmg0@shell.armlinux.org.uk>
In-Reply-To: <aXnpTy6XckPGcmg0@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: fustini@kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, guoren@kernel.org, kuba@kernel.org,
 linux-riscv@lists.infradead.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, wefu@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: report active
	phy interface
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:fustini@kernel.org,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:guoren@kernel.org,m:kuba@kernel.org,m:linux-riscv@lists.infradead.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:wefu@redhat.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 22EA4B68F7
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 28 Jan 2026 10:47:43 +0000 you wrote:
> The original patch needs dwmac-thead fixed so the PHY_INTF* definitions
> do not clash.
> 
>  drivers/net/ethernet/stmicro/stmmac/common.h       |  6 +++
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 10 ++---
>  .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    |  2 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  2 +
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  1 +
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 52 ++++++++++++++++++++++
>  7 files changed, 69 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [net-next,1/2] net: stmmac: thead: avoid conflicts with PHY_INTF_* definitions
    https://git.kernel.org/netdev/net-next/c/88afa0dd655c
  - [net-next,2/2] net: stmmac: report active PHY interface
    https://git.kernel.org/netdev/net-next/c/d9009f72ed88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
