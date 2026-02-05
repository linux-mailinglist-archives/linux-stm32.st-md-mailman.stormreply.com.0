Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLBkD/AjhGnKzgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 06:00:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A07EE9B6
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 06:00:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB31EC87ED3;
	Thu,  5 Feb 2026 05:00:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EE38C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 05:00:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECE9B44487;
 Thu,  5 Feb 2026 05:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE6AC4CEF7;
 Thu,  5 Feb 2026 05:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770267627;
 bh=Ugwf7nuySvJF0pm1EZ6sYChpkqrG6unVjUpZaqu1rqk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TJgo7JQx+lazQiQ1XhvOHdzF8+jsz824b6KYy2ao9gY9WRIG3OIcXz9/vE2oFX+Ju
 fyw1TcMkhjKVnLNdMv0dCAJoXbgmjscU52Ke/ws/ETVtowrAP8gu/6c3C9tjHGb32B
 mKyfYmKjZ1n6Nyn4T1042T+6cOUlp8OjgHvTUUDtCEAql5jioCiDNN9pdU2FJsTzSW
 hymWQurh+xvwATFyG3R2lTy8sky0Lf07FQuQFgoMIAioLBb437t8CwUNiofuerzRIO
 m1O8nODDuJ/+Ycv8Gas1GhTNjmzmOFAwI137AB6EYj1eNbxiraQyOGbUaWYDmVzKG3
 MG7gD5t3I3XEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 0B3143808200; Thu,  5 Feb 2026 05:00:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177026762582.167759.9447025168347496232.git-patchwork-notify@kernel.org>
Date: Thu, 05 Feb 2026 05:00:25 +0000
References: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
In-Reply-To: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, mohd.anwar@oss.qualcomm.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/4] net: stmmac: fix serdes
	power methods
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[netdevbpf];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 13A07EE9B6
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 3 Feb 2026 10:00:58 +0000 you wrote:
> The stmmac serdes powerup/powerdown methods are not guaranteed to be
> called in a balancing fashion, but these are used to call the generic
> PHY subsystem's phy_power_up() and phy_power_down() methods which do
> require balanced calls.
> 
> This series addresses this by making the stmmac serdes methods balanced.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: stmmac: add wrappers for serdes_power[up|down]() methods
    https://git.kernel.org/netdev/net-next/c/3302126a9b2b
  - [net-next,2/4] net: stmmac: add state tracking for legacy serdes power state
    https://git.kernel.org/netdev/net-next/c/9bfcf5460b70
  - [net-next,3/4] net: stmmac: add missing serdes power down in error paths
    https://git.kernel.org/netdev/net-next/c/3019a1333e66
  - [net-next,4/4] net: stmmac: move serdes power methods to stmmac_[open|release]()
    https://git.kernel.org/netdev/net-next/c/61aaa6253714

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
