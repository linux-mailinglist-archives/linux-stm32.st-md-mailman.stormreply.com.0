Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076836457B
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Apr 2021 15:57:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BD0EC57196;
	Mon, 19 Apr 2021 13:57:30 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9D77C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 13:57:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYLqs-1l4Mbt0ka2-00VTzw for <linux-stm32@st-md-mailman.stormreply.com>; Mon,
 19 Apr 2021 15:57:27 +0200
Received: by mail-wr1-f42.google.com with SMTP id p6so27455727wrn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 06:57:27 -0700 (PDT)
X-Gm-Message-State: AOAM530NPzb1Ws53Xn3IcHJzARfKytXvwAOJBD2Y/YuilJ+L3kDJYWvI
 Zi6n6G1GtZnfgnXDxtcSkNOWEh8G0T5AcWj/KRQ=
X-Google-Smtp-Source: ABdhPJy9unBhJAs1A1vsfAqD5VJWjn3s3JNXApCpMos5sX1l7PV8pNqCwemCX23fbcibgwHMtR1BIfEvdX4jMjdJ3E0=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr14806757wrj.99.1618840646771; 
 Mon, 19 Apr 2021 06:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-13-alexandre.torgue@foss.st.com>
 <ececc78c-4fca-bb93-ef62-5d107501d963@pengutronix.de>
 <96da49dc-f24d-aa12-e1d8-39b5a5b6fbc9@foss.st.com>
In-Reply-To: <96da49dc-f24d-aa12-e1d8-39b5a5b6fbc9@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Apr 2021 15:57:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1bGAUbqTGqyz+PB=7fuVLkJce0awtx1Z9PE3uiX6uysQ@mail.gmail.com>
Message-ID: <CAK8P3a1bGAUbqTGqyz+PB=7fuVLkJce0awtx1Z9PE3uiX6uysQ@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Provags-ID: V03:K1:ZclQzW5OMTpJW0hohzb5ZP7zMl6XBNmUAa+69qt8o1U2TptxNhc
 nt8DUb+5K4KN4LpuvH7lnG/33yYvDWWYTqZmWIbAJMcK6X9KvuuS+n3MgRQwkHR96/bC6YZ
 UvN5Y712++r55DtAAcHx8FFXN0DBrFZOEOm9MoTdZ9a6CCVK13SETp9B8lRRn4Np2miykrv
 QjbLNSYlvryKG+E+D8swA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dTLq7S10YSg=:j7m+wvtHNLtvBubVAD+Sdr
 2GtN0R8Mbm3zQsfRMCudD+C7IgLvgfcztFENXXSbOQwVrlezAhy6itGWiqTp3qqprzGM9uB+H
 9sU5ip47f7ZO0rq3sqrWavX3huc1k7KYIErqtZmXAkyvXLWl9DEt+72zn3ajd99w/aOG4SkfG
 9NzNjS+v0BRIT8s60UTv3B6f0EO90/4Q42tOlAqg/xR9qpmXsQ8JCjZOLcR6MKow/nqp1Fafj
 VFWNaSzahHK8Ec7477C2tlZp05bdJwgG4FKIe+Pp2S33OGITCvFXFgtT+4iQBlrhHW52foAn0
 rgxfneqdFgu954dpt5j+V/JWVmdDUtAj8q+GxmYXO+CV+FbQijZ7HaSXJuudIxeiad/ITMBfr
 J13NVm1P3MbqthzV4KlwiSm7Hu2smOAZetZSbWshffluAFu41qcsqeMDnh/C5DRo9vMTILMVF
 zDnjLKdgfLS+PLyAuBHZoRhCxtYXb91ZMvmvZqX6q7AOpe8mm8ZjaFBDyspNem5WKGCXoSXPG
 C9Bq85Kw/Y7k/P6NcIQkettQ3FgPanKZj03QOhrjon69eAEvUdl6HRjGr8h7iJ4PzLvhzuP0m
 mYdmgsGkPwozUmPFCmH3owBVmKp0P48cmq9Ap5GzG+qLw3dRcCTAkiA8Fuke0sxD96gb2E4+c
 eITc=
Cc: Marek Vasut <marex@denx.de>, DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 12/13] ARM: dts: stm32: fix DSI port node
	on STM32MP15
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

On Thu, Apr 15, 2021 at 2:23 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
> On 4/15/21 12:43 PM, Ahmad Fatoum wrote:
> > On 15.04.21 12:10, Alexandre Torgue wrote:
> >> Running "make dtbs_check W=1", some warnings are reported concerning
> >> DSI. This patch reorder DSI nodes to avoid:
> >>
> >> soc/dsi@5a000000: unnecessary #address-cells/#size-cells without
> >> "ranges" or child "reg" property
> >
> > This reverts parts of commit 9c32f980d9 ("ARM: dts: stm32: preset
> > stm32mp15x video #address- and #size-cells"):
> >
> >      The cell count for address and size is defined by the binding and not
> >      something a board would change. Avoid each board adding this
> >      boilerplate by having the cell size specification in the SoC DTSI.
> >
> >
> > The DSI can have child nodes with a unit address (e.g. a panel) and ones
> > without (ports { } container). ports is described in the dtsi, panels are
> > described in the dts if available.
> >
> > Apparently, the checker is fine with
> > ports {
> >       #address-cells = <1>;
> >       #size-cells = <0>;
> > };
> >
> > I think my rationale for the patch above was sound, so I think the checker
> > taking offense at the DSI cells here should be considered a false positive.
>
> If it's a "false positive" warning then we need to find a way to not
> print it out. Else, it'll be difficult to distinguish which warnings are
> "normal" and which are not. This question could also be applied to patch[3].
>
> Arnd, Rob what is your feeling about this case ?

I don't have a strong opinion on this either way, but I would just
not apply this one for 5.13 in this case. Rob, Alexandre, please
let me know if I should apply the other patches before the
merge window, I usually don't mind taking bugfixes late before the
merge window, but I still want some level of confidence that they
are actually correct.

Ahmad, if you feel strongly about this particular issue, would you like
to suggest a patch for the checker?

        Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
