Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7CF25A566
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Sep 2020 08:12:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 428C5C36B26;
	Wed,  2 Sep 2020 06:12:39 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF268C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Sep 2020 06:12:35 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id v16so3296011otp.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Sep 2020 23:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OH2CSI+RMVDa+o7mr+bFOYCagAiIO2w5E9YocL797D8=;
 b=chrpRBMuxKqoCGIhmYCwEfg2NCy2inV1ZzirbSc8pizTHLUrWeVR5Ul5SCu5XfmgHD
 X7GAk2S8xdmSk/ZeSgsO/b6qrwe8gpvpAqJiSLGVchVURFi6CLumbhl5vXneamaCyHpR
 nlfQ/cwBd71ubhbKgTNhzaEHLiBBEfQDcsLVtFenLx47I5F4clelWrVBVRlAPYivDy/W
 WGbXn5baLInh+myzw6i46tquBTI7kSyLzpMzWrP5Zw6BIKos/d9O/MAEm8Pqbx9v/tRF
 fI8OtyuCro+247fWffA/3pTf0lfUdYCwESQouBSdR+5y7NVryn0G3I/+6+rb73XI1KYl
 477w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OH2CSI+RMVDa+o7mr+bFOYCagAiIO2w5E9YocL797D8=;
 b=PE+pJeDmhzyc7VM4qx7DMZTV+E8CW9oIg8K+4UVJX6PWukOepTIiNI5sNSmWMKw8Jh
 5YpKZQfdDfeV5HaITfxgB/UNl+Y7eMZ/zHi1tPGEabFWbQujM1ij93p5+RNqjnkz1FGO
 OwVdV0UotrYd0+1rlxj3VfVw49HyLRL/3GPgjVQTaQ5JCTjiDnSEmhBVBiUsh2yRV0AC
 YyCha3nuZ3fDtwOTBTAdvYOiHHdHnJQ1+lIxnWXC/U9kfMrdFuONT93codWxVXCLAt4I
 Os9Bc182f9I5rNc7PF8zSsYVH3/jFxoq+C4vF6iprKtoA1/VVYfz7KDALbFjHecz9I1N
 OHSA==
X-Gm-Message-State: AOAM533MN9O/h9JZWSKqbBlhz3dpFBxqcS+JoQhryra7RBkCLFRP4FzV
 VLg3rq/YOGPokoelgftIS8waI3ssn2vnJWPVaSo=
X-Google-Smtp-Source: ABdhPJzW3oF7F8kpT7DmR6bM8ZmVyV0PcZtVvxF5E4tdp0v0Vc/JnExc6NBbLfqj0X7p09Ew41E6IFXpQVsUq+Az/RI=
X-Received: by 2002:a9d:50a:: with SMTP id 10mr3897594otw.207.1599027153888;
 Tue, 01 Sep 2020 23:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200826063850.47625-1-alexandru.ardelean@analog.com>
 <20200826120042.200364-1-alexandru.ardelean@analog.com>
 <CA+U=DsrMDSTQKEc2_3+W8u4bLraAowVB3nB4huKY--v8gnds2Q@mail.gmail.com>
 <c3a9411e-186d-a3ac-5ad0-bd70ad78f147@st.com>
 <CA+U=DspjGUhXCY7c8P6zOYZsx17ybcU4Kdr52yujmdYOaa1JSQ@mail.gmail.com>
 <20200829164613.3be1b2b1@archlinux>
In-Reply-To: <20200829164613.3be1b2b1@archlinux>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Wed, 2 Sep 2020 09:12:22 +0300
Message-ID: <CA+U=DsrMFasSO3ka-U_Dkn2BXF4qmfp4ejv=gjf4epo6WxFnUQ@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
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

On Sat, Aug 29, 2020 at 6:46 PM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Thu, 27 Aug 2020 13:00:36 +0300
> Alexandru Ardelean <ardeleanalex@gmail.com> wrote:
>
> > On Thu, Aug 27, 2020 at 12:03 PM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> > >
> > > On 8/27/20 10:55 AM, Alexandru Ardelean wrote:
> > > > On Wed, Aug 26, 2020 at 3:03 PM Alexandru Ardelean
> > > > <alexandru.ardelean@analog.com> wrote:
> > > >> From: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> > > >>
> > > >> As part of the general cleanup of indio_dev->mlock, this change replaces
> > > >> it with a local lock. The lock protects against potential races when
> > > >> reading the CR reg and then updating, so that the state of pm_runtime
> > > >> is consistent between the two operations.
> > > >>
> > > >> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> > > >> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> > > >> ---
> > > > Forgot the changelog here.
> > > > Apologies.
> > > >
> > > > Changelog v1 -> v2:
> > > > * removed whitespace change for 'common' field
> > > > * updated comment about the lock usage
> > >
> > > Hi Alexandru,
> > >
> > > Sorry if I missed it... is there an update on the comment :-) ?
> >
> > For a moment there, I thought I didn't.
> > GMail's threading is confusing.
> >
> > ----------------------------------------------------------------------------
> > As part of the general cleanup of indio_dev->mlock, this change replaces
> > it with a local lock. The lock protects against potential races when
> > reading the CR reg and then updating, so that the state of pm_runtime
> > is consistent between the two operations.
> > ----------------------------------------------------------------------------
> I think this got confused...
>
> see below.
>
>
> >
> > >
> > > Best Regards,
> > > Fabrice
> > > >
> > > >>  drivers/iio/dac/stm32-dac.c | 12 ++++++++----
> > > >>  1 file changed, 8 insertions(+), 4 deletions(-)
> > > >>
> > > >> diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
> > > >> index 092c796fa3d9..7a8aed476850 100644
> > > >> --- a/drivers/iio/dac/stm32-dac.c
> > > >> +++ b/drivers/iio/dac/stm32-dac.c
> > > >> @@ -26,9 +26,11 @@
> > > >>  /**
> > > >>   * struct stm32_dac - private data of DAC driver
> > > >>   * @common:            reference to DAC common data
> > > >> + * @lock:              lock to protect the data buffer during regmap ops

oh, silly me;
it's about this comment;
will re-spin

>
> The original comment was:
>
>
> In this particular case I'm not sure that's what mlock was being used for.
> I think it's about avoiding races around checking if powered down and
> actually doing it.
>
> And Fabrice's reply:
>
> Hi Sergiu,
>
> Indeed, purpose is to protect against a race here when reading CR, and
> updating it via regmap (this also makes the subsequent pm_runtime calls
> to be balanced based on this).
> (Side note: there is no data buffer involved for the DAC.)
> Could you please update the comment ?
>
> Thanks,
> Fabrice
>
> > > >>   */
> > > >>  struct stm32_dac {
> > > >>         struct stm32_dac_common *common;
> > > >> +       struct mutex            lock;
> > > >>  };
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
