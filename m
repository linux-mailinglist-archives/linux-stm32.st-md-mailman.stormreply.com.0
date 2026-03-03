Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG+rEshnpmljPQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 05:47:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF731E9098
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 05:47:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35B6FC3F944;
	Tue,  3 Mar 2026 04:47:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7DEEC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 04:47:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A702443E9;
 Tue,  3 Mar 2026 04:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5320EC116C6;
 Tue,  3 Mar 2026 04:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772513220;
 bh=CS1WrxtxU/kHPZfcygHyRAiSv8ol2PAZ5jWVio9L/AA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BJ+REdOOU26G9ad9XcSeLSyblI4tigLc+DZn3j7z+pMBYsenlvPMIK9+3oDHDWk/w
 6YfN9+LuTCM4keU1xpH4oshl1rKyelnlWDjbuRiU1umFFpgFFObh1sIbEwrDyiaDVI
 erP/IBYCcGTsdvoyQvsPZ4L02f2kQZeT1Khe2hDkBPhYZk+v6x7r2u1n8bJb9jGtGb
 OF1DGnRBmcvwOQEB4WK4Se1NpENTd0bxefIJygYrEzh6hXCSF7mXPk00rraRZie0Zp
 9ZrLuZOLy9NfGW5RuD73zgwSFxminkIcm+h5dnphQDXo2aHvZBLuqEqoyNuAjnJKse
 lYkVaS/IyrD3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02DCB3809A80; Tue,  3 Mar 2026 04:47:03 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177251322154.625663.1785427574755264345.git-patchwork-notify@kernel.org>
Date: Tue, 03 Mar 2026 04:47:01 +0000
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 00/14] net: stmmac: further
	cleanups
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
X-Rspamd-Queue-Id: DCF731E9098
X-Rspamd-Server: lfdr
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
	NEURAL_HAM(-0.00)[-0.973];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 27 Feb 2026 09:52:38 +0000 you wrote:
> Hi,
> 
> Yet another bunch of patches cleaning up the stmmac driver.
> 
> We start off by cleaning up the formatting for stmmac_mac_finish(). Then
> remove a plat_dat->port_node which is redundant, followed by several
> descriptor methods that aren't called.
> 
> [...]

Here is the summary with links:
  - [net-next,01/14] net: stmmac: clean up formatting in stmmac_mac_finish()
    https://git.kernel.org/netdev/net-next/c/940ec40dd299
  - [net-next,02/14] net: stmmac: remove plat_dat->port_node
    https://git.kernel.org/netdev/net-next/c/44a2ec96d374
  - [net-next,03/14] net: stmmac: remove .get_tx_owner()
    https://git.kernel.org/netdev/net-next/c/d48ba98bbc82
  - [net-next,04/14] net: stmmac: remove .get_tx_ls()
    https://git.kernel.org/netdev/net-next/c/1fe444bdc583
  - [net-next,05/14] net: stmmac: remove .get_tx_len()
    https://git.kernel.org/netdev/net-next/c/19f2d59c3c3a
  - [net-next,06/14] net: stmmac: remove dwmac4 DMA_CHAN_INTR_DEFAULT_[TR]X*
    https://git.kernel.org/netdev/net-next/c/d1925291231e
  - [net-next,07/14] net: stmmac: remove dwmac410_(enable|disable)_dma_irq
    https://git.kernel.org/netdev/net-next/c/0e7cb34d0f6c
  - [net-next,08/14] net: stmmac: remove mac->xlgmac
    https://git.kernel.org/netdev/net-next/c/70bafb53b305
  - [net-next,09/14] net: stmmac: make extend_desc boolean
    https://git.kernel.org/netdev/net-next/c/ecb037f58da7
  - [net-next,10/14] net: stmmac: make chain_mode a boolean
    https://git.kernel.org/netdev/net-next/c/a2a3832ad76d
  - [net-next,11/14] net: stmmac: make dma_cfg mixed/fixed burst boolean
    https://git.kernel.org/netdev/net-next/c/1558705afbb2
  - [net-next,12/14] net: stmmac: move initialisation of dma_cfg->atds
    https://git.kernel.org/netdev/net-next/c/0835bc72510f
  - [net-next,13/14] net: stmmac: simplify atds initialisation
    https://git.kernel.org/netdev/net-next/c/93cde989bd28
  - [net-next,14/14] net: stmmac: move DMA configuration validation to driver probe
    https://git.kernel.org/netdev/net-next/c/07a8531d4427

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
