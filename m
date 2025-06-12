Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBF7AD70CB
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 14:51:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 128F0C32E8E;
	Thu, 12 Jun 2025 12:51:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06552C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749732683; x=1781268683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Bql/TNuo24JhgENmtOEIa3XVAhbnXtyYW3C4rsZ9KFs=;
 b=EGwrJIx+eh0qBbRcea1QjOYX1R/PNSCFt/id9lSJiavelosU9hXpXsAB
 +b332KBBl9os9cGmSiRehkpc9Ed0fCQT9Ts1qllOL/VqfXeFVrWCq0KD4
 rzMPIWz954CFKDd7KRhzh9XBjlGOnmDg0qFItmWX+sjit6wZzldP/uvuB
 GH8O7Gez64He5/E/3fcd8H/F5njUq3Jw/pXkUStMKrvhmDC9d0IFODDmE
 mhN69llIotBRSX0uJxFFosNQYwFOjaCqm7bDvXxkJQpDDDm8sQfb70Qv4
 GOTvip6Il9E0OLqxZdBb8teAC3FHnO+/8g2H2R3AogWfHCGgMfwgqGmfg g==;
X-CSE-ConnectionGUID: Y/X5IcHiRSmJnFYYdBOcuQ==
X-CSE-MsgGUID: RepADE9YTeapoen2Ys8npQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69478292"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69478292"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:51:20 -0700
X-CSE-ConnectionGUID: mofzayPbSfemxo/78nvEhA==
X-CSE-MsgGUID: 65CP34ARQ+yNMlLSnRyUqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152795140"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:51:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uPhOg-00000005x89-01m7; Thu, 12 Jun 2025 15:51:10 +0300
Date: Thu, 12 Jun 2025 15:51:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <aErNPaZzvgAps_-b@smile.fi.intel.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>, linux-rockchip@lists.infradead.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

On Wed, Jun 11, 2025 at 05:38:52PM -0500, David Lechner wrote:
> Jonathan mentioned recently that he would like to get away from using
> memset() to zero-initialize stack memory in the IIO subsystem. And we
> have it on good authority that initializing a struct or array with = { }
> is the preferred way to do this in the kernel [1]. So here is a series
> to take care of that.

I believe we may do that independently of the compilers that can leave garbage
in the padding. In case it happens, it will be good adventure to fix the bugs
in the code, that for some reason take padding(s) into account for the real
values.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
