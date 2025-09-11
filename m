Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CCAB52A7E
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 09:50:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E23D4C349C1;
	Thu, 11 Sep 2025 07:50:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E27BC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 07:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757577036; x=1789113036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m30L7S1WvoRggLHv6LreiIlctXHF+XJ1XKVdT0+e9qo=;
 b=UQH1sXvrKR4o375Ujs6SfJ1iosfXmsz6Ss5Iq4k2sgFmWOlrk7l5RJjw
 91dv4stVBjV0GleW/3JySnr5ScS+1KrwS9d0iQpojThbu1tlzjTBl54iX
 UMCSg3E0e27A97u21GARX0PCpYCEd0Cd2uC0QRenZ33VqAZIuWOegheCc
 wIll8lgWsF3SyZ8cV3fy3QM8hvySYzXjqiHAr4RrKgq15tVks7F0CimwZ
 Ixik4veLIaTdyv0dhT2hxzj1iQn5Y61i/hS4PClT8rOkXYgw4Xuw+16oD
 pJGd9KLXZpq8YH1C3N7pS+5yWVwi8ruiAKF8UevKYtslObX9gARTEjxpB g==;
X-CSE-ConnectionGUID: FyqwJPcsSmSmr1hvES6I5A==
X-CSE-MsgGUID: 1PoQUcAjQMWhkoa2eMXgzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="58941635"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="58941635"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:50:32 -0700
X-CSE-ConnectionGUID: /rkAzoZPQPW19fuKTvUXuA==
X-CSE-MsgGUID: uzsJIT7GTJKG20+iNoc2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="178821912"
Received: from smile.fi.intel.com ([10.237.72.51])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:50:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1uwc4R-000000022QJ-0Efr; Thu, 11 Sep 2025 10:50:19 +0300
Date: Thu, 11 Sep 2025 10:50:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <aMJ_Ohp5YtYNFnYV@smile.fi.intel.com>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, imx@lists.linux.dev,
 Tomer Maimon <tmaimon77@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 James Cowgill <james.cowgill@blaize.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Fair <benjaminfair@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, openbmc@lists.ozlabs.org,
 Lee Jones <lee@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 linux-gpio@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>,
 Yang Shen <shenyang39@huawei.com>, Scott Branden <sbranden@broadcom.com>,
 Neil Jones <neil.jones@blaize.com>, linux-unisoc@lists.infradead.org,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matt Redfearn <matt.redfearn@blaize.com>, Imre Kaloz <kaloz@openwrt.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 0/3] gpio/pinctrl/mfd: use more common
 syntax for compound literals
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

On Wed, Sep 10, 2025 at 09:25:44AM +0200, Bartosz Golaszewski wrote:
> As discussed[1] with Andy: it's probably better to use a more common
> syntax for compound literals so fix the commits that converted GPIO
> chips to using the new generic GPIO chip API and make them explicitly
> spell out the type they're initializing.
> 
> Each commit in this series can go directly into its respective tree:
> MFD, pinctrl and GPIO.

Thank you! All look good to me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> [1] https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
