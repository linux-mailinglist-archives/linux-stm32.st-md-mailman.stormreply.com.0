Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IDmaHCKVPGpupggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 04:40:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E06C26BF
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 04:40:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=P7na+Pil;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B11BC58D7B;
	Thu, 25 Jun 2026 02:40:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14DF9C57B41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 02:40:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C23C540587;
 Thu, 25 Jun 2026 02:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A318D1F000E9;
 Thu, 25 Jun 2026 02:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782355230;
 bh=p3p64QLxeoSw9Yq4VL1TE72ZFtwb/GGd34Qq6hX/+TA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=P7na+PilaTea4ySP01h/CB9/1d51ZEgJcB7t4yjiyW9Ebe7bbB7g6R4goX2Rmjp0H
 cLTNwxK3eGUO/45R/Th60rbmu7WVB71uVsdxW6Eug3N7pygfq0v/uHvrGk3WSpYxYk
 woZZHkRYnTntt0wUy7+jl6jsPvOAVL5NrKXIH26Ej6JVfwLVHAXh93JXiyoT+NOPMM
 Mx1HIGld4tyrEBuL39iT9CmYKVGY59II1ErPcDFch1hfcX3mf24hIiJqp+ijX8Ic0Z
 AM1gKYE6qD2JJJPKsFnv22Cg//Hmj/3qWuDHLSkuJPoGGNFJKA6ATQwzlhLbARGgl2
 1mhHuKPw/iXLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 199423AAA6DE; Thu, 25 Jun 2026 02:40:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178235521877.3091545.4674535688381617061.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jun 2026 02:40:18 +0000
References: <20260623074637.503864-1-inochiama@gmail.com>
In-Reply-To: <20260623074637.503864-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 netdev@vger.kernel.org, looong.bin@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, dlan@gentoo.org,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 dlan@kernel.org, kuba@kernel.org, linux-riscv@lists.infradead.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 0/2] net: stmmac: dwmac-spacemit:
 Fix wrong macro definition
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:linux-kernel@vger.kernel.org,m:spacemit@lists.linux.dev,m:netdev@vger.kernel.org,m:looong.bin@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:dlan@gentoo.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:dlan@kernel.org,m:kuba@kernel.org,m:linux-riscv@lists.infradead.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:looongbin@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com,gentoo.org,lunn.ch,google.com,kernel.org,lists.infradead.org,redhat.com,armlinux.org.uk,davemloft.net];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F15E06C26BF

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 23 Jun 2026 15:46:33 +0800 you wrote:
> Fix Wrong macro definition of the Spacemit K3.
> 
> Changed from v1:
> - https://lore.kernel.org/netdev/20260618064143.1102179-1-inochiama@gmail.com
> 1. Separate the patch into two patches
> 2. Use the right macro name for the LPI interrupt.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: stmmac: dwmac-spacemit: Fix wrong phy interface definition
    https://git.kernel.org/netdev/net/c/d1e3a4c3b24d
  - [net,v2,2/2] net: stmmac: dwmac-spacemit: Fix wrong irq definition
    https://git.kernel.org/netdev/net/c/bf5cd5d4ca42

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
