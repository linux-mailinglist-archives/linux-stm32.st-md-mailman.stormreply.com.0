Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B82EC957362
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 20:34:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C964C6DD72;
	Mon, 19 Aug 2024 18:34:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE874C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 18:34:50 +0000 (UTC)
X-CSE-ConnectionGUID: mPuxWvd0TASnMLINOqPLPA==
X-CSE-MsgGUID: 5EehzecUQDmYVqKV/rQH6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33776007"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="33776007"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 11:34:49 -0700
X-CSE-ConnectionGUID: 5FtwFPEET8aOxXDZI/74iw==
X-CSE-MsgGUID: 6Xvndym9QEafUJ88JEQXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64640739"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 11:34:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy@kernel.org>) id 1sg7DC-0000000H2SS-0eRd;
 Mon, 19 Aug 2024 21:34:38 +0300
Date: Mon, 19 Aug 2024 21:34:37 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <ZsOQPbVGQFtUYSww@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-10-pstanner@redhat.com>
 <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, onathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Aug 19, 2024 at 08:19:28PM +0200, Christophe JAILLET wrote:
> Le 19/08/2024 =E0 18:51, Philipp Stanner a =E9crit=A0:


...

> Unrelated to the patch, but is is safe to have 'name' be on the stack?
> =

> pcim_iomap_region()
> --> __pcim_request_region()
> --> __pcim_request_region_range()
> --> request_region() or __request_mem_region()
> --> __request_region()
> --> __request_region_locked()
> --> res->name =3D name;
> =

> So an address on the stack ends in the 'name' field of a "struct resource=
".
> =

> According to a few grep, it looks really unusual.
> =

> I don't know if it is used, but it looks strange to me.

It might be used when printing /proc/iomem, but I don't remember by heart.

> If it is an issue, it was apparently already there before this patch.

This series seems to reveal a lot of issues with the probe/remove in many
drivers. I think it's better to make fixes of them before this series for
the sake of easier backporting.

If here is a problem, the devm_kasprintf() should be used.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
