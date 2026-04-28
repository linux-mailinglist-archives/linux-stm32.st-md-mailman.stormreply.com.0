Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE74OAuR8Gl4UwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2026 12:50:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81379482F41
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2026 12:50:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10B42C87EDF;
	Tue, 28 Apr 2026 10:50:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E677BC1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2026 10:50:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BC94960154;
 Tue, 28 Apr 2026 10:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B326C2BCAF;
 Tue, 28 Apr 2026 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777373448;
 bh=0cuZ4nY0AbQu+qq/AL+Yse47A4Z10Pa0BfVJC9kTurM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DKk5tgQcak2+Ipn1aFgnj+gK7y+qMU+mqZLdurDKXospQQm0b5lWg5kEVOCh0yFrS
 wnHyeh3o/G4zbZ2Nmg45NX7CL1ZMKo/9AEjeF14WvsAS6XF6+NWqYqSq2D9BPpzIT0
 Bn0yalC9+9y0a1Zqiupd590wdA0HMUTwaGAGTXthW9ErGIR1yRv/5MOJWu138jEVo2
 5wLR5pPWwDPM6ZOHgaWY1jaG4Aizuyxpe5Q9lJJWn7qWb7vaKDaWPqlMSs6bEkKFAF
 /YP4yhNGwwXwSqCcdRQnu4RvU/SWFHSUq9qEXPaz79u6//BKT7qcbDAb6Uilyre+ke
 aKW+ZiL5MMiLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7CD903930196; Tue, 28 Apr 2026 10:50:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177737340530.407008.57733216818450708.git-patchwork-notify@kernel.org>
Date: Tue, 28 Apr 2026 10:50:05 +0000
References: <20260422044503.5349-1-CFSworks@gmail.com>
In-Reply-To: <20260422044503.5349-1-CFSworks@gmail.com>
To: Sam Edwards <cfsworks@gmail.com>
Cc: baruch@tkos.co.il, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 CFSworks@gmail.com, vladimir.oltean@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, edumazet@google.com,
 netdev@vger.kernel.org, stable@vger.kernel.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net v6] net: stmmac: Prevent NULL deref
 when RX memory exhausted
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
X-Rspamd-Queue-Id: 81379482F41
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:linux@armlinux.org.uk,m:CFSworks@gmail.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:fancer.lancer@gmail.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:stable@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,armlinux.org.uk,gmail.com,nxp.com,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,st.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	NEURAL_SPAM(0.00)[0.983];
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
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 21 Apr 2026 21:45:03 -0700 you wrote:
> The CPU receives frames from the MAC through conventional DMA: the CPU
> allocates buffers for the MAC, then the MAC fills them and returns
> ownership to the CPU. For each hardware RX queue, the CPU and MAC
> coordinate through a shared ring array of DMA descriptors: one
> descriptor per DMA buffer. Each descriptor includes the buffer's
> physical address and a status flag ("OWN") indicating which side owns
> the buffer: OWN=0 for CPU, OWN=1 for MAC. The CPU is only allowed to set
> the flag and the MAC is only allowed to clear it, and both must move
> through the ring in sequence: thus the ring is used for both
> "submissions" and "completions."
> 
> [...]

Here is the summary with links:
  - [net,v6] net: stmmac: Prevent NULL deref when RX memory exhausted
    https://git.kernel.org/netdev/net/c/0bb05e6adfa9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
