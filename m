Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A0tFJjfcmntqwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 03:40:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6866FBCD
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 03:40:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CB51C87EDE;
	Fri, 23 Jan 2026 02:40:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 571EFC5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 02:40:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 288216012B;
 Fri, 23 Jan 2026 02:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE9CC116C6;
 Fri, 23 Jan 2026 02:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769136020;
 bh=rYnv4zqtY0mBEcBw1/7t7CTHC/pA41/mg6zxkbHmxPU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=k+jWSwZ1eP5mqHx46Ett5/lsqxNiOQvUKebp39gWeNwTDWF+FbtqphuXqQfAhOznQ
 y+d6HtrISdQBTWgG2viM4t07WWlSQjd1264x2g5I/Ykz7nDh/HW7H4tPjhEGdcnjxm
 U3Lf8AFX9CRS1hUzcS/5SEf8ASUlTnzuFZZNcDsOTPH5Di026hPLQ9RFqsGtz4RdMy
 chb6Z1E65xYv/WT4Z8I0S2S4MPWpXiKmFfGopDZPRHO4LugRq7H4KQVoNr/DIAopaL
 nPWJcQlYgW9J4pHG0JKXGdiBbof6EK1MJ4VDLc1XKJlpmTViHxqYoEvaxuUDn9dayu
 7xahaO4HWKUBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 4ED5F3808200; Fri, 23 Jan 2026 02:40:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176913601709.2368645.17411798603536969153.git-patchwork-notify@kernel.org>
Date: Fri, 23 Jan 2026 02:40:17 +0000
References: <20260120203905.23805-1-eichest@gmail.com>
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 festevam@gmail.com, s.hauer@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, edumazet@google.com, netdev@vger.kernel.org,
 mcoquelin.stm32@gmail.com, francesco.dolcini@toradex.com, kuba@kernel.org,
 pabeni@redhat.com, shawnguo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: dwmac:
 enforce preamble before SFD for i.MX8MP
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[netdevbpf];
	FORGED_RECIPIENTS(0.00)[m:eichest@gmail.com,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:s.hauer@pengutronix.de,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:francesco.dolcini@toradex.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,pengutronix.de,gmail.com,st-md-mailman.stormreply.com,armlinux.org.uk,lunn.ch,google.com,toradex.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.749];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: BB6866FBCD
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 20 Jan 2026 21:30:01 +0100 you wrote:
> This series adds a new phy_device flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD
> that allows a MAC driver to request to keep the preamble bytes before
> the start frame delimiter (SFD) when receiving frames from the PHY.
> 
> This flag is set in the stmmac driver for the i.MX8MP SoC due to errata
> (ERR050694), which causes it to drop frames without a preamble.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: phy: add a new phy_device flag to keep preamble before sfd
    https://git.kernel.org/netdev/net-next/c/2153e151c27c
  - [net-next,v3,2/3] net: phy: micrel: add option to keep the preamble before sfd for KSZ9131
    https://git.kernel.org/netdev/net-next/c/fa1197a09496
  - [net-next,v3,3/3] net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP
    https://git.kernel.org/netdev/net-next/c/dc6597fab3e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
