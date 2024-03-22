Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606488706D
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Mar 2024 17:09:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19B93C6DD95;
	Fri, 22 Mar 2024 16:09:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 377D2C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711123794; x=1742659794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cuGiQISoVKHBaZbLIVHnraYHHoAO1WEtkqCEo2+zeaY=;
 b=NVyyXWHCmlAixwfKFI+/jPqvrwBdLr86e3HKkjICM560i+bXRrEVq3MF
 vcmtG6ZAK3PWCX0yEeG2YgVQj7/gqaeyl9iwEIib7W5LsK9ewuBjgMoAT
 WheVuS+hOGKsI+iWnUxRNe7Gy5OXnNF81WZasO7mbPApUrOrUL9fslyZI
 TGzb9koDJRnL7M3gjgvde/fXzLAPzTNkClu1DI2AXt9QjwLcWQs9mEoLR
 FSRRgbjq/NcT6q8C8FkSEbn0KSGMrCm0bbNBgu0qgK99ltu3lJvf69Ow4
 JNUL1S/DA5V0fpC6E+Bm+Toy+3JZHXmLwrlSBjqxAI+2WbaGEGjv4QkVb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23634249"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="23634249"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914747988"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="914747988"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:09:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rnhSi-0000000FCTj-1lkG; Fri, 22 Mar 2024 18:09:44 +0200
Date: Fri, 22 Mar 2024 18:09:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 asahi@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH 64/64] i2c: reword i2c_algorithm in
 drivers according to newest specification
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

On Fri, Mar 22, 2024 at 02:25:57PM +0100, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.

...

>  static const struct i2c_algorithm at91_twi_algorithm = {
> -	.master_xfer	= at91_twi_xfer,
> +	.xfer	= at91_twi_xfer,

Seems you made this by a script, can you check the indentations afterwards?

>  	.functionality	= at91_twi_func,
>  };

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
