Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aaR5FPxrQ2rOYAoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 09:10:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C940F6E0FF3
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 09:10:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=ukauNkjo;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8124DC8F261;
	Tue, 30 Jun 2026 07:10:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51C2CC0A472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 07:10:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EFF13C5CD4C;
 Tue, 30 Jun 2026 07:10:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6543F60233;
 Tue, 30 Jun 2026 07:10:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E7836106F1C3F; 
 Tue, 30 Jun 2026 09:10:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1782803447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2WEvFOUe3RFPl/fYwecdyACzR7RbrE8OMXLcd2G9smQ=;
 b=ukauNkjoFa+Izzi7oPn2g0tA9q7whk8DxJSbSLP4SFqYdfTnlnKGZ1S4XqYxEEwP8ROc9E
 HBc0hiAPp7t+IiAp+olwJx+tnk551HcHvSjWCDN0CAqAC9n0GWw0PdeayEatvn0B87x+i2
 UtCQ70rLf2WOGxPOPxiLprWMeC8InZK5XbLOStrcUyN9FT/CSPIE8djSzaSgoUsGbVtrxe
 ZHuWI77VuVPssz2DRPOR0uitBZkzZoNSB2PL41BJvUg7Ik0Og/41Mijhl8L8HyfqFLpmni
 K2yR3zqh15Dqv+kBkWLY7EwbaAqDcVbg9hQlF4vujxerOUvHat58mr27FL4SvQ==
Message-ID: <0083a957-7afb-489b-b2db-de3acd71b445@bootlin.com>
Date: Tue, 30 Jun 2026 09:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063239.1158-1-lizhi2@eswincomputing.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260630063239.1158-1-lizhi2@eswincomputing.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com,
 linmin@eswincomputing.com, ningyu@eswincomputing.com, lee@kernel.org,
 pritesh.patel@einfochips.com, horms@kernel.org, wens@kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v9 2/6] dt-bindings: ethernet:
 eswin: add EIC7700 eth1 RX clock inversion variant
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[eswincomputing.com,vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lists.infradead.org,st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:devicetree@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:pinkesh.vaghela@einfochips.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:ningyu@eswincomputing.com,m:lee@kernel.org,m:pritesh.patel@einfochips.com,m:horms@kernel.org,m:wens@kernel.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:from_mime,eswincomputing.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C940F6E0FF3

Hi,

On 6/30/26 08:32, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> The EIC7700 SoC integrates two GMAC instances. The eth1 MAC exhibits
> different RX clock sampling characteristics due to silicon-inherent
> timing behavior.
> 
> The eth1 MAC has a fixed, non-configurable RX clock-to-data skew at the
> MAC input in the order of 4-5 ns. This cannot be compensated solely by
> the standard MAC internal delay configuration and PHY delay, and RX clock
> inversion is required at 1000Mbps for correct sampling.
> 
> The eth1 TX path also includes a fixed silicon-inherent delay of
> approximately 2 ns. This delay is always present and cannot be disabled.
> It is therefore part of the effective transmit timing observed on the
> wire.
> 
> For the eth1 variant, the valid tx-internal-delay-ps values include
> this fixed delay component. Consequently, the effective range becomes
> 2000-4540 ps (approximately 2000 ps fixed delay plus 0-2540 ps
> programmable delay).
> 
> Introduce a dedicated compatible string
> "eswin,eic7700-qos-eth-clk-inversion" to represent the eth1 variant,
> allowing the driver to apply RX clock inversion only when required by
> hardware variant selection.
> 
> This keeps SoC-level differentiation without exposing silicon-fixed skew
> as configurable device tree parameters.
> 
> To reflect this, model the TX internal delay as a base 0-4540 ps range,
> and constrain valid values per compatible using conditional schema rules.
> 
> Update the binding schema as follows:
> 
>   - Define tx-internal-delay-ps as a base range: 0-4540 ps
>   - Add compatible-specific constraints using if/then rules:
>     * eswin,eic7700-qos-eth:
>         max 2540 ps
>     * eswin,eic7700-qos-eth-clk-inversion:
>         minimum 2000 ps (effective range 2000-4540 ps)
> 
Maybe Andrew can help answering that one, but does it ever make sense to insert
a delay beyond 2540 ps ?

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
