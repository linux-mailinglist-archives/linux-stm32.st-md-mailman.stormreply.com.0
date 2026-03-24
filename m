Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG0gJHvdwWnxXQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 01:40:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDD62FFD13
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 01:40:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9358AC87EC5;
	Tue, 24 Mar 2026 00:40:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77D68C56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 00:40:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6308960120;
 Tue, 24 Mar 2026 00:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F0AC4CEF7;
 Tue, 24 Mar 2026 00:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774312824;
 bh=btYs4VEc0poy2Koo3Piud4wH+ItfAcitrk7kH+kgg4Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=otgPlMp8nLSa9QtK2QV9+4EArr7VD2cGlymo/MAOl9xOxt+d2wFXF6O7E/wlwtLwy
 /QmeFsU6DH3Fy2GlmcIlH1l3/Y6HFx3dOipUKcI5h0i1cZRxjylLjh9PhXKF04jq3Z
 xidLVVloQFWBfFTCi7L951RRBgoidIjgr7o8qfaz0oBRcPJUJ66oeVJkhWbFKsDQA3
 CN8T2IQBLb1t+ofJc5govdyN+23scnt6JYIXcz+aWF6chqMUWaQ2VxVFC7b9iDbd+8
 ViXMCX+hGRY0fuXizhO0y6GIuZUfHCToZaOwPVwAKoh4suNBFlH/GYSLUmJ2rBeE3r
 OY4iqA/CaVFbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7CEE93808200; Tue, 24 Mar 2026 00:40:13 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177431281229.391430.10437162930638421849.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 00:40:12 +0000
References: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
In-Reply-To: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, mohd.anwar@oss.qualcomm.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 maybe? 0/5] net: stmmac:
	improve PCS support
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[kernel.org:-];
	TAGGED_FROM(0.00)[netdevbpf];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 0CDD62FFD13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Mar 2026 16:05:53 +0000 you wrote:
> I am losing track of what version we're at, because each time the
> series is reworked, changing the approach, which changes the
> patches quite a bit, it makes it difficult. We've gone RFC to non-RFC
> back to RFC and then to non-RFC again.
> 
> This series is the next of the three part series sorting out the PCS
> support in stmmac, building on part 2:
> 
> [...]

Here is the summary with links:
  - [net-next,v2,maybe?,1/5] net: stmmac: move default_an_inband to plat_stmmacenet_data
    https://git.kernel.org/netdev/net-next/c/9a475dc71c38
  - [net-next,v2,maybe?,2/5] net: stmmac: add struct stmmac_pcs_info
    https://git.kernel.org/netdev/net-next/c/7d5a2da501e0
  - [net-next,v2,maybe?,3/5] net: stmmac: add support for reading inband SGMII status
    https://git.kernel.org/netdev/net-next/c/083757866735
  - [net-next,v2,maybe?,4/5] net: stmmac: add BASE-X support to integrated PCS
    https://git.kernel.org/netdev/net-next/c/68cff4fff61f
  - [net-next,v2,maybe?,5/5] net: stmmac: use integrated PCS for BASE-X modes
    https://git.kernel.org/netdev/net-next/c/365c62c8b530

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
