Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WMPYDaogH2ofhQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 20:27:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B459C63110D
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 20:27:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b="V/6m9eMq";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68F3FC8F271;
	Tue,  2 Jun 2026 18:27:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F56AC58D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2026 18:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780424872; x=1811960872;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=JAKACGblmVp0qOtTpZKUe7ENVsK0mSqAwKq+52Y/t/s=;
 b=V/6m9eMqhQhUBe5ipYuYN/xLB8aEie+jT3v4YknfBO5z3ZiBmpPsfk0k
 H7QQQEwf43xopyiDEEhn4/fJMCaRJ1hjMJjaxBN6hSWdkwQd0bDbJQ2j8
 Fe/LSVj5lk859iEfKg1cfvA0FdOxFR5ru3uiGcGKhLTRe+3u05anGCqq+
 qtlCNVXN8dz6RB8Qzv4qlKnUn2A9/ofmdbHrHbnUpeE6RhGVeq07vtK+G
 XuCCm2k3qPs/UsrJJyWH/knmIAPNFjr8hpwf4dniE9p2kuKz37Y1xuXwS
 ome5jQTZTnej80UIHx2k1zACCdnzmYfrHTcOCS0yrTgaWOmJ7ZZ+NLsMO w==;
X-CSE-ConnectionGUID: P9A2IbDYQsWA1mRrq8I9kg==
X-CSE-MsgGUID: llEEoXRwQgWFvatk2ATRog==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81348604"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="81348604"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 11:27:49 -0700
X-CSE-ConnectionGUID: X7dJPcHIRBuGkxCgZ6zc6A==
X-CSE-MsgGUID: f3PWSRppTeGC+zCSm+pprg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="237634600"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 11:27:46 -0700
Date: Tue, 2 Jun 2026 21:27:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Message-ID: <ah8gn3g3_-cY1kbQ@ashevche-desk.local>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
 <agTe7vZ94DnmD4Ed@ashevche-desk.local>
 <CALSJ-wBbjwrhTEpfKm-JHox7-E1YRQ=kTj1JN+KyiucTTu7c3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALSJ-wBbjwrhTEpfKm-JHox7-E1YRQ=kTj1JN+KyiucTTu7c3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Subject: Re: [Linux-stm32] [PATCH v2 11/11] iio: dac: add mcf54415 DAC
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
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:gerg@uclinux.org,m:linux-m68k@lists.linux-m68k.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-iio@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[baylibre.com,linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,analog.com,uclinux.org,lists.linux-m68k.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,ashevche-desk.local:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B459C63110D

On Thu, May 21, 2026 at 05:14:07AM -0700, Angelo Dureghello wrote:
> On Wed, May 13, 2026 at 11:28:30PM +0300, Andy Shevchenko wrote:
> > On Wed, May 13, 2026 at 11:14:35AM +0200, Angelo Dureghello wrote:

...

> > > +struct mcf54415_dac {
> > > +	struct clk *clk;
> > > +	struct regmap *map;
> >
> > I believe that regmap pointer is used more often, can you check with
> > bloat-o-meter that swapping these two (by the order) gives any benefit in
> > object size?
> >
> 
> checking size in ColdFire arch with last kernel.org gcc had no benefit,
> anyway put regmap before

Thanks for checking.

> > > +};

...

> > > +		return dev_err_probe(dev, PTR_ERR(regs),
> > > +				     "failed to get io regs\n");
> >
> > One line.
> 
> i decided to stay inside 80 in all the file, is it ok ?

It's fine, but for trailing string literals like this the limit was lifted more
than ten years ago. I leave it to the maintainer.

...

> > > +		return dev_err_probe(dev, PTR_ERR(info->clk),
> > > +				     "failed getting clock\n");
> >
> > Also can be a single line, but this one a bit longer than above, gives
> > 88 characters.
> 
> same as above

Ditto.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
