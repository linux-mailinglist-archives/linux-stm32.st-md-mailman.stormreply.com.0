Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D95F22AC
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2019 00:33:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40DB6C36B0B;
	Wed,  6 Nov 2019 23:33:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D035C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 23:33:20 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76F6021D7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 23:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573083198;
 bh=kXuPSKl+d3N16AWU48reQZ1zuDSoKWcH8SnXbdsyG1Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jtHyhFkWE3pKHvdd83jG7hT7NyR376eTuEr9ERzYU/cLPUMq8jfmu4Pc3AwMwAOfA
 Ta5bhoJh9cqN3cZVa6vzhyOfspGH5C9cbvPH9vfe7rCAYdmt5ayL69+QublnfxuRyj
 LKVoZnM3aCaTH+YQzn0GMYdakODsvG+TlLgH+QUU=
Received: by mail-qv1-f54.google.com with SMTP id w11so72257qvu.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Nov 2019 15:33:18 -0800 (PST)
X-Gm-Message-State: APjAAAVLyaNTk++TAYlJnh0kgtw7bx9EnF2E3x0crrPVK4QlsFB+lujK
 P6nbrBeRZFORiInvJqf63EJfFk3v1p57OBeSiA==
X-Google-Smtp-Source: APXvYqyC3A2flD/nPROb9ThjRdJKDCsiLA48Ab5fS1yM/Zg798U/Sn7jNMdhWcJ4s8JZjQWG/fXn9qcpyqj9go+/rgA=
X-Received: by 2002:a0c:ca06:: with SMTP id c6mr490409qvk.136.1573083197450;
 Wed, 06 Nov 2019 15:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20191031123040.26316-1-benjamin.gaignard@st.com>
 <20191031123040.26316-5-benjamin.gaignard@st.com>
 <20191106041518.GC5294@bogus>
 <41c43d09-9371-8b23-a3dd-e43f5df5c5bc@st.com>
In-Reply-To: <41c43d09-9371-8b23-a3dd-e43f5df5c5bc@st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2019 17:33:05 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+eFew_8ULDOwL5GXUDxLRB9e+b+ZsMdWLKUO8i9Lk7AQ@mail.gmail.com>
Message-ID: <CAL_Jsq+eFew_8ULDOwL5GXUDxLRB9e+b+ZsMdWLKUO8i9Lk7AQ@mail.gmail.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 4/4] dt-bindings: mfd: Convert stm32
	timers bindings to json-schema
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

On Wed, Nov 6, 2019 at 1:57 PM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
> On 11/6/19 5:15 AM, Rob Herring wrote:
> > On Thu, Oct 31, 2019 at 01:30:40PM +0100, Benjamin Gaignard wrote:
> >> Convert the STM32 timers binding to DT schema format using json-schema
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> >> ---
> >>   .../devicetree/bindings/mfd/st,stm32-timers.yaml   | 91 ++++++++++++++++++++++
> >>   .../devicetree/bindings/mfd/stm32-timers.txt       | 73 -----------------
> >>   2 files changed, 91 insertions(+), 73 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> >>   delete mode 100644 Documentation/devicetree/bindings/mfd/stm32-timers.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> >> new file mode 100644
> >> index 000000000000..3f0a65fb2bc0
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> >> @@ -0,0 +1,91 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: STMicroelectronics STM32 Timers bindings
> >> +
> >> +description: |
> >> +  This hardware block provides 3 types of timer along with PWM functionality: \
> > Don't need the \
> ok
> >
> >> +    - advanced-control timers consist of a 16-bit auto-reload counter driven by a programmable \
> >> +      prescaler, break input feature, PWM outputs and complementary PWM ouputs channels. \
> >> +    - general-purpose timers consist of a 16-bit or 32-bit auto-reload counter driven by a \
> >> +      programmable prescaler and PWM outputs.\
> >> +    - basic timers consist of a 16-bit auto-reload counter driven by a programmable prescaler.
> >> +
> >> +maintainers:
> >> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> >> +  - Fabrice Gasnier <fabrice.gasnier@st.com>
> >> +
> >> +allOf:
> >> +  - $ref: "../pwm/st,stm32-pwm.yaml#"
> >> +  - $ref: "../iio/timer/st,stm32-timer-trigger.yaml#"
> >> +  - $ref: "../counter/st,stm32-timer-cnt.yaml#"
> > This works, but I prefer the child node names be listed under properties
> > here with a ref:
> >
> > counter:
> >    $ref: "../counter/st,stm32-timer-cnt.yaml#"
> If I wrote everything in one file I guess what won't be needed anymore
> >
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: st,stm32-timers
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: int
> >> +
> >> +  reset:
> >> +    maxItems: 1
> >> +
> >> +  dmas: true
> > How many?
>
> from 0 up to 8, but I don't know the syntax for that. minItems = 0 isn't
> accepted.
>
> Any hints for me ?

0 is not accepted because the property is never 0 items. 0 is not
present. So just:

minItems: 1
maxItems: 8


> >> +
> >> +  dma-names: true
> > What are the names?
>
> it could be ch1 ... ch8, "trig" or "up" in any order.

Why does it need to be in any order? Normally we don't want to have that.

>
> Again I haven't be able to find a syntax that allow to list the names
> and use them in any orders.

dma-names:
  items:
    enum: [ ch1, ch2, ..., trig, up ]

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
