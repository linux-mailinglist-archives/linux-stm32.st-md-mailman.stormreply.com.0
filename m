Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HYqKkXexWk9CgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 02:32:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7633DDB3
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 02:32:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBE33C8F286;
	Fri, 27 Mar 2026 01:32:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 489D2C8F281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2026 01:32:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1025060103;
 Fri, 27 Mar 2026 01:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4761C19423;
 Fri, 27 Mar 2026 01:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774575169;
 bh=2jW+B2lXjwLgZb3cDkL7mX6Gb7T5UWGOWeSgPIBscW0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZXDXEZvrfbba5SXaPx+s9TyX3f3xwmko6tdteBUp4OqwMzZl2Tu3DijxDIkmFmNGw
 PQI73u+fc0F62JnMperkHNN/7SG1wze0fLP8r5FfS3+XMYLHSQsUVT/5cKFSff4+4w
 B9EU2vPnuacs3cFkGNUaC3kWDJPF5YsYUJIzGYmJCxhG2hNuLFW5bo9mo0SCnGiEPa
 QzdDqnhMFZDvE285ndvp29Ns0cBLREcUN5xmVFjQj9N7KVgsOwsrmLBzqy57bAFCUE
 5TJwCWQs8YgIyLaJ9k1ukwWOBbNTGDN7z4KzzKZmJ+eplrm0BT4ZbNzG1PjwQpgSYc
 TKUelsOgpRznw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 400403809A07; Fri, 27 Mar 2026 01:32:37 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177457515578.3250412.707977713955076913.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 01:32:35 +0000
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 rohan.g.thomas@altera.com, linux@armlinux.org.uk, mun.yew.tham@altera.com,
 edumazet@google.com, alexis.lothore@bootlin.com, horms@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: dwmac-socfpga:
 Cleanup .fix_mac_speed
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
	FREEMAIL_CC(0.00)[lists.infradead.org,lunn.ch,gmail.com,bootlin.com,vger.kernel.org,st-md-mailman.stormreply.com,altera.com,armlinux.org.uk,google.com,kernel.org,redhat.com,davemloft.net];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelin.stm32@gmail.com,m:thomas.petazzoni@bootlin.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:rohan.g.thomas@altera.com,m:linux@armlinux.org.uk,m:mun.yew.tham@altera.com,m:edumazet@google.com,m:alexis.lothore@bootlin.com,m:horms@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.794];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 43B7633DDB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 24 Mar 2026 10:20:55 +0100 you wrote:
> Hi everyone,
> 
> This small series does a bit of cleanup in the dwmad-socfpga glue
> driver, especially around the .fix_mac_speed() operation.
> 
> It's mostly about re-using existing helpers from the glue driver, as
> well as reorganizing the code to make the local private structures a
> little bit smaller.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: stmmac: dwmac-socfpga: Move internal helpers
    https://git.kernel.org/netdev/net-next/c/845a04411118
  - [net-next,2/5] net: stmmac: dwmac-socfpga: Use the socfpga_sgmii_config() helper
    https://git.kernel.org/netdev/net-next/c/a7be7cc12442
  - [net-next,3/5] net: stmmac: dwmac-socfpga: Use the correct type for interface modes
    https://git.kernel.org/netdev/net-next/c/9b04ecdfb876
  - [net-next,4/5] net: stmmac: dwmac-socfpga: get the phy_mode with the dedicated helper
    https://git.kernel.org/netdev/net-next/c/adf1536f79a5
  - [net-next,5/5] net: stmmac: dwmac-sofcpga: Drop the struct device reference
    https://git.kernel.org/netdev/net-next/c/9bd1af853750

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
