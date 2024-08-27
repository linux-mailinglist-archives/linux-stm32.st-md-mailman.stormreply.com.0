Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68E969681
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 10:06:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 534DBC7801B;
	Tue,  3 Sep 2024 08:06:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F128C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 03:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724729499; x=1756265499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZsAX6fYNBN8s4cM6prV7+Nw4KR6G6zRcui+vpWCXiiM=;
 b=BJjUFrWIvUGXsDL8C7ZxsuDHx5rni6crZfmSc6KXUNadLlrkJL1GoIgB
 JHOTefpR0QhGak9+rYkwNYxAXHd1MnkbtZgNBLv2jhbGdcmS5y99to6Nx
 MiLBlfJ6G7/90nFuvAuFQpDpz8FfImoCkCSTl4UrKm1k1m1K/yn+ZSwDp
 YrJjeSHr6Ml5iLqMSvQFlpFz8jxuYN5xHeVRvGWpEQtfi6CnHUUX8zLsE
 kCdQuSGdExoee9DKsYFNR83HM06uCW+q4aJCHi5Bbuoyo/QMF+Rf+WFj5
 e69uRGmFn0+40NV0lkdwTX7BzVsUOAZxE9lSVRBrLoPkuRpHiFUQt+qy0 Q==;
X-CSE-ConnectionGUID: czWTYVWCRD2BhlFU+iOx/g==
X-CSE-MsgGUID: O5JfxXUASbW6elSTCGK1fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23154136"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23154136"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 20:31:30 -0700
X-CSE-ConnectionGUID: QDU5QLH3TqucnA37kaonFw==
X-CSE-MsgGUID: w9+02ioqSw6jKQ/o9ovjaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62698679"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa008.fm.intel.com with ESMTP; 26 Aug 2024 20:31:22 -0700
Date: Tue, 27 Aug 2024 11:28:59 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <Zs1H+zgzZAuLUnza@yilunxu-OptiPlex-7050>
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-3-pstanner@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822134744.44919-3-pstanner@redhat.com>
X-Mailman-Approved-At: Tue, 03 Sep 2024 08:06:49 +0000
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Andy Shevchenko <andy@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>,
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
Subject: Re: [Linux-stm32] [PATCH v3 2/9] fpga/dfl-pci.c: Replace deprecated
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

On Thu, Aug 22, 2024 at 03:47:34PM +0200, Philipp Stanner wrote:
> pcim_iomap_regions() and pcim_iomap_table() have been deprecated by the
> PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
> pcim_iomap_table(), pcim_iomap_regions_request_all()").
> 
> Port dfl-pci.c to the successor, pcim_iomap_region().
> 
> Consistently, replace pcim_iounmap_regions() with pcim_iounmap_region().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Acked-by: Xu Yilun <yilun.xu@intel.com>

Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
