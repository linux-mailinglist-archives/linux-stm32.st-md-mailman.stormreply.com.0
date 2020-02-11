Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0882F159C3B
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 23:30:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50C6BC36B0B;
	Tue, 11 Feb 2020 22:30:50 +0000 (UTC)
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A648EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 22:30:46 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id f130so4332721ybc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 14:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CHoiFuVyPb6jGydbvdkP7hbmi4a+GAh7Qj76wkBaMrw=;
 b=KqXh8ljWsaeJuL5FZXSBYEMOEtwIDGtNhPOg0K+XUvNK9WNzlf102sQ8jl82PFo8XF
 s+Ljzb/2DZuO0hfDjig0E+42lrnPZv/TPE7RJ8Aqcx5xI9V7autaDv1tzexHXbY8iQty
 emEUEpwNSlANK1zORXQhRhy5tNQf2Ob0zLmcHG55uqs/alcX9ODLzR5BetAN9ZF5rmQ2
 L25xAQtPyXz4zTfuqZZ/CpTP5vh7LsBhN8NpOxxgp0t58Zctl7vxGJbVRa2ovEgfn55s
 i7Ls6CX0QpJTP0yd4t9igAHATrBZ+sxcHJfF2O09c0ls0c51XDilEOQdV2YfxfRxZoPj
 KfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CHoiFuVyPb6jGydbvdkP7hbmi4a+GAh7Qj76wkBaMrw=;
 b=XSfPHOsDMPwHyKQRcSvJRcKwZjZ+XZkk5gHVsHqLjfSwVnSAaujGBbOWB37oQJubGU
 nn2XqjtjzLOUeOxXww0hkEGKnRAiPoWs2mD2gA0IjOy+b7+CNhvTrBhIN+TxBdodZYeN
 IaUgwzSM1MncXtRHbFbOIdq+8INlHCGM4S+mbNfjujbN1yltSt5j4MrGTO+C6DD7IAdj
 3YWUqJb+wG0S5vaylg1CHYeYjPSIGebyuzXMBN+kcJ5TQi9Li+Ro865mzEnSREgQX8V1
 Zm41kUJ9tjzABlEwBxT9EV0NwSTU4ZYpBgjIhi2TE2BeDXswwgdr3UQGMbgSP9xvD79o
 icoQ==
X-Gm-Message-State: APjAAAXvq6zfd+qpaV7DmCQHA6h9mGOEcXxbIu43Xt+fnHC9KUkcNdgb
 Ks/3Tua04ZsAF2+aBkEKv1Q=
X-Google-Smtp-Source: APXvYqyilsRsa87oczzBpnbDDzSd9mSalUhB8qVYON+pfbtfykYkhrGIfyKeqrrb88A0edcvtP8mkQ==
X-Received: by 2002:a25:8290:: with SMTP id r16mr7654104ybk.4.1581460245400;
 Tue, 11 Feb 2020 14:30:45 -0800 (PST)
Received: from icarus (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id q130sm2560552ywg.52.2020.02.11.14.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 14:30:44 -0800 (PST)
Date: Tue, 11 Feb 2020 17:30:28 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200211223028.GA7369@icarus>
References: <1581355198-30428-1-git-send-email-fabrice.gasnier@st.com>
 <20200210174550.GA4626@icarus>
 <b1e2930a-eeaf-dcfe-3e2c-b666908262bf@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1e2930a-eeaf-dcfe-3e2c-b666908262bf@st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] counter: stm32-timer-cnt: add power
	management support
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

On Tue, Feb 11, 2020 at 11:54:17AM +0100, Fabrice Gasnier wrote:
> On 2/10/20 6:45 PM, William Breathitt Gray wrote:
> > On Mon, Feb 10, 2020 at 06:19:58PM +0100, Fabrice Gasnier wrote:
> >> Add suspend/resume PM sleep ops. When going to low power, enforce the
> >> counter isn't active. Gracefully restore its state upon resume in case
> >> it's been left enabled prior to suspend.
> >>
> >> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> >> ---
> >> Changes in v2:
> >> - Don't refuse to suspend in case the counter has been left enabled.
> >>   Gracefully disable it and restore its state upon resume.
> >> ---
> >>  drivers/counter/stm32-timer-cnt.c | 63 +++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 63 insertions(+)
> >>
> >> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> >> index 3eafcce..50496f4 100644
> >> --- a/drivers/counter/stm32-timer-cnt.c
> >> +++ b/drivers/counter/stm32-timer-cnt.c
> >> @@ -12,6 +12,7 @@
> >>  #include <linux/iio/types.h>
> > 
> > Unrelated to your patch but it caught my eye: are iio headers necessary
> > for this file? I suspect they are not needed since this driver does not
> > make use of the IIO interface.
> 
> Hi William,
> 
> Yes, you're right. Thanks for pointing this!
> I'll push a patch on top of this one to fix it. BTW, I'm not sure if
> this needs to be a marked as a fix, as this seems a quite minor issue?
> 
> Best Regards,
> Fabrice

No need for a Fixes tag in this case since this is not a bug fix, but
rather just a minor clean up of the included headers.

Thanks,

William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
