Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA2F5A044
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 18:05:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA56C35E05;
	Fri, 28 Jun 2019 16:05:48 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1137EC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 16:05:46 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r21so5808538otq.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 09:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rB3m6lymfmEJSrj5bHYQhYToOLJuP/M6N6+Gh/hsbFw=;
 b=bc/qm2AfIl7/pff81NO1XSTxiwj/Tf0ODnPhZSJ5FTf056oge76zhm015auns2dWOc
 RinrawyZ0O2i6XS3+Gia3nZKyP4l+hj94CO63lQVLxbXgIhu7crlszsOV628/OdmjOHs
 sgA2BP1tBdIoQGCZBW6+NVSOzl9jEECi2MCa0a/YPJDDCTBDdePstSg/jnqv6PrxCsmQ
 ThKE283f5h0W/IlmNX0oHfVqT1Ne7o8ahjcCU6dkor7BD58aVUBqhrXrvV7DJyiPPXkB
 MJa5LLDboqWiBQHW5V5SO5bR4xRlOCIXS7xPSUT6OYP8peQqJOrSThluXwg3T02RX4Hq
 coBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rB3m6lymfmEJSrj5bHYQhYToOLJuP/M6N6+Gh/hsbFw=;
 b=ln718I71kXF6HjjEaLxIuiTkNxl6gGY42/t4zp8nwU9LtBYB6LV9DvSbBfrUT4l4+W
 +Ceb+SyJOiByGjilH/DrQjNIu1y91eAdFjUhgxGRPxG2M1YWnCXgGfBYcfmP0s4K3VZB
 KiNTH2NnyiUGWVeMWWb7c6T+8nKGoS7VBW5o2dc0bIUnoMFHnQslByaGe57IqvXtYlZF
 pvMFyKFWR4h5N/NFvzTi6jTYkka+N7UULj57wm4P6yHIUmRJy8CkpHBqEJ2ws0nES7jv
 iBtc7rtDG9HVcLwo47oLUfA/RovRMWv/DHw2yB/Rw+xsN7Zvc4HrIwN3hgZkWXQ128Fr
 wK1g==
X-Gm-Message-State: APjAAAVP0gw/2GQK8qWsHbRi0W41XF9BVWPHyO/BXGnLIsgEzmQqIKPJ
 lO5L3Tes4zlZ5r75TysAKxUKqC5cLZaniTFt/LQ=
X-Google-Smtp-Source: APXvYqxpqVINGUIuZUIFanNgoXeInzShDbpDl64F0HtsRM7t1NOYrZCC3Ebzuzy9/EHv7T38+pkX4a5YcGAPWYaVwrw=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr8604745otb.98.1561737944761; 
 Fri, 28 Jun 2019 09:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190617165836.4673-1-colin.king@canonical.com>
 <20190619051308.23582-1-martin.blumenstingl@googlemail.com>
 <92f9e5a6-d2a2-6bf2-ff8a-2430fe977f93@canonical.com>
 <CAFBinCDmYVPDMcwAAYhMfxxuTsG=xunduN58_8e20zE_Mhmb7Q@mail.gmail.com>
 <CAFBinCC-LLpfXQRFcKBbUpCfKc0S9Xtt60QrhEThsOFV-T7vFw@mail.gmail.com>
 <c46d2d17-c35b-46f0-0674-0c55bea3a272@canonical.com>
 <CAFBinCBk5aPVE+vq5px3QKS1T_R=WGXXxEJMC9X676KGvi9jdg@mail.gmail.com>
 <26646ff1-059f-fb2d-e05d-43009aeb2150@canonical.com>
In-Reply-To: <26646ff1-059f-fb2d-e05d-43009aeb2150@canonical.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 28 Jun 2019 18:05:33 +0200
Message-ID: <CAFBinCAx5qrPK1z68bF-tGKpJQfKLnee65qBOxMS4nj8t381+Q@mail.gmail.com>
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

On Fri, Jun 28, 2019 at 10:32 AM Colin Ian King
<colin.king@canonical.com> wrote:
>
> On 28/06/2019 05:15, Martin Blumenstingl wrote:
> > On Tue, Jun 25, 2019 at 9:58 AM Colin Ian King <colin.king@canonical.com> wrote:
> >>
> >> On 25/06/2019 05:44, Martin Blumenstingl wrote:
> >>> Hi Colin,
> >>>
> >>> On Thu, Jun 20, 2019 at 3:34 AM Martin Blumenstingl
> >>> <martin.blumenstingl@googlemail.com> wrote:
> >>>>
> >>>> Hi Colin,
> >>>>
> >>>> On Wed, Jun 19, 2019 at 8:55 AM Colin Ian King <colin.king@canonical.com> wrote:
> >>>>>
> >>>>> On 19/06/2019 06:13, Martin Blumenstingl wrote:
> >>>>>> Hi Colin,
> >>>>>>
> >>>>>>> Currently the call to device_property_read_u32_array is not error checked
> >>>>>>> leading to potential garbage values in the delays array that are then used
> >>>>>>> in msleep delays.  Add a sanity check to the property fetching.
> >>>>>>>
> >>>>>>> Addresses-Coverity: ("Uninitialized scalar variable")
> >>>>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >>>>>> I have also sent a patch [0] to fix initialize the array.
> >>>>>> can you please look at my patch so we can work out which one to use?
> >>>>>>
> >>>>>> my concern is that the "snps,reset-delays-us" property is optional,
> >>>>>> the current dt-bindings documentation states that it's a required
> >>>>>> property. in reality it isn't, there are boards (two examples are
> >>>>>> mentioned in my patch: [0]) without it.
> >>>>>>
> >>>>>> so I believe that the resulting behavior has to be:
> >>>>>> 1. don't delay if this property is missing (instead of delaying for
> >>>>>>    <garbage value> ms)
> >>>>>> 2. don't error out if this property is missing
> >>>>>>
> >>>>>> your patch covers #1, can you please check whether #2 is also covered?
> >>>>>> I tested case #2 when submitting my patch and it worked fine (even
> >>>>>> though I could not reproduce the garbage values which are being read
> >>>>>> on some boards)
> >>> in the meantime I have tested your patch.
> >>> when I don't set the "snps,reset-delays-us" property then I get the
> >>> following error:
> >>>   invalid property snps,reset-delays-us
> >>>
> >>> my patch has landed in the meantime: [0]
> >>> how should we proceed with your patch?
>
> Your fix is good, so I think we should just drop/forget about my fix.
thank you for looking at the situation

as far I understand the -net/-net-next tree all commits are immutable
so if we want to remove your patch we need to send a revert
do you want me to do that (I can do it on Monday) or will you take care of that?


Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
