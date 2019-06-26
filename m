Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B60757287
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2019 22:24:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2148C56C5B
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2019 20:24:37 +0000 (UTC)
Received: from saturn.retrosnub.co.uk (saturn.retrosnub.co.uk [46.235.226.198])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEF03C56C5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2019 20:24:36 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95]) by saturn.retrosnub.co.uk (Postfix;
 Retrosnub mail submission) with ESMTPSA id 1DF5B9E751C; 
 Wed, 26 Jun 2019 21:24:35 +0100 (BST)
Date: Wed, 26 Jun 2019 21:24:34 +0100
From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20190626212434.1b78b49e@archlinux>
In-Reply-To: <20190622115257.7198f8d4@archlinux>
References: <20190617143057.4096-1-geert+renesas@glider.be>
 <20190622115257.7198f8d4@archlinux>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] Documentation: ABI: Add missing newline
	at end of file
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

On Sat, 22 Jun 2019 11:52:57 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon, 17 Jun 2019 16:30:57 +0200
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> > "git diff" says:
> > 
> >     \ No newline at end of file
> > 
> > after modifying the files.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>  
> Applied to the togreg branch of iio.git and pushed out as testing.
Hmm. I only just noticed that this 'fixes' the sysfs-power file as
well which isn't one of mind.

I'm going to drop the patch to avoid any possible clashes.
Please respin as separate patches.

Thanks,

Jonathan

> 
> Thanks,
> 
> Jonathan
> 
> > ---
> >  Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32 | 2 +-
> >  Documentation/ABI/testing/sysfs-power                   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32 b/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32
> > index da9822309f0757bd..0e66ae9b0071e80b 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32
> > +++ b/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32
> > @@ -13,4 +13,4 @@ Description:
> >  			error on writing
> >  		If DFSDM input is SPI Slave:
> >  			Reading returns value previously set.
> > -			Writing value before starting conversions.
> > \ No newline at end of file
> > +			Writing value before starting conversions.
> > diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
> > index 18b7dc929234f625..3c51303550118474 100644
> > --- a/Documentation/ABI/testing/sysfs-power
> > +++ b/Documentation/ABI/testing/sysfs-power
> > @@ -300,4 +300,4 @@ Description:
> >  		attempt.
> >  
> >  		Using this sysfs file will override any values that were
> > -		set using the kernel command line for disk offset.
> > \ No newline at end of file
> > +		set using the kernel command line for disk offset.  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
