Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E65FA22F951
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 21:44:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99294C36B27;
	Mon, 27 Jul 2020 19:44:39 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76621C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 19:44:37 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z3so9637905pfn.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qzzZKFqE1nfVRb0bTdQAza1honJ2T0+1vW2BFXwTzqA=;
 b=HLOh+BHLV83GvCy5qUxFSaZI0+nJP44EMKDBWsLY8Ovleoz0qJzz9U/WHyEcv8UmBR
 K6dzaNevQflsp7u1+vL5BpA3XgDFl66RzHvFTsbEJAoMUxj8tAYHWQ5e2pNuo8db9gJe
 PJegFSJz/dE71vnOhQ4JE8F7CAkptW/6IiGqB18TtsZS+FvQ+fpDtHyKSpGeyycOmDGk
 +61FWMMRgSO3dsJRPTJYfH7iezRNM7LIchSAZBCfb8kF4+kXRublXv+myOcu6UNAEBgi
 rLsNTbH1/YK8y3dO6mBN28vzkIqqhsJwgLugHq2jPJAK7F4CjOjeLidnlm6kM8JEwKL4
 gi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzzZKFqE1nfVRb0bTdQAza1honJ2T0+1vW2BFXwTzqA=;
 b=jNJZWDDs4gzH9cA0Fi07xhTbYf35CGc1ynHKT3Uim9mOMWesJu6PqvZfyjDU7yaBjT
 T7590Wkc+EgzYJUCsdf6hBS99FO9lvoTlVmQZx0zaJk7arTo4lMtR8wauSFlyzmAptlk
 e8URjSRZY5o5lUiWA627i3rO/UZ9Sy4YQpfCB511CVNeIQiwPzdfR9x/TjpLYSX8NKMP
 sEjomoVfoLbdjSMwkPA4kIBMRVY1lN/4i9zyhMW6/gxk0tGmTb222HQyI1v47Lapm1Sc
 xxlvf7ubVm0a8gWYNlXUX9P4TgPymBGTnsE4GXPuU3obXUlS7+cJ+eNAhNLaKbm1pF84
 QLUg==
X-Gm-Message-State: AOAM532pkB/5AEiPaS5N9EzgU9VXEm1irzXt88N8rFvo0WX88XUb8XsE
 j7vdP7W7G0CsbuiRhk6mpg81WouoqNPjMdE/Kok=
X-Google-Smtp-Source: ABdhPJzEd9N2EW8275FRzfeT1fNAW9ksND1FAyY1KyG0A8DkhI41cM9sG0GJE6Li/KdL/CE30l9gi3zTMIRToWH2OsA=
X-Received: by 2002:a62:758f:: with SMTP id q137mr3064389pfc.170.1595879075906; 
 Mon, 27 Jul 2020 12:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200727092346.19780-1-amelie.delaunay@st.com>
 <20200727092346.19780-4-amelie.delaunay@st.com>
 <CAFBinCCXuUC4PHgrobYjj=yjA3Tz73Wwx0KWz+B6PfCw_OSi_w@mail.gmail.com>
In-Reply-To: <CAFBinCCXuUC4PHgrobYjj=yjA3Tz73Wwx0KWz+B6PfCw_OSi_w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 Jul 2020 22:44:19 +0300
Message-ID: <CAHp75Ve75d+K87cokb4YYgim_wU0gTidGuiPs3BmohRKfTh5gA@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Felipe Balbi <balbi@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 3/3] usb: dwc2: don't use ID/Vbus
 detection if usb-role-switch on STM32MP15 SoCs
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

On Mon, Jul 27, 2020 at 10:04 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Mon, Jul 27, 2020 at 11:23 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> > -       p->activate_stm_id_vb_detection = true;
> > +       p->activate_stm_id_vb_detection =
> > +               !of_property_read_bool(np, "usb-role-switch");
> the rest of params.c uses device_property_read_* instead of of_read_property_*
> I thought I'd mention it so you can decide yourself whether this is
> fine or needs to be changed

Better to change and leave all on one line.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
