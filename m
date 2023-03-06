Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACE6ACF1B
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 21:25:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36FA2C6904A;
	Mon,  6 Mar 2023 20:25:27 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC630C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678134325; x=1709670325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bpjTmGt2FFmjIz5dpuGkKtkZK2wYWT5pskh8rVUTPcY=;
 b=CtceOmkc9RNMl5zu+zYkGVejfFHLQ7FbXc8GBNUIpu44l58c6WRdh1ag
 Id7aOYwZbmS43GYTk1g8plVkK+lynwVPWS0Eejfwy5Dn4B/ycZfdkhEQ8
 BvTL2wFyx4ZwqPL6q7zERa56I66hauybatI0eMa9d7BAx7oJG0FkkIwFj
 By3I8eX5IuTKCgcmjydneQrSBjeKUjRwu7inj1+VqYZA27JympHQ7TD9e
 TVryQBSfuLqxSyDLXU0bdCBX6h3nTFojx1nEUjYcQW5U1SyaxfTq+CPTh
 ABpeG93tdHpbeePIAv0zBSqdCUrMfhhnfoT8HzLMe3YFKXXq519WYpvP/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316065429"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="316065429"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745196118"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="745196118"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 12:25:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pZHOV-00Gbuf-30; Mon, 06 Mar 2023 22:25:15 +0200
Date: Mon, 6 Mar 2023 22:25:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Message-ID: <ZAZMK8YLDN2gDObv@smile.fi.intel.com>
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Nandor Han <nandor.han@ge.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Doug Berger <opendmb@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v1 00/16] gpio: Use string_choices.h
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

On Mon, Mar 06, 2023 at 09:55:40PM +0200, Andy Shevchenko wrote:
> Use string_choices.h in the GPIO drivers and library.
> It has been tested on x86_64 and (semi-)compile tested
> over all.

Forgot to mention that this is based on top of the immutable tag I sent PR with
earlier today.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
