Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5092B896AD7
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 11:40:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DCB9C69063;
	Wed,  3 Apr 2024 09:40:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33214C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712137235; x=1743673235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ICn91gnq+iMytIBB6tqjA6afiAWPNDHdNzxVladSkzI=;
 b=Zt4UhtnCXfczh8TqNEO9LKdI4UVkAlKe5mduHsTuQHJdqhAT7Iw3EKgl
 QYTWN2Y0pL3ZsCYILvw3UaP9KbXsM1O94I9K6Hrd9PNuMYaqsw+bHYrWm
 fVWBNIdyh6n3N/0uHTxrTtn0aJWWMih2l1wOi3Nx1fNUWlD/7FXDTMYZb
 2BYdUkE7mnFvXaaZikkWPZ7KJKStiFYBYP0PLRZ2sFmLTpl1kV1cxypYR
 clzkwrvPFUye69+g5F8+P1zg7oK44LvBZBJwkKtQ+RcJ47JGC5w3FWsL1
 XZRh1yMorD64ev4Oh7Z5HJGXM/W2eK+cCW6e1U4LASVWVZBZWFQN+wnXY Q==;
X-CSE-ConnectionGUID: 8yJ/x4q0ScSTAS89cWv0pQ==
X-CSE-MsgGUID: Xg+Fvh9ZSHOnim1P+8N7ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7219510"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7219510"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="915176296"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="915176296"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:40:30 -0700
Received: from andy by smile with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1rrx6Z-000000014uW-3jLk; Wed, 03 Apr 2024 12:40:27 +0300
Date: Wed, 3 Apr 2024 12:40:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Zg0kC6uYFOi-UGXl@smile.fi.intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-8-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080702.3509288-8-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/34] Input: stmpe-ts - mark OF related
 data as maybe unused
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

On Wed, Apr 03, 2024 at 10:06:25AM +0200, Arnd Bergmann wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> When compile tested with W=1 on x86_64 with driver as built-in:
> 
>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]

...

> -static const struct of_device_id stmpe_ts_ids[] = {
> +static const struct of_device_id stmpe_ts_ids[] __maybe_unused = {

__maybe_unused? 

Why not adding it into .driver as you have done in another patch in this series?

>  	{ .compatible = "st,stmpe-ts", },
>  	{ },
>  };

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
