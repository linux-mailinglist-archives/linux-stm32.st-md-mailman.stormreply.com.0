Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULn6I+hKqmmIOwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 04:32:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7A921B1F9
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 04:32:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A33BEC8F270;
	Fri,  6 Mar 2026 03:32:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E21E0C8F26F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 03:32:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 82CEE4400D;
 Fri,  6 Mar 2026 03:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63326C116C6;
 Fri,  6 Mar 2026 03:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772767972;
 bh=J5WNpI9IFOZTn+5xxMTNRdxLsLhlZZ5pCnKzZHghzHU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CiZHaT+iDF0JBJhKP5j+xHrw3HKoiJahdSNW1m5LuGTPLlSgRRlmggtREW6U1dtdu
 eO1inZLnbuc81n2FDTFA5ImteQHR8K7Bg0t6726FgJf63jOJgUMvBSTLS2j1wuHiER
 lDbPDz7PQ9WNn8Hh7HDoNbMVNAdO1dIXOyEPYVHlwcgA9Vay8p1Loo5INeR+2dSc30
 ktxCqHrbbLEEdO0HgR2MbJBI4EysmfY3ATloJ0dJpvTT1IIx0axex6J4tS6bF9v5gF
 Jn46/XT8RyMWYDrDfXYEaa5+Sp+KCyB8zeR/2CJUzESI2HgZT7uPBFh01v29Nzc94a
 PyFl4bi2dPmbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FEF53808200; Fri,  6 Mar 2026 03:32:53 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177276797180.3348267.4879154054522782350.git-patchwork-notify@kernel.org>
Date: Fri, 06 Mar 2026 03:32:51 +0000
References: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
In-Reply-To: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, mohd.anwar@oss.qualcomm.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac: qcom-ethqos:
 further serdes reorganisation
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
X-Rspamd-Queue-Id: 2E7A921B1F9
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
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[15];
	NEURAL_HAM(-0.00)[-0.766];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 3 Mar 2026 15:53:02 +0000 you wrote:
> This is part 2 of the qcom-ethqos series, part 1 and patch 2 of part 2
> has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: stmmac: qcom-ethqos: move ethqos_set_serdes_speed()
    https://git.kernel.org/netdev/net-next/c/fc8ca5da896e
  - [net-next,v2,2/7] net: stmmac: qcom-ethqos: convert to use phy_set_mode_ext()
    https://git.kernel.org/netdev/net-next/c/4999e0a2ab34
  - [net-next,v2,3/7] phy: qcom-sgmii-eth: remove .set_speed() implementation
    https://git.kernel.org/netdev/net-next/c/b7721597547d
  - [net-next,v2,4/7] phy: qcom-sgmii-eth: use PHY interface mode for SerDes settings
    https://git.kernel.org/netdev/net-next/c/d2b20acdaed8
  - [net-next,v2,5/7] phy: qcom-sgmii-eth: remove qcom_dwmac_sgmii_phy_interface()
    https://git.kernel.org/netdev/net-next/c/f82210ce8cb8
  - [net-next,v2,6/7] phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
    https://git.kernel.org/netdev/net-next/c/ebe8b48b88ad
  - [net-next,v2,7/7] net: stmmac: qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()
    https://git.kernel.org/netdev/net-next/c/038a8e8eb90d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
