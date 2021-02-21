Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CBE320BA2
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Feb 2021 17:06:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21464C57191;
	Sun, 21 Feb 2021 16:06:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0A5FC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Feb 2021 16:06:56 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 926FA64EF2;
 Sun, 21 Feb 2021 16:06:53 +0000 (UTC)
Date: Sun, 21 Feb 2021 16:06:49 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20210221160649.7aa451b8@archlinux>
In-Reply-To: <59ecf96d-6a20-fec7-95ba-fe2561338f1e@foss.st.com>
References: <20210117153816.696693-1-jic23@kernel.org>
 <20210117153816.696693-3-jic23@kernel.org>
 <59ecf96d-6a20-fec7-95ba-fe2561338f1e@foss.st.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com,
	"        <linux-stm32@st-md-mailman.stormreply.com>, linux-doc@vger.kernel.org,  linux-iio@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,  Jonathan Cameron <Jonathan.Cameron@huawei.com>,  Lukas Bulwahn <lukas.bulwahn@gmail.com>,  Fabrice Gasnier <fabrice.gasnier@st.com>"@stm-ict-prod-mailman-01.stormreply.prv
Subject: Re: [Linux-stm32] [RFC PATCH 2/7] iio:ABI docs: Avoid repitition of
 triggerX/sampling_frequency
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

On Mon, 18 Jan 2021 10:02:07 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 1/17/21 4:38 PM, Jonathan Cameron wrote:
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >
> > The timer-stm32 provided a little more specific information than the main
> > docs about the value of 0 corresponding to stopping sampling.  Given that
> > this makes sense in general, move that statement over to the main docs
> > and drop the version in sysfs-bus-iio-timer-stm32
> >
> > Fixes
> > $ scripts/get_abi.pl validate
> > /sys/bus/iio/devices/triggerX/sampling_frequency is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:92  ./Documentation/ABI/testing/sysfs-bus-iio:45
> >
> > Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> > Reported-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-iio             | 2 ++
> >  Documentation/ABI/testing/sysfs-bus-iio-timer-stm32 | 8 --------
> >  2 files changed, 2 insertions(+), 8 deletions(-)  
> 
> Hi Jonathan,
> 
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Applied.  Thanks,

Jonathan

> 
> Thanks,
> 
> Fabrice
> 
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> > index d2dd9cc280f9..9b5ceb22363d 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-iio
> > +++ b/Documentation/ABI/testing/sysfs-bus-iio
> > @@ -55,6 +55,8 @@ Description:
> >  		direct access interfaces, it may be found in any of the
> >  		relevant directories.  If it affects all of the above
> >  		then it is to be found in the base device directory.
> > +		Note a value 0 where supported, will correspond to sampling
> > +		stopping.
> >  
> >  What:		/sys/bus/iio/devices/iio:deviceX/sampling_frequency_available
> >  What:		/sys/bus/iio/devices/iio:deviceX/in_intensity_sampling_frequency_available
> > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32 b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> > index c4a4497c249a..05074c4a65e2 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> > +++ b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> > @@ -90,14 +90,6 @@ Description:
> >  		Reading returns the current master modes.
> >  		Writing set the master mode
> >  
> > -What:		/sys/bus/iio/devices/triggerX/sampling_frequency
> > -KernelVersion:	4.11
> > -Contact:	benjamin.gaignard@st.com
> > -Description:
> > -		Reading returns the current sampling frequency.
> > -		Writing an value different of 0 set and start sampling.
> > -		Writing 0 stop sampling.
> > -
> >  What:		/sys/bus/iio/devices/iio:deviceX/in_count0_preset
> >  KernelVersion:	4.12
> >  Contact:	benjamin.gaignard@st.com  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
