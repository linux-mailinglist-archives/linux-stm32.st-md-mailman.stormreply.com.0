Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 566212026E0
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Jun 2020 23:33:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D4E1C36B0C;
	Sat, 20 Jun 2020 21:33:07 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0182BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jun 2020 21:33:05 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y11so15303279ljm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jun 2020 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XMLLcSh0FlLbcDXmFaO9BURwcvJCFIp9+2dM/IBT/Z8=;
 b=fM4jBfoJ8l2d8ZgUkqeYaPu66l91KZ+pIQwrkEHS4iDVaScL1olYwKtzFsLv7tD6nc
 U5k2wV+U0eGTAME55rsSEefFLQbDFZoLdJWUSbEFQ6t2b9dMa5pThSZpU6CpmQhaAA6x
 wZQhubqxLH+t28SzlysCuddi8WW516Qro+ktfIHpZpNZO6upfyub7jvC1rh4j1dzn3kN
 r5s0jtTEv2e77Tzt4Z8dZ4ZvsjOeJF8+gJsFz2nwuIyW2DkeeOkQKMcGAsbiACdNNct8
 xXLJO8p/SzLJuWgd1BIvAcPLaFclUaxFY/oF3V6ZsY1n6ODXPpOTgsHK/601jY9P/XqC
 NDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XMLLcSh0FlLbcDXmFaO9BURwcvJCFIp9+2dM/IBT/Z8=;
 b=A7qZrr81JYk9+NSRRrrgRSo386HhbDEd0Tg73oXdCnFCMLogWvwNmxzbpVTNlK6LWa
 jywkOpngNUXD9Mf/AUTW8hwaeN+dC1m8JD8r4JZCRWoZaU40+lHnwv/z+v0TjAZ6Wo1D
 dFdTxVijeVgc7QchjU61TF13IbRtW5fjGaBbShPcdKP9HWy2J8Fk5lvj2KLdOthDn4Kq
 DOKO9ID+HfkCKF5s1lg8VlW/tMDfVHzWBSeggk5A6LX/fg82K61QMWk4B2VEkWcZMCy5
 ysFLD9qg/1vzx53omftX2QT4ZBN9dUDp4FxaHMlRHEbZGc+83zX2vJAS2OOANcBhxKL2
 X6Aw==
X-Gm-Message-State: AOAM5305Mvft0IlauMHWOWeBQH5zNObFwo6kYW83H8eAZ6F1NyCDKk3u
 yX6SSSAbCi4ENoKcLA8X4FEnrXOTXCjQu6sRU68BGA==
X-Google-Smtp-Source: ABdhPJyc/rKcuZI7IzUgOFsdvhotZrQBegRWHGiFD7Jo5zA51VgOf9AQa+SOJTDLDml/A2XI/RqRiyXvUzFabtKoFAk=
X-Received: by 2002:a2e:351a:: with SMTP id z26mr4816556ljz.144.1592688785302; 
 Sat, 20 Jun 2020 14:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
 <20200520085142.GD271301@dell>
In-Reply-To: <20200520085142.GD271301@dell>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 20 Jun 2020 23:32:54 +0200
Message-ID: <CACRpkdYry6=iJ8hpy+pS9hFuBJD5Cf1ZKJwCkCBZPGW4rGa86Q@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.co>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mfd: Convert stmfx
	bindings to json-schema
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

On Wed, May 20, 2020 at 10:51 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 20 Feb 2020, Benjamin Gaignard wrote:
>
> > Convert stmfx bindings to json-schema
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > ---
> >  .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
> >  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>
> >  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
>
> Linus, anything from you?

Looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
