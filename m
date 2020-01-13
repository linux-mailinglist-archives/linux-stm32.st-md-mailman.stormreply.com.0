Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956A139C00
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 22:58:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F9CBC36B0D;
	Mon, 13 Jan 2020 21:58:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 267BDC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 21:58:23 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2CE921569;
 Mon, 13 Jan 2020 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578952701;
 bh=dMiza/iFXEPvYxpswfqKt8lrTVj6PkpTWxCzuISkOes=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AIPV9ksy5zQIiyHAZyc6EUHspEbXIRjdyjILtjsn1YOGmbdnDfMxXxu9dMGqQ9l45
 L6b8PKp3loQkEysjwa2DkPFbyJ2fN31SVRulXCynXkhsZriKKrtMRuVrnFIUVmTI0y
 1lJcQEeZNqXqeCzhYTAgUf1h7NNdcyBgUDnMk5oE=
Date: Mon, 13 Jan 2020 21:58:16 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier MOYSAN <olivier.moysan@st.com>
Message-ID: <20200113215816.753310aa@archlinux>
In-Reply-To: <1a4261a5-1835-a248-9094-c4e7236e7254@st.com>
References: <20191127130729.18511-1-olivier.moysan@st.com>
 <1a4261a5-1835-a248-9094-c4e7236e7254@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "lars@metafoo.de" <lars@metafoo.de>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "knaack.h@gmx.de" <knaack.h@gmx.de>, Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-dfsdm: fix single
	conversion
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

On Fri, 10 Jan 2020 10:05:47 +0000
Olivier MOYSAN <olivier.moysan@st.com> wrote:

> Hi Jonathan, all,
> 
> Kind reminder on this patch.

Gah. Sorry .I marked it to reply then forgot to actually come back and do so.

Thanks for the reminder.  Given timing I'll apply this to the togreg branch
of iio.git and get it lined up for the merge window.  Marked it for stable
so it should quickly get applied to stable as appropriate after that.

Sorry for the delay.

Thanks,

Jonathan

> Regards
> Olivier
> 
> On 11/27/19 2:07 PM, Olivier Moysan wrote:
> > Apply data formatting to single conversion,
> > as this is already done in continuous and trigger modes.
> >
> > Fixes: 102afde62937 ("iio: adc: stm32-dfsdm: manage data resolution in trigger mode")
> >
> > Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> > ---
> > changes in version 2:
> > - correct title
> > ---
> >   drivers/iio/adc/stm32-dfsdm-adc.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> > index e493242c266e..0339ecdd06bd 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > @@ -1204,6 +1204,8 @@ static int stm32_dfsdm_single_conv(struct iio_dev *indio_dev,
> >   
> >   	stm32_dfsdm_stop_conv(adc);
> >   
> > +	stm32_dfsdm_process_data(adc, res);
> > +
> >   stop_dfsdm:
> >   	stm32_dfsdm_stop_dfsdm(adc->dfsdm);
> >     

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
