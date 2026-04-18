Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHXnCi3b42l2LgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Apr 2026 21:27:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA0E42216D
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Apr 2026 21:27:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A7DEC87EBF;
	Sat, 18 Apr 2026 19:20:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2AA8C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Apr 2026 19:20:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A10843E6F;
 Sat, 18 Apr 2026 19:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4EAC19424;
 Sat, 18 Apr 2026 19:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776540045;
 bh=s5SdtgrqQaWGvxyOocfvVTmGIyntRJLtgQ7WiZdv5dA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KR42lGXBR2U6rgtVc+mVv2nfkFkQqXVvjj6lIs3eeP7BN6+pjMTpZoG2xmm4O2NxI
 bCecK9lqwrDGr7x2UDoHNqhVZWziKmWUFuJXl+1wLTnEOr7rhdPErL7ND0EqBssiTE
 QtUNdnZJJWaJoeVco4whegzjlHJ2SH7rfmdlNrZ9iqKSjTFiE7FjzRgXqC0zC3RDDH
 uFMJDxFLJTRhtD3tJ6QkRQPMjL0qIdJbHEAes2uoHywvFt0ebdxhFn/XFl+7zVTLhc
 V3JGnF31gHB4Bp3s+j1Ms6KOyfY0DiYlJxcCAHkLPSPYagoOCLoAK39QOFRqUtHv3i
 Jq7vDs6YOxTag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 BA055380CEDD; Sat, 18 Apr 2026 19:20:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177654001129.508728.16812510297262829320.git-patchwork-notify@kernel.org>
Date: Sat, 18 Apr 2026 19:20:11 +0000
References: <20260416102609.7953-1-khai.wen.tan@intel.com>
In-Reply-To: <20260416102609.7953-1-khai.wen.tan@intel.com>
To: KhaiWenTan <khai.wen.tan@intel.com>
Cc: linux-kernel@vger.kernel.org, yoong.siang.song@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, edumazet@google.com,
 hong.aun.looi@intel.com, khai.wen.tan@linux.intel.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net,
 v3 1/1] net: stmmac: Update default_an_inband before passing value
 to phylink_config
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
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,linux.intel.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:khai.wen.tan@intel.com,m:linux-kernel@vger.kernel.org,m:yoong.siang.song@intel.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:hong.aun.looi@intel.com,m:khai.wen.tan@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.963];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,intel.com:email]
X-Rspamd-Queue-Id: 8CA0E42216D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 16 Apr 2026 18:26:09 +0800 you wrote:
> From: KhaiWenTan <khai.wen.tan@linux.intel.com>
> 
> get_interfaces() will update both the plat->phy_interfaces and
> mdio_bus_data->default_an_inband based on reading a SERDES register. As
> get_interfaces() will be called after default_an_inband had already been
> read, dwmac-intel regressed as a result with incorrect default_an_inband
> value in phylink_config.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/1] net: stmmac: Update default_an_inband before passing value to phylink_config
    https://git.kernel.org/netdev/net/c/8cff9dbe89d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
