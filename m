Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MhEXHvuhOmrqCAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 17:10:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2EE6B8349
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 17:10:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=kR56Wa5R;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EF43CA8E47;
	Tue, 23 Jun 2026 15:10:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FCDEC7A830
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 15:10:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 219F0419A4;
 Tue, 23 Jun 2026 15:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705741F00A3A;
 Tue, 23 Jun 2026 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782227448;
 bh=JbnEvt1HYbMhxvD0ZUEB9Wz8ezFMKa7Yiz789jn378Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kR56Wa5RrjGIycvuXt4DdZ+TTHnp16yTDBAq8s2nyvOzJ1vTF3bi4uB02BN0S38sG
 kyChjWVQRlOI1eKTzdBc2obuYnPEN+kAiZAw9YUDragqBJs8TfdcKboC4dAyhRPAI0
 HR6j5obPwvpVx/rXNFh6TFvCRkueIuJXsuavEZ7COBAPg7oM24IZtZjarCuTXftaQc
 VXxqKMFWfH1SqoGossGvrdGGCu2FzrXbE358FI6gDIXBxMrea5BajbqDXmKoSj6Euf
 +c0kAIc2VcU9Wnz+6s33xSm9MGiwUMFa6gDMP/1git4w55pWNK4zyDWmsurANgzAzy
 DVQ+HEJYsHaDg==
Date: Tue, 23 Jun 2026 16:10:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <20260623161038.6429c3d7@jic23-huawei>
In-Reply-To: <ajpX3E2zHYh2e8FG@ashevche-desk.local>
References: <20260612215151.1886851-1-robh@kernel.org>
 <ai1dhJWb9vKqxEEe@ashevche-desk.local>
 <20260621151026.69714694@jic23-huawei>
 <46fce99d-9dd5-435b-95cd-86ed4771aa83@foss.st.com>
 <ajpX3E2zHYh2e8FG@ashevche-desk.local>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,jic23-huawei:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB2EE6B8349

On Tue, 23 Jun 2026 12:54:36 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Jun 23, 2026 at 11:43:49AM +0200, Olivier MOYSAN wrote:
> > On 6/21/26 16:10, Jonathan Cameron wrote:  
> > > On Sat, 13 Jun 2026 16:39:16 +0300
> > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > > On Fri, Jun 12, 2026 at 04:51:50PM -0500, Rob Herring (Arm) wrote:  
> 
> ...
> 
> > > > > -	ret = of_property_read_u32_index(indio_dev->dev.of_node,
> > > > > -					 "st,adc-alt-channel", chan_idx,
> > > > > -					 &df_ch->alt_si);  
> > > >   
> > > > > +	df_ch->alt_si = of_property_present(indio_dev->dev.of_node,  
> > > > 
> > > > I believe it still has another (serious?) issue. We usually don't use indio_dev
> > > > for device properties. It's not a device that is described in DT.
> > > > It seems the only driver in IIO that does that. Note, I haven't conducted any
> > > > deeper research, it might be (however I'm quite in doubt) that this is correct
> > > > use and one device registers a few indio_dev:s.  
> > > 
> > > It is curious.  The registration sequence in this driver is complex, but I'm not
> > > seeing anything that sets the fwnode for the struct iio_dev->dev before calling
> > > the init() callbacks that end up in this code.  It is set later by iio_device_register()
> > > (iirc that has something to do with consumers turning up later).
> > > 
> > > St folk could you take a look at this and see what we are missing
> > > if it does currently work?
> > > 
> > > For now I'll apply this patch but might need to drop it if a fix clashes
> > > with it.  
> > 
> > I confirm that the current legacy path is functional
> > (With the st,adc-alt-channel property fix applied)  
> 
> Yeah, it's here
> https://elixir.bootlin.com/linux/v7.1.1/source/drivers/iio/adc/stm32-dfsdm-adc.c#L1772
> and should gone. Basically one wants to replace all these to use device and
> fwnode propery APIs and proper device node, without that hack.

If we 'were' going to keep this it should have been using the helper
to set that. I thought all those had been cleaned up so didn't check
for it being directly written :(  Obviously this comment is irrelevant
given the code is going away!

Jonathan

> 
> > It currently works because the driver initializes np from dev->of_node in
> > probe, and that value is then used in init callbacks.
> > 
> > I agree that this approach is not robust, as it depends on initialization
> > sequencing and on using an IIO object that is not the DT owner object. I
> > will prepare a patch to use the DT device directly as the single source for
> > DT properties.
> > 
> > I also suggest keeping a fallback path for st,adc-alt-channel so we do not
> > break legacy DTs that have not yet migrated to the new binding.
> > I prepare this also.  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
