Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SlmeFd/wN2pTVwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 16:10:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D731D6AB081
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 16:10:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="Z+Rj/Zkb";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B2E1C9AE2F;
	Sun, 21 Jun 2026 14:10:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66B2FC5A4DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 14:10:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2352842DF8;
 Sun, 21 Jun 2026 14:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FFE1F000E9;
 Sun, 21 Jun 2026 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782051036;
 bh=d71ItCVHJbPlKwUm7p+uxHBTSKf+Z391+seM8dThinc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Z+Rj/Zkb+B11kl2Pjd8dX3zMa/T2jM5TuHUNgXfmJVAV5u+V61XjACMgnjs4QpmGS
 JFvb6z3hIQuj/Wk3Nq4e9upAh+GQSEbYnojVaNfulmtePQEhvzOJYorT25JJBWdzk2
 /PeOaC1QEF/OeX+QQzc17jaLcKag4ubNdy7KwJP4ZNT9ZN+LjaMQitRGtY45ij/x7m
 GgCRmM6bc2AQi9DCRd8ZjFQRq04QQIhAxw86fiqcBT95dZZOJYHvfCK9ohiXLvXzcm
 IZlwp7ChPoht84jVxZt1qatZaWrRozR4MMiPbjiQv3ksD4TxeFWTbNyFwPlc5+XGcJ
 0MrUL5Rqgcjxg==
Date: Sun, 21 Jun 2026 15:10:26 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <20260621151026.69714694@jic23-huawei>
In-Reply-To: <ai1dhJWb9vKqxEEe@ashevche-desk.local>
References: <20260612215151.1886851-1-robh@kernel.org>
 <ai1dhJWb9vKqxEEe@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, "Rob Herring \(Arm\)" <robh@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: stm32-dfsdm: Treat flags as booleans
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
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:robh@kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nuno.sa@analog.com,m:mcoquelin.stm32@gmail.com,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,analog.com,gmail.com,baylibre.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jic23-huawei:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D731D6AB081

On Sat, 13 Jun 2026 16:39:16 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Fri, Jun 12, 2026 at 04:51:50PM -0500, Rob Herring (Arm) wrote:
> > The "st,adc-alt-channel" and "st,filter0-sync" properties are
> > documented as boolean flags. The legacy parser read them as integer
> > cells, unlike the child-node parser which already checks only for
> > presence.
> > 
> > Use presence and boolean helpers so both parsers follow the binding and
> > the property type checker no longer reports the flags.  
> 
> For the patch
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> However one interesting remark below.
> 
> ...
> 
> > -	ret = of_property_read_u32_index(indio_dev->dev.of_node,
> > -					 "st,adc-alt-channel", chan_idx,
> > -					 &df_ch->alt_si);  
> 
> > +	df_ch->alt_si = of_property_present(indio_dev->dev.of_node,  
> 
> I believe it still has another (serious?) issue. We usually don't use indio_dev
> for device properties. It's not a device that is described in DT.
> It seems the only driver in IIO that does that. Note, I haven't conducted any
> deeper research, it might be (however I'm quite in doubt) that this is correct
> use and one device registers a few indio_dev:s.

It is curious.  The registration sequence in this driver is complex, but I'm not
seeing anything that sets the fwnode for the struct iio_dev->dev before calling
the init() callbacks that end up in this code.  It is set later by iio_device_register()
(iirc that has something to do with consumers turning up later).

St folk could you take a look at this and see what we are missing
if it does currently work?

For now I'll apply this patch but might need to drop it if a fix clashes
with it.

Thanks,

Jonathan



> 
> > +					    "st,adc-alt-channel");  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
