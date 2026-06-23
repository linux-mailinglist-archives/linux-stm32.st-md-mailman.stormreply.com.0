Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uH4GK+VXOmpX6gcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 11:54:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA2E6B5F7A
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 11:54:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=HLd6kx8D;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE495C8F272;
	Tue, 23 Jun 2026 09:54:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71EA2C7A834
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782208484; x=1813744484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vkFETun7c0Vx4s11aeriB3dobfV+C7MaHaRn0CTIr/s=;
 b=HLd6kx8Dqh8jPdf9ViiWGazbQQsaGGlW6iEyyLVX1HcvmAzjeiMKmP8+
 chHcmlEFrtz5uBYCZniX395LKAo/4CT1FhFRPlYir64OhFIJToi0EhYXV
 wMoPTwUOny7sh6gELAkJMTH8LZidMhrOPPtbC/86WeHyWQ6M5B/7Rk7pM
 HIRyzhlezIIcTulxtG+F93f0iQpSOoUrvUo0FzdBLcv9SBTX87KprinlG
 8BHe8IbLz/ODe4GqNznZb4s0poJ6IwKx9IGPQKnF5in/Ob+6v9UIAR3O/
 QOBA7kzqcyGZKQ3jzdTJM7u03e6My2Pk3yccJlSFtp7iMSSzC4mkJ+fww A==;
X-CSE-ConnectionGUID: rjSIR57MSPmWXcrXT18mqA==
X-CSE-MsgGUID: E6XVwEUCS9WV50XdlVmpBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93537217"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="93537217"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:54:42 -0700
X-CSE-ConnectionGUID: q3/WUKbKSVmUc1Zi61eWcg==
X-CSE-MsgGUID: ufxCW/2fRTqRcD7q5+9NWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="248326947"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.7])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:54:39 -0700
Date: Tue, 23 Jun 2026 12:54:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <ajpX3E2zHYh2e8FG@ashevche-desk.local>
References: <20260612215151.1886851-1-robh@kernel.org>
 <ai1dhJWb9vKqxEEe@ashevche-desk.local>
 <20260621151026.69714694@jic23-huawei>
 <46fce99d-9dd5-435b-95cd-86ed4771aa83@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46fce99d-9dd5-435b-95cd-86ed4771aa83@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Andy Shevchenko <andy@kernel.org>, "Rob Herring \(Arm\)" <robh@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olivier.moysan@foss.st.com,m:andy@kernel.org,m:robh@kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nuno.sa@analog.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,analog.com,lists.infradead.org,gmail.com,baylibre.com,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,stormreply.com:url,stormreply.com:email,bootlin.com:url,intel.com:from_mime,intel.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AA2E6B5F7A

On Tue, Jun 23, 2026 at 11:43:49AM +0200, Olivier MOYSAN wrote:
> On 6/21/26 16:10, Jonathan Cameron wrote:
> > On Sat, 13 Jun 2026 16:39:16 +0300
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > > On Fri, Jun 12, 2026 at 04:51:50PM -0500, Rob Herring (Arm) wrote:

...

> > > > -	ret = of_property_read_u32_index(indio_dev->dev.of_node,
> > > > -					 "st,adc-alt-channel", chan_idx,
> > > > -					 &df_ch->alt_si);
> > > 
> > > > +	df_ch->alt_si = of_property_present(indio_dev->dev.of_node,
> > > 
> > > I believe it still has another (serious?) issue. We usually don't use indio_dev
> > > for device properties. It's not a device that is described in DT.
> > > It seems the only driver in IIO that does that. Note, I haven't conducted any
> > > deeper research, it might be (however I'm quite in doubt) that this is correct
> > > use and one device registers a few indio_dev:s.
> > 
> > It is curious.  The registration sequence in this driver is complex, but I'm not
> > seeing anything that sets the fwnode for the struct iio_dev->dev before calling
> > the init() callbacks that end up in this code.  It is set later by iio_device_register()
> > (iirc that has something to do with consumers turning up later).
> > 
> > St folk could you take a look at this and see what we are missing
> > if it does currently work?
> > 
> > For now I'll apply this patch but might need to drop it if a fix clashes
> > with it.
> 
> I confirm that the current legacy path is functional
> (With the st,adc-alt-channel property fix applied)

Yeah, it's here
https://elixir.bootlin.com/linux/v7.1.1/source/drivers/iio/adc/stm32-dfsdm-adc.c#L1772
and should gone. Basically one wants to replace all these to use device and
fwnode propery APIs and proper device node, without that hack.

> It currently works because the driver initializes np from dev->of_node in
> probe, and that value is then used in init callbacks.
> 
> I agree that this approach is not robust, as it depends on initialization
> sequencing and on using an IIO object that is not the DT owner object. I
> will prepare a patch to use the DT device directly as the single source for
> DT properties.
> 
> I also suggest keeping a fallback path for st,adc-alt-channel so we do not
> break legacy DTs that have not yet migrated to the new binding.
> I prepare this also.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
