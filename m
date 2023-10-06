Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E42EC7BB20F
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 09:18:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87EFFC6C836;
	Fri,  6 Oct 2023 07:18:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EBABC6B478
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 07:18:43 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2777a5e22b5so1432394a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Oct 2023 00:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696576721; x=1697181521;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EKpCyHWOeoDq3mhuWwEc3nzpzJID0E8GreD4OlWUF7Y=;
 b=j7ioWSZs3XxN7cmrtP5hhRs4SilD768nJI6egulWFPWNSC0VGYTinguVtyy+onuqm4
 ttRn1n+/YlXR+dWWfD95XtoACIPXaMgsduVlN7CPupA9UnU5kHv3a3ZN/xyT39BCF3wr
 H3qOhLKk6ev7T+zSmAuPEyp6QY4WxlhUb236ck0BkimHwRQiZUzxK7aiT65HVYCadKec
 nI+OmDLRIPtDYxkcvyze3T1Yavb8GfkmCCWYWmbzVWDXLDOJDOJFWsqNnNzMpwSK0vY1
 5QRVqkiZKlEMf7YVYkWSCp4FqjrHWT7do1aTr1nk3C8M0uHfEVAsNYsqNhXqh+hiXKgF
 Y0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696576721; x=1697181521;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EKpCyHWOeoDq3mhuWwEc3nzpzJID0E8GreD4OlWUF7Y=;
 b=wzsWm6GIiovRvdZa1U4505bnBklDwrDVwWvggmdDi9tWoXIUJptJgcsihAZrYvo1Za
 8qf69H2VuJQg1zYyxKeqebJxolT9DQnoSil1tqMUStP/XcVkVRmYKlAa0whgzCmZI40R
 JREuF+YdzmP3OzQc37+MEc/uIMXMsyc4BpQF3mbWbVIzw2xMYhxSUJL+p1TBRZd+5ssL
 CftXzAtWNZ3+MSZpA49j8HU0htsjnemF/P+JYT13kAffxo/+5tV8shDiOysLqV3ONiB2
 wRbtO4Ur+C+JpTDFYRoW1oUSH9lyJuUF4DAugFWV87SA4DkCISB1CfdGGS2Y60rbcDhF
 SMSA==
X-Gm-Message-State: AOJu0Yw3Z6SYwuUsrvKUKuKAiux6Icx6L8FRUkg+isGpHeaeNZDGIxVh
 +ywfWDzl2Kfo5Vu2I97K77beQSocllFlL3xPdN4=
X-Google-Smtp-Source: AGHT+IFKDAahXWKqY7tYZ0QihyHM/jksHYk53NNXue6zODq0zpstVmqGE3sjOong6uwzQRE15B2DebyDFq1LsPtCQ1c=
X-Received: by 2002:a17:90a:ce83:b0:26b:c3f:1503 with SMTP id
 g3-20020a17090ace8300b0026b0c3f1503mr7580409pju.17.1696576721568; Fri, 06 Oct
 2023 00:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230919083553.35981-1-eagle.alexander923@gmail.com>
 <20230919-98b276afdbc85d62815da0b9@fedora>
In-Reply-To: <20230919-98b276afdbc85d62815da0b9@fedora>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Fri, 6 Oct 2023 10:18:30 +0300
Message-ID: <CAP1tNvS8KsEjs_KhimD6X4CPe7vQ3LKikoz3yU3w2z7pKE9G0A@mail.gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: stm32: document
 MYD-YA151C-T development board
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

Hello.

I looked through the entire file and saw that the entries were
sorted by board name and by SOC part number within the board option.

> On Tue, Sep 19, 2023 at 11:35:52AM +0300, Alexander Shiyan wrote:
> > Add new entry for MYD-YA151C-T development board.
...
> > diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > index 4bf28e717a56..5252b9108ddc 100644
> > --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> > @@ -140,6 +140,11 @@ properties:
> >            - const: engicam,microgea-stm32mp1
> >            - const: st,stm32mp157
> >
> > +      - description: MyirTech MYD-YA15XC-T SoM based Boards
> > +        items:
> > +          - const: myir,myd-ya151c-t   # MYIR MYD-YA151C-T STM32MP151C
> > +          - const: st,stm32mp151
>
> It appears that this file is sorted by soc part number, which would put
> this entry now in the wrong location.
> With that changed,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
