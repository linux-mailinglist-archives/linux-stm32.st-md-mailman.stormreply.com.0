Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A37F221117
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2020 17:33:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05D2FC36B29;
	Wed, 15 Jul 2020 15:33:08 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6847DC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 15:33:05 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k23so2657691iom.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3/pQdYS/Dnr1ymTJv+NidFC3OUFb+e6KKsxPQ2Yv67c=;
 b=D+ARyC/tT0EwkUI5QwGS/MpuvZHZQhZw1IIn9yTvTJ5PzNgdV+xJ/09woYE+QgKfHA
 3nKvtPRUFo91vGrZFgb7mNort2mz0DapQl970UQKuba9mYudg7ARczsPYKbSKJCaUpjV
 Fk258LRS73Px4xEW/TA2kMUJauSKvIMglEiugBR3zKo6W0D9aC9EuWP2GjQJG2tjFoEe
 eQ8PL+1KiRVDerhisAHsmoPZOjTS70z873MicFxWmtGOZMhK53rzReWy5Qxwx8kNikp9
 je9dzKqFAQF7ri/Pfuvj7yOzlwqQ2ayWa1kC/nuMJuJ0pZfEGNGuIebCrCAdEa4smsTu
 3i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3/pQdYS/Dnr1ymTJv+NidFC3OUFb+e6KKsxPQ2Yv67c=;
 b=HbnbPJw0UxJKe2T2hQ/CJI0XbDbvY4lPSVzmhXVaL9zmjapK9ZVplIWIak2lamRLsn
 gpfTO6db0wghDy/8aixHM+RMKwH3AZAlRFirT1DmFaj9v47YnDKNA3GwyfbQUBENTCpc
 oeQksYNNboR6zvUSHsyXOuPv+Gw3a7i9EHdcZT/sfo3lyS4wMXx0sFeBgEE6wI8dubqf
 AoudMff4q8w7GNID5rRPJ3RIsChl5Dl7jqt1EV/d722TtVymRzUopgzG2WF4bKNFzL68
 BdgRW84F7Mz2CAFqD8pA1zGRZSvxTMjghSA9oYD0SLTESa1Vtbpr1GVR7D/juxHNRhaw
 lp0w==
X-Gm-Message-State: AOAM533Wsw/9C2yrsvf9deYtKMGKSWj9z6iRWo9w4cN/x7g6MDbEiHzo
 rfGZkkfIWbpqej7zoIGSbs3N+96SoZfQm9pMSWUlPQ==
X-Google-Smtp-Source: ABdhPJweq1N6tkof3wjCwSMgBSSq0jgPksYVht/5VHBVayPqCWUxP7gIsxMCn/l6df4OcdQzXCWR0gv5qPFEFEpUW1E=
X-Received: by 2002:a6b:5c0a:: with SMTP id z10mr10587243ioh.131.1594827184561; 
 Wed, 15 Jul 2020 08:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
 <1cde5c1d5d9047149c93e031c5093492@SFHDAG3NODE1.st.com>
In-Reply-To: <1cde5c1d5d9047149c93e031c5093492@SFHDAG3NODE1.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 15 Jul 2020 09:32:53 -0600
Message-ID: <CANLsYkyWLowSk1Zq7oWUzgsF=7FDVwe6XDgA6foWyX0VQwTE4g@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc: "ohad@wizery.com" <ohad@wizery.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v6 00/11] remoteproc: stm32: Add support
	for attaching to M4
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

On Wed, 15 Jul 2020 at 00:51, Arnaud POULIQUEN <arnaud.pouliquen@st.com> wrote:
>
> Hi Mathieu
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: mardi 14 juillet 2020 22:05
> > To: ohad@wizery.com; bjorn.andersson@linaro.org; Loic PALLARDY
> > <loic.pallardy@st.com>; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> > mcoquelin.stm32@gmail.com; Alexandre TORGUE
> > <alexandre.torgue@st.com>
> > Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > stm32@st-md-mailman.stormreply.com
> > Subject: [PATCH v6 00/11] remoteproc: stm32: Add support for attaching to
> > M4
> >
> > This set applies on top of [1] and refactors the STM32 platform code in order
> > to attach to the M4 remote processor when it has been started by the boot
> > loader.
> >
> > New to V6:
> > 1) Removed extra newline in patch 06.
> > 2) Re-worked title and changelog of patch 08 to better reflect
> >    what is done by the patch.
> >
> > Tested on ST's mp157c development board.
>
> I don' t know if you don't see  it on last  version or if you prefer that I review your update first... so for the series

Ah yes, my apologies on that - I misread the comment you left me in
00/11 of the V5 set.

>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>
> Thanks,
> Arnaud
>
> >
> > Thanks,
> > Mathieu
> >
> > [1].https://patchwork.kernel.org/project/linux-
> > remoteproc/list/?series=318275
> >
> > Mathieu Poirier (11):
> >   remoteproc: stm32: Decouple rproc from memory translation
> >   remoteproc: stm32: Request IRQ with platform device
> >   remoteproc: stm32: Decouple rproc from DT parsing
> >   remoteproc: stm32: Remove memory translation from DT parsing
> >   remoteproc: stm32: Parse syscon that will manage M4 synchronisation
> >   remoteproc: stm32: Properly set co-processor state when attaching
> >   remoteproc: Make function rproc_resource_cleanup() public
> >   remoteproc: stm32: Parse memory regions when attaching to M4
> >   remoteproc: stm32: Properly handle the resource table when attaching
> >   remoteproc: stm32: Introduce new attach() operation
> >   remoteproc: stm32: Update M4 state in stm32_rproc_stop()
> >
> >  drivers/remoteproc/remoteproc_core.c |   3 +-
> >  drivers/remoteproc/stm32_rproc.c     | 214 ++++++++++++++++++++++++--
> > -
> >  include/linux/remoteproc.h           |   1 +
> >  3 files changed, 198 insertions(+), 20 deletions(-)
> >
> > --
> > 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
