Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JePNU/4oGmboQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 02:50:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4F1B1A10
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 02:50:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19678C87EC5;
	Fri, 27 Feb 2026 01:50:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A324C87EBE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 01:50:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E540600AE;
 Fri, 27 Feb 2026 01:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB567C116C6;
 Fri, 27 Feb 2026 01:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772157003;
 bh=zEIkP0v+Gt6GKxEd6rrduCgxlWdMNrWP0C7sJGM9NSY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CmbRBvhE8XpF06ktiuTWDldt8B3JOhztqsyrsGnCtopGkKWJbUKXD6rOrA4HWEZZu
 o2J7w+J8JyjfPG7HU/WZOPjF4vVlAINDAwTdtvBpw8a9fZWHOZ/cAi24HVfvJCscYL
 i9rUOTanNM6xLJzmbWWQqpMaaIYRQy8GRMxj0G9Qat4QoEI7Fmaoiu1VgphqdTvAsx
 nZA13RyQ/gGLtC1GanNG9puhtv2e4d4Ws5QjW4l0I46KQn/z18ISjzzaZJuTSnXK4D
 zcsgF6y+8lwL1cOXHiB9yhL5TZQKo6LmZDfAJtTATIHt7dBAS5DO0ZmPkYRlPIs8yP
 N96jAjMs4B2ow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02CA5393109B; Fri, 27 Feb 2026 01:50:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177215700779.1935486.3167937625716884926.git-patchwork-notify@kernel.org>
Date: Fri, 27 Feb 2026 01:50:07 +0000
References: <E1vvBhn-0000000ArCg-4C4u@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vvBhn-0000000ArCg-4C4u@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: ptp: limit
	n_per_out
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
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:Jose.Abreu@synopsys.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.905];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 68A4F1B1A10
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 25 Feb 2026 10:01:19 +0000 you wrote:
> ptp_clock_ops.n_per_out sets the number of PPS outputs, which the PTP
> subsystem uses to validate userspace input, such as the index number
> used in a PTP_CLK_REQ_PEROUT request.
> 
> stmmac_enable() uses this to index the priv->pps array, which is an
> array of size STMMAC_PPS_MAX. ptp_clock_ops.n_per_out is initialised
> using priv->dma_cap.pps_out_num, which is a three bit field read from
> hardware.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: ptp: limit n_per_out
    https://git.kernel.org/netdev/net-next/c/5c894879f17c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
