Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XorLFT5oq2l4cwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Mar 2026 00:50:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF5228DAA
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Mar 2026 00:50:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D942C8F290;
	Fri,  6 Mar 2026 23:50:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 854E7C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 23:50:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7ED9E60018;
 Fri,  6 Mar 2026 23:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2844AC4CEF7;
 Fri,  6 Mar 2026 23:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772841018;
 bh=BQW73dxoFvf8W9lwbY5JOxppl2jq+PcUgOfCJhuasFc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=AZeceoFWUBzHrcZ1cwO/gNZKKGnTGYzoaTq4ZcmJ3PkLhzEbo1YHEm2P3D5sQjNah
 JjVGGBxD6egmPXbetoSy8xZDIcG7gkwDbLTv3d/Vdx9zRojsBKqtn/KbKJrrR9mW+6
 MIV9N1wlDdcbQPQuhvlxyWU+0t50ePLZCkAUFTaj2K0//qhaOvAvcWsz8Jcc54ruep
 jmY9pkf1Wox7Jr4uIiIbFPmyYyKeHR3AMV/JyMKulw/n+PpejERXJxN5BzHzb1rq2e
 3xAf9jv6V2j0O2tQhW0Zek11e/SysJwH3PkaOZ1yaV1orDHOOdjKJP/RgKNtSEUT2f
 9p25rXvQLGR7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7CF413808200; Fri,  6 Mar 2026 23:50:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177284101730.95361.6178473364485118037.git-patchwork-notify@kernel.org>
Date: Fri, 06 Mar 2026 23:50:17 +0000
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, pabeni@redhat.com, samuel@sholland.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, wens@kernel.org,
 linux-sunxi@lists.linux.dev, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/8] net: stmmac: mdio related
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
X-Rspamd-Queue-Id: D1FF5228DAA
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
	DKIM_TRACE(0.00)[kernel.org:-];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.564];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 5 Mar 2026 10:42:03 +0000 you wrote:
> Hi,
> 
> The first four patches clean up the MDC clock divisor selection code,
> turning the three different ways we choose a divisor into tabular form,
> rather than doing the selection purely in code.
> 
> Convert MDIO to use field_prep() which allows a non-constant mask to be
> used when preparing fields.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/8] net: stmmac: mdio: convert MDC clock divisor selection to tables
    https://git.kernel.org/netdev/net-next/c/4c7e0e081889
  - [net-next,v2,2/8] net: stmmac: mdio: use same test for MDC clock divisor lookups
    https://git.kernel.org/netdev/net-next/c/b6687ef97603
  - [net-next,v2,3/8] net: stmmac: mdio: simplify MDC clock divisor lookup
    https://git.kernel.org/netdev/net-next/c/506f78f43c58
  - [net-next,v2,4/8] net: stmmac: mdio: convert field prep to use field_prep()
    https://git.kernel.org/netdev/net-next/c/58bd0039002b
  - [net-next,v2,5/8] net: stmmac: use u32 for MDIO register field masks
    https://git.kernel.org/netdev/net-next/c/df388b4d3913
  - [net-next,v2,6/8] net: stmmac: use GENMASK_U32() for mdio bitfields
    https://git.kernel.org/netdev/net-next/c/a64d927aecf1
  - [net-next,v2,7/8] net: stmmac: mdio_bus_data->default_an_inband is boolean
    https://git.kernel.org/netdev/net-next/c/3cd963fa915c
  - [net-next,v2,8/8] net: stmmac: make pcs_mask and phy_mask u32
    https://git.kernel.org/netdev/net-next/c/e4fd855c52ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
