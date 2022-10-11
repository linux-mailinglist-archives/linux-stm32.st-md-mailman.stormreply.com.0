Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F01675FB48D
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 16:28:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3380C640F2;
	Tue, 11 Oct 2022 14:28:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5B04C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665498508; x=1697034508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tDN8pO8vkYfi7aIzDYMNy5iW/C9igDir6WIyp4TE2LA=;
 b=IJ1zRKZsIkHdL+9zeQb11pGnqqxrAJGeiYHcXRG6dNCVRPTAEYGKxcrZ
 1lNaIqFBjBxqotWASbW7khFPreow36aU2mB9FFgWNxVvl7XRTMhygc3mM
 zwm8hytLIaTlBQ1HRnbV829Ax7sdi9YO1X9jB8NhYqUi74aS0j8+3Irjt
 Adm7tL1fOnCUaqLu45+eR3p0VulfTfN2RVwhtyspvTM8xkCH7g7iAlbcE
 Yh+ekkMVukpu8T/U0sxSPoefRqWt334Pd77Y1uY3Fllr0Sacg5YUY3ez5
 25wn0CeBb01llCbe7HwCZiBPITUhOfssVhjIkySM88qWFHm4LeBFdHoKq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="306140614"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="306140614"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 07:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="628713444"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="628713444"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 11 Oct 2022 07:28:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oiGEq-005LfS-1Y; Tue, 11 Oct 2022 17:28:08 +0300
Date: Tue, 11 Oct 2022 17:28:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Message-ID: <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com> <Y0V57gI75ik4ki3A@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0V57gI75ik4ki3A@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 02/36] gpiolib: cdev: Add missed
	header(s)
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

On Tue, Oct 11, 2022 at 10:13:02PM +0800, Kent Gibson wrote:
> On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > > > > -#include <linux/gpio.h>
> > > > >  #include <linux/gpio/driver.h>
> > > > > +#include <linux/gpio.h>
> > > > > +#include <linux/hte.h>
> > > >
> > > > Ok with the hte re-order.
> > > >
> > > > But moving the gpio subsystem header after the gpio/driver is not
> > > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > > to me the way it was.
> > > 
> > > I see, I guess this is vim sort vs shell sort. Strange, they should
> > > follow the locale settings...
> > 
> > I have checked, the shell and vim sort gave the same result as in this patch.
> > 
> 
> The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
> and that still returns the same result.  That matches what I would
> expect to see given the content of the text.
> 
> And for me vim also gives the original order.
> 
> Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?

$ LC_COLLATE=C sort test1.txt
#include <linux/gpio.h>
#include <linux/gpio/driver.h>

$ LC_COLLATE= sort test1.txt
#include <linux/gpio/driver.h>
#include <linux/gpio.h>

I guess this explains the difference. Currently I have en_US.UTF-8.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
