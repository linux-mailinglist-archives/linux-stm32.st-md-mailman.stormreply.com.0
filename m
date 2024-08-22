Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9361E95B8CD
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 16:45:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47992C71287;
	Thu, 22 Aug 2024 14:45:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54C12C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 14:45:40 +0000 (UTC)
X-CSE-ConnectionGUID: LXHU3JFaSGu2MygB5Y8Lgw==
X-CSE-MsgGUID: xp7SrPQsR5a7FDIdUFVaCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22360680"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22360680"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 07:45:38 -0700
X-CSE-ConnectionGUID: 8qTJ1xUcTSCwD9dSqx9njw==
X-CSE-MsgGUID: DQf8vM2PTiWk6u+9lqITwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65665426"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 07:45:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy@kernel.org>) id 1sh93K-00000000U3f-1bWg;
 Thu, 22 Aug 2024 17:44:42 +0300
Date: Thu, 22 Aug 2024 17:44:42 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <ZsdO2q8uD829hP-X@smile.fi.intel.com>
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-6-pstanner@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822134744.44919-6-pstanner@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 David Lechner <dlechner@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 5/9] ethernet: cavium: Replace
	deprecated PCI functions
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

On Thu, Aug 22, 2024 at 03:47:37PM +0200, Philipp Stanner wrote:
> pcim_iomap_regions() and pcim_iomap_table() have been deprecated by
> the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
> pcim_iomap_table(), pcim_iomap_regions_request_all()").
> 
> Replace these functions with the function pcim_iomap_region().

...

> -	err = pcim_iomap_regions(pdev, 1 << PCI_PTP_BAR_NO, pci_name(pdev));
> -	if (err)
> +	clock->reg_base = pcim_iomap_region(pdev, PCI_PTP_BAR_NO, pci_name(pdev));
> +	if (IS_ERR(clock->reg_base)) {
> +		err = PTR_ERR(clock->reg_base);
>  		goto error_free;
> -
> -	clock->reg_base = pcim_iomap_table(pdev)[PCI_PTP_BAR_NO];
> +	}

Perhaps

	clock->reg_base = pcim_iomap_region(pdev, PCI_PTP_BAR_NO, pci_name(pdev));
	err = PTR_ERR_OR_ZERO(clock->reg_base);
	if (err)
		goto error_free;

This will make your patch smaller and neater.

P.S. Do you use --histogram diff algo when preparing patches?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
