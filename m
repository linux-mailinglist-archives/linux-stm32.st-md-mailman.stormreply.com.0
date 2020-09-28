Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5250127ACA7
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Sep 2020 13:23:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E705C36B37;
	Mon, 28 Sep 2020 11:23:51 +0000 (UTC)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1177C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Sep 2020 11:23:48 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id o64so2058370uao.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Sep 2020 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dPqyhHPvAKE8oFtG0HXSnceWMN8F9MOf0pO61krCb1Y=;
 b=mFX2vgIw/ymy13Qjh/G7aVRGOACw1Fj/ADWUfGlozDS641eSx1hWEkFSVu1esESKHB
 UgvUnxWEKkoyXHt2GQppOniC5F2M/aHpw+xrsCU17sCP31b/bVtTvUtUzBMuGtkJyCO4
 9ZwaDtusG19u99CaKHkXc2xtSJnn8TFODC2YHyQo3Z6gziYVZkXmQ4vBrgNUIxjbZI4+
 t97q6KS543YUmghrGRJDlHkbJ4o8HddYlWvtYRck7UAj/HYKrCGi+iChzCywW1I8gS0w
 T3Td0+hsZFLVw3kRqLj32n4oOnePgk7isZFeo5d404mzKKfz0KTHG0yUSnbck3JeA8cf
 UNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dPqyhHPvAKE8oFtG0HXSnceWMN8F9MOf0pO61krCb1Y=;
 b=uFvgUWLHmmwYScIcsI2ZWYHjqd0BON67wwR6kbeVUj1AMU/fsH5C54AMzk/I5ltpkY
 udbW/eqgLoxvOG0g9Gfraap34JNdXCR/OvgUkBNLwc6Fkko7N8x/wXrj2L+GMSOTrD7i
 DTklAYikdmwfYtiCmnS9DZWMhOhH3Aw0FynFixzHJ5ThyWxwOzdCZlcdeUpTdW2yb/hL
 Ys/Gq/LOwvAOUW+I2UMeH0P/PReuMZ6oSEyLS6kKA0Q/RMFZFGsBbtSTytI9BqdZR3GG
 6A/0+Ocdfk3iFD7YmPGSDza/5cuLfamNdT3CPGFko+8UudZPAeSzBtWY31J7ynHHaUJN
 KtKA==
X-Gm-Message-State: AOAM5315Dp1w1xmklvMYSd6K2TS2lPznIKXOrmnYfqbbWbgxbrfKtNVB
 0MwGDD0oJGXuoiG7qN9My9KKyzLNxwVKbervlDd+yA==
X-Google-Smtp-Source: ABdhPJwt5PJ9h/2t57J8+266psChAvJLx+l73d4OtTMrMI4/BajbmGg2qnHjsErwIH1mVybopUNZ9072O8Zy3kEiT7w=
X-Received: by 2002:ab0:2904:: with SMTP id v4mr312369uap.15.1601292227436;
 Mon, 28 Sep 2020 04:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <1593615328-5180-1-git-send-email-fabrice.gasnier@st.com>
 <045e9e34-f1e0-087b-bc5b-44440db6be27@st.com>
 <20200926161732.72af96e3@archlinux>
In-Reply-To: <20200926161732.72af96e3@archlinux>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Sep 2020 13:23:11 +0200
Message-ID: <CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: linux-iio@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v2] iio: adc: stm32-adc: fix
 runtime autosuspend delay when slow polling
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

Jonathan, Fabrice,

On Sat, 26 Sep 2020 at 17:17, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Wed, 16 Sep 2020 12:28:00 +0200
> Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>
> > On 7/1/20 4:55 PM, Fabrice Gasnier wrote:
> > > When the ADC is runtime suspended and starting a conversion, the stm32-adc
> > > driver calls pm_runtime_get_sync() that gets cascaded to the parent
> > > (e.g. runtime resume of stm32-adc-core driver). This also kicks the
> > > autosuspend delay (e.g. 2s) of the parent.
> > > Once the ADC is active, calling pm_runtime_get_sync() again (upon a new
> > > capture) won't kick the autosuspend delay for the parent (stm32-adc-core
> > > driver) as already active.
> > >
> > > Currently, this makes the stm32-adc-core driver go in suspend state
> > > every 2s when doing slow polling. As an example, doing a capture, e.g.
> > > cat in_voltageY_raw at a 0.2s rate, the auto suspend delay for the parent
> > > isn't refreshed. Once it expires, the parent immediately falls into
> > > runtime suspended state, in between two captures, as soon as the child
> > > driver falls into runtime suspend state:
> > > - e.g. after 2s, + child calls pm_runtime_put_autosuspend() + 100ms
> > >   autosuspend delay of the child.
> > > - stm32-adc-core switches off regulators, clocks and so on.
> > > - They get switched on back again 100ms later in this example (at 2.2s).
> > >
> > > So, use runtime_idle() callback in stm32-adc-core driver to call
> > > pm_runtime_mark_last_busy() for the parent driver (stm32-adc-core),
> > > to avoid this.
> > >
> > > Fixes: 9bdbb1139ca1 ("iio: adc: stm32-adc: add power management support")
> > >
> > > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > > ---
> > > Changes in v2:
> > > - Use runtime_idle callback in stm32-adc-core driver, instead of refreshing
> > >   last_busy from the child (for the parent) at many place. Initial patch v1
> > >   looked like "somewhat adhoc solution" as commented by Jonathan.
> >
> > Hi all,
> >
> > Gentle reminder for this patch. Earlier discussions on it were as per
> > [1] and [2].
> >
> > Ideally, Jonathan was looking for an ack from Rafael on this patch.
> > This is a long pending issue. I'd like to progress on this.
> >
> > [1] https://patchwork.kernel.org/patch/11349841/
> > [2] https://lkml.org/lkml/2020/6/11/279
>
> Fabrice, I think this one has sat waiting for inputs for
> too long. Hence I'm going to take a slight gamble that you are correct
> on doing the fix this way (I'm reasonably convinced)

My apologies for the huge and unacceptable delay. I have re-started
looking at this several times, but just never got the point of writing
a proper reply. Let me do this now, better late than never I guess.

In general, I think this problem (nicely described by Fabrice), should
be solved in the runtime PM core, without having to involve drivers
for parents/childs. I have looked into that, but I don't have a patch
to propose, at least not yet.

FYI, I have also stumbled over the same problem, for a card controller
(parent), serving both sd and memstick cards. For that case, we simply
decided to skip using autosuspend for the child devices (represented
by an sd host and a memstick host), not optimal, but there were other
reasons why we decided for this approach as well.

That said, I also think the solution proposed in $subject patch, which
uses the ->runtime_idle() callback for the parent is perfectly fine,
at least until we have figured out something that can replace it.

>
> Applied to the fixes-togreg branch of iio.git.
> It won't go in for 5.9 now, so we have a bit of time for any last
> minute comments.

Feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

>
> Thanks,
>
> Jonathan
>
> >
> > Please advise,
> > Thanks in advance,
> > Fabrice
> >
> > > ---
> > >  drivers/iio/adc/stm32-adc-core.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> > > index 0e2068e..3586369 100644
> > > --- a/drivers/iio/adc/stm32-adc-core.c
> > > +++ b/drivers/iio/adc/stm32-adc-core.c
> > > @@ -794,6 +794,13 @@ static int stm32_adc_core_runtime_resume(struct device *dev)
> > >  {
> > >     return stm32_adc_core_hw_start(dev);
> > >  }
> > > +
> > > +static int stm32_adc_core_runtime_idle(struct device *dev)
> > > +{
> > > +   pm_runtime_mark_last_busy(dev);
> > > +
> > > +   return 0;
> > > +}
> > >  #endif
> > >
> > >  static const struct dev_pm_ops stm32_adc_core_pm_ops = {
> > > @@ -801,7 +808,7 @@ static const struct dev_pm_ops stm32_adc_core_pm_ops = {
> > >                             pm_runtime_force_resume)
> > >     SET_RUNTIME_PM_OPS(stm32_adc_core_runtime_suspend,
> > >                        stm32_adc_core_runtime_resume,
> > > -                      NULL)
> > > +                      stm32_adc_core_runtime_idle)
> > >  };
> > >
> > >  static const struct stm32_adc_priv_cfg stm32f4_adc_priv_cfg = {
> > >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
