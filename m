Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bu/BDI9dLWplfQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jun 2026 15:39:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 667A167EAF6
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jun 2026 15:39:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=ZKjvHkCA;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDD1FC8F293;
	Sat, 13 Jun 2026 13:39:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3969CC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jun 2026 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781357964; x=1812893964;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OI66FUDTDYvCeY10NqbQgLoYEhrOPd1Kya/AaT9RDHA=;
 b=ZKjvHkCAXNqcr2dgnBEOTZrKkrqp49ADv1QjMsmsgxzfle5DF2cruRSh
 /v5gv/ebcgdulV//MpxzXyOPlfdxQuZV4zDRjXvLrqUezIqVVByob8LGD
 eTp1LO0EuvJhupyn9aCGmnwMti911U54UfJQudTgBfj2iCjjym/mRcTrC
 hX8n6QHYUv7+c7fUazeFbMIs127vovhzDLDV5z+v+QhP4fZOiMsBU2HXm
 lXRLpQLwv0bjCR74uFwiFmytQEXafneuSlzn29doPw6oXJCVChTeJNbEd
 UY6pY9PJQmCmymAsp+IsGAl0/EcsXvAIMnk1y7lW54euEEcou20EXVDyn g==;
X-CSE-ConnectionGUID: ehIoupOYS2CSfnYo60KfIQ==
X-CSE-MsgGUID: ZGqDbIUDTm6SDqYYK2cOWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93660876"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; d="scan'208";a="93660876"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2026 06:39:22 -0700
X-CSE-ConnectionGUID: DZu2Tr2UQe2k7vVP5XQbcw==
X-CSE-MsgGUID: uswYLJDqTHKcATAC74pTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; d="scan'208";a="277251883"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.184])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2026 06:39:19 -0700
Date: Sat, 13 Jun 2026 16:39:16 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <ai1dhJWb9vKqxEEe@ashevche-desk.local>
References: <20260612215151.1886851-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260612215151.1886851-1-robh@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
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
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nuno.sa@analog.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,analog.com,lists.infradead.org,gmail.com,baylibre.com,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	ARC_NA(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 667A167EAF6

On Fri, Jun 12, 2026 at 04:51:50PM -0500, Rob Herring (Arm) wrote:
> The "st,adc-alt-channel" and "st,filter0-sync" properties are
> documented as boolean flags. The legacy parser read them as integer
> cells, unlike the child-node parser which already checks only for
> presence.
> 
> Use presence and boolean helpers so both parsers follow the binding and
> the property type checker no longer reports the flags.

For the patch
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

However one interesting remark below.

...

> -	ret = of_property_read_u32_index(indio_dev->dev.of_node,
> -					 "st,adc-alt-channel", chan_idx,
> -					 &df_ch->alt_si);

> +	df_ch->alt_si = of_property_present(indio_dev->dev.of_node,

I believe it still has another (serious?) issue. We usually don't use indio_dev
for device properties. It's not a device that is described in DT.
It seems the only driver in IIO that does that. Note, I haven't conducted any
deeper research, it might be (however I'm quite in doubt) that this is correct
use and one device registers a few indio_dev:s.

> +					    "st,adc-alt-channel");

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
