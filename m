Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5735A51F820
	for <lists+linux-stm32@lfdr.de>; Mon,  9 May 2022 11:28:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10CC9C5F1D3;
	Mon,  9 May 2022 09:28:09 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 548CFC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 May 2022 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652088487; x=1683624487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jHBUo4IZJ5wDgySYfLtBXCx8yanDJE1x8luvraGTq3g=;
 b=XMK6d+B66XA6T5Bop9tRaTAP3Q/XnHljER4btzIP8GW77AJTKUPqgZTa
 qQiqimTDpXOjupT/k3weHyGlfgUgi3nktg8KnVC0dnbv/W0vnfoE7Db8n
 +9O+XUwWHJiAZW9QsRYaEGRkcq83r8hSEJ/D8PJJxz8x3bIIpvrtbJavi
 xN+LROXEf8aQSBcgXLDfnqmyRHj/gkPYhz39DryMpukzKwwCWipwoh7DK
 FjY8SzvDo3oyrbKkxMN8S0tHDIHVlqlg8Gf/B09TiwrIqghXIVOO/SmRK
 VpVLoN75XFgRzm/F9wvP2RwUTAmUyZ5L8HFrZDd2AIQ+Q8DuwHbdUOxuL w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="267835971"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="267835971"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:28:05 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="550934317"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:28:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nnzgN-00DrIB-Q6; Mon, 09 May 2022 12:27:59 +0300
Date: Mon, 9 May 2022 12:27:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fabien DESSENNE <fabien.dessenne@foss.st.com>
Message-ID: <YnjenwfMd6zttOOA@smile.fi.intel.com>
References: <20220507102257.26414-1-andriy.shevchenko@linux.intel.com>
 <30a2c669-693f-45ec-df0e-610e1f94bffd@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30a2c669-693f-45ec-df0e-610e1f94bffd@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] pinctrl: stm32: Unshadow np
 variable in stm32_pctl_probe()
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

On Mon, May 09, 2022 at 09:39:57AM +0200, Fabien DESSENNE wrote:
> Hi Andy
> 
> 
> Thank you for the patch.
> 
> Will this patch be applied in Linus pinctrl tree, or in the gpio-intel tree
> before being merged (linux-next) in the pinctrl tree?

I believe the pin control tree is a primary here, while applying to GPIO tree
won't harm. But I maintain neither of them :-)

> On 07/05/2022 12:22, Andy Shevchenko wrote:
> > The np variable is used globally for stm32_pctl_probe() and in one of
> > its code branches. cppcheck is not happy with that:
> > 
> >    pinctrl-stm32.c:1530:23: warning: Local variable 'np' shadows outer variable [shadowVariable]
> > 
> > Instead of simply renaming one of the variables convert some code to
> > use a device pointer directly.
> > 
> > Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_node() helper")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
