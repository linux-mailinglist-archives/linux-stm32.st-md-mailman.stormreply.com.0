Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3146B636B74
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 21:44:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8A03C65E41;
	Wed, 23 Nov 2022 20:44:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 865ADC6506F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 20:44:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 140E2B81F03;
 Wed, 23 Nov 2022 20:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1276FC433D6;
 Wed, 23 Nov 2022 20:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669236257;
 bh=blYSzKUNc7T988paAGw1Il7D1vmiMKzkZW2yOWCzzlg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hE7THTRUjsqqpPzD1p2zT+Sgxpmvspx3KLbpcQGOZr2BmnKf70NEIbO7heL7VJx+X
 1M3JcHc209FIGLf4HtLpfNu06csLx46ZQRgpbZTDuamESCHaRw7Fq+gtnX4JdHMKWJ
 Aqt0uZe7C0pRUR4g7/Hbp26I+BhIRaXtT61gvr9QOybqjcFFy3b6+yXi/UzH0c8Ext
 rrworE6PHYCtU6gbWMsyFxfDpue0ay2EMtA4JgFwdBWQybY73Xpy1y6cIjNDC6uzbf
 nGSNXNutBibXCa+eeHNpgSnLi5Zmonjt2vhCvelH4icfgryzAe0zlzYmDXGHLzFQbQ
 RdhpiD65GLmgQ==
Date: Wed, 23 Nov 2022 20:56:50 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20221123205650.3be4ee4e@jic23-huawei>
In-Reply-To: <f7a2a680-4879-b6cf-3546-e890b3c96e32@foss.st.com>
References: <20221115103124.70074-1-olivier.moysan@foss.st.com>
 <f7a2a680-4879-b6cf-3546-e890b3c96e32@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] iio: adc: stm32: add smart calibration
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

On Wed, 23 Nov 2022 12:04:36 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 11/15/22 11:31, Olivier Moysan wrote:
> > Refine offset and linear calibration strategy for STM32MP15 and
> > STM32MP13 SoCs:
> > 
> > - offset calibration
> > This calibration depends on factors such as temperature and voltage.
> > As it is not time consuming, it's worth doing it on each ADC
> > start, to get the best accuracy. There is no need to save these data.
> > 
> > - linear calibration
> > This calibration is basically SoC dependent, so it can be done only once.
> > When this calibration has been performed at boot stage, the ADC kernel
> > driver can retrieve the calibration data from the ADC registers.
> > Otherwise, the linear calibration is performed once by the ADC driver.
> > The backup of these data, allows to restore them on successive ADC starts.
> > 
> > Olivier Moysan (3):
> >   iio: adc: stm32-adc: smart calibration support
> >   iio: adc: stm32-adc: improve calibration error log
> >   iio: adc: stm32-adc: add debugfs to read raw calibration result  
> 
> Hi Olivier,
> 
> For the series, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Applied to the togreg branch of iio.git and pushed out as testing to let
0-day have a first look at it.

Thanks,

Jonathan

> 
> Thanks,
> Fabrice
> 
> > 
> >  drivers/iio/adc/stm32-adc-core.h |   1 +
> >  drivers/iio/adc/stm32-adc.c      | 135 ++++++++++++++++++-------------
> >  2 files changed, 78 insertions(+), 58 deletions(-)
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
