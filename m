Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB8A82A73
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Apr 2025 17:33:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7220CC78F9A;
	Wed,  9 Apr 2025 15:33:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A74B7C78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744212803; x=1775748803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mErJO8k3cpuBPBmJcDHzl2+V5zvBB5RozSbgoAix5w4=;
 b=SkkELMUBY5d6oRMQII4HZMnoST8hSmQoqbHIB0o9dUHk3CHsLQbMVXMf
 CKBwyLxRC+KF6Q+IZahHGeGHP5NtFRJah/5z6N74WjQ32sZ1gpf07KJed
 a0sFft1gR0nzTYY6jeL0Ssllxe3VWgTohCBlZNHc4f5aF7zUBupOlEhcM
 CFLNn0FsSQEhrwhvxLhZrNajfadmjAVhjYs+X95TQvreZ9NBbrbSQj3H2
 BOefreKSy+QFmgmyIYiEe/IymqAVIymgbZqWpWH+CnkwKbor8SdSmidPm
 o2OkFBtoCXsgdNZbLzWC85nrk7HB21qSa8kEmMMdZeSdlO5o7af+Sn7cK w==;
X-CSE-ConnectionGUID: rjQPF92hRbW/87v4eS8VPw==
X-CSE-MsgGUID: UK1+xo6zRgattLMREPUJLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45582299"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45582299"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 08:33:21 -0700
X-CSE-ConnectionGUID: Fpvn1roRQguN0PtW+NjSfA==
X-CSE-MsgGUID: hp7hC+GATASRmDoW92HvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="128354896"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 08:33:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u2XQQ-0000000AmNz-0KQG; Wed, 09 Apr 2025 18:33:14 +0300
Date: Wed, 9 Apr 2025 18:33:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Z_aTOUUmyXpWnt57@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409122314.2848028-3-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Arnd Bergmann <arnd@arndb.de>, Yu Jiaoliang <yujiaoliang@vivo.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/10] [v2] Input: stmpe-ts - use module
 alias instead of device table
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

On Wed, Apr 09, 2025 at 02:22:55PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When compile tested with W=1 on x86_64 with driver as built-in:
> 
>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]
> 
> Ideally this would be referenced from the platform_driver, but since
> the compatible string is already matched by the mfd driver for its
> parent device, that would break probing.
> 
> In this case, the of_device_id table just serves as a module alias
> for loading the driver, while the device itself is probed using
> the platform device name.
> 
> Remove the table and instead use a module alias that reflects how
> the driver is actually probed.

...

> +MODULE_ALIAS("platform:stmpe-ts");

Isn't the preferable way to have platform device ID table instead?
Krzysztof?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
