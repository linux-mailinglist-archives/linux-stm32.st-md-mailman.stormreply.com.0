Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yADXI33NBmrynwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2026 09:38:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C77054AB1D
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2026 09:38:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E582C8F271;
	Fri, 15 May 2026 07:38:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3594C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778830712; x=1810366712;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=lP9tVmtwzbLQRudPjuo1zfBP9p5/3imREIYkZ6AvAmw=;
 b=ccX9S+iboEeF4Aah/S5rby3L/8ulbhQNqmjxi5aZ7aZIHTyp02Rbo+EA
 siuj+OK6vuECzMyRW23F+3rrxm+C1DNY9FGAdsDNZmN2FPqdTPiyCAfQM
 ZhSiUMfDgXLnmrS5WQsZqU55aTGxj7Uc6AA8Vwv6u+muDfNTPPW07dbwS
 CKy29jTWldo8lnJjDVbo43TbgOrxMlt1Fvmr5Shude4RfoMNr8tr/OcLh
 Hr7+JNI2CsVEV7295/+hR9l/WHc7ymiMXn4PhBNp0161I6hpHS2MO1BHy
 zzdYedJ1YqHI49fPT6rITJnxIiExfcu1vXSUShjotHiIjrQ/PG9WrQSmd g==;
X-CSE-ConnectionGUID: jtypDXUcThmlznjcVMdlGQ==
X-CSE-MsgGUID: +C15KnXdRpCr315N6bSIng==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79956070"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79956070"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:38:30 -0700
X-CSE-ConnectionGUID: KzgjRThqSPG4EwBrKnmLxw==
X-CSE-MsgGUID: EIw5Ob1JRaKbZTPEx77eBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242618938"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:38:26 -0700
Date: Fri, 15 May 2026 10:38:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
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
Message-ID: <agbNbzD__8IDk5UA@ashevche-desk.local>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
 <agTcoVbImqMgfQy5@ashevche-desk.local>
 <cabngw2wuxh7cfx4cw4ik46dmxs72u47jyo6hcwgdd7a5whny2@dsp4cysetarw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cabngw2wuxh7cfx4cw4ik46dmxs72u47jyo6hcwgdd7a5whny2@dsp4cysetarw>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Subject: Re: [Linux-stm32] [PATCH v2 09/11] m68k: stmark2: use ioport.h
	macros for resources
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
X-Rspamd-Queue-Id: 5C77054AB1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:gerg@uclinux.org,m:linux-m68k@lists.linux-m68k.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-iio@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com,uclinux.org,lists.linux-m68k.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:20:38AM +0200, Angelo Dureghello wrote:
> On 13.05.2026 23:18, Andy Shevchenko wrote:
> > On Wed, May 13, 2026 at 11:14:33AM +0200, Angelo Dureghello wrote:

...

> > This conversion drops hard indices, would it be a problem (for example,
> > some code modifies the fields based on the [hard coded] index...)?
> > 
> > If not, perhaps good to mention in the commit message and move IRQ to be the
> > second one?
> 
> i can't see any directly-related code accessing these resources by index,
> so would not change this if there isn't any risk. 
> Also i see DEFINE_RES_() stuff widely used in other arch, so thios make me
> think accessing by index is something wrong.

OK, thanks for confirming.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
