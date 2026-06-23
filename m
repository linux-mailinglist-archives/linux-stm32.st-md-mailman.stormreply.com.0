Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5xcDDjj4Omq8NQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 23:18:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF66BA3A4
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 23:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=OuopLVoR;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5EF6C8F292;
	Tue, 23 Jun 2026 21:18:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69198C87EDE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782249525; x=1813785525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PXOMq887K9FXPyqsb4vi8gGbLEYnXMywB+78wZBK9dY=;
 b=OuopLVoRRLiQNamg+cFBiT5E6WFgsBHJ/58n19E/ChOkX1g2uhyKoxL+
 1k6DXrs2eGgtqRJ5zZpeYU8snomnj1g9tG97aKqW8TKLZ+Dd9OljgahY/
 i+pkVI2SUD9qnAndduMShfKcCQ3TsbXMeaEYBd2Z6qm9u/c9sWZa925WY
 BDRVpf6ORFfjZjciIOOqDA5QzTH5WdBzuOmE0ZLDueNjw1c/yydqhS5rX
 OagubSAv01P5Jl/jnob9k9qTSB/NuTkHUAKKpRo7fLGRd7NykElwQ1cGE
 3GmVVQ4Gyc8MXgPTLv8P4Tbzp+nxjNSylb01zTpK3Z2CfmiN8dl1kmrR+ Q==;
X-CSE-ConnectionGUID: wiL0iO6sQvGqjYrG2gCCTQ==
X-CSE-MsgGUID: yidgW+CUT+e+b0+UfMyeRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94121914"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="94121914"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 14:18:43 -0700
X-CSE-ConnectionGUID: NKkjQdtURQ+vCzlz1PrRGg==
X-CSE-MsgGUID: 1QLw5JC5RqmGz1M/tKJ1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="247287657"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.7])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 14:18:40 -0700
Date: Wed, 24 Jun 2026 00:18:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Message-ID: <ajr4LvdPZKHrqDVp@ashevche-desk.local>
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 0/2] add mcf54415 DAC driver
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nuno.sa@analog.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,analog.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,baylibre.com,st-md-mailman.stormreply.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,ashevche-desk.local:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34DF66BA3A4

On Thu, Jun 18, 2026 at 11:04:14PM +0200, Angelo Dureghello wrote:
> This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> builtin DACs.
> 
> Currently the driver enables the raw write only. Feature as dma, sync, or
> format are not supoprted for this version.
> 
> Additional options suppoerted by the DAC module will be added to the driver
> later on, as needed.
> 
> The same patchset prepares the m68k/coldfire architecture to support
> the driver.
> 
> Below some basic tests done on stmark2 mcf54415-based board, voltage check
> on DAC0 and DAC1:
> 
> ~ # cd /sys/bus/iio/devices/iio:device0/
> /sys/bus/iio/devices/iio:device0 # ls
> name               out_voltage_scale  uevent
> out_voltage_raw    subsystem
> /sys/bus/iio/devices/iio:device0 # cat name
> mcf54415
> /sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw 
> /sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw 
> /sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw 
> sh: write error: Invalid argument
> /sys/bus/iio/devices/iio:device0 # cat out_voltage_raw 
> 2048
> /sys/bus/iio/devices/iio:device0 # 
> 
> Same behavior for /sys/bus/iio/devices/iio:device1.
> 
> Generated a sine wave by shell script, sine shape is good.

Heard a presentation (Embedded Recipes IIRC) where one tried sine and real
sound (it was about sound DAC) was really awful. So, Can you try a bit more
sophisticated signal?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
