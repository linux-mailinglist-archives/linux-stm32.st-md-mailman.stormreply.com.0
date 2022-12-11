Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6766C649473
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Dec 2022 14:31:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04187C65E5D;
	Sun, 11 Dec 2022 13:31:37 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F7D5C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Dec 2022 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670765494; x=1702301494;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mzHG/pVGmg236g4ocCottXwf/Vck+AOplcQMPTkzoug=;
 b=FuC1p11EB8wI/mR0qwToHNQSRyOiOzTqs9BIXWr6rAMryXSYtk0OSMK+
 Lvld4vLS5BMNpEM2cCqtJfTM5kIeRZYCbiju1zV37rxH+lwfMPEVfx/b4
 RmESs5HaieBsGA8p1paxT8VbRTkijNPhr39lsR3R6KzKmZea4pGYy80gH
 WE594e6OtAHH9GVZ5Z3ebvuMX8nXKsCTrCtGAFqK9nyNfjRT6OvnycgwZ
 F9VR6nNiTH91IwLUALXPqs76m88En/KxrA2/P59cl5DbzlqJiK4nDIBdc
 wuRThz7lYpEAXdzt10f/L7QYNykF3XqI4Kwhv+IgwT2z6w11iTcL0n3cN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="318847051"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; d="scan'208";a="318847051"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2022 05:31:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="678628772"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; d="scan'208";a="678628772"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga008.jf.intel.com with ESMTP; 11 Dec 2022 05:31:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@intel.com>) id 1p4MQQ-0080Nz-0b;
 Sun, 11 Dec 2022 15:31:26 +0200
Date: Sun, 11 Dec 2022 15:31:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Y5XbrWTicuTxPLwN@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
 <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
 <Y5TyrO5maz5VYic3@smile.fi.intel.com>
 <20221210224154.733cd5qnrkpexq22@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210224154.733cd5qnrkpexq22@pengutronix.de>
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

On Sat, Dec 10, 2022 at 11:41:54PM +0100, Uwe Kleine-K=F6nig wrote:
> On Sat, Dec 10, 2022 at 10:57:16PM +0200, Andy Shevchenko wrote:
> > On Sat, Dec 10, 2022 at 10:18:33AM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-K=F6nig wrote:

...

> > > > I'm wondering why we didn't see a compiler warning about mistyped f=
unction
> > > > prototypes in some drivers.
> > > =

> > > I don't understand where you expected a warning. Care to elaborate?
> > =

> > intel-lpss.c has the prototype that returns an int. IIRC it was like th=
is
> =

> Do you mean drivers/mfd/intel-lpss.c? That one doesn't implement a PWM?!

Nope, I meant pwm-lpss.c.

> And drivers/pwm/pwm-lpss.c is adapted by this series.

That's what I didn't see how.

> One of us is confused ...

Yes, because when I have checked the branch based on Linux Next I already s=
aw
that get_state() returns a code and I wasn't aware that the series is alrea=
dy
there.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
