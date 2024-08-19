Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9BB957379
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 20:37:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA9CEC6DD72;
	Mon, 19 Aug 2024 18:37:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21277C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 18:37:14 +0000 (UTC)
X-CSE-ConnectionGUID: d5ESH3NzR8K8YBVRwAw0Bw==
X-CSE-MsgGUID: HdfkLdcxTlescgeZPlmpRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22536724"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="22536724"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 11:37:13 -0700
X-CSE-ConnectionGUID: RyFwEX5bROyf8abY2ZSm9w==
X-CSE-MsgGUID: +aUUQjLnRli3CXGq2n2fpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64851993"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 11:37:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy@kernel.org>) id 1sg7FU-0000000H2Uv-09RB;
 Mon, 19 Aug 2024 21:37:00 +0300
Date: Mon, 19 Aug 2024 21:36:59 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <ZsOQy5BVRVf16ryw@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-10-pstanner@redhat.com>
 <ZsOPnwQO8sppwI8u@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsOPnwQO8sppwI8u@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, onathan Corbet <corbet@lwn.net>,
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
 Hannes Reinecke <hare@suse.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, David Lechner <dlechner@baylibre.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 8/9] vdap: solidrun: Replace deprecated
	PCI functions
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

On Mon, Aug 19, 2024 at 09:32:00PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 19, 2024 at 06:51:48PM +0200, Philipp Stanner wrote:

...

> >  	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> > +		if (pci_resource_len(pdev, i)) {

Btw, looking at this you may invert the conditional

	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
		if (!pci_resource_len(pdev, i))
			continue;

It might make patch neater.

> > +			psnet->bars[i] = pcim_iomap_region(pdev, i, name);
> > +			if (IS_ERR(psnet->bars[i])) {
> > +				SNET_ERR(pdev, "Failed to request and map PCI BARs\n");
> > +				return PTR_ERR(psnet->bars[i]);
> > +			}
> > +		}

> >  
> 
> Blank line leftover.
> 
> >  	}

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
