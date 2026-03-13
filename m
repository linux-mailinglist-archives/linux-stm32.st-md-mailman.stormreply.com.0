Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KgWJSDZs2mzbgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 10:30:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8D280804
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 10:30:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D648CC8F299;
	Fri, 13 Mar 2026 09:30:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1E50C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394207; x=1804930207;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ClY2wRaESVURRmRqKK2FcwN9QyfCcetyXgPPPCHz0Rw=;
 b=EcYsXCBhDMuC8RaBGWqPN8T2erGuI/VvBk1qNkq4x1TojBxYdTtagPRT
 neYojLBkH/YM7q2bP1jd2xTWiiTj5Vo27IqDjEX+fbQV82v3+wWPrXLzn
 VvFgTICujuV/NN6+B9yOKGBJVvXl0pnFFRiLsbIdohKu9E0Kq0qd8SEl9
 3bMVvfxfmKspnJPMQHcgXhWBq5TM0ps7kSaxyM+1O5gFhdh3wKq9iihuV
 AsGET7Xe8oJ6FrAR9g9uZvMeepzJyluO1TngVFiGF/Tp5FqO/UXrd706P
 /eVj2reDGwHwSW9kqo2SIHKwrn+n9xtA/M7dpbv9IzLtg+0qXu4pmXtY9 A==;
X-CSE-ConnectionGUID: 8FdOXYi0TOiSOukRDPn+EA==
X-CSE-MsgGUID: ZofF1uusQV6PMhzz5wfvDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74380762"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74380762"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:30:05 -0700
X-CSE-ConnectionGUID: YbLZYZgbS5qp7ng0VxytMA==
X-CSE-MsgGUID: 2Z5y++EfR/aJlHbErsrYhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="226068259"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:29:53 -0700
Date: Fri, 13 Mar 2026 11:29:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomas Borquez <tomasborquez13@gmail.com>
Message-ID: <abPZD-fLDYzE2WRc@ashevche-desk.local>
References: <20260313013435.25731-1-tomasborquez13@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313013435.25731-1-tomasborquez13@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: linux-iio@vger.kernel.org, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
 Ariana Lazar <ariana.lazar@microchip.com>, Guenter Roeck <groeck@chromium.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alisa-Dariana Roman <alisa.roman@analog.com>, chrome-platform@lists.linux.dev,
 Lars-Peter Clausen <lars@metafoo.de>, Erikas Bitovtas <xerikasxx@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, Kurt Borja <kuurtb@gmail.com>,
 David Lechner <dlechner@baylibre.com>, Waqar Hameed <waqar.hameed@axis.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>,
 Shi Hao <i.shihao.999@gmail.com>, chuguangqing <chuguangqing@inspur.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Gwendal Grignou <gwendal@chromium.org>,
 Benson Leung <bleung@chromium.org>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Jyoti Bhayana <jbhayana@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Janani Sunil <janani.sunil@analog.com>,
 Marius Cristea <marius.cristea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Peter Rosin <peda@axentia.se>,
 Kim Seer Paller <kimseer.paller@analog.com>
Subject: Re: [Linux-stm32] [PATCH] cleanup: uintptr_t to unsigned long
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
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:tomasborquez13@gmail.com,m:linux-iio@vger.kernel.org,m:nuno.sa@analog.com,m:antoniu.miclaus@analog.com,m:giorgitchankvetadze1997@gmail.com,m:ariana.lazar@microchip.com,m:groeck@chromium.org,m:linux-stm32@st-md-mailman.stormreply.com,m:alisa.roman@analog.com,m:chrome-platform@lists.linux.dev,m:lars@metafoo.de,m:xerikasxx@gmail.com,m:dixitparmar19@gmail.com,m:kuurtb@gmail.com,m:dlechner@baylibre.com,m:waqar.hameed@axis.com,m:Mariel.Tinaco@analog.com,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:Michael.Hennerich@analog.com,m:mazziesaccount@gmail.com,m:marten.lindahl@axis.com,m:i.shihao.999@gmail.com,m:chuguangqing@inspur.com,m:tzungbi@kernel.org,m:gwendal@chromium.org,m:bleung@chromium.org,m:matteomartelli3@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:jbhayana@google.com,m:gustavoars@kernel.org,m:linux-kernel@vger.kernel.org,m:janani.sunil@analog.com,m:marius.cristea@microchip.com,m:jic23@kernel.org,m:mcoquelin.stm32@gmail.com,m
 :peda@axentia.se,m:kimseer.paller@analog.com,m:ishihao999@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,analog.com,gmail.com,microchip.com,chromium.org,st-md-mailman.stormreply.com,lists.linux.dev,metafoo.de,baylibre.com,axis.com,jmondi.org,linux.intel.com,inspur.com,kernel.org,lists.infradead.org,google.com,axentia.se];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,ashevche-desk.local:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 39F8D280804
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 10:34:35PM -0300, Tomas Borquez wrote:
> Linus has been explicit that uintptr_t should not be used in the kernel.

And it's all usually about new code. The shuffling _existing_ code is a churn.
This churn has to be agreed upfront. (That's what Jonathan's mail is, so
you need to have two links and proper message.)

> The iio_chan_spec_ext_info struct uses uintptr_t for the private field
> and in its read/write function pointer signatures. Jonathan Cameron noted
> this should be cleaned up in one go across all users [1].
> 
> Update the struct definition in iio.h and backend.h, along with all
> drivers implementing or using iio_chan_spec_ext_info callbacks.
> 
> No functional change intended.

> [1] https://lore.kernel.org/linux-iio/20260111122034.174c754c@jic23-huawei/
> 

This should be Link tag. And to the original email.

> Suggested-by: Jonathan Cameron <jic23@kernel.org>

We don't accept wrongly prepared patches.
NAK.

...

>  drivers/iio/adc/stm32-dfsdm-adc.c             |  4 ++--
>  drivers/iio/afe/iio-rescale.c                 |  4 ++--
>  drivers/iio/amplifiers/hmc425a.c              |  4 ++--
>  drivers/iio/chemical/sunrise_co2.c            |  8 ++++----
>  .../cros_ec_sensors/cros_ec_sensors_core.c    |  4 ++--
>  drivers/iio/common/scmi_sensors/scmi_iio.c    |  2 +-
>  drivers/iio/dac/ad3530r.c                     |  4 ++--

Besides that, it's much better to group them one per subfolder: adc, dac,
et cetera. Currently this even spams tons of people who do not want to
be spammed.

Take your time and become familiar with the process before sending a proper
version of this.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
