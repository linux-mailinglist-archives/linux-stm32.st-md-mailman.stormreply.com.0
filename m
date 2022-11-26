Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29163A29F
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Nov 2022 09:19:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2167FC64113;
	Mon, 28 Nov 2022 08:19:28 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90666C6506E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Nov 2022 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669477448; x=1701013448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TYZva1qhZaDDzx7ssD6565IlpCg24ayIFbcaC7tY8Tc=;
 b=Nnk7TES4JUB/fj7L0JnFTCZKhMU0aQ3OjL741Tm3CM+OtxiKAe6UcCiM
 UUmAG3CaRjv6ig0gcxPFzyTozX37GBx8QjfKxYgsdKDIBGZCAqnvJGaYt
 bWx4s3j4viTfh4och5SwzHNbYWCm5gwbuM5wyhpeEjdN70P4wvWsriISb
 49WdZUHxcavI+lSAQ6ZCzjJCN5zV8Sz28lyJ80TnHLH4g7UKw7zpf0L5K
 vPje8mwKAlEQRXUwXbr6oZW8diDT4dUhSyGeiUu1hEfaTeRwCqa/25u/K
 YXx7yIReoFiG7PZnn8Zy7QkbGB0uTYO0RWplIIxAju2n7cFMkvHpBJo3J w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="294305968"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; d="scan'208";a="294305968"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2022 07:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="620587303"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; d="scan'208";a="620587303"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP; 26 Nov 2022 07:43:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@intel.com>) id 1oyxLL-000Bco-1n;
 Sat, 26 Nov 2022 17:43:51 +0200
Date: Sat, 26 Nov 2022 17:43:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Y4I0N3KpU/LSJYpd@smile.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221122185818.3740200d@jic23-huawei>
 <20221122201654.5rdaisqho33buibj@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122201654.5rdaisqho33buibj@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 28 Nov 2022 08:19:27 +0000
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Grant Likely <grant.likely@linaro.org>, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 linux-pm@vger.kernel.org, linux-actions@lists.infradead.org,
 Wolfram Sang <wsa@kernel.org>, linux-gpio@vger.kernel.org,
 Angel Iglesias <ang.iglesiasg@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 000/606] i2c: Complete conversion to
	i2c_probe_new
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

On Tue, Nov 22, 2022 at 09:16:54PM +0100, Uwe Kleine-K=F6nig wrote:
> On Tue, Nov 22, 2022 at 06:58:18PM +0000, Jonathan Cameron wrote:

> > Queued all of the below:
> > with one tweaked as per your suggestion and the highlighted one dropped=
 on basis
> > I was already carrying the equivalent - as you pointed out.
> > =

> > I was already carrying the required dependency.
> > =

> > Includes the IIO ones in staging.
> > =


> > p.s. I perhaps foolishly did this in a highly manual way so as to
> > also pick up Andy's RB.  So might have dropped one...
> =

> You could have done:
> =

> 	H=3D$(git rev-parse @)
> 	b4 am -P 49-190 20221118224540.619276-1-uwe@kleine-koenig.org
> 	git am ...
> 	git filter-branch -f --msg-filter "grep -v 'Signed-off-by: Jonathan'; ec=
ho 'Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>'; echo=
 'Signed-off-by: Jonathan Cameron <jic23@kernel.org>'" $H..
> =

> (untested, but you get the idea).

That's, for example (just last from the history as is), how I usually do it
(tested):

 git filter-branch --msg-filter 'sed -e "/Signed-off-by: Andy Shevchenko/ a=
 Tested-by: Daniel Scally <dan.scally@ideasonboard.com>"' -f HEAD~4..HEAD


-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
