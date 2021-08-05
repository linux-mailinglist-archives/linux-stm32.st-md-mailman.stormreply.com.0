Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD43E112F
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 11:20:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF9D2C597BC;
	Thu,  5 Aug 2021 09:20:19 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 370D4C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 09:20:18 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id f11so5828964ioj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 02:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gmxmbal5kN8ALwaA2TjN7nOaacEIqVHPBww5o4ZLZEc=;
 b=OTPZ/ue8FcpPntTRetaZvV8hc8RlWy4XkuE+tMA6Qhva/AlRgX3auNlI7HPA6+z1o3
 RQdc8lK1I0XdtJI+wvPo5hcETJGwZY7n8z+rIKfMMvwyUuP7J+/Zyg7x4ldMpuR+qC+D
 X0V7XPd7lHhuJMx+yufSuxAxE8aloRNUKA6oOJ9Y+GpQN3rZ0TBLxhGMkbfXaY+gMMMk
 5Hab3YAiMmwkbdY/qIvj5rRVxj08OiMDIl/xKygyhWEek6Cl0gyVorEotDqenuPEei5h
 PFeiWo277J9nvXLcWtdbffBURbQzRqze1M9GrvmBL+FI7tvWiV2vM7PJvdbowaGyxUAU
 BZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gmxmbal5kN8ALwaA2TjN7nOaacEIqVHPBww5o4ZLZEc=;
 b=H+SpKmO1uuZHSO0thlC4X55RR0IqkAKcG7xZOu1fypWytiy0VNw8ndDUbai8qD2Vw8
 mzov3OkXQjsWvQBQlLFzmsJYIb54WcsnhTNt6ziqUF5vVR5vQxR6OlQQ1hT3BFm4jkAa
 5HSh2DHCN0vACvPk+kED0b/fg4mLAJ9aq1d0UEDtYP/964ByFc10j8tpDOg13ZiCLUH9
 Vi6SzElIqInyFKOK0fVD+QKww99baJb0wKoqFmWr+8/YFxOxt6PpTKMbHzfkOAFy7FhO
 p56fw5lBrIfsKf/od4SanFqGgLyHqFpoYORtbdSZ3KSd/djcgo2gX7sOgl7u6U+fpCvy
 lT4g==
X-Gm-Message-State: AOAM532866k6zWWz04t4Zf455eQLtlbVDIvpjBT1XVNHT3BLlIP35a6+
 8PV/vW7VWU2JwIudceI3JLRK82CE4V/+lDELMgE=
X-Google-Smtp-Source: ABdhPJzj90GzKVMvuigvCbMYK6QaClIQIGsSj4o9T55BNJMS+gKSjLMfX+sql1HcMcsIKDElrvqSZjS0mJLvMJ7GhxQ=
X-Received: by 2002:a02:b047:: with SMTP id q7mr3722748jah.130.1628155217097; 
 Thu, 05 Aug 2021 02:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdYReUdg_7oSTqcsA_+9tS9w6MH90=KV1rGyr4YWT=NW-w@mail.gmail.com>
In-Reply-To: <CACRpkdYReUdg_7oSTqcsA_+9tS9w6MH90=KV1rGyr4YWT=NW-w@mail.gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 5 Aug 2021 17:19:41 +0800
Message-ID: <CAL9mu0LfcLS1iNQnamxA_oTrxu8eEBpUm+u92V2d9-8qz6hvow@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Alexandre TORGUE <Alexandre.torgue@foss.st.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kbuild-all@lists.01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 2/3] ARM: dts: stm32: fix dtbs_check
 warning on ili9341 dts binding
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

Hi Linus

Thanks.

On Thu, 5 Aug 2021 at 17:11, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sat, Jul 24, 2021 at 5:44 AM <dillon.minfei@gmail.com> wrote:
>
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > Since the compatible string defined from ilitek,ili9341.yaml is
> > "st,sf-tc240t-9370-t", "ilitek,ili9341"
> >
> > so, append "ilitek,ili9341" to avoid the below dtbs_check warning.
> >
> > arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
> > ['st,sf-tc240t-9370-t'] is too short
> >
> > Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on stm32429-disco board")
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> > v4: no change.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please funnel this patch through the STM and ARM SoC tree.

Sure, I will let Alex know. Thanks for your help on this driver.

Hi Alex,
Should I send v5 with Linus's Reviewed-by tag on this patch? thanks.

Best Regards
Dillon

>
> Yours,
> Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
