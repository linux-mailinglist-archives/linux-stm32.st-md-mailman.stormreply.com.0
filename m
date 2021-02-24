Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90041324380
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Feb 2021 19:05:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 202D9C57B59;
	Wed, 24 Feb 2021 18:05:54 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 070A5C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 18:05:52 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id w19so3000134qki.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IUVbPpVZ4+NgeP6WqeHK/Kh6aJQsEUlwdu/Vg1IkVWc=;
 b=BbuezdHJhX0VaqiVhs3QX24iZqeWNYYI9JPFBgxbVH7NCORNudB31SneVA7WkWMAR7
 aLqFN6jUzJfTUH3cpxX5XVNx+9Zfgyak6IILCCgbsx/owKKhL/HmpbeyUz/FuafT/D40
 xbUd6myC/Nl+LIlJGuSCogXQTTKbfo6B4c70Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IUVbPpVZ4+NgeP6WqeHK/Kh6aJQsEUlwdu/Vg1IkVWc=;
 b=qHMT8hMEsoEQDJBS9ciIFV9seKNoZQPVN3zjydLOm3we8XkafiLaGqr85XXHoCJfzc
 ZoNgh+uRTqiE2fAQ7kXgXT8qgw21LNeWGKRvi/1a/Y6EpWDAHRElKpOlwakfyFdTU63j
 RBOVmE9sWZCVDTAQasfybw4tyl8RyOS2p5z/ye6/3solXJfPaAxiHlrv8fcNGuGVq+Ow
 CLtTnStRpW9pFhRL9k6ZNA9FKLWKnop7oCV8peu7Zhm/rLJNdzAyFC52nk1gpaA/vwtC
 l1VuGbX81EbyK+oocG3nWuj2jySpfJmu0rsJDPUuCvKiorUq1DnAUEoXz5/TgJfM3Pg/
 lFmQ==
X-Gm-Message-State: AOAM531lEKKlW4YrCgzmIxgfAJ76OiiR3DMu11IRe5ou7A6l1r8ykgo5
 hIOcmgNjzrFighWjSfCYDISdazr7tvsDEGAWy29gwg==
X-Google-Smtp-Source: ABdhPJzxG+t4ePEvNgAjEffIj7RO+NTXPSKnP7rszVjKHwIoimFIoB8HXaiwIpUXbvSbxz8DA+m6YZaoxm9PDlX+dHs=
X-Received: by 2002:a37:9444:: with SMTP id w65mr12635158qkd.88.1614189951332; 
 Wed, 24 Feb 2021 10:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20201223191402.378560-1-jagan@amarulasolutions.com>
 <20201223191402.378560-3-jagan@amarulasolutions.com>
 <21398844-c334-f753-0fac-144a0cdc29dc@foss.st.com>
In-Reply-To: <21398844-c334-f753-0fac-144a0cdc29dc@foss.st.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 24 Feb 2021 23:35:39 +0530
Message-ID: <CAMty3ZBotTi2RwkKUpb+8KBOJ484hHzOV0p4J_dJ-fBVSDoMAg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 2/5] ARM: dts: stm32: Add Engicam MicroGEA
	STM32MP1 SoM
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

On Mon, Jan 25, 2021 at 8:35 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi,
>
> On 12/23/20 8:13 PM, Jagan Teki wrote:
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
> > ---
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
>
> If STM32MP157AAC is soldered onto this board, you should include SoC
> dtsi here and no into MicroDev 2.0 board. No ?

No, it's an SoM dtsi. and it can be associated with the respective
carrier board and include files are attached in its dts.

Please check the next patches on this series.

Jagan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
