Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E28031CF204
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 11:59:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9478CC35E3E;
	Tue, 12 May 2020 09:59:05 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69B05C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 09:59:02 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v5so5944661lfp.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXd5QHwJ1tPi5716Xcmxn3FGS3giieue5uSgZlXtiWg=;
 b=eF4UZfPdwxY2kcJ3SbBcXESksctSLMe0oyp3Dqb6rpox9rfOdE5TWSXlhLeZ7WVuJu
 K9EZyurUt4GoHXQGQJ/s/OIEAI31LdtzoB4OLI3c504mIW9b3C07x0rNyN/WpEEkui5z
 VayR7QZBrGhhSxZ7mnv/UaXebyvcd/obTk6ROY/uR8l1vWjvlXye4pt4sY7vBX1vTxHl
 lQlCW8H2SUcm6avA6W8stsSGIosReXoSyNmTLwiN8IH+JEk8cfxsp0MNEE4UFeELbKri
 KVXEW3tiDJ6y1cjGXzsEfdg4CZr29OfRHfERGPeFut8XyeYZP8PWMVEK0wlzjsF6ZOtf
 WWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXd5QHwJ1tPi5716Xcmxn3FGS3giieue5uSgZlXtiWg=;
 b=rYjbpksz19XHeDkbKwUndxbZ8l2Jw9S4ys3XiUQlZd3qmJ1fw3fVdduUFJ9MErEiuz
 1QUPT862KKkbSxASkWK2CBHLKSaqPUu9kIbarfIeKlICF3f98r3JzWk1kXR0Wpitck60
 epn6sT08csAbFlMVaUsU/PbMbpgWGE1PSJ4bmHVZCpO4caqfVCaHoXxgUOKPUt1sJV1B
 XPAXk/HZhJdJIgiBwj1jouMxFCHDS/0rjoMcyGfOxMS+UqRRpoogrO5EgeVUh5HPd0WJ
 54ZGMu7ueO4pLNl1S2Bogf5uPHVs81wAk1tpzWdWaAxX0+Zc5++kXEu0MV0sz0E0S6sZ
 Lm7g==
X-Gm-Message-State: AOAM533eo74iYBJXlIVIIbQXFYRIvqTk59ZjJY7WqDJ2viTiWCEQZIwA
 6GPU9WRd0no9hZCWEuqebWh7EpYRvDKowCSCHaQJ7g==
X-Google-Smtp-Source: ABdhPJyBq7To18Sh0+GIDcFRF81NKkhoFYKeSr+78ZnK/tfcB+M6Xqf+HgiWU5Chhbq4xITdhpfrF18M/MgtiTWvtZ0=
X-Received: by 2002:ac2:555b:: with SMTP id l27mr14203108lfk.170.1589277541973; 
 Tue, 12 May 2020 02:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200508134527.26555-1-etienne.carriere@linaro.org>
 <CAL_JsqJVaWDYZWwRwotSQyaL5bOugM3judxipS9oKveV3FdK8w@mail.gmail.com>
In-Reply-To: <CAL_JsqJVaWDYZWwRwotSQyaL5bOugM3judxipS9oKveV3FdK8w@mail.gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 12 May 2020 11:58:50 +0200
Message-ID: <CAN5uoS8GzbFyQq=kjZuxNwBDJ8cn9q-sq8C=VLN5UWWD0HXWaA@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: stm32: new property
	for data access
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

Hello Rob,


On Tue, 12 May 2020 at 03:51, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, May 8, 2020 at 8:47 AM Etienne Carriere
> <etienne.carriere@linaro.org> wrote:
> >
> > From: Etienne Carriere <etienne.carriere@st.com>
> >
> > Introduce boolean property st,non-secure-otp for OTP data located
> > in a factory programmed area that only secure firmware can access
> > by default and that shall be reachable from the non-secure world.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> > ---
> >  .../bindings/nvmem/st,stm32-romem.yaml          | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> > index d84deb4774a4..c11c99f085d7 100644
> > --- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> > @@ -24,6 +24,18 @@ properties:
> >        - st,stm32f4-otp
> >        - st,stm32mp15-bsec
> >
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":
> > +    type: object
> > +
> > +    properties:
> > +      st,non-secure-otp:
> > +        description: |
> > +          This property explicits a factory programmed area that both secure
> > +          and non-secure worlds can access. It is needed when, by default, the
> > +          related area can only be reached by the secure world.
> > +        type: boolean
> > +
> >  required:
> >    - "#address-cells"
> >    - "#size-cells"
> > @@ -41,6 +53,11 @@ examples:
> >        calib@22c {
> >          reg = <0x22c 0x2>;
> >        };
> > +
> > +      mac_addr@e4 {
> > +        reg = <0xe4 0x8>;
> > +        st,non-secure-otp;
>
> This fails validation. You need to drop 'additionalProperties' in nvmem.yaml.

My apologies. I guess I did not test `dt_binding_check` on this change.
I'll send a v2.

Regards,
Etienne

>
> Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
