Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KHOCiy4zmmTpgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 20:40:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FD638D481
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 20:40:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37724C55590;
	Thu,  2 Apr 2026 18:40:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FB2DC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Apr 2026 18:40:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1518E60123;
 Thu,  2 Apr 2026 18:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFF6C116C6;
 Thu,  2 Apr 2026 18:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775155240;
 bh=pmcwFe1wHetLptQwyfU3HCeP9GSzNzMSqxhSN5vyyo4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=eg/qIUmHH0zmmJTDhNc6+zkD4z3hZZ/uP9DfdAk1Aq9DtrvXoz4k58M7heedS8qpL
 eNy71ongaIVLZ+962RRrwgzBeyDovEvg4/yQEYwrKKZmm8qYSWLmwMgqp0CfOWaeP5
 +Wcrt5lx1ysm/XBhI6xmKizYyezqF7s4skIOFmzbvCu8J6J1rek/5dGoc+Cj23pgLt
 BIrUbARdMiz3lDwov9b7j6jqarriuniRf7sAlxRSwWdKMUhLlslck0O/kaBVuRsnQj
 0zM02fBVHjSRozus5bPVaLQVy5fa43wV5PvbH3t57t5kFQVVGGTo68QwqcZufQY/VI
 cjAGPZsHWI0QQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FF843809A09; Thu,  2 Apr 2026 18:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177515522304.572495.5047092891296862297.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 18:40:23 +0000
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, boon.leong.ong@intel.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: TSO
	fixes/cleanups
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
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.leong.ong@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.867];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B0FD638D481
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 1 Apr 2026 08:20:52 +0100 you wrote:
> This is a more refined version of the previous patch series fixing
> and cleaning up the TSO code.
> 
> I'm not sure whether "TSO" or "GSO" should be used to describe this
> feature - although it primarily handles TCP, dwmac4 appears to also
> be able to handle UDP.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/14] net: stmmac: fix channel TSO enable on resume
    https://git.kernel.org/netdev/net-next/c/989a9c20f63e
  - [net-next,v2,02/14] net: stmmac: fix .ndo_fix_features()
    https://git.kernel.org/netdev/net-next/c/afe840ddf15c
  - [net-next,v2,03/14] net: stmmac: fix TSO support when some channels have TBS available
    https://git.kernel.org/netdev/net-next/c/e32820264c29
  - [net-next,v2,04/14] net: stmmac: add stmmac_tso_header_size()
    https://git.kernel.org/netdev/net-next/c/f799b5dab9c9
  - [net-next,v2,05/14] net: stmmac: add TSO check for header length
    https://git.kernel.org/netdev/net-next/c/6732e474f880
  - [net-next,v2,06/14] net: stmmac: add GSO MSS checks
    https://git.kernel.org/netdev/net-next/c/c05a81cbee87
  - [net-next,v2,07/14] net: stmmac: move TSO VLAN tag insertion to core code
    https://git.kernel.org/netdev/net-next/c/3f6a6eb9ef21
  - [net-next,v2,08/14] net: stmmac: move check for hardware checksum supported
    https://git.kernel.org/netdev/net-next/c/b55dfb173ce8
  - [net-next,v2,09/14] net: stmmac: simplify GSO/TSO test in stmmac_xmit()
    https://git.kernel.org/netdev/net-next/c/2e4082e4b739
  - [net-next,v2,10/14] net: stmmac: split out gso features setup
    https://git.kernel.org/netdev/net-next/c/c04939cb9851
  - [net-next,v2,11/14] net: stmmac: make stmmac_set_gso_features() more readable
    https://git.kernel.org/netdev/net-next/c/6ad004442897
  - [net-next,v2,12/14] net: stmmac: add warning when TSO is requested but unsupported
    https://git.kernel.org/netdev/net-next/c/f8c70ab540c1
  - [net-next,v2,13/14] net: stmmac: check txpbl for TSO
    https://git.kernel.org/netdev/net-next/c/33f5cc83bbbd
  - [net-next,v2,14/14] net: stmmac: move "TSO supported" message to stmmac_set_gso_features()
    https://git.kernel.org/netdev/net-next/c/0f96212a5142

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
