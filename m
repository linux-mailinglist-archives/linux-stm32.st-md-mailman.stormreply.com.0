Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLwYLkuhF2qzLggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 03:58:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A65EBA33
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 03:58:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D37DEC8F290;
	Thu, 28 May 2026 01:58:34 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BE17C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2026 01:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=F5xpMV+AO1CKUrIiHxmrwoh1nrbemlBJIcVD/F1YUvI=; b=UJv8Nm5WktK8TNlR51sdYFfnq4
 U5X45/lWKA9m5eQxfTd1jDw9F7MY4tI7XFQgWdqBgz/ZBUIJVdIWGGmsS6CtSdhZGYLLD9fEYcGyO
 D+7758T0EZKkB8iUO+KgIq15euwfq2ei8TlvkBGqAvjp+5P7Wkm4zK0EVXk3LalpOO6s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1wSQ0u-004q8p-CU; Thu, 28 May 2026 03:58:24 +0200
Date: Thu, 28 May 2026 03:58:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Message-ID: <a0cdbac8-c7b2-4dc2-b08c-7fae99a73e93@lunn.ch>
References: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Improve Tx timer arm
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:muhammad.nazim.amirul.nazle.asmade@altera.com,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[lunn.ch:-];
	NEURAL_HAM(-0.00)[-0.805];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 574A65EBA33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> pre-patch behaviour. The meaning of tx_coal_timer is unchanged.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3591755ea30b..35da51c26248 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
>  	 * Try to cancel any timer if napi is scheduled, timer will be armed
>  	 * again in the next scheduled napi.
>  	 */
> -	if (unlikely(!napi_is_scheduled(napi)))
> -		hrtimer_start(&tx_q->txtimer,
> -			      STMMAC_COAL_TIMER(tx_coal_timer),
> -			      HRTIMER_MODE_REL);
> -	else

With this code, the timer is always tx_coal_timer in the future.


> +	if (unlikely(!napi_is_scheduled(napi))) {
> +		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
> +			hrtimer_start(&tx_q->txtimer,
> +				      STMMAC_COAL_TIMER(tx_coal_timer),
> +				      HRTIMER_MODE_REL);

If the timer is not active, it is set to tx_coal_timer in the
future. However, if the timer is active, meaning it is already
counting down, it is left alone, so is less than tx_coal_timer in the
future.

Do i have this right?

Doesn't that change the meaning of the timer. It now actually goes off
sooner?

This is somewhat academic. The point of coalescence is to reduce
overheads. The increase in performance shows that this change does
reduce overheads.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
