Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DC06490C5
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Dec 2022 21:57:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE8F8C65E6D;
	Sat, 10 Dec 2022 20:57:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16925C65E5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Dec 2022 20:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670705845; x=1702241845;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8tRXcUKxGagfde91ZdUSDF88p8/b8+3NQn8nn2kaumc=;
 b=Z8FRauK1i0+pKl0yATc+E/NGcYNXoq/grKMGZ8aBNhcj2zQBZviMwQvM
 JKTKkydjjrfdd88qIDhnFhVWVD6hX38j3rzs3dvmQRFNEvpUbds5gNfHv
 QVoSZ/MC8o/OOOEYRXDl6/PYdXxqqcyJKpADPlHEvs40Z2ioban1YAGOp
 QLuYd0SApjC2GQ8k1H9kKgfUf06LbHlziSQ1WNXpANEyxupG23qcznL7s
 ME80wd5FoowGzUAyWZgwH6UNrnXM25SvbjOHS8+yjqM7G7rQwsBc7YnZq
 lomfMZNbAAvmVC3CRS3ByThlCbc82bwu/kh1l5VLRNo3RZZFMPVrugfzx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10557"; a="315286167"
X-IronPort-AV: E=Sophos;i="5.96,235,1665471600"; d="scan'208";a="315286167"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2022 12:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10557"; a="678489946"
X-IronPort-AV: E=Sophos;i="5.96,234,1665471600"; d="scan'208";a="678489946"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga008.jf.intel.com with ESMTP; 10 Dec 2022 12:57:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@intel.com>) id 1p46uK-007g2g-33;
 Sat, 10 Dec 2022 22:57:16 +0200
Date: Sat, 10 Dec 2022 22:57:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Y5TyrO5maz5VYic3@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
 <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
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

On Sat, Dec 10, 2022 at 10:18:33AM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-K=F6nig wrote:

...

> > I'm wondering why we didn't see a compiler warning about mistyped funct=
ion
> > prototypes in some drivers.
> =

> I don't understand where you expected a warning. Care to elaborate?

intel-lpss.c has the prototype that returns an int. IIRC it was like this
before your patches. Now the above wondering passage...

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
