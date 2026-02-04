Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNTnLQG7gmnLZQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 04:20:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51798E1368
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 04:20:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2F8FC58D7A;
	Wed,  4 Feb 2026 03:20:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A56A6C0693E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 03:20:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F89940ABA;
 Wed,  4 Feb 2026 03:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B528C116D0;
 Wed,  4 Feb 2026 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770175230;
 bh=gHmM2ZjEnro/lzlK6i3SYqm0I447P+5N5u36K6NBE74=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=f1wYf+14b9gipvn5gApCoaFoofSrRCcAIpPqhc4t8SWqgaGlq3poYYuJC44mEUltH
 XH2Dp4Ix+weI4Rsih59lSfkfZ3lguVBhUYNraPz5l8Xk418NhHWudJSgNOVyr+jT1p
 esxkHWU9Iew4U7gib8v+puHX9RFNCI6IsznnOZlwpc4EIkDlYzHy8E0Frcz+yqiJl0
 mCo0v+qif36W7m3z/1/k+vfR/twXPpWBN2DIKBXdEbQhfRCLDwtRTxBKzqQKa7QWje
 4ywzjUrOpyMsqf+G8ASrrCbjw1ZQTrQMgI0yPbuRzsTJtvu4XqllZwlMtt/DlcBzvu
 qW+xQvLRLPamQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 910193808200; Wed,  4 Feb 2026 03:20:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177017522608.2163463.14435686221837710351.git-patchwork-notify@kernel.org>
Date: Wed, 04 Feb 2026 03:20:26 +0000
References: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
In-Reply-To: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/10] net: stmmac: rk:
 cleanups v3: mode and speed for most
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
	DKIM_TRACE(0.00)[kernel.org:-];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 51798E1368
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 2 Feb 2026 10:03:28 +0000 you wrote:
> Hi,
> 
> Third installment in the rk cleanups, this converts the interface mode
> and speed configuration for most RK SoCs.
> 
> --
> v2: disable clocks on regmap_write() failure
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/10] net: stmmac: rk: convert to mask-based interface mode configuration
    https://git.kernel.org/netdev/net-next/c/31d28d062aa8
  - [net-next,v2,02/10] net: stmmac: rk: convert rk3588 to mask-based interface mode config
    https://git.kernel.org/netdev/net-next/c/600fe01e947a
  - [net-next,v2,03/10] net: stmmac: rk: move speed GRF register offset to private data
    https://git.kernel.org/netdev/net-next/c/82d1df4b4143
  - [net-next,v2,04/10] net: stmmac: rk: convert rk3588 to rk_set_reg_speed()
    https://git.kernel.org/netdev/net-next/c/8e4b4004e847
  - [net-next,v2,05/10] net: stmmac: rk: remove rk3528 RMII clock initialisation
    https://git.kernel.org/netdev/net-next/c/0c8107dbe720
  - [net-next,v2,06/10] net: stmmac: rk: use rk_encode_wm16() for RGMII clocks
    https://git.kernel.org/netdev/net-next/c/b9544c128c30
  - [net-next,v2,07/10] net: stmmac: rk: use rk_encode_wm16() for RMII speed
    https://git.kernel.org/netdev/net-next/c/4dc66f93b419
  - [net-next,v2,08/10] net: stmmac: rk: use rk_encode_wm16() for RMII clock
    https://git.kernel.org/netdev/net-next/c/33c5c9473a23
  - [net-next,v2,09/10] net: stmmac: rk: remove need for ->set_speed() method
    https://git.kernel.org/netdev/net-next/c/3cf4dfa7b040
  - [net-next,v2,10/10] net: stmmac: rk: convert px30
    https://git.kernel.org/netdev/net-next/c/5031e35f3499

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
