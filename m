Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDC3602C6E
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Oct 2022 15:07:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95639C64101;
	Tue, 18 Oct 2022 13:07:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65AA6C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666098476; x=1697634476;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sEQGqXRBwnqb8HWOCi92bXpDgq1DcIK6JeLU6KGQmhU=;
 b=K62UIxX+STbpnrNYvP4CozwQ6Rk5Kx0fN8RqudOKv11N94jIQsmBktCn
 2NKlsrnwQ7UsbcWxEjYImPb6+Fgv0zj61Z0zCixLj0+ypnGVBvDut9LrS
 ETxYIOqD8hiUppH0/mHRX5/Y5Gz2GM3/rMYeK555El9x9S8zc8exMsYwI
 9R4uUJPvfex7fovUvJ9KDX2Op/uusIJ8BUprIgLKumOfetOJxCosrK8GA
 2/r2kuF6xhMBH1EZEaD3/YRktQWlF/lfD3yXD1010tSKc6fI92hg2Z+Rs
 VWqw2u3OfPV/QcoeISN/WxPmC9nUQbNTA/tpXdEdlqD8llFv4B1okVET9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="370295883"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="370295883"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 06:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="659781896"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="659781896"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga008.jf.intel.com with ESMTP; 18 Oct 2022 06:07:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1okmJu-009NCP-2i; Tue, 18 Oct 2022 16:07:46 +0300
Date: Tue, 18 Oct 2022 16:07:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <Y06lIq+2+MPRL45W@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com>
 <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
 <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
 <Y0UyOWALxSFai2w6@smile.fi.intel.com>
 <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Kent Gibson <warthog618@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v2 36/36] pinctrl: Clean up headers
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

On Tue, Oct 18, 2022 at 03:04:44PM +0200, Geert Uytterhoeven wrote:
> On Tue, Oct 11, 2022 at 11:07 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 11, 2022 at 10:46:30AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Oct 11, 2022 at 9:31 AM Basavaraj Natikar <bnatikar@amd.com> wrote:

...

> > > I can confirm adding
> > >
> > >     #include <linux/pinctrl/pinconf.h>
> > >
> > > to drivers/pinctrl/renesas/pinctrl-rzn1.c and drivers/pinctrl/pinctrl-single.c
> > > fixes the issues I was seeing with shmobile_defconfig and (out-of-tree)
> > > renesas_defconfig.
> >
> > I will add this, thank you for reporting.
> 
> Same for drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c.

Thanks!

Not only. I have updated all of them (but missed zynq (it is in today's Linux
Next).

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
