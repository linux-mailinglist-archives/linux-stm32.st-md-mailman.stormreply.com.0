Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FEB9584BB
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 12:37:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E32B1C6DD66;
	Tue, 20 Aug 2024 10:37:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1D17CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 10:37:43 +0000 (UTC)
X-CSE-ConnectionGUID: qgvSl1qdQ86bZxiPvQExUw==
X-CSE-MsgGUID: zcwyliDzRVmIYMv6gZ6SXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26307104"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="26307104"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:37:42 -0700
X-CSE-ConnectionGUID: nWFywAqfTeSsKI2HcF+BTA==
X-CSE-MsgGUID: LFqzb9g/TbCg/PzI2I/nxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60665629"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:37:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy@kernel.org>) id 1sgMEy-0000000HGXR-3q0A;
 Tue, 20 Aug 2024 13:37:28 +0300
Date: Tue, 20 Aug 2024 13:37:28 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <ZsRx6OyqHPL0ws0e@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-9-pstanner@redhat.com>
 <ZsOO2uuGmD97Mocj@smile.fi.intel.com>
 <ef48369d230ef1912da157e7b437040bece6b5f4.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef48369d230ef1912da157e7b437040bece6b5f4.camel@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 7/9] ethernet: stmicro: Simplify PCI
	devres usage
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

On Tue, Aug 20, 2024 at 09:52:40AM +0200, Philipp Stanner wrote:
> On Mon, 2024-08-19 at 21:28 +0300, Andy Shevchenko wrote:
> > On Mon, Aug 19, 2024 at 06:51:47PM +0200, Philipp Stanner wrote:

...

> > loongson_dwmac_probe()
> > =

> > > +	memset(&res, 0, sizeof(res));
> > > +	res.addr =3D pcim_iomap_region(pdev, 0, pci_name(pdev));
> > > +	if (IS_ERR(res.addr)) {
> > > +		ret =3D PTR_ERR(res.addr);
> > > +		goto err_disable_device;
> > =

> > It seems your series reveals issues in the error paths of .probe():s
> > in many drivers...
> > =

> > If we use pcim variant to enable device, why do we need to explicitly
> > disable it?
> =

> No.

Can you elaborate? No issues being revealed, or no need to disable it
explicitly, or...?

> > > =A0	}

...

> > loongson_dwmac_remove()
> > =

> > > =A0	pci_disable_msi(pdev);
> > > =A0	pci_disable_device(pdev);
> > =

> > Not sure why we need these either...
> =

> It's complicated.
> =

> The code uses pciM_enable_device(), but here in remove
> pci_disable_device().
> =

> pcim_enable_device() sets up a disable callback which only calls
> pci_disable_device() if pcim_pin_device() has not been called.
> =

> This code doesn't seem to call pcim_pin_device(), so I think
> pci_disable_device() could be removed.
> =

> =

> I definitely would not feel confident touching pci_disable_msi(),
> though. The AFAIK biggest problem remaining in PCI devres is that the
> MSI code base implicitly calls into devres, see here [1]

But isn't it a busyness of PCI core to call pci_disable_msi() at the right
moment? Okay, I admit that there might be devices that require a special
workflow WRT MSI, is this the case here?

> [1] https://lore.kernel.org/all/ee44ea7ac760e73edad3f20b30b4d2fff66c1a85.=
camel@redhat.com/

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
