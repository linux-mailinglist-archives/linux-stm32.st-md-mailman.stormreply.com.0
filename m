Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B95925E
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 06:15:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 397D0C5BF5C;
	Fri, 28 Jun 2019 04:15:14 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 586B1C35E19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 04:15:12 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z23so4611007ote.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 21:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=alHSV6X/0jYcdmtS8pNTXOWz4fHsYwIu+SIRyai8F4U=;
 b=mwWKHR4gsiFZhFc+g9iiDBf3ria3CPGJBcUKNVbrOil9jxBOb15bPSedkQ6i24jHB2
 kgq9cPIPT5bdCFJOdW4vK/Cj6Q28b75Jdtg4+A+nn49Ju0ZMez/bP3llj4+yZRpmC4m1
 OAilLA/8XG4laGNg6ziCWw8QLmX1BfNw/A3dGxRtKF5WhMpH3wnILuAUhnDo3Ldro3Ja
 oQqbhOTpK+MN0Xu75Uru15bz0iInVn95zDCzLcEIjC1zcbaU8cbBCd6DeFDEM46JNzad
 JE8vF0BXoRqPNCBw1IJndTkL244uCMNW7mfJvMaJLegyUECwNOQD0lWoch5vlqqg5d+D
 avLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=alHSV6X/0jYcdmtS8pNTXOWz4fHsYwIu+SIRyai8F4U=;
 b=fMNvf8tlqrfErzkDRFop5QfSaql7RCK79ZcJUZFTWAedc7o48bMkEZu8FnlsdBcBB8
 Hifict93UVPuzgGrTiBQXp5VQB24idNqEbetwKHkx60OgJ8RIlLW2XUTa4qCdyTrC/YE
 VZcyncBEmWSd6CS6PbEmIvu9GQGCgSdBujZ14OozWq1/EnslOaAsk6j7ifmzalVuF9eh
 g8DaWsAXmm28r6/1TwgdvbQVliSxIaif72otSETxhtrT7xNCha4g1FRdG/LrwV1iMROH
 UZp9t1NFCEQ/HjpUWugugC6ZJ/84fdlXzKq5W1Vz/L6A1abiPm5xUzQjxlR8hARsQynf
 O69g==
X-Gm-Message-State: APjAAAXDC4BXUj0F69lfjLzA/Mb06J8cd4T1gm0R6CjOEnNHCcLFousb
 ywBf8ltUlXWsARyS0HTopKzZvOZFHyetYEzsU5s=
X-Google-Smtp-Source: APXvYqzoN5kA1YyGVtcEAFkQBTUlTjcCxJhJ1rQg63DQ4NxitIRUZ2Osuk9gZslYzS51V4HANDD59jPadH78m0yUWGw=
X-Received: by 2002:a9d:6d8d:: with SMTP id x13mr6286370otp.6.1561695310932;
 Thu, 27 Jun 2019 21:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190617165836.4673-1-colin.king@canonical.com>
 <20190619051308.23582-1-martin.blumenstingl@googlemail.com>
 <92f9e5a6-d2a2-6bf2-ff8a-2430fe977f93@canonical.com>
 <CAFBinCDmYVPDMcwAAYhMfxxuTsG=xunduN58_8e20zE_Mhmb7Q@mail.gmail.com>
 <CAFBinCC-LLpfXQRFcKBbUpCfKc0S9Xtt60QrhEThsOFV-T7vFw@mail.gmail.com>
 <c46d2d17-c35b-46f0-0674-0c55bea3a272@canonical.com>
In-Reply-To: <c46d2d17-c35b-46f0-0674-0c55bea3a272@canonical.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 28 Jun 2019 06:15:00 +0200
Message-ID: <CAFBinCBk5aPVE+vq5px3QKS1T_R=WGXXxEJMC9X676KGvi9jdg@mail.gmail.com>
To: Colin Ian King <colin.king@canonical.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add sanity check to
 device_property_read_u32_array call
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

On Tue, Jun 25, 2019 at 9:58 AM Colin Ian King <colin.king@canonical.com> wrote:
>
> On 25/06/2019 05:44, Martin Blumenstingl wrote:
> > Hi Colin,
> >
> > On Thu, Jun 20, 2019 at 3:34 AM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> >>
> >> Hi Colin,
> >>
> >> On Wed, Jun 19, 2019 at 8:55 AM Colin Ian King <colin.king@canonical.com> wrote:
> >>>
> >>> On 19/06/2019 06:13, Martin Blumenstingl wrote:
> >>>> Hi Colin,
> >>>>
> >>>>> Currently the call to device_property_read_u32_array is not error checked
> >>>>> leading to potential garbage values in the delays array that are then used
> >>>>> in msleep delays.  Add a sanity check to the property fetching.
> >>>>>
> >>>>> Addresses-Coverity: ("Uninitialized scalar variable")
> >>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >>>> I have also sent a patch [0] to fix initialize the array.
> >>>> can you please look at my patch so we can work out which one to use?
> >>>>
> >>>> my concern is that the "snps,reset-delays-us" property is optional,
> >>>> the current dt-bindings documentation states that it's a required
> >>>> property. in reality it isn't, there are boards (two examples are
> >>>> mentioned in my patch: [0]) without it.
> >>>>
> >>>> so I believe that the resulting behavior has to be:
> >>>> 1. don't delay if this property is missing (instead of delaying for
> >>>>    <garbage value> ms)
> >>>> 2. don't error out if this property is missing
> >>>>
> >>>> your patch covers #1, can you please check whether #2 is also covered?
> >>>> I tested case #2 when submitting my patch and it worked fine (even
> >>>> though I could not reproduce the garbage values which are being read
> >>>> on some boards)
> > in the meantime I have tested your patch.
> > when I don't set the "snps,reset-delays-us" property then I get the
> > following error:
> >   invalid property snps,reset-delays-us
> >
> > my patch has landed in the meantime: [0]
> > how should we proceed with your patch?
>
> I'm out of the office today. I'll get back to you on this tomorrow.
gentle ping
(I will be away for the weekend but I can reply on Monday)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
