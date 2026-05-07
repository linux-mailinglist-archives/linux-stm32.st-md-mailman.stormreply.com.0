Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPhrL+20/Gm0SwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 17:51:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B484EB65B
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 17:51:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E688FC8F283;
	Thu,  7 May 2026 15:51:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E477BC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 15:51:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E87F060181;
 Thu,  7 May 2026 15:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EC8C2BCB2;
 Thu,  7 May 2026 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778169066;
 bh=uhsrqHOzky90E/GDDipH5Wy+SbXWe48XToRSzO5ocXc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SWFLloY1hDgLvsbtrLAkKZUk0AANEkyO1ZfSAaYQl8uewJBobEtm/GWWIqnCvuqmX
 ho2jhhdIpSKU7Gc7gtbNTEfGepPaXtgnanA6rlc53jkLcx+VJwUCtufuFJZzxS0KuF
 Pf44SrBMwI5cBhRcR+xkihNFpGMoSBkfeNMvaSqaCMESCR6sWjIZkfUMHgvThfe5SF
 SaLzSEhHXWWjWbRtBloFRr0/OFHB3/mHuv7CNKyyIt36Yoegl5mzC3gxitJn5Zh9Cf
 kA59oqbNGxfPy2pMWks5lQF+u526+Bv7qgfMAwmfyAeROe6kMksk/VK+wMsiPsRxMQ
 HsZzvO/s1/CwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02CC33930909; Thu,  7 May 2026 15:50:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177816901553.4048611.3374770303118328705.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 15:50:15 +0000
References: <20260506084614.192894-1-a0987203069@gmail.com>
In-Reply-To: <20260506084614.192894-1-a0987203069@gmail.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/1] net: stmmac: dwmac-nuvoton: fix
 NULL pointer dereference in nvt_set_phy_intf_sel()
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
X-Rspamd-Queue-Id: 60B484EB65B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.725];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  6 May 2026 16:46:12 +0800 you wrote:
> This series fixes a NULL pointer dereference bug introduced in the
> initial dwmac-nuvoton glue driver. The struct nvt_priv_data::dev field
> was never initialized after devm_kzalloc(), leaving it NULL. When
> phylink later calls nvt_set_phy_intf_sel() for interface selection,
> the callback dereferences priv->dev via nvt_gmac_get_delay(), triggering
> a NULL pointer dereference.
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: dwmac-nuvoton: fix NULL pointer dereference in nvt_set_phy_intf_sel()
    https://git.kernel.org/netdev/net/c/dedf6c90386d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
