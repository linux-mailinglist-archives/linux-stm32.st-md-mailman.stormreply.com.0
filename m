Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bM95FHmPH2rOnAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 03 Jun 2026 04:20:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DED506339FD
	for <lists+linux-stm32@lfdr.de>; Wed, 03 Jun 2026 04:20:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="Dtp/jnQj";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93E4DC8F271;
	Wed,  3 Jun 2026 02:20:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16B52C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2026 02:20:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BCAEB42A83;
 Wed,  3 Jun 2026 02:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2381F00893;
 Wed,  3 Jun 2026 02:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780453237;
 bh=M0icSYUpwjidM91a9CSaBCLnufhdPEAGwxRPFHGLfiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Dtp/jnQjLfISW5AeF6ugLMKcDnl1cN6dIeAAR493UwY7/EkiyxqVRN9CK6vqFd0ck
 QxNxZ9EMEyJlyUiwzuTDy+GqVundBap7i3o6N6dxVb1Hl1tBAJawSOuEtnOkLOrLbw
 qaUHp+bYH48EMzYuNvhUbRJ5uxPavglTOsPbyF67nhhBhBPa8KiGNfJseAuo/NUkZG
 klVmPnVvgvNND4Vm5mdAPKs0D1xICKktO781r2sfBjDMBlMErQB/K1dfunY65317R3
 QqNizdA408DBoUnryzpa6mUkutnxX0uITxFWGY2Kdd7314Q6IWXMPIClivSYUhk2dw
 t76gxwoljQmdw==
Date: Tue, 2 Jun 2026 19:20:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Message-ID: <20260602192036.7cc25ae8@kernel.org>
In-Reply-To: <20260529064659.32287-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260529064659.32287-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: Improve Tx timer arm
	logic further
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:muhammad.nazim.amirul.nazle.asmade@altera.com,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DED506339FD

On Thu, 28 May 2026 23:46:59 -0700
muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> There is no race concern: hrtimer_start() is internally serialized and
> safe to call on an active timer. In the event of a race between
> hrtimer_active() and hrtimer_start(), the worst case is calling
> hrtimer_start() on an already-active timer, which is identical to the
> pre-patch behaviour.

I mean.. I wouldn't say that this is not racy. But I think you're not
making it much worse than it already was :S

Could you experiment with deleting all this local driver logic and just
relying on NAPI's built-in defer IRQ mechanism?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
