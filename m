Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2788B31373
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 11:39:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98A1DC3F95A;
	Fri, 22 Aug 2025 09:39:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2AD4C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855568; x=1787391568;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7TUjIdFSpxdPwhWS7KavRP+nexN6+krDK0zXKT3Z4nI=;
 b=lGBIGLJS6HOSbRe2QS0LmpUWoJBiH68ex3L2pXQLrKtiyk5WqBuNu4EV
 2C7jTQv8iWL42BCFUOZ/kSZV1BoRew/kQ1TSgikzC92D2pMh+8ujd7lKc
 DwITehL27mL/oF9U+JOok3vS6rr5PkaQNssf9g8ZyBVMS6h1f+BIQyWxm
 qQTcDDe/3MJ5Gh+xjY1G5bEhNuGGi1MT3iLmJwggB/ZKWShn0oi/Rjwfq
 eFQw4QKS6pYif1it1lucWZ1s5QUnuHgS2QzGTsRdrviU7taowf3pSvTv9
 AwUsdb/75u8VJeu3mn5tfs3lGSER527f4YhK2KC5HxVNvvlFUN0Hnn8eK w==;
X-CSE-ConnectionGUID: TcoM4hbvRFK1IUO7i9+Yww==
X-CSE-MsgGUID: Eoc66El0Sf+7vVZHhzlfpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69260153"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="69260153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:39:26 -0700
X-CSE-ConnectionGUID: f9G7SEp4RL+f9OQZP3DIVg==
X-CSE-MsgGUID: a3E0ehOpQtuXsOFDu60/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="168177411"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:39:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1upOEu-00000007Tma-2yFG; Fri, 22 Aug 2025 12:39:16 +0300
Date: Fri, 22 Aug 2025 12:39:16 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dixit Parmar <dixitparmar19@gmail.com>
Message-ID: <aKg6xF4w2ugRqDMt@smile.fi.intel.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250822-enomam_logs-v1-1-db87f2974552@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250822-enomam_logs-v1-1-db87f2974552@gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 01/10] iio: accel: Drop unnecessary
	-ENOMEM messages
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

On Fri, Aug 22, 2025 at 09:19:49AM +0530, Dixit Parmar wrote:
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().

Misplaced (), should be like
"...So remove the dev_err() messages from the probe."

Same applies to all of the affected commit messages in the series.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
