Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499C5FC673
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Oct 2022 15:30:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECEE4C640F9;
	Wed, 12 Oct 2022 13:30:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17624C640F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 13:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665581416; x=1697117416;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tV/ZvJGYw4mf000OleNKwCzv+JZQjAKj+4wcxHqkOco=;
 b=n9mHN/N0+b1u4OdBEQGBEolzKIudYQgVNiqqyXAREXSmyXQKhdkyybkO
 bshqKZObqHZU/owHaggfj3HaR3P8D+/kRTNc4AwA5x7Rbk2A2lNL2SMTP
 qY+ibM3Wshf5xwJ+oZnIoSLFT3qj902mPvb1thHoEHLf5ZLR9CYV0xY0X
 ocReocNPHdJgZd542vOcByQ32VgKlcNg/X/ZEwOYPhfHLKTp4HnsyIN4I
 Ipa0zBbpQhfO4IReQYC8JQJdEiasBRGGc7XK48LlMebR16v2uDZc9rGBu
 HU12sEDm5z3aFw3BqwcTgS0/MWxRrDux8Ot0xcIqzSVKbMTaow9+3QPaj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="284517890"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="284517890"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 06:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="626766256"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="626766256"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP; 12 Oct 2022 06:30:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oiboD-005qlS-1e; Wed, 12 Oct 2022 16:30:05 +0300
Date: Wed, 12 Oct 2022 16:30:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Message-ID: <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0SyVwjDl7NGfTPn@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, patches@opensource.cirrus.com,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

On Tue, Oct 11, 2022 at 08:01:27AM +0800, Kent Gibson wrote:
> On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > -#include <linux/gpio.h>
> >  #include <linux/gpio/driver.h>
> > +#include <linux/gpio.h>

> But moving the gpio subsystem header after the gpio/driver is not
> alphabetical ('.' precedes '/') and it read better and made more sense
> to me the way it was.

Okay, I will move it back.

...

> > +#include <linux/seq_file.h>
> 
> I wasn't aware that we use anything from seq_file.
> What am I missing?


Eventually I can answer to your question: the commit 0ae3109a8391
("gpiolib: cdev: add fdinfo output for line request file descriptors")
is what you are missing.

That said, we need this patch.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
