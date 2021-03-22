Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A3D344021
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 12:48:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAE72C57B5E;
	Mon, 22 Mar 2021 11:48:45 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A07FAC5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 11:48:44 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id n21so13538263ioa.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 04:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wyt0l5oKA1RNn55G7F/1OYk1XowasbjdBJAi3unCvdk=;
 b=nQMxbVhwYlbETH/czbc83Qy5xAFLGJLH3Vo6iP+k653Or1hpIct+QeDqnVGR00gR0p
 3lSMNW11Z102gbZhHrmsSEjGALOyZZsKukdK5zdrAhPF0rV+FxIRojTCKInHh8vokZYr
 l5pQovLFDF+03LzkK5NMXQNWeTD/hcfGtDT383MblG9X0gwp+4aDAqbWtdS61/mXsOKV
 nakNVRemI0g3MLPA1kzuoZ1/1dx3VHX/QkHgIsq16s1+es+Ggr5cDbsO7e5WwGJfAIgd
 teBEQSIueRdXSow1IRp/1REehmyRzTO2cjp832Sd/IH++xrhhyvPct/zHnAe7GyZgaZU
 UDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wyt0l5oKA1RNn55G7F/1OYk1XowasbjdBJAi3unCvdk=;
 b=bwjpBc6B9rQOVFPPtMUuHyQTs3tmEtQ9ufBasXutzuou9zU0X/ClfZ8MgGjZqBAN/n
 4Y8GYpSzZUYvzlROObPRDzQA4lBH/v69f3JJAFuYOYGyJenw5qnhM9JTJ2pS/en8n8xn
 IR1tI0RxmCF6SWuNnlYe6CgIeeAU3gU+tgMvJCLLlntmMxsP64sgm3iUYkrc69o3Dq9P
 a52cP7TxT5wzQ67MCSdIwcROJvcku5erDptydpNyVujiBXr8UWGZohzpJB3eXYDBOUQb
 E9Uyyxwg3w/yKjqTd4EEwbqEIiQ0XPdbYub2n46hI/2d0z99OVpMscvvM+8dYz0FZIMn
 SR1w==
X-Gm-Message-State: AOAM530TFscFmLGRNKVEGfM1+Xk9dlUrMJroE9tIstRH3cDych2KARWQ
 /0R1jmcA1I1Fxov9slbbtgMU8SNgYkf1Lw5lc3A=
X-Google-Smtp-Source: ABdhPJzzRxh6vRkud9pux4kVjb8zSKHOU/4RPPGupEarXMhvkeYwfo0hLlTtioZQcjOnyPyDbhKNMkUeAuwejnar8D8=
X-Received: by 2002:a02:3085:: with SMTP id
 q127mr10661879jaq.137.1616413723386; 
 Mon, 22 Mar 2021 04:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
 <1616205383-24114-8-git-send-email-dillon.minfei@gmail.com>
 <5f95b6ad-ddbe-8394-8599-e78f30c8b62c@foss.st.com>
In-Reply-To: <5f95b6ad-ddbe-8394-8599-e78f30c8b62c@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 22 Mar 2021 19:48:07 +0800
Message-ID: <CAL9mu0LcwRcr+YOuDcLzqxDVCTUajDNnM9SQTkkKCt-J7BX75Q@mail.gmail.com>
To: Valentin CARON - foss <valentin.caron@foss.st.com>, 
 Alexandre TORGUE <Alexandre.torgue@foss.st.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "vladimir.murzin@arm.com" <vladimir.murzin@arm.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "rong.a.chen@intel.com" <rong.a.chen@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "afzal.mohd.ma@gmail.com" <afzal.mohd.ma@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "lkp@intel.com" <lkp@intel.com>
Subject: Re: [Linux-stm32] [PATCH v4 9/9] dt-bindings: serial: stm32: Use
 'unevaluatedProperties' instead of 'additionalProperties'
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

Hi Valentin,
Thanks for feedback.

On Mon, Mar 22, 2021 at 7:05 PM Valentin CARON - foss
<valentin.caron@foss.st.com> wrote:
>
> Hi Dillon,
>
> It works for me.
>
> On 3/20/21 2:56 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > To use additional properties 'bluetooth', need use unevaluatedProperties
> > to fix dtbs_check warnings.
> >
> > 'arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800: 'bluetooth'
> > does not match any of the regexes: 'pinctrl-[0-9]+'
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: af1c2d81695b ("dt-bindings: serial: Convert STM32 UART to json-schema")
>
> You can add my:
> Tested-by: Valentin Caron <valentin.caron@foss.st.com>
Sure. I will add it to next submit.
>
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >
> > v4:
> > - add Reported-by and Fixes tag
> > - use unevaluatedProperties: false to fix dtbs_check warrnings instead of
> >    add 'bluetooth' in st,stm32-uart.yaml
> >
> >   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > index 8631678283f9..305941b1d5a0 100644
> > --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > @@ -80,7 +80,7 @@ required:
> >     - interrupts
> >     - clocks
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
> >
> >   examples:
> >     - |
>
> Regards,
> Valentin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
