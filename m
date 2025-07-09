Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21878AFE31C
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 10:48:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A83D1C36B2B;
	Wed,  9 Jul 2025 08:48:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9E01C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752050894; x=1783586894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ApbaFaUdVgbCLb3e8EMfbruCyFj7sOIBzssDOASSRBU=;
 b=JbR9CwapTPcc3u7m/wSiZymTY6ZJzm5WqvWPfOLBugawv5EcZBHhsrux
 +1xTV/S8nBR2EBui/C7to/OZXtlGjO3STQEnEfkynDTg9mmug0WpLm/ij
 psNXkn2azOjWhSr4TQLoLPHkMMF7LJWVWz4VKl2RJftQX3OfiEpzqwv/8
 nW8W278F+U/RXargzmevM19vXCdSvfL+PK/UeDczaaeru9p/joegvaFF7
 bk5PiDYHUZing3cYzNiIpe7WpqY8J4GgX9ITXnCTBWIn7GjurA1j3OZCb
 8MXGZo7F/J3IWFZ0TsAcLNzrBcyfyZC2rwYKAT+pnQ2HaWfPo7hSIETL3 Q==;
X-CSE-ConnectionGUID: uT0yxeY4SQiO3uC/cHAMHw==
X-CSE-MsgGUID: ivHPZEerRzKR8ziBxq2vug==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65366319"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="65366319"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 01:48:11 -0700
X-CSE-ConnectionGUID: HJKTXCCZRRaFCsDbctY33g==
X-CSE-MsgGUID: zEhTeGJUQDGJ+h9nL519UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="160029510"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 01:48:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1uZQTE-0000000DoRa-3oNF; Wed, 09 Jul 2025 11:48:04 +0300
Date: Wed, 9 Jul 2025 11:48:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <aG4sxEtXRw982Z9q@smile.fi.intel.com>
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
 <20250708231152.971550-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708231152.971550-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 05/12] iio: dac: Remove redundant
 pm_runtime_mark_last_busy() calls
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

On Wed, Jul 09, 2025 at 02:11:52AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().

...

> -	if (!enable) {
> -		pm_runtime_mark_last_busy(dev);
> +	if (!enable)
>  		pm_runtime_put_autosuspend(dev);
> -	}
>  
>  	return 0;
>  
>  err_put_pm:
> -	if (enable) {
> -		pm_runtime_mark_last_busy(dev);
> +	if (enable)
>  		pm_runtime_put_autosuspend(dev);
> -	}
>  
>  	return ret;


Hmm... Why not simply

	ret = 0;

err_put_pm:
	if (enable)
		pm_runtime_put_autosuspend(dev);

	return ret;

instead of the duplication?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
