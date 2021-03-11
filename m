Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D643372B5
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 13:35:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 622EEC5718B;
	Thu, 11 Mar 2021 12:35:07 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D19EFC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 12:35:05 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id r7so3127033ilb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 04:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kD+l4kkxKKdUXJQ23AQkR8FXXJ0y04WGuJHxzgDJRv8=;
 b=MP98FclJzXBmegZ2Hfg3NslxwABrao5gudQXwGIRkIt0/b4bN97IOmPAzrA8NPZ4V1
 63Bkgl1x3VgSkyV4E5c633NfHfefkJ8aCnc0BHLJuDDRVS23pUVoRzO348MqUMV0y/Ro
 GkCO6rMuMm5jEZzXh49AMdDXjSnAe7oJZHqDHI/2/NpUtFnoLAZPxMbzmCl6scxu/TW8
 Nux+nl0RSz09QtfaKddJZoWe4KNIvo3ErRoGMXDoCW5DQJe/9YqZRWjspfSPlxSbFSV1
 w//suhuA5GOw3GfBHKF780pCI0ZVx9URuGjJYqd3HcpC7vVGniH7eIHA4/Z4Zntf0mse
 uEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kD+l4kkxKKdUXJQ23AQkR8FXXJ0y04WGuJHxzgDJRv8=;
 b=aE0Luv4NKdiChNu77QBsLymauWab/8DQOkZ+6VCV7Tf8dYRt2YXalevZOlmSdW5fYv
 H7XvdAiAnt/hNBhtw9T2kK02Ohp2ZXpHXMnuJYUVUQSpYjBkWnUcg34tUC9YE7E36Y+u
 hxSEpEu+1yNtygUN6gS1nyjet2k/TNKGBa6Vet/cnSv9BGQQZF4rLqyZ+8Fa1ox6STXL
 pKk+xDfZF8dUQ3HEhm4G3rU7gvluUeyF3ICjXscEqqjLqJ7yNQrtreD1rdKDrr3uHdwK
 hDjidE2kgZ1O+OK+iqXI2wyz9aCVslgnKgRZmdpmYrcN6qR6whBWLcdZmXUVyeWNbK2R
 IrnQ==
X-Gm-Message-State: AOAM533QD+LryFLKFVdH5FfbEY5bjUUywoUflYbr9KtPjFZvrMDUi9Ji
 PxwGUlJEF8BwCUETT1jpcfEETwaRJpyls5UjCcg=
X-Google-Smtp-Source: ABdhPJzVtEakATdWW4VtfwUZKd0SXkdKNnUM5sILMsU4t79IaXrM/CeslMV4JekVnYf9MqTbg/ZxExNZ8xXnbCrWWFs=
X-Received: by 2002:a05:6e02:156e:: with SMTP id
 k14mr4381915ilu.200.1615466104755; 
 Thu, 11 Mar 2021 04:35:04 -0800 (PST)
MIME-Version: 1.0
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-9-git-send-email-dillon.minfei@gmail.com>
 <a5b4a06c-60c4-ba56-5f5b-dd7a8c5a0d6d@foss.st.com>
In-Reply-To: <a5b4a06c-60c4-ba56-5f5b-dd7a8c5a0d6d@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 11 Mar 2021 20:34:28 +0800
Message-ID: <CAL9mu0K9f2rDsFeiVKT0izutxQzAU_=YBo6x7w1m=8gDhK9uOw@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 8/8] ARM: stm32: add initial support for
	stm32h750
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

Hi Alexandre

On Thu, Mar 11, 2021 at 6:43 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dillon
>
> On 3/3/21 9:05 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
>
> No empty commit message please
Okay, thanks for remind.
>
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >   arch/arm/mach-stm32/board-dt.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
> > index 011d57b488c2..a766310d8dca 100644
> > --- a/arch/arm/mach-stm32/board-dt.c
> > +++ b/arch/arm/mach-stm32/board-dt.c
> > @@ -17,6 +17,7 @@ static const char *const stm32_compat[] __initconst = {
> >       "st,stm32f746",
> >       "st,stm32f769",
> >       "st,stm32h743",
> > +     "st,stm32h750",
> >       "st,stm32mp157",
> >       NULL
> >   };
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
