Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7F95849F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 12:32:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8074CC6DD66;
	Tue, 20 Aug 2024 10:32:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAA17CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 10:32:31 +0000 (UTC)
X-CSE-ConnectionGUID: Evv+FPodRRKVoNT/AuBGrA==
X-CSE-MsgGUID: kfXjhyjNTiW2Ww8B95G71g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22324657"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22324657"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:32:30 -0700
X-CSE-ConnectionGUID: bgvkjWUKT6CGVtHoylpWSw==
X-CSE-MsgGUID: 3ydoSxXsQZCyk4cZEMBrXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="91458848"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:32:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy@kernel.org>) id 1sgM9w-0000000HGS5-2gMy;
 Tue, 20 Aug 2024 13:32:16 +0300
Date: Tue, 20 Aug 2024 13:32:16 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <ZsRwsDWQT6dmwC1p@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-8-pstanner@redhat.com>
 <ZsONiNkdXGMKMbRL@smile.fi.intel.com>
 <5d70794731198ec7bc59bd95e50a8aa81cf97c7b.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d70794731198ec7bc59bd95e50a8aa81cf97c7b.camel@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 6/9] ethernet: cavium: Replace deprecated
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Aug 20, 2024 at 09:40:09AM +0200, Philipp Stanner wrote:
> On Mon, 2024-08-19 at 21:23 +0300, Andy Shevchenko wrote:
> > On Mon, Aug 19, 2024 at 06:51:46PM +0200, Philipp Stanner wrote:

...

> > cavium_ptp_probe()
> > =

> > > -	pcim_iounmap_regions(pdev, 1 << PCI_PTP_BAR_NO);
> > > +	pcim_iounmap_region(pdev, PCI_PTP_BAR_NO);
> > > =A0
> > > =A0error_free:
> > > =A0	devm_kfree(dev, clock);
> > =

> > Both are questionable. Why do we need either of them?
> =

> You seem to criticize my pcim_iounmap_region() etc. in other unwind
> paths, too.

Yes, having devm/pcim/etc_m in the clean up / error paths seems at bare min=
imum
confusing, or reveals wrong use of them or even misunderstanding the concep=
t...

And it's not your fault, it was already in those drivers like that...

> I think your criticism is often justified. This driver
> here, however, was the one which made me suspicious and hesitate and
> removing those calls; because of the code below:
> =

> =

> 	pcim_iounmap_region(pdev, PCI_PTP_BAR_NO);
> =

> error_free:
> 	devm_kfree(dev, clock);
> =

> error:
> 	/* For `cavium_ptp_get()` we need to differentiate between the case
> 	 * when the core has not tried to probe this device and the case when
> 	 * the probe failed.  In the later case we pretend that the
> 	 * initialization was successful and keep the error in
> 	 * `dev->driver_data`.
> 	 */
> 	pci_set_drvdata(pdev, ERR_PTR(err));
> 	return 0;
> }
> =

> So in case of an error they return 0 and do... stuff.
> =

> I don't want to touch that without someone who maintains (and, ideally,
> understands) the code details what's going on here.

Thanks for elaboration, indeed it was not enough context to see the full
picture. This seems like an ugly hack that has to be addressed at some poin=
t.
But again, not your fault.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
