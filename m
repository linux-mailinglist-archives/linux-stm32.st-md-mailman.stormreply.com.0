Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F6AD9D6D
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 16:19:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BF13C36B3D;
	Sat, 14 Jun 2025 14:19:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0445C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 14:18:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AC98EA50B0B;
 Sat, 14 Jun 2025 14:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDCEC4CEEB;
 Sat, 14 Jun 2025 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749910737;
 bh=TAefawj8sFz6PzX77ED0UDRrtR9qcAx7l29OSrOfCJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ta9SO3rEXMSLA10FI7fBR3F6/8k5nRYF+su0+OPjS5hW+vMPqYqkjwkBqhYYBZJzi
 WkxbcgQaolfGAHRjZceYZBqeLjg3nxqewEpEhi/mc3fXRRgOVjQmxu7ghIAZztiJWi
 rcXaFy9n2AswtVLbxFPrJHJQ5k7DbNhVzkcrWFm8KVbZvInGvZmzv0P2o5TRxwzScJ
 EXpRqYx7xKx2ZA5uXP8ZlvfB0XTbU8PVP30WMoANTItUUqs4EdtCQcckRCKr/THZHj
 QqEd2x3S4DlvrLbcIOo7MzysAEzgrI8Z9I2cHL8+5MkDlEBeHuyeU6NRmGWVCBNvn6
 0y8FcKrLKOhAw==
Date: Sat, 14 Jun 2025 15:18:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Message-ID: <20250614151844.50524610@jic23-huawei>
In-Reply-To: <20250614131844.7fdc10b8@jic23-huawei>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz> <2243943.irdbgypaU6@workhorse>
 <aEsiTy++yKGe1p9W@duo.ucw.cz> <aEsmDyc44P8amm5p@smile.fi.intel.com>
 <aE0a/Y9qVByfA2vI@duo.ucw.cz>
 <20250614131844.7fdc10b8@jic23-huawei>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-rockchip@lists.infradead.org,
 =?UTF-8?B?T25kxZllag==?= Jirman <megi@xff.cz>,
 David Lechner <dlechner@baylibre.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Leonard =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZl?= =?UTF-8?B?cw==?=
 <jpaulo.silvagoncalves@gmail.com>, kernel@pengutronix.de,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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

On Sat, 14 Jun 2025 13:18:44 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Sat, 14 Jun 2025 08:47:25 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
> 
> > On Thu 2025-06-12 22:10:07, Andy Shevchenko wrote:  
> > > On Thu, Jun 12, 2025 at 08:54:07PM +0200, Pavel Machek wrote:    
> > > > > On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel Machek wrote:    
> > > > > >     
> > > > > > > Jonathan mentioned recently that he would like to get away from using
> > > > > > > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > > > > > > have it on good authority that initializing a struct or array with = { }
> > > > > > > is the preferred way to do this in the kernel [1]. So here is a series
> > > > > > > to take care of that.    
> > > > > > 
> > > > > > 1) Is it worth the churn?
> > > > > > 
> > > > > > 2) Will this fail to initialize padding with some obscure compiler?    
> > > > > 
> > > > > as of right now, the only two C compilers that are supported are
> > > > > GCC >= 8.1, and Clang >= 13.0.1. If anyone even manages to get the
> > > > > kernel    
> > > > 
> > > > Well... I'm pretty sure parts of this would make it into -stable as a
> > > > dependency, or because AUTOSEL decides it is a bugfix. So..
> > > > 
> > > > GNU C                  4.9              gcc --version
> > > > Clang/LLVM (optional)  10.0.1           clang --version    
> > > 
> > > Even though, what the kernel versions are you referring to? I am sure there
> > > plenty of cases with {} there.    
> > 
> > 5.10, for example. I'm sure they are, uninitialized padding is a
> > security hole, but rather hard to detect if they are not specifically
> > looking.  
> 
> The stack kunit test is there back to 5.0-rc4 
> 50ceaa95ea09 ("lib: Introduce test_stackinit module")
> 
> So I think we should be pretty well defended against issues.
> 
> Hence I plan to pick this up curently.
> 
> Thanks all for inputs on this.
> 
> Fun corners of the C spec vs implementations!
> 
> Jonathan
> 
I want to give this some testing exposure from 0-day etc in case
we missed any build related issues so I've queued it up on my testing branch.
I can still pick up tags / rebase etc for now.

Thanks,

Jonathan

> > 
> > BR,
> > 								Pavel  
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
