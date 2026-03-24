Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI00KXxzwmmncwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 12:20:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3FF3072F0
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 12:20:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD856C87ECC;
	Tue, 24 Mar 2026 11:20:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAF62C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:20:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4E6E943AFF;
 Tue, 24 Mar 2026 11:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EFAC19424;
 Tue, 24 Mar 2026 11:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774351225;
 bh=/VGB9nDd+/GqixMK/Q1YavpbNhgLz5r5U6tvuEB+cXY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=l/hgYGwPIylBRr2b7EK+ZSRcvcDiOQEreu0KBHfd+RJFFiPiQ0w8YDUyOePjCxDRi
 hKmfDCq57RRCm4s8eBPIfQ4j2o6O1YqxmPGABv5cg178ckxxyYG7IJ2XnGKKYFpZyW
 Qfo7s+2pH5TAjHr7CqAM4GKDe3zPUVpUORp6peyu0sA4y6W54URZCCjk27IovDdBAB
 jK3BmoajfAu1505VN89k1ESTMTl1ffMr381p7NN5MgCMG3oK/KoqUAoiIBWqP0mj1j
 zIA64jnsZX1rmfuOB/BfR4SVvY8ffIBuxSkhW3gWr7tBXphL3CTY1p4BmIOxmg4ckB
 wUZ4cqU71qtjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FECB3808200; Tue, 24 Mar 2026 11:20:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177435121274.629137.16512237981909489281.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 11:20:12 +0000
References: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
In-Reply-To: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: cleanup
	stmmac_xmit()
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
	NEURAL_HAM(-0.00)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3A3FF3072F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 20 Mar 2026 16:46:52 +0000 you wrote:
> This series continues on from part 2 of the descriptor cleanups, making
> stmmac_xmit() more readable.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 103 +++++++++++-----------
>  1 file changed, 52 insertions(+), 51 deletions(-)

Here is the summary with links:
  - [net-next,1/6] net: stmmac: move stmmac_xmit() skb head handling
    https://git.kernel.org/netdev/net-next/c/fcbf106189aa
  - [net-next,2/6] net: stmmac: move first xmit descriptor SARC and TBS config
    https://git.kernel.org/netdev/net-next/c/cafacdc48a74
  - [net-next,3/6] net: stmmac: move stmmac_xmit() first entry index code
    https://git.kernel.org/netdev/net-next/c/7b8683115034
  - [net-next,4/6] net: stmmac: move stmmac_xmit() initial variable init
    https://git.kernel.org/netdev/net-next/c/2e3bfeb1bc0c
  - [net-next,5/6] net: stmmac: use first_desc for TBS
    https://git.kernel.org/netdev/net-next/c/557ccd54ba14
  - [net-next,6/6] net: stmmac: elminate tbs_desc in stmmac_xmit()
    https://git.kernel.org/netdev/net-next/c/cd1f306e2815

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
