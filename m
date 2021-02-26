Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4C5326587
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 17:27:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 313E2C57B59;
	Fri, 26 Feb 2021 16:27:20 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6A19C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 16:27:18 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id l12so11702716edt.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 08:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6BKeyIcRjzR84A9x0lbwBUm0rSexnKSuimviQvcPYuc=;
 b=ZNm9FG8njbw0YZco/bpGOrjR44E9M4EuVHzJWtnNljcMn+/7OAywDvaSfqRF+bFY8V
 u4RHzYU2KDaWUvFw5zG5IwplF0PP8NYmvTNt0YtH/JR1OSf7/jkdBN69W2gVcV9azTi9
 H1mOZu4ojoYmbnwXuBl9fLil8YuZXP+ALRuUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6BKeyIcRjzR84A9x0lbwBUm0rSexnKSuimviQvcPYuc=;
 b=KXn3dUN8+976JX7jIiNGWdtB5+lSyrW3L347l8ivY2AkO54WLZHe/Us8++wtp45ECC
 doGT9ciLQmq8FM+Rca3TdeT7nnQgqUK4hWdwARHeisEaP8YmT+QVI89d6XUoR30ahSGD
 Wu9t74mHeWY3tWrkvCjFjlXubuxr+5kzC7fAFoCCXQIYJhG5V43LfXl48q42UTYGfUZw
 Gq/zwW4gSA1575XGc6C/mptK4ohZkWHRboMow2V8rsb1BZ+UQTw0qeiIM88/F38CPhnP
 nAKz3CMPFaMYykIq1Y6ue+Y4LZO3FrG+0V8AHCZmUisuLHlXUVEGIikqKMLQU2qj2xjD
 sC4Q==
X-Gm-Message-State: AOAM5310elkJpThvl5Mu2DvyHpHd9/TpMOYexqjW9+XWleFNP6GYWbfn
 CNXU1xFfi/ig9+tWzwjft604rLNA/qkSmdWvDoAiiA==
X-Google-Smtp-Source: ABdhPJwGCKt7zsL/y6NObCIYi35f4/YHkGRmg7kLDOYW+erS32FwkDnZ/eKzy1gDTP1pjLSdLD6kXvv5BmZCemgFzak=
X-Received: by 2002:a50:d307:: with SMTP id g7mr4302596edh.204.1614356838561; 
 Fri, 26 Feb 2021 08:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20210226070304.8028-1-jagan@amarulasolutions.com>
 <20210226070304.8028-3-jagan@amarulasolutions.com>
 <611bce6f-7adb-f0b5-0c9b-d5d7bb8b90fb@foss.st.com>
In-Reply-To: <611bce6f-7adb-f0b5-0c9b-d5d7bb8b90fb@foss.st.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 26 Feb 2021 21:57:07 +0530
Message-ID: <CAMty3ZAKZ=ODtNMBu-XoFCmNRR8XCA42wTD1H8f_6wC+sn+wPg@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Francesco Utel <francesco.utel@engicam.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mirko Ardinghi <mirko.ardinghi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [Linux-stm32] [PATCH v2 02/10] ARM: dts: stm32: Add Engicam
	MicroGEA STM32MP1 SoM
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

Hi Alexandre,

On Fri, Feb 26, 2021 at 9:42 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Jagan
>
> On 2/26/21 8:02 AM, Jagan Teki wrote:
> > MicroGEA STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> >
> > General features:
> > - STM32MP157AAC
> > - Up to 1GB DDR3L-800
> > - 512MB Nand flash
> > - I2S
> >
> > MicroGEA STM32MP1 needs to mount on top of Engicam MicroDev carrier
> > boards for creating complete platform solutions.
> >
> > Add support for it.
> >
> > Signed-off-by: Matteo Lisi <matteo.lisi@engicam.com>
> > Signed-off-by: Francesco Utel <francesco.utel@engicam.com>
> > Signed-off-by: Mirko Ardinghi <mirko.ardinghi@engicam.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Minor question: if the stm32mp157 is soldered on Microdev boards why do
> you mention it in this commit message ?

It was there in the commit message:

> > General features:
> > - STM32MP157AAC
> > - Up to 1GB DDR3L-800
> > - 512MB Nand flash
> > - I2S

>
> + a minor comment bellow.
>
> thanks
> Alex
>
> > ---
> > Changes for v2:
> > - none
> >
> >   .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 147 ++++++++++++++++++
> >   1 file changed, 147 insertions(+)
> >   create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
> >
> > diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
> > new file mode 100644
> > index 000000000000..97d569107bfe
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
> > @@ -0,0 +1,147 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> > +/*
> > + * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
> > + * Copyright (c) 2020 Engicam srl
> > + * Copyright (c) 2020 Amarula Solutons(India)
> > + */
> > +
> > +/ {
> > +     compatible = "engicam,microgea-stm32mp1", "st,stm32mp157";
> > +
> > +     memory@c0000000 {
>
> you could add           device_type = "memory";

Okay.

Jagan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
