Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA44AE8309
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 14:45:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC55AC32EB0;
	Wed, 25 Jun 2025 12:45:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12620C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750855544; x=1782391544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u7KhYtYFfF8hIrEkFmomLpCGUnnfCnEiIwSY+/XufMM=;
 b=XRA7B5eQ+jHdYY16CVQDGt/W2gphoeXlSJHyVwJcziNubmVcDF8RJEOY
 bkbNp8zdVpimNOzZLJKWG5acAcpN6Cg4ubjMFNKASEvvdy1Euxr0wpqgd
 DfeM0joGQwPukGINjG4qRbv5dYqanrjacPyGIaLoAsofJQ77eyQ2C0RoB
 gMYXCRJ7gVgAY0gxdT6x4Hw8pwMhK67R//8zPCcpfQf2vNCzKU6/oKnDI
 xxCEBqeKAk9aERMpsQwllTf6020x8VJxOo2zR1ExO0Lr32ZrURrCoLow9
 EyDPLkWEwTyUe7+tKqDqjXLFVnGH9/fJ3f23jZiDYwjEqdkH7EMTDXI/s w==;
X-CSE-ConnectionGUID: zP681rJcTwaGHkVgyHRl7Q==
X-CSE-MsgGUID: 525gikdxR/ORw7s1h41WQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70556311"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="70556311"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:45:41 -0700
X-CSE-ConnectionGUID: NMZhsQVgQSaZDfVpbvOZBA==
X-CSE-MsgGUID: H2UvHpQ4SsKlNtvwARVPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="189380904"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:45:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uUPVN-00000009lll-1PDb; Wed, 25 Jun 2025 15:45:33 +0300
Date: Wed, 25 Jun 2025 15:45:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <aFvvbH9nJkgWqj_t@smile.fi.intel.com>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-3-bc110a3b52ff@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-3-bc110a3b52ff@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/12] gpio: sch: use new GPIO line value
	setter callbacks
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

On Wed, Jun 25, 2025 at 12:33:26PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
