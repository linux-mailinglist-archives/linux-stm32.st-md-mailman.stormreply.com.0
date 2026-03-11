Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEJAJM/asGmHnwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 04:00:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2730825B386
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 04:00:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2193C8F288;
	Wed, 11 Mar 2026 03:00:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79110C8F280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 03:00:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 677D060132;
 Wed, 11 Mar 2026 03:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1298CC19423;
 Wed, 11 Mar 2026 03:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773198028;
 bh=bOXGmh6jsTxCsgYCU4QHEri4xQgWhuXk6jt33pBkt/M=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MBo62BpPJVP29oqsWlvaUEmQVEicBzq1LzxONNHQoQJeAlOHFN27fwIYhsEkwpaUf
 543muqKkM5o5/dNrAJRZigmxY2M5WVe/1QCjnsHxq0Mcj6jR+1xkc+2RCaU2IwQxrD
 8OgHEkmTQoJAw3xcls+LC8RLLSGdUfS9cRTaEyfHqnau6evdCT0yl2CbgAW3GNHzQo
 uXZZ3ur23R3qcmztDAFeJ4hQoEMzpQjWuBdaFQCFYCdoE8yAwMNPNbWjq/Hguns5vE
 1tAT4z+YuaROAdOa0CEyQs/19Dtnb7TN9at5Tao5oFzqNZZe0R2S/6Pnx5s7vWg4fI
 Ck8Kh3oKcVFEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B9F783808200; Wed, 11 Mar 2026 03:00:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177319802455.3019253.1878262013471339195.git-patchwork-notify@kernel.org>
Date: Wed, 11 Mar 2026 03:00:24 +0000
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, s32@nxp.com, imx@lists.linux.dev, me@ziyao.cc,
 Frank.Li@nxp.com, edumazet@google.com, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 samuel@sholland.org, kuba@kernel.org, pabeni@redhat.com,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, jan.petrous@oss.nxp.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 wens@kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, kernel@pengutronix.de, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac: start to
	shrink memory usage
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
X-Rspamd-Queue-Id: 2730825B386
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
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:s32@nxp.com,m:imx@lists.linux.dev,m:me@ziyao.cc,m:Frank.Li@nxp.com,m:edumazet@google.com,m:jonathanh@nvidia.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:samuel@sholland.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-sunxi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-mediatek@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:davem@davemloft.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.964];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 9 Mar 2026 09:38:26 +0000 you wrote:
> Hi,
> 
> Start shrinking stmmac's memory usage by avoiding using "int" for
> members that are only used for 0/1 (boolean) values, or values that
> can't be larger than 255.
> 
> In addition, as struct stmmac_dma_cfg is approximately a cache line,
> shrinks below a cache line as a result of this patch set, and is
> required, there is no point separately allocating this from
> struct plat_stmmacenet_data. Embed it into the end of this struct
> and set the existing pointer to avoid large wide-spread changes.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: stmmac: provide plat_dat->dma_cfg in stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/7a6387dec8ce
  - [net-next,v2,2/7] net: stmmac: convert plat_stmmacenet_data booleans to type bool
    https://git.kernel.org/netdev/net-next/c/c3d08424e025
  - [net-next,v2,3/7] net: stmmac: reorder structs to reduce memory consumption
    https://git.kernel.org/netdev/net-next/c/3357642e65e9
  - [net-next,v2,4/7] net: stmmac: use u8 for ?x_queues_to_use and number_?x_queues
    https://git.kernel.org/netdev/net-next/c/94808793fed7
  - [net-next,v2,5/7] net: stmmac: use u8 for host_dma_width and similar struct members
    https://git.kernel.org/netdev/net-next/c/758ed85aadd0
  - [net-next,v2,6/7] net: stmmac: add documentation for stmmac_dma_cfg members
    https://git.kernel.org/netdev/net-next/c/9fe167ab790b
  - [net-next,v2,7/7] net: stmmac: add documentation for clocks
    https://git.kernel.org/netdev/net-next/c/315bab9411f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
