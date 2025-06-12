Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D06ADAD7AEA
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 21:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94F23C32E8E;
	Thu, 12 Jun 2025 19:10:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67A1CC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 19:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749755424; x=1781291424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BQ0TV5Stz/vWyyu62ZhSbJbmlu58TvJYqNpEEOYBVC0=;
 b=A11BJwqdZ4Fm92Uxq9hhLgys0AE1aHoSClDjtZvmZx2+z4zG7QKGyCkr
 zQIvDXwhdZZkcMJBq+ed04fh5ADUTQWoxBEgUOmPVdskZYs1VGbYzSOhp
 d6r2mZ6caMM6EOBAJE60SxKp2k5TI6owqh7yNrzcH/XD+yyP5TruccVuj
 1MiBmCZqq5MfUCXIvBGYNq0arrxOvYAvd3Zwr/3Pjk9TMIrsCXX03ESX1
 CE2qTGftQTkzntngO6wfemvSxgbbMH4qBBTxGKPyx3leeBG4ZDMLSEnN5
 IPyNH75AqwKHF8sqZU/Bq1pFUl2wcxCQNQ+cnJoTGOPgoPc21K0/0/9ML A==;
X-CSE-ConnectionGUID: RcfH1qPFRkGwLWMLMkyDdQ==
X-CSE-MsgGUID: O/aPDB9tSuauVeI2sLMM7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52093204"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="52093204"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:10:21 -0700
X-CSE-ConnectionGUID: e9iD3O3SS36bVUZFVNkguw==
X-CSE-MsgGUID: lSBa5jyTT9mJ70WAU7t4XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="184852801"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:10:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1uPnJQ-000000061me-0q0g; Thu, 12 Jun 2025 22:10:08 +0300
Date: Thu, 12 Jun 2025 22:10:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Pavel Machek <pavel@ucw.cz>
Message-ID: <aEsmDyc44P8amm5p@smile.fi.intel.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz> <2243943.irdbgypaU6@workhorse>
 <aEsiTy++yKGe1p9W@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEsiTy++yKGe1p9W@duo.ucw.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-rockchip@lists.infradead.org,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 David Lechner <dlechner@baylibre.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
 kernel@pengutronix.de, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/28] iio: zero init stack with { }
	instead of memset()
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

On Thu, Jun 12, 2025 at 08:54:07PM +0200, Pavel Machek wrote:
> > On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel Machek wrote:
> > > 
> > > > Jonathan mentioned recently that he would like to get away from using
> > > > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > > > have it on good authority that initializing a struct or array with = { }
> > > > is the preferred way to do this in the kernel [1]. So here is a series
> > > > to take care of that.
> > > 
> > > 1) Is it worth the churn?
> > > 
> > > 2) Will this fail to initialize padding with some obscure compiler?
> > 
> > as of right now, the only two C compilers that are supported are
> > GCC >= 8.1, and Clang >= 13.0.1. If anyone even manages to get the
> > kernel
> 
> Well... I'm pretty sure parts of this would make it into -stable as a
> dependency, or because AUTOSEL decides it is a bugfix. So..
> 
> GNU C                  4.9              gcc --version
> Clang/LLVM (optional)  10.0.1           clang --version

Even though, what the kernel versions are you referring to? I am sure there
plenty of cases with {} there.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
