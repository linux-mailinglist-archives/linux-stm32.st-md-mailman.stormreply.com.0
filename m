Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33382F0D8F
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 05:07:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E64EFC36B0B;
	Wed,  6 Nov 2019 04:07:02 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2B68C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 04:07:00 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l202so19759890oig.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2019 20:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=pbXWYeEjjc1tNeD8Va0Rn7W5q8WImyzirMTHLiEKYGY=;
 b=Uwi963sPD6oSzSehbgnyr9bC9FZp/SREynBnm/xwo4yG9RvR/SIL0vTo2UJ5F1o8aq
 NZMxU/omPLqJTsFppCqXnS/vELT9askzGrV71aVkkJApe21j1oYVpqf0tSt7aIKK4BWg
 dwdB88C4GiQpXVdhaLP+Ge4DXg1+PNb7IdeEx60jJ0JUWaoTwBgkETTxZ6QtzbdvQuDp
 d/dnwE5AhY/gDASYHBaJqDKeapidhgD7LDHFuBOCXJYK99YSMD14zAxya2rlEA/7Qc4w
 6XDk+gd0+Qjah4fr5FIAwrVeymAHIg3v3S/4JcjdydlyrRXB2Fy1ws7FwxnsXJoM7nvU
 Hcmw==
X-Gm-Message-State: APjAAAUNiudrbZeEjm03SnStwrNMj0SQttV07ysbB5RMNw3Ew8s9B7vr
 sISI2zo2KfFN58sLQygCmg==
X-Google-Smtp-Source: APXvYqwe0beNgeLE8gya+f9XdJ7ynxnQMAtyk6u+v0005b8KLbqtym2m20lGy9EYFxREtXyxePD27Q==
X-Received: by 2002:aca:f18b:: with SMTP id p133mr406122oih.22.1573013219216; 
 Tue, 05 Nov 2019 20:06:59 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k93sm6726958otc.30.2019.11.05.20.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 20:06:58 -0800 (PST)
Date: Tue, 5 Nov 2019 22:06:57 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Message-ID: <20191106040657.GA5294@bogus>
References: <20191031123040.26316-1-benjamin.gaignard@st.com>
 <20191031123040.26316-3-benjamin.gaignard@st.com>
 <20191103110841.3ad3ecfb@archlinux>
 <CA+M3ks5sZ6wwV-V+HCLC8OLdeLqrxK0Ga-pXTsdktQErbMOk4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+M3ks5sZ6wwV-V+HCLC8OLdeLqrxK0Ga-pXTsdktQErbMOk4g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Linux PWM List <linux-pwm@vger.kernel.org>, linux-iio@vger.kernel.org,
 Hartmut Knaack <knaack.h@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, u.kleine-koenig@pengutronix.de,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: iio: timer: Convert
 stm32 IIO trigger bindings to json-schema
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Nov 05, 2019 at 11:07:16AM +0100, Benjamin Gaignard wrote:
> Le dim. 3 nov. 2019 =E0 12:08, Jonathan Cameron <jic23@kernel.org> a =E9c=
rit :
> >
> > On Thu, 31 Oct 2019 13:30:38 +0100
> > Benjamin Gaignard <benjamin.gaignard@st.com> wrote:
> >
> > > Convert the STM32 IIO trigger binding to DT schema format using json-=
schema
> > >
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > I'm far from great on these as still haven't taken the time I should to=
 learn
> > the yaml syntax properly.  A few comments inline however based mostly o=
n this
> > doesn't quite look like other ones I've seen recently.
> >
> > Thanks,
> >
> > Jonathan
> >
> > > ---
> > >  .../bindings/iio/timer/st,stm32-timer-trigger.yaml | 44 ++++++++++++=
++++++++++
> > >  .../bindings/iio/timer/stm32-timer-trigger.txt     | 25 ------------
> > >  2 files changed, 44 insertions(+), 25 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/iio/timer/st,st=
m32-timer-trigger.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/iio/timer/stm32=
-timer-trigger.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/iio/timer/st,stm32-tim=
er-trigger.yaml b/Documentation/devicetree/bindings/iio/timer/st,stm32-time=
r-trigger.yaml
> > > new file mode 100644
> > > index 000000000000..1c8c8b55e8cd
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/timer/st,stm32-timer-trig=
ger.yaml
> > > @@ -0,0 +1,44 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/iio/timer/st,stm32-timer-trigger.=
yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: STMicroelectronics STM32 Timers IIO timer bindings
> > > +
> > > +maintainers:
> > > +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> > > +  - Fabrice Gasnier <fabrice.gasnier@st.com>
> > > +
> > > +properties:
> > > +  $nodemane:
> >
> > nodename?
> =

> That will be in v2

No, $nodename is correct. The '$' signifies something we generate and =

add in. IOW, not a real property. I guess we could have used 'name' here =

and stuck with traditional OpenFirmware.

> =

> >
> > > +    pattern: "^timer@[0-9]+$"
> > > +    type: object
> > > +
> > > +    description:
> > > +      must be a sub-node of an STM32 Timer device tree node
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        oneOf:
> >
> > enum is I think preferred for these.
> =

> as you like it will be in v2
> =

> >
> > > +          - const: st,stm32-timer-trigger
> > > +          - const: st,stm32h7-timer-trigger
> > > +
> > > +      reg: true
> >
> > Normally some info for what the reg value is..
> I can't put "description" on this field because the syntax doesn't allow =
it.
> I will add a comment in v2 to explain what reg is.

items:
  - maximum: <max timer number>

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
