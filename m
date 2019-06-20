Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EF94C4FE
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 03:34:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CD0EC5C85A
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 01:34:33 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F566C5C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 01:34:31 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t76so905819oih.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 18:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nYuOW5lyxxT0zsgk7qqZi/7w20Oi72vHiGCqLTnTrl8=;
 b=XxxTCKxD/5Hh4mP6+R4KSzkOEhkkx9EXfAH8omqHrIeXVmLMBa406JF09S5I9/dOxR
 wc9h4G7Dflde6RcyDAZnRIMTkl43HRI69tjffugAWRVlUFXSiEWEbbvf1v8Dkv333ACz
 fPBTlaPJtNz1tic4Y8+juQsuQ6mnFj5eYHNiMilXbbr3elf5dvc2xJrALVZVKGSFd1iZ
 efEFfZAArnZa7GOg/IseyJDpc7KuRCJF8XYefzt5VhBC48jDwJGyC0kRcJOnDLUKC0In
 eFPF3hEUJBXxsibzw51TwqvsjDFIP78hjGH3zMbetl9Rq5+bOJEMbbz3Y1EtDIbZufot
 ZLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nYuOW5lyxxT0zsgk7qqZi/7w20Oi72vHiGCqLTnTrl8=;
 b=IQnUAedaA0VXzBwPBxuNo5KMaBllFGiXn9k86FCH9APy3g8anCiAA8nRDTXZS6x+Qz
 p44jBaGobNZ0XF0J/FQrctdVxXjvtW5seBzwdkGR5T7/9KL7WD70JZ/BnUYVM8Sfj/+L
 rRucve1JRLjxkUs5SuSTIFujg6vr4kLXyD5MFvKRaaCLVauDDrcCFK3ARHJ+wa2H4aRK
 +yVgImyzKGrb3KPvRNHCgCUDhrGRJlGPT3MaqRPfQXHgUMzewEWpQowjYpn7ntJ62iVJ
 QkQB7dIYgx26B74DAk1KnU7UurpDmIH34Vr9Kw+a7qvreUjgxFr03MK2/plJR6k0e077
 W0yg==
X-Gm-Message-State: APjAAAULVmaL4ZMiZLIn7R15THEzjC/2QpLEyapMI4AMXvU7N3NeK1qY
 f+UB+mwT/Edu2t/yaXh/NNYLFdmHIoTmDiveeco=
X-Google-Smtp-Source: APXvYqwrykrLtbD0pG9V8vBrsbsTo35v6Soy95FKONjQ0aI87GQhODvgpXAK5RhK2mM0+AszFXum8RjavMf7MOSMXic=
X-Received: by 2002:aca:4403:: with SMTP id r3mr4853308oia.39.1560994469747;
 Wed, 19 Jun 2019 18:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190617165836.4673-1-colin.king@canonical.com>
 <20190619051308.23582-1-martin.blumenstingl@googlemail.com>
 <92f9e5a6-d2a2-6bf2-ff8a-2430fe977f93@canonical.com>
In-Reply-To: <92f9e5a6-d2a2-6bf2-ff8a-2430fe977f93@canonical.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 20 Jun 2019 03:34:18 +0200
Message-ID: <CAFBinCDmYVPDMcwAAYhMfxxuTsG=xunduN58_8e20zE_Mhmb7Q@mail.gmail.com>
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

Hi Colin,

On Wed, Jun 19, 2019 at 8:55 AM Colin Ian King <colin.king@canonical.com> wrote:
>
> On 19/06/2019 06:13, Martin Blumenstingl wrote:
> > Hi Colin,
> >
> >> Currently the call to device_property_read_u32_array is not error checked
> >> leading to potential garbage values in the delays array that are then used
> >> in msleep delays.  Add a sanity check to the property fetching.
> >>
> >> Addresses-Coverity: ("Uninitialized scalar variable")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > I have also sent a patch [0] to fix initialize the array.
> > can you please look at my patch so we can work out which one to use?
> >
> > my concern is that the "snps,reset-delays-us" property is optional,
> > the current dt-bindings documentation states that it's a required
> > property. in reality it isn't, there are boards (two examples are
> > mentioned in my patch: [0]) without it.
> >
> > so I believe that the resulting behavior has to be:
> > 1. don't delay if this property is missing (instead of delaying for
> >    <garbage value> ms)
> > 2. don't error out if this property is missing
> >
> > your patch covers #1, can you please check whether #2 is also covered?
> > I tested case #2 when submitting my patch and it worked fine (even
> > though I could not reproduce the garbage values which are being read
> > on some boards)
> >
> >
> > Thank you!
> > Martin
> >
> >
> > [0] https://lkml.org/lkml/2019/4/19/638
> >
> Is that the correct link?
sorry, that is a totally unrelated link
the correct link is: https://patchwork.ozlabs.org/patch/1118313/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
