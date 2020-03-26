Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FDD193E0B
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2020 12:38:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF819C36B0B;
	Thu, 26 Mar 2020 11:38:50 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3F55C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 11:38:47 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id z3so1765022pjr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 04:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=R0qU1vfFJtq/8uG9IZGBPMdQ0ZUew1mrKKw6hutamAQ=;
 b=DQZmDaLxybbCIR7OhJBlYkbfh0VC2lyHZ20SSGUBLSGqUYDxLQ8242wwrhvmMIkb+S
 kauniwR17uUed8TQ9jHasiNY9F0hFIQ+iOXlw+Z3KaBoTjCoZBiR8qmIhLhgn0N/zuzM
 22Gb5fG2swp7zD4zWaEa3wgW3PwSj369qegoLcBMjvsICPfjheRv0y8uxvwVUSBIG5Bg
 +OF0emN61e/tbswYEZI3gzkS/0ortnuXK/NQ29CCygBvb3JByEMDtFdtk+d7akr6J7KW
 7kSiz9I257CjR4R0WzKrrxKa8jSsmeOkN6bk6alieSvYuWHfQGIt4IjoxeM4+Q3z0DVJ
 WLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=R0qU1vfFJtq/8uG9IZGBPMdQ0ZUew1mrKKw6hutamAQ=;
 b=SlOcq/r89XdTtJs1hfoUGDfru0TvHhhnavebuttgL5UTNOF4ZwDH5+KKKtFaBBRxs6
 2Sim5fNTcexaoHbySp6ezjFB5NHhdoqWL233APFTrbdQp4Z/uFDUcOk4bb2WFFTRcYxC
 8SPUMJ2nrm2cTF1jmnbcLxML4orAROmR+fPOWSqgUCFR4nR4ofS24rXKii8mJg9nSK0t
 uPpYxZrpfg5VaKzLzQxcrSDVF8/pPCb0TqkJvyKcO+UErMaYiiZYtProxgHphOoo8S4V
 fjyBHBbLWv/n9n3S1/HXbAQe315pWzlHFEXUwNfIs4NAO9Rp7AUBHQDv+r/J5oOZaXRv
 +Fzw==
X-Gm-Message-State: ANhLgQ31h7sXIe5X2bxGWELAmlSy0sR0/iYJhVuXIAKpvDA9l1Tdfmph
 LCOAKiwncRagKja8P+G6/6/4QD9yJxHoTund7Bw=
X-Google-Smtp-Source: ADFU+vvCH5BmVxfLH5Lsgo06YaFz8cXJ4Ew5KtuIz1eSdJLbu86yn4cADJqPrChVHtpWYi3ypBWuWoz1w1lJOmB4knk=
X-Received: by 2002:a17:902:5acb:: with SMTP id
 g11mr317572plm.18.1585222725777; 
 Thu, 26 Mar 2020 04:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <1585161361-3408-1-git-send-email-alain.volmat@st.com>
 <1585161361-3408-3-git-send-email-alain.volmat@st.com>
 <CAHp75VdPCWdpGo=2n9g0ivti-g2m4jZ=cG4BKHBLk8BVDzaCyg@mail.gmail.com>
 <20200326101219.GA21190@gnbcxd0016.gnb.st.com>
In-Reply-To: <20200326101219.GA21190@gnbcxd0016.gnb.st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 26 Mar 2020 13:38:38 +0200
Message-ID: <CAHp75Vc896RpnrX6+yb0LfXVroLJO5XX6Gt5V4BJZjdFYOXYnQ@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Wolfram Sang <wsa@the-dreams.de>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre TORGUE <alexandre.torgue@st.com>,
 linux-i2c <linux-i2c@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] i2c: i2c-stm32f7: allows for any bus
	frequency
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

On Thu, Mar 26, 2020 at 12:12 PM Alain Volmat <alain.volmat@st.com> wrote:
> On Wed, Mar 25, 2020 at 06:53:45PM +0000, Andy Shevchenko wrote:
> > On Wed, Mar 25, 2020 at 8:38 PM Alain Volmat <alain.volmat@st.com> wrote:

...

> > > +       int i;
> > > +
> > > +       for (i = ARRAY_SIZE(i2c_specs) - 1; i >= 0; i--)
> >
> >
> > Perhaps
> >
> >        int i = ARRAY_SIZE(i2c_specs);
> >
> >        while(i--)
> >
> > ?
>
> I propose the following code to make it a bit easier to read/understand:
>
> static u32 get_lower_rate(u32 rate)
> {
>         int i = ARRAY_SIZE(i2c_specs);
>
>         while (i--)
>                 if (i2c_specs[i].rate < rate)
>                         break;
>
>         return i2c_specs[i].rate;
> }
>
> If you agree with that I'll push a v2.

No objections.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
