Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 203562568C7
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Aug 2020 17:46:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE00DC32EA6;
	Sat, 29 Aug 2020 15:46:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAB09C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Aug 2020 15:46:19 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A981A20707;
 Sat, 29 Aug 2020 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598715978;
 bh=AheSshfe92OtbNQk0Y5YnL36d07LMk/Bwp5WrwRwW/8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xFkSuODyEMu7scime7X76raA4n6sWN3AdwLpRB0qK1Rdc0IWkRyClkmKnRUBUriNg
 lwdIHHz47eCBAdC6YfYGpV5GhU/XPHYoq88pMjRcI5qz5WzE0g/JSwgOR5RBg8PHwK
 8vbqk9SMaORV8BmDSp7vcYlm0NNZnh/msT7Cgkvk=
Date: Sat, 29 Aug 2020 16:46:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20200829164613.3be1b2b1@archlinux>
In-Reply-To: <CA+U=DspjGUhXCY7c8P6zOYZsx17ybcU4Kdr52yujmdYOaa1JSQ@mail.gmail.com>
References: <20200826063850.47625-1-alexandru.ardelean@analog.com>
 <20200826120042.200364-1-alexandru.ardelean@analog.com>
 <CA+U=DsrMDSTQKEc2_3+W8u4bLraAowVB3nB4huKY--v8gnds2Q@mail.gmail.com>
 <c3a9411e-186d-a3ac-5ad0-bd70ad78f147@st.com>
 <CA+U=DspjGUhXCY7c8P6zOYZsx17ybcU4Kdr52yujmdYOaa1JSQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio <linux-iio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: stm32-dac: Replace
 indio_dev->mlock with own device lock
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

On Thu, 27 Aug 2020 13:00:36 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> On Thu, Aug 27, 2020 at 12:03 PM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> >
> > On 8/27/20 10:55 AM, Alexandru Ardelean wrote:  
> > > On Wed, Aug 26, 2020 at 3:03 PM Alexandru Ardelean
> > > <alexandru.ardelean@analog.com> wrote:  
> > >> From: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> > >>
> > >> As part of the general cleanup of indio_dev->mlock, this change replaces
> > >> it with a local lock. The lock protects against potential races when
> > >> reading the CR reg and then updating, so that the state of pm_runtime
> > >> is consistent between the two operations.
> > >>
> > >> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> > >> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> > >> ---  
> > > Forgot the changelog here.
> > > Apologies.
> > >
> > > Changelog v1 -> v2:
> > > * removed whitespace change for 'common' field
> > > * updated comment about the lock usage  
> >
> > Hi Alexandru,
> >
> > Sorry if I missed it... is there an update on the comment :-) ?  
> 
> For a moment there, I thought I didn't.
> GMail's threading is confusing.
> 
> ----------------------------------------------------------------------------
> As part of the general cleanup of indio_dev->mlock, this change replaces
> it with a local lock. The lock protects against potential races when
> reading the CR reg and then updating, so that the state of pm_runtime
> is consistent between the two operations.
> ----------------------------------------------------------------------------
I think this got confused...

see below.


> 
> >
> > Best Regards,
> > Fabrice  
> > >  
> > >>  drivers/iio/dac/stm32-dac.c | 12 ++++++++----
> > >>  1 file changed, 8 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
> > >> index 092c796fa3d9..7a8aed476850 100644
> > >> --- a/drivers/iio/dac/stm32-dac.c
> > >> +++ b/drivers/iio/dac/stm32-dac.c
> > >> @@ -26,9 +26,11 @@
> > >>  /**
> > >>   * struct stm32_dac - private data of DAC driver
> > >>   * @common:            reference to DAC common data
> > >> + * @lock:              lock to protect the data buffer during regmap ops

The original comment was:


In this particular case I'm not sure that's what mlock was being used for.
I think it's about avoiding races around checking if powered down and
actually doing it.

And Fabrice's reply:

Hi Sergiu,

Indeed, purpose is to protect against a race here when reading CR, and
updating it via regmap (this also makes the subsequent pm_runtime calls
to be balanced based on this).
(Side note: there is no data buffer involved for the DAC.)
Could you please update the comment ?

Thanks,
Fabrice

> > >>   */
> > >>  struct stm32_dac {
> > >>         struct stm32_dac_common *common;
> > >> +       struct mutex            lock;
> > >>  };  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
