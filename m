Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8405D5A871C
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 21:57:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B3AAC03FDB;
	Wed, 31 Aug 2022 19:57:21 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F3A6C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 19:57:19 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id cu2so30609621ejb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3/C402UrLcFdr+55UasuTaaa+TRTdcGT9j3EBVa3jV4=;
 b=4U2aNm2Bzl6sWFxYmpkLatmR/VIT9M4TC1wx0Hz6KqTkVCAaqUdhJHrXDM2HUeISWU
 1gj3skkD3jlLf9mYWNLSCbFU5iqJnZUEzJRPLeBqgrWLPfK3DdFHW4F+uXR7U2I+h6Iq
 LitD5cgW2roRNHIEh8XLMWtQ/h8iXF+zWOuHcYLxTMTT1Sa9Sf0eLeD2czf+5ijLTb3S
 swZ2PvazSBanHogOiTiupHKA5oTBim4W05sNNoz0PS5RRM0lh1QI6rDxkjo73fQfdjW3
 tTaXih8CgMoJ5VZwTjcjfyo0FsfiKKIgv90cljRY1FlGuaavwP93wqgZ/FfBX3lJhfyL
 rZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3/C402UrLcFdr+55UasuTaaa+TRTdcGT9j3EBVa3jV4=;
 b=JYEu+puUIFxw/YWtmeZu8bVRqHe1y8a7rPC7zFoQXLrBrlabU2lyW/UYOHSb/AAdZ0
 eVJbB4WHiW2Z99zNoOj8Vz7/ytjEnOvOteGWB3RBX8fuqF5VRMu84vpm3BFg2SJMzooP
 Rc3CyNmNIrMf2w09g/uLCZP8HnYVUJefjA2HvAOAjlrqH6WyktPE70vx9uz+TuwMZ4G8
 ipsmuKSZzr4UCRGrB0sSEnuioILU9CYN84ZAX7ICVV19Kn0Zzwwzq4VCmq1/A76f4ioz
 CU0RlGZbRNX3Xq/+0KUJtyVsfIctIT1asb4x+U9IthbvIIyrVZHxcgQ5wifhRxTNWvVP
 DWDw==
X-Gm-Message-State: ACgBeo2SePhqa27EEnLVF4yuU4r+6G4aTVJA7RrsMFBO866tHdw0F+Tp
 CLaFoUVFJB4GFcDspozQewAAOdCJeSM3DpZO+5P30w==
X-Google-Smtp-Source: AA6agR4eCcEmRzF3NJLEVzxJ5LTDTqeQtu9d8ExuzstxWQae7oIVIV99F7ZjR94wAkhLZw8SM3jUdy/xwxuuxtIc+dk=
X-Received: by 2002:a17:907:1c87:b0:741:8199:a59d with SMTP id
 nb7-20020a1709071c8700b007418199a59dmr11832796ejc.736.1661975839012; Wed, 31
 Aug 2022 12:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-4-francesco.dolcini@toradex.com>
 <20220809134836.GB44926@francesco-nb.int.toradex.com>
In-Reply-To: <20220809134836.GB44926@francesco-nb.int.toradex.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 Aug 2022 21:57:08 +0200
Message-ID: <CAMRc=McqfBSb+ZoD_WT-rWBqxqTCpogKUhO2uJr2R8dctTA1CA@mail.gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux Input <linux-input@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: gpio: stmpe: Remove
	node name requirement
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

On Tue, Aug 9, 2022 at 3:48 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
>
> Hello Bartosz, can you pick this? Patches 1 and 2 were applied to MFD
> tree.
>
> On Tue, Jul 12, 2022 at 06:33:43PM +0200, Francesco Dolcini wrote:
> > STMPE driver does not require a specific node name anymore, only the
> > compatible is checked, update binding according to this.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio-stmpe.txt | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> > index a0e4cf885213..b33f8f02c0d7 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> > @@ -8,8 +8,7 @@ Optional properties:
> >   - st,norequest-mask: bitmask specifying which GPIOs should _not_ be requestable
> >     due to different usage (e.g. touch, keypad)
> >
> > -Node name must be stmpe_gpio and should be child node of stmpe node to which it
> > -belongs.
> > +Node should be child node of stmpe node to which it belongs.
> >
> >  Example:
> >       stmpe_gpio {
> > --
> > 2.25.1
> >
>

Sorry, I was off most of August and missed this one. Now applied.

Bart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
