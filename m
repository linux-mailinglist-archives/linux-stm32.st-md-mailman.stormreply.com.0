Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A02648A4A
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Dec 2022 22:48:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47AABC65E52;
	Fri,  9 Dec 2022 21:48:05 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64A16C65E4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Dec 2022 21:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670622483; x=1702158483;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VyW/tMWJvyoCTirAlG73DmAZL480LWhJqZ6Zbp5E2tY=;
 b=SMZcKcmv+wY0U5iUfibh/93NEicVwtegQDIeul9CJSRInNMJ1qzvrmWn
 ICihpO5OcyjG7x4WxGL3ip/TjKOogp1rjPggtBszgU6ZxbEgytZD+rw73
 0fc8bSXQmW4U7ZzzwK13/hc+xUl3aEONXtqqyCLC5ijbThSEKaW9rcMpj
 RJuLeJnpYVr4kou4dbG1gF4HyRSKvr2Qs7TekylEFZE1QIjsKVtqz2gmZ
 t6Q1KwAIezWuBD8Ne2Sd3sdNojzAXt/xe5BfDiUid5T3ohJsVkULCf0Cq
 EOX9WfDZyAHIwDtVHRWRTJDBb98H9yY6Bccst8A0MP2HEdg3/DHiCsvAF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="319415094"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; d="scan'208";a="319415094"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 13:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="821856456"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; d="scan'208";a="821856456"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005.jf.intel.com with ESMTP; 09 Dec 2022 13:47:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@intel.com>) id 1p3lDn-007CW5-0p;
 Fri, 09 Dec 2022 23:47:55 +0200
Date: Fri, 9 Dec 2022 23:47:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: linux-pwm@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 00/11] pwm: Allow .get_state to fail
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> I forgot about this series and was remembered when I talked to Conor
> Dooley about how .get_state() should behave in an error case.
> =

> Compared to (implicit) v1, sent with Message-Id: 20220916151506.298488-1-=
u.kleine-koenig@pengutronix.de
> I changed:
> =

>  - Patch #1 which does the prototype change now just adds "return 0" to
>    all implementations and so gets simpler and doesn't change behaviour.
>    The adaptions to the different .get_state() implementations are split
>    out into individual patches to ease review.
>  - One minor inconsistency fixed in "pwm: Handle .get_state() failures"
>    that I noticed while looking into this patch.
>  - I skipped changing sun4i.c as I don't know how to handle the error
>    there. Someone might want to have a look. (That's not ideal, but it's
>    not worse than the same issue before this series.)
> =

> In v1 Thierry had the concern:
> =

> | That raises the question about what to do in these cases. If we return
> | an error, that could potentially throw off consumers. So perhaps the
> | closest would be to return a disabled PWM? Or perhaps it'd be up to the
> | consumer to provide some fallback configuration for invalidly configured
> | or unconfigured PWMs.
> =

> .get_state() is only called in pwm_device_request on a pwm_state that a
> consumer might see. Before my series a consumer might have seen a
> partial modified pwm_state (because .get_state() might have modified
> .period, then stumbled and returned silently). The last patch ensures
> that this partial modification isn't given out to the consumer. Instead
> they now see the same as if .get_state wasn't implemented at all.

I'm wondering why we didn't see a compiler warning about mistyped function
prototypes in some drivers.

P.S. The series is good thing to do, thank you.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
