Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2RCMGyNMTWpJxwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 20:57:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD1871EC98
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 20:57:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=lunn.ch header.s=20171124 header.b=tbPJZbO2;
	dmarc=fail reason="SPF not aligned (strict)" header.from=lunn.ch (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE3B8C8F262;
	Tue,  7 Jul 2026 18:57:38 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6546C7A836
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 18:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ct1RYm16x3GFzu4FMGkc7eTBInRFcY8Ty+VPr5iXQDg=; b=tbPJZbO2+zUHCABOu6WpC9n2UX
 ApKquvPNPi+iTfI9xQUwt3a7HVpJUahC+fmqFDKiAAu7/RqX7VSiPe+7ikL1S21NFsfuh328vAtgK
 8fKPtjvBCnTULNOFDdD3758vwMIM+cdyfwUF7MoVlDipJHktpUez/ijS2s39YIJCYAuE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1whAz2-00BDI8-Rq; Tue, 07 Jul 2026 20:57:28 +0200
Date: Tue, 7 Jul 2026 20:57:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
Message-ID: <d4fb7a9f-c0bb-4ced-8428-14bd2aa66d85@lunn.ch>
References: <20260707174431.1264520-1-j.raczynski@samsung.com>
 <CGME20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee@eucas1p1.samsung.com>
 <20260707174431.1264520-2-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707174431.1264520-2-j.raczynski@samsung.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 k.domagalski@samsung.com, k.tegowski@samsung.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/2] net/stmmac: Protect against zero
	queue DTS config
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:j.raczynski@samsung.com,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:k.domagalski@samsung.com,m:k.tegowski@samsung.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,samsung.com,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,lunn.ch:mid,lunn.ch:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BD1871EC98

On Tue, Jul 07, 2026 at 07:44:30PM +0200, Jakub Raczynski wrote:
> Commit 8a7bca6de6de protected against inputing number of tx/rx_queues_to_use
> over kernel supported limit in DTS config. AI review mentioned that we also
> should protect against zero queue input, because this would cause issues
> down the line. Missing config is not an issue as stmmac_plat_dat_alloc()
> does apply '1' by default.
> 
> Fix this by adding check for zero queues input during DTS parsing
> 
> Fixes: 8a7bca6de6de ("net/stmmac: Apply MTL_MAX queue limit if config missing")

I'm not sure a Fixes: is justified here. Does this bother somebody? As
far as i understand, for this to actually do something the system is
broken anyway?

>  	if (!of_property_read_u32(rx_node, "snps,rx-queues-to-use", &value)) {
>  		if (value > MTL_MAX_RX_QUEUES)
>  			value = MTL_MAX_RX_QUEUES;
> +		else if (value == 0)
> +			value = 1;

If the DT is broken, don't we want it to be fixed? -EINVAL would make
it obvious.

    Andrew

---
pw-bot: cr

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
