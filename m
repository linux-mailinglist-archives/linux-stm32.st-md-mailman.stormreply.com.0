Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF+4AEULeWkiuwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 20:00:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77499840
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 20:00:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0C8CC01FBF;
	Tue, 27 Jan 2026 19:00:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24521C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 19:00:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D679343EE0;
 Tue, 27 Jan 2026 19:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9F7C19422;
 Tue, 27 Jan 2026 19:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769540416;
 bh=c1tXqNRpIYOMWP0VFHYLgja6KaJDZeX2rziUlYI6lDE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Kj6gRbXeAmfTn/JBCTT62O3iJ8jjNV0u8rFD8iC71YBpUat13frCXksenXJKLoz9g
 hRhUOkDar/NaTyShKpK5y49wYwlmswiVzimXTkUkX5BvROrEvODNBWyT44vKUuJoh5
 4xsX19vKoY4Apd9ByWqlwUnrBiocX76se2AxxVl/tBsiGItUtvkfm7s6xUQQRcLRrv
 Xj1bcXD04XTPLQDHbimStBP3TSOIaSlVwE0rY+24QkxvKPJYoQbcWv/Yz64lyAvfoa
 yDajGi5xBggK1h2IdV6VK6+43VhcO/MZfUQBYpm4oVAkd9TuOH9RPallLkOa+sRhpH
 3PgF9cTXkY3IQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 C8C95380AA58; Tue, 27 Jan 2026 19:00:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176954041060.1365394.14963614525906963591.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 19:00:10 +0000
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
In-Reply-To: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/22] net: stmmac: rk:
 simplify per-SoC configuration
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	TAGGED_FROM(0.00)[netdevbpf];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4A77499840
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 26 Jan 2026 11:44:11 +0000 you wrote:
> [Please note: due to google's spam filtering, I can no longer send
> patch series to @gmail.com addresses, and thus, to save being spammed
> with failed deliveries, I'm dropping such addresses from my patch
> series. Stop giving google so much power, use other email services.]
> 
> dwmac-rk has an excessive variability between each individual SoCs
> which makes this file extremely large.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/22] net: stmmac: rk: avoid phy_power_on()
    https://git.kernel.org/netdev/net-next/c/a0094edaf492
  - [net-next,v2,02/22] net: stmmac: rk: get rid of rk_phy_power_ctl()
    https://git.kernel.org/netdev/net-next/c/af6eaf701897
  - [net-next,v2,03/22] net: stmmac: rk: convert rk3328 to use bsp_priv->id
    https://git.kernel.org/netdev/net-next/c/cdb5fdfcf396
  - [net-next,v2,04/22] net: stmmac: rk: group MACPHY register offset and fields together
    https://git.kernel.org/netdev/net-next/c/a7ad67e9745d
  - [net-next,v2,05/22] net: stmmac: rk: add GMAC_CLK_xx constants, simplify RGMII definitions
    (no matching commit)
  - [net-next,v2,06/22] net: stmmac: rk: add SoC specific ->init() method
    (no matching commit)
  - [net-next,v2,07/22] net: stmmac: rk: convert to mask-based interface mode configuration
    (no matching commit)
  - [net-next,v2,08/22] net: stmmac: rk: convert rk3588 to mask-based interface mode config
    (no matching commit)
  - [net-next,v2,09/22] net: stmmac: rk: move speed GRF register offset to private data
    (no matching commit)
  - [net-next,v2,10/22] net: stmmac: rk: convert rk3588 to rk_set_reg_speed()
    (no matching commit)
  - [net-next,v2,11/22] net: stmmac: rk: remove rk3528 RMII clock initialisation
    (no matching commit)
  - [net-next,v2,12/22] net: stmmac: rk: use rk_encode_wm16() for RGMII clocks
    (no matching commit)
  - [net-next,v2,13/22] net: stmmac: rk: use rk_encode_wm16() for RMII speed
    (no matching commit)
  - [net-next,v2,14/22] net: stmmac: rk: use rk_encode_wm16() for RMII clock
    (no matching commit)
  - [net-next,v2,15/22] net: stmmac: rk: remove need for ->set_speed() method
    (no matching commit)
  - [net-next,v2,16/22] net: stmmac: rk: convert px30
    (no matching commit)
  - [net-next,v2,17/22] net: stmmac: rk: introduce flags indicating support for RGMII/RMII
    (no matching commit)
  - [net-next,v2,18/22] net: stmmac: rk: replace empty set_to_rmii() with supports_rmii
    (no matching commit)
  - [net-next,v2,19/22] net: stmmac: rk: rk3328: gmac2phy only supports RMII
    (no matching commit)
  - [net-next,v2,20/22] net: stmmac: rk: rk3528: gmac0 only supports RMII
    (no matching commit)
  - [net-next,v2,21/22] net: stmmac: rk: use rk_encode_wm16() for clock selection
    (no matching commit)
  - [net-next,v2,22/22] net: stmmac: rk: rk3506, rk3528 and kk3588 have rmii_mode in clock register
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
