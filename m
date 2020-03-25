Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D378C1930B0
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2020 19:53:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BF10C36B0B;
	Wed, 25 Mar 2020 18:53:56 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19C65C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2020 18:53:55 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id j29so1596315pgl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2020 11:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0A8XwLK/VHei5BNSLIP6RyAAlYr0PTQ3mUKooO2YHBI=;
 b=lRUs5gXjxEoqkj3/if5a2+eHB3Ind5z4U93waFxX6C2QEaho1OmHCbTn6w3kJqmrsf
 zrDUxx73i5J8KwBO5S1V+hx9GySQTXzGAkJ3upVOVowTfBnu49udAiW/y844IdGedClK
 loRaz52mO50+7BX5vqOf86CiRhXFAceiVCgzU+dOcR89dabpTMxLvslKANhq0WAxcZZg
 45ve6G5zRJgMup1TmPq8jKMj3OdlJXKEOOBhKbr9Sjo/MCHm5x60TFVxK4281OPRHOwk
 3KE1NAALBMq4ydP/SB1Gn/MKu8LbM6XLamBKfdq03weClINJIji8s8YHQbCDJFK+pFtS
 +U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0A8XwLK/VHei5BNSLIP6RyAAlYr0PTQ3mUKooO2YHBI=;
 b=IhTrXA4uyWlIeu5Q0hq8RRm6VnoVaVvXmv0XJgsHliOh+Yg56TMrY80cB3wOIeCRO3
 uY63T8+7l0fKDwAx/6O/Cg/TomSQw+QV867S8BTn42WPREBz4iS+LNMs9BVqsjENQONK
 T4FnGzpSnXaHcVZhUlylvlEWaHFCqLB+tsHJhE4ayrsl2TnZU02TO3ov+xlf+5W49lqm
 aCwsFYD3YMxR60Ab3ARj9XdkHq35RfcwNuHBmokxX9LUwtgN7usNBhwJTkc9y0kHK4ln
 HKM3E5qV+J5UTlxY9wJv+l+O7i83k5leyaQQLft83/bLlJisd7jcvBROJF7Fcx4UWuFf
 9uEQ==
X-Gm-Message-State: ANhLgQ2i3PXJA3B9ZzyGbO/XoSn1+n01IFnXnay4w9C/LCBldy8Tenpr
 0H+8GJu1GjRSNm0GmYi2J32cwm/NJXCn0Luuox8=
X-Google-Smtp-Source: ADFU+vs5IGiqDBHOJuHFA5G0E6zEcgp/2GS7T1qnTQ7Iwf3xjKO0zWxnArLFNE7IurwGXRC7fD0ppU5owx2lakG1HzI=
X-Received: by 2002:a63:5859:: with SMTP id i25mr4349929pgm.74.1585162433449; 
 Wed, 25 Mar 2020 11:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <1585161361-3408-1-git-send-email-alain.volmat@st.com>
 <1585161361-3408-3-git-send-email-alain.volmat@st.com>
In-Reply-To: <1585161361-3408-3-git-send-email-alain.volmat@st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 25 Mar 2020 20:53:45 +0200
Message-ID: <CAHp75VdPCWdpGo=2n9g0ivti-g2m4jZ=cG4BKHBLk8BVDzaCyg@mail.gmail.com>
To: Alain Volmat <alain.volmat@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 pierre-yves.mordret@st.com, Rob Herring <robh+dt@kernel.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] i2c: i2c-stm32f7: allows for any bus
	frequency
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

On Wed, Mar 25, 2020 at 8:38 PM Alain Volmat <alain.volmat@st.com> wrote:
>
> Do not limitate to the 3 (100KHz, 400KHz, 1MHz) bus frequency but
> instead allows any frequency (if it matches timing requirements).
> Depending on the requested frequency, use the spec data from either
> Standard, Fast or Fast Plus mode.
>
> Hardcoding of min/max bus frequencies is removed and is instead computed.
>
> The driver do not use anymore speed identifier but instead handle
> directly the frequency and figure out the spec data (necessary
> for the computation of the timing register) based on the frequency.

...

> +static struct stm32f7_i2c_spec *get_specs(u32 rate)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(i2c_specs); i++)
> +               if (rate <= i2c_specs[i].rate)
> +                       return &i2c_specs[i];
> +

> +       /* NOT REACHED */
> +       return ERR_PTR(-EINVAL);

WARN_ONCE() ?

> +}

...

> -                       if ((tscl_l < i2c_specs[setup->speed].l_min) ||
> +                       if ((tscl_l < specs->l_min) ||

>                             (i2cclk >=
>                              ((tscl_l - af_delay_min - dnf_delay) / 4))) {

Perhaps squash above two to one line at the same time?

...

> +       int i;
> +
> +       for (i = ARRAY_SIZE(i2c_specs) - 1; i >= 0; i--)


Perhaps

       int i = ARRAY_SIZE(i2c_specs);

       while(i--)

?

> +               if (i2c_specs[i].rate < rate)
> +                       return i2c_specs[i].rate;

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
