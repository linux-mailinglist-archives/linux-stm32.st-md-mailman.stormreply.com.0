Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B8F7B9E39
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 16:02:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCA19C6C835;
	Thu,  5 Oct 2023 14:02:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B758CC6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 14:02:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C7B76197F;
 Thu,  5 Oct 2023 14:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BDEC43215;
 Thu,  5 Oct 2023 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696514554;
 bh=Yym/0Ckebdzm9KAQ3LjZwwE9ndHEvxXkPTtFfyHgzvE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ER3vAkdFfURm/ku44XkFaBj8mcSYJLYFIYPR8MrjZrUJHY3tihb1iK/Bz/mNn5mJX
 nqafOXXXRV/PZt8t2NgzI/Kdq3BZIsN9QCNi5Gdy+6eXj0uTql3Cn6PLdrt8hky8md
 ozSiQcR+qZRxEJWWYd1Baedcigz67LabOdu7W4mm0UQV5M6dhp111qJ4M7y3fODTfk
 V4sR7fedFXtIjsCvaM5S+R9s7HSQthyB8cVFHA48Jyg1elyf9RoT4FQOca2mibPYdt
 SN4tvojfOQ4tWW81z9o1Ues63Mc8ksEvPQjebNgHEicof6x7R3Iiir30sCJ6gwaD+7
 5ps5SdnvV4MhQ==
Date: Thu, 5 Oct 2023 15:02:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20231005150238.0f5ff100@jic23-huawei>
In-Reply-To: <202309301056.5A21C37D5@keescook>
References: <20230921-strncpy-drivers-iio-adc-stm32-adc-c-v1-1-c50eca098597@google.com>
 <202309232006.690F89A@keescook>
 <20230930184118.73d7465a@jic23-huawei>
 <202309301056.5A21C37D5@keescook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Justin Stitt <justinstitt@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: replace deprecated
	strncpy
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

On Sat, 30 Sep 2023 10:57:03 -0700
Kees Cook <keescook@chromium.org> wrote:

> On Sat, Sep 30, 2023 at 06:41:18PM +0100, Jonathan Cameron wrote:
> > On Sat, 23 Sep 2023 20:15:09 -0700
> > Kees Cook <keescook@chromium.org> wrote:
> >   
> > > On Thu, Sep 21, 2023 at 04:54:00AM +0000, Justin Stitt wrote:  
> > > > `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> > > > 
> > > > We should prefer more robust and less ambiguous string interfaces.
> > > > 
> > > > We expect adc->chan_name[val] to be NUL-terminated based on ch_name's
> > > > use within functions that expect NUL-terminated strings like strncmp and
> > > > printf-likes:
> > > > | 	if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
> > > > | 		/* Check internal channel availability */
> > > > | 		switch (i) {
> > > > | 		case STM32_ADC_INT_CH_VDDCORE:
> > > > | 			if (!adc->cfg->regs->or_vddcore.reg)
> > > > | 				dev_warn(&indio_dev->dev,
> > > > | 					 "%s channel not available\n", ch_name);
> > > > ...
> > > > 
> > > > There is no evidence that NUL-padding is needed either.    
> > > 
> > > Agreed -- it's used as a C string everywhere I can see.
> > >   
> > > > 
> > > > Considering the above, a suitable replacement is `strscpy` [2] due to
> > > > the fact that it guarantees NUL-termination on the destination buffer
> > > > without unnecessarily NUL-padding. If, for any reason, NUL-padding _is_
> > > > required we should go for `strscpy_pad`.
> > > > 
> > > > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> > > > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> > > > Link: https://github.com/KSPP/linux/issues/90
> > > > Cc: linux-hardening@vger.kernel.org
> > > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > > ---
> > > > Note: build-tested
> > > > ---
> > > >  drivers/iio/adc/stm32-adc.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > > > index f7613efb870d..9cdcf396d901 100644
> > > > --- a/drivers/iio/adc/stm32-adc.c
> > > > +++ b/drivers/iio/adc/stm32-adc.c
> > > > @@ -2209,7 +2209,7 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
> > > >  				ret = -EINVAL;
> > > >  				goto err;
> > > >  			}
> > > > -			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
> > > > +			strscpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);    
> > > 
> > > I still prefer sizeof($dst), but yes, these are the same:
> > > 
> > >         char chan_name[STM32_ADC_CH_MAX][STM32_ADC_CH_SZ];
> > > 
> > > If this needs a v2, please improve the Subject, but it is technically
> > > correct, so:  
> > 
> > Hi Kees,
> > 
> > I can tweak the subject whilst applying.  What did you have in mind
> > as a better one?  
> 
> I would use "iio: adc: stm32-adc: Replace deprecated strncpy() with strscpy()"
Makes sense. I also used the () approach to identify functions in the
text of the patch description instead of `funcname`

Applied with those tweaks to the togreg branch of iio.git but initially
just pushed out as testing to let 0-day take a look at it.

Thanks,

Jonathan

> 
> Thanks!
> 
> -Kees
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
