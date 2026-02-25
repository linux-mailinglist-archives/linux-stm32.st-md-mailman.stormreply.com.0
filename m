Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAUaFmVVnmnyUgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 02:50:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 061DD18FFD4
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 02:50:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDA0DC8F289;
	Wed, 25 Feb 2026 01:50:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E044CC87ECA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 01:50:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9BBEA4456E;
 Wed, 25 Feb 2026 01:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697D1C2BC87;
 Wed, 25 Feb 2026 01:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771984226;
 bh=hqHD9RFlh+gmpegg8cL1nP31Ba7mVMoIC+E34e8sKf0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gbsBe58xM8CPUL4NRKk/zy0iv7QuA1oH0MYcKYyoq8dcNj6DZ7ckecjm8AXhi0KjI
 DOyD8Hrzissdqy71F50GykotYh8GgeYmZruknBLJXVvD2WGL4eApqDPJXCvn/lzeWl
 zhDXV0FkCdus+JAGYSKvddZxsyvXoKOyIBUWxiRu9i/2XgPwVQocPueik48gQbJ81r
 xeXfzP7jIcTs+/jM447N51dKgVgO9VF68eaZjloZzqZp1X3QFfBbZVJMOxA0vccWZN
 ECmLaOkZ+tgfwlwX1zBgfFrNHI8GB6IIBSKQnJ0fCFjaoyZG4k8YUywLJorp527BAy
 GH1G8qlv65iPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02D8C3808203; Wed, 25 Feb 2026 01:50:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177198423153.31093.1747668496554974371.git-patchwork-notify@kernel.org>
Date: Wed, 25 Feb 2026 01:50:31 +0000
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, mohd.anwar@oss.qualcomm.com, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, pabeni@redhat.com, vkoul@kernel.org,
 kernel@pengutronix.de, netdev@vger.kernel.org, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 00/10] net: stmmac: qcom-ethqos:
 cleanups and re-organise SerDes handling
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:vkoul@kernel.org,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.926];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 061DD18FFD4
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Feb 2026 09:33:52 +0000 you wrote:
> Hi,
> 
> As the last series had issues with stability, I've changed the approach
> in this series to concentrate on keeping much of the SerDes related
> code within the qcom-ethqos driver rather than trying to move it out at
> this stage. This means it should be possible to bisect these patches and
> pinpoint exactly the code movement that causes any instability.
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: stmmac: qcom-ethqos: rename "por" members to "rgmii_por"
    https://git.kernel.org/netdev/net-next/c/ebfc2be12ec5
  - [net-next,02/10] net: stmmac: qcom-ethqos: remove register field value obfuscations
    https://git.kernel.org/netdev/net-next/c/e6f43a41ba62
  - [net-next,03/10] net: stmmac: qcom-ethqos: change ethqos_configure*() to return void
    https://git.kernel.org/netdev/net-next/c/649a00c3926f
  - [net-next,04/10] net: stmmac: qcom-ethqos: move qcom_ethqos_set_sgmii_loopback() up
    https://git.kernel.org/netdev/net-next/c/3baa791f19be
  - [net-next,05/10] net: stmmac: qcom-ethqos: move loopback disable to .mac_finish()
    https://git.kernel.org/netdev/net-next/c/834c72ca306c
  - [net-next,06/10] net: stmmac: pass interface mode into fix_mac_speed() method
    https://git.kernel.org/netdev/net-next/c/cd0aa6515350
  - [net-next,07/10] net: stmmac: qcom-ethqos: pass phy interface mode to configs
    https://git.kernel.org/netdev/net-next/c/b560938163db
  - [net-next,08/10] net: stmmac: qcom-ethqos: use phy interface mode for inband
    https://git.kernel.org/netdev/net-next/c/b8ab32315e22
  - [net-next,09/10] net: stmmac: qcom-ethqos: move SerDes speed configuration
    https://git.kernel.org/netdev/net-next/c/fb42f19e671f
  - [net-next,10/10] net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method
    https://git.kernel.org/netdev/net-next/c/9192320a65b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
