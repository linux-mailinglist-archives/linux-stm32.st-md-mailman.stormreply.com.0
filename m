Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XLnuBOl6J2pDyAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 04:31:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA4E65BDB5
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 04:31:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=N010GNAq;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23FB9C5F1F7;
	Tue,  9 Jun 2026 02:31:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A84BC5F1F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 02:31:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8AA72601E6;
 Tue,  9 Jun 2026 02:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF2D1F00893;
 Tue,  9 Jun 2026 02:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780972261;
 bh=rh7+JytDuZuJDCznDx0VCj5EAQToBkmQNWkGO0U5JvI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=N010GNAqn865krLcj1+QjF6lVLaybog1vWywyrSP38qdeA8j7WHMoLIpIOtlEdagc
 6MoCXwA9+/L8BICWTkA++plpfOmaOqYBSagWvM1W1uPU6C8M4OsUhhgRybotcLOK4u
 yPvB/VUbi23tpa5LTmCGUZ3NCtF7HaqP6tPUlfYNmm6m+Na1F3ptB3oAKP/f5KBa4s
 CNWd06BpSXlLxzWWVtjsT0AzkrSh1zE7VWa5sfAM37smT3w+E2LjgpUwijrNJRPL/3
 n0auAu1H9YMjHnTRlbpfDsBdBGPrDP8jy2PSE4KPw00hAgaMqewliZCm5EMcipNlq+
 XHp7oVjFBTrgA==
Date: Mon, 8 Jun 2026 19:30:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ding Hui <dinghui1111@163.com>
Message-ID: <20260608193059.78e05dce@kernel.org>
In-Reply-To: <20260604144557.3175399-1-dinghui1111@163.com>
References: <20260604144557.3175399-1-dinghui1111@163.com>
MIME-Version: 1.0
Cc: j.raczynski@samsung.com, open list <linux-kernel@vger.kernel.org>,
 xiasanbo@lixiang.com, Ding Hui <dinghui@lixiang.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 yangchen11@lixiang.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 liuxuanjun@lixiang.com, Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: fix fatal bus error on
 resume by reinitializing RX buffers
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dinghui1111@163.com,m:j.raczynski@samsung.com,m:linux-kernel@vger.kernel.org,m:xiasanbo@lixiang.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:yangchen11@lixiang.com,m:mcoquelin.stm32@gmail.com,m:liuxuanjun@lixiang.com,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[samsung.com,vger.kernel.org,lixiang.com,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FA4E65BDB5

On Thu,  4 Jun 2026 22:45:54 +0800 Ding Hui wrote:
> +/**
> + * stmmac_reinit_rx_descriptors - re-program RX descriptor buffer addresses
> + *				   after stmmac_clear_descriptors()
> + * @priv: driver private structure
> + * @dma_conf: structure holding the dma data
> + * @queue: RX queue index

nit:

kernel-doc script says:

Warning: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1733 No description found for return value of 'stmmac_reinit_rx_descriptors'

You need a Returns: statement in this kdoc
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
