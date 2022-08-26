Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC05A20E5
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 08:32:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7156C640FD;
	Fri, 26 Aug 2022 06:32:53 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E190C640FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 06:32:52 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id s6so750593lfo.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 23:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+qU9ctcrY7mtJ7WOAIohkf0A848XGp2YRevCX8i4gts=;
 b=C7HaYeqFpX0lS9ll1R6ZCwBkm8QpDYZfuNWeuq8t0XEvQUmiGWlAwZ92EXwJeoD4J+
 HhrTOmbUp2lx/PBx34u5s9RtG5xGwYCqitwzWsE9tNWsKG4h4D9o4WCojuyM8IRP0AvA
 2Q3oTSAcRaBDuC05Vpm59LuL+Js5fRXqt+8lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+qU9ctcrY7mtJ7WOAIohkf0A848XGp2YRevCX8i4gts=;
 b=DR9TbTnZ5yGQ/gvY1vm8zZL/D5ciyJ8hjCCTghYzjcL0eTF6k88MyR9osZ13rBnGJM
 sOwEVbDI5YZDkP1je8vlw3gJaPVDbOu0POCghTa3+aUc1+jilJpTB2s0UUVqUtJVrhb/
 h4ecm5S7FSmO/nonN9XzEKPSvffBVqiKipPSfWFuk2LIjK9+QTYWtaroURKzqs7kJjaF
 HhCyyfmM2CSPlfoNLQYnnbi7R/fGmEFjyH7xZW4IhNzZ0+aRPmZdAjax7wIgKo7VPO3P
 yGKRFE646LfucxLVzYkwXulx25eY3HLoOU5YWt1HXOxbrwksHBkMBX5SWfwsY7e7k8Lp
 YwUg==
X-Gm-Message-State: ACgBeo2kolv+euEhXlLR/wbjysQ3/62ZCPi+XfdfLVvn3GMONDFuAu6p
 tsV3wG/ZMQK3FJ3wOKup51uCimD+wKmZl2ZTmk0MIw==
X-Google-Smtp-Source: AA6agR6XzaZ+tjS2B38+xX/5fv3zVFoMbmEjVYn3rbhESLg5eHnuuhXweWowUZRe3isFIyyq67NglnbcGPdP3p8ht3c=
X-Received: by 2002:a05:6512:1694:b0:48a:9d45:763f with SMTP id
 bu20-20020a056512169400b0048a9d45763fmr1987125lfb.662.1661495571621; Thu, 25
 Aug 2022 23:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
 <20220820082936.686924-4-dario.binacchi@amarulasolutions.com>
 <c74b4464-ec28-eff6-86e2-2b0e5e9e992b@linaro.org>
In-Reply-To: <c74b4464-ec28-eff6-86e2-2b0e5e9e992b@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Aug 2022 08:32:40 +0200
Message-ID: <CABGWkvryfr84eZyQzB4Cf17kBBNBRGRi3TxK24tesq=k56_uQw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: Re: [Linux-stm32] [RFC PATCH v2 3/4] ARM: dts: stm32: add pin map
 for CAN controller on stm32f4
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

Hi Krzysztof,

On Tue, Aug 23, 2022 at 3:43 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/08/2022 11:29, Dario Binacchi wrote:
> > Add pin configurations for using CAN controller on stm32f469-disco
> > board. They are located on the Arduino compatible connector CN5 (CAN1)
> > and on the extension connector CN12 (CAN2).
> >
> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> Do not ignore review. This is not correct. You are mixing copyright with
> SoC...

OK. I got it. I will drop one SOB in version 3.

>
> >
>
>
> > +                     can2_pins_b: can2-1 {
> > +                             pins1 {
> > +                                     pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
> > +                             };
> > +                             pins2 {
> > +                                     pinmux = <STM32_PINMUX('B', 12, AF9)>; /* CAN2_RX */
> > +                                     bias-pull-up;
> > +                             };
> > +                     };
> > +
>
> Don't ignore review.

Sorry, I didn't want to ignore your review, I thought the blank line
to be removed was another.
Actually I had to remove two blank lines and I left out the one you suggested.

Thanks and regards,
Dario

>
> That's second one, so that's a no.. :(


>
> Best regards,
> Krzysztof



-- 

Dario Binacchi

Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
