Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AA1B31385
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 11:41:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C958DC3F95A;
	Fri, 22 Aug 2025 09:41:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B04A3C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855692; x=1787391692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RZKftV/2n/t5kgoSakypDVxhxqhMEzE7Gy6hWmya91U=;
 b=oIgrLh4ZoVwb4h/O8Jl6ec8rqbBLVFn4AKBOnbU0f/UQzl05tmS0GEQa
 wg1kVaaXVginUTPeAfUXXVaeM9ZVKwQSoNyOTPpJ8+0fuGj6owknjwwF1
 0Pnva+3inkhMv4L5jM1OCO9eBzvGyLj16B12ZYWATyVF6kz60Y+8dk6d2
 0KH6g14p9SWg3Vw6AL1vgEs2fSVX2qV9ipu51oeh3QO0VW/b4NYSEoMe+
 gs1Z320c4OAPGzpKdtuQratI9HwGIMllOHCTKjiSkVPcsanly+olnvmUz
 EHlDq8hqj6Kj5ElAAzZN3Mc9cIpxJ2yhuZ/axFqurtDHRnTTBgGPZ9xQb w==;
X-CSE-ConnectionGUID: HWXA1xNIQJWfKNWHAT7aJw==
X-CSE-MsgGUID: xBMqebLPSsuoOHVDe1XHKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61994832"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61994832"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:29 -0700
X-CSE-ConnectionGUID: 7dUmcja+THqiuGqu0CivaA==
X-CSE-MsgGUID: 0REQ5MhYReu1rNaxxngBzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="172857947"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1upOGs-00000007To4-2PQ4; Fri, 22 Aug 2025 12:41:18 +0300
Date: Fri, 22 Aug 2025 12:41:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dixit Parmar <dixitparmar19@gmail.com>
Message-ID: <aKg7Ptj4jy4Icvgo@smile.fi.intel.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250822-enomam_logs-v1-2-db87f2974552@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250822-enomam_logs-v1-2-db87f2974552@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Haibo Chen <haibo.chen@nxp.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Lechner <dlechner@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-samsung-soc@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 02/10] iio: adc: Drop unnecessary -ENOMEM
	messages
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

On Fri, Aug 22, 2025 at 09:19:50AM +0530, Dixit Parmar wrote:
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().

...

>  	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*ddata));
> -	if (!indio_dev) {
> -		dev_err(&pdev->dev, "failed to allocate iio device\n");
> -
> +	if (!indio_dev)
>  		return -ENOMEM;
> -	}
> +
>  	ddata = iio_priv(indio_dev);
>  	ddata->ato = device_get_match_data(&pdev->dev);
>  	if (!ddata->ato)

Looking at this hunk I'm wondering if you are using --histogram diff algo when
preparing patches. If not, please do for the next version.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
