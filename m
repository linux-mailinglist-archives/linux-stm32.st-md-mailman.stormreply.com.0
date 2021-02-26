Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 537F1326481
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 16:10:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A7C2C57B59;
	Fri, 26 Feb 2021 15:10:35 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E10CDC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 15:10:32 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id lr13so15359205ejb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 07:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qob+x0v3PWoQeSjNHiZO+kB15xvcQ69XpXTQVJz2RPU=;
 b=a1MDEHM8s09DsnQbF02T997tp4oRe2O37ngvi+1wKL+1pfve0tWdfjpaxAYTPYjbQp
 Va2oSjrin0RnNf5eHoWp7n+V0DxLvLXzxan2yj7/Q2ZJU7RXgr5AmxKC73hwD0SsMOpC
 /kKpSGfnaWzC+f55rJmmjNCqG0jOtkaRZxnIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qob+x0v3PWoQeSjNHiZO+kB15xvcQ69XpXTQVJz2RPU=;
 b=Uq59KLL0MNX12gLmrbnBuDNe50nt76qGq8pM8SNEcZ3J5KvmX5TXY+TEyWItBQnnJ0
 XowNVeY8fvlrb1xEdO5Diz/9bcbwK0vxxkH/UwWDFvoq6MGdoJ7DpoxKIcA/a54Ejz3c
 77ImXSJOcVcLT29GGzj65FaprdOuh+3pxLgAtjXEwepnxfnAh6UmQGU8K7G5dchNl9fb
 mkiZkXN0/CF6brkMQRh45gKTmW4ADINxZx1hjkuEBScrwy/KIQ3xVcyX0JhC3Y3jxPRw
 oFlEspfrWvtfVzVBV0958wmy2TDG/xRCYfS1AeSY74OxYCGRtp+WnjtJ4gUvJuljdlpB
 M1WQ==
X-Gm-Message-State: AOAM533Lf0bfQR6GmoHqEnPIsaBEwg2dO7nwkZml1WHCVBNaowjs7Alp
 fZNnnzZOl7409hgUeZrJbbuXNuul4sdiuQtb3FGGiw==
X-Google-Smtp-Source: ABdhPJyoRqbRLP+Q6WlKYXMUH1kbTuEF+ZlC2okW0g37gPI8Gl8+y1kqX+nuWxY1JhpGJZkn81TY1UVsxXTQR5Sy/6s=
X-Received: by 2002:a17:906:3fc3:: with SMTP id
 k3mr3911081ejj.522.1614352232483; 
 Fri, 26 Feb 2021 07:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20201223191402.378560-1-jagan@amarulasolutions.com>
 <20201223191402.378560-3-jagan@amarulasolutions.com>
 <21398844-c334-f753-0fac-144a0cdc29dc@foss.st.com>
 <CAMty3ZBotTi2RwkKUpb+8KBOJ484hHzOV0p4J_dJ-fBVSDoMAg@mail.gmail.com>
 <cb9708b7-dfd2-04d3-a3d9-2479ab428f1a@foss.st.com>
In-Reply-To: <cb9708b7-dfd2-04d3-a3d9-2479ab428f1a@foss.st.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 26 Feb 2021 20:40:20 +0530
Message-ID: <CAMty3ZB7_Bi5pxJAtG21xnng4eTosP_taTa_gnVYZ503EAFnUg@mail.gmail.com>
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

On Fri, Feb 26, 2021 at 8:39 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Jagan
>
> On 2/24/21 7:05 PM, Jagan Teki wrote:
> > On Mon, Jan 25, 2021 at 8:35 PM Alexandre TORGUE
> > <alexandre.torgue@foss.st.com> wrote:
> >>
> >> Hi,
> >>
> >> On 12/23/20 8:13 PM, Jagan Teki wrote:
> >>> MicroGEA STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> >>>
> >>> General features:
> >>> - STM32MP157AAC
> >>> - Up to 1GB DDR3L-800
> >>> - 512MB Nand flash
> >>> - I2S
> >>>
> >>> MicroGEA STM32MP1 needs to mount on top of Engicam MicroDev carrier
> >>> boards for creating complete platform solutions.
> >>>
> >>> Add support for it.
> >>>
> >>> Signed-off-by: Matteo Lisi <matteo.lisi@engicam.com>
> >>> Signed-off-by: Francesco Utel <francesco.utel@engicam.com>
> >>> Signed-off-by: Mirko Ardinghi <mirko.ardinghi@engicam.com>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>>    .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 147 ++++++++++++++++++
> >>>    1 file changed, 147 insertions(+)
> >>>    create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
> >>>
> >>> diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
> >>> new file mode 100644
> >>> index 000000000000..97d569107bfe
> >>> --- /dev/null
> >>> +++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
> >>> @@ -0,0 +1,147 @@
> >>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> >>> +/*
> >>> + * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
> >>> + * Copyright (c) 2020 Engicam srl
> >>> + * Copyright (c) 2020 Amarula Solutons(India)
> >>> + */
> >>> +
> >>
> >> If STM32MP157AAC is soldered onto this board, you should include SoC
> >> dtsi here and no into MicroDev 2.0 board. No ?
> >
> > No, it's an SoM dtsi. and it can be associated with the respective
> > carrier board and include files are attached in its dts.
> >
> > Please check the next patches on this series.
> Ok, I thought it was a mistake as you mentioned "- STM32MP157AAC" in
> your commit message.

Please check, v2 for this series. thanks!

Jagan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
