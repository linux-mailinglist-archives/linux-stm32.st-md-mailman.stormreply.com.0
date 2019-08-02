Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D6802B7
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Aug 2019 00:31:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 779D7C35E04;
	Fri,  2 Aug 2019 22:31:29 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BF47C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 22:31:28 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b17so53996885lff.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2019 15:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8tQh191xW5z/uqwcXTQaR6iRlPu4dlS4JjUPIzXI1i0=;
 b=L0evPFMisUlfcr0ejK8sxz3FR7curgkYcXNQl3aE8Ndyo6Zm2gmWpA/JzsTVoihGhw
 5EWCzMH8dJbIdO1VXDSeK4S7EczFoV0sHOraDsX4ap9t9qaaHuD0ePuJc1eAHsLsr1YQ
 93BJ8OPQo7AMtWpR1+drmfGGbZarfaW6MBebCodaismcPLqwfsmajV/wb30d7Gf9czUp
 I+H4GL3RuxEU3PZjX2tgCZWhqug0csI/AbnfHt23mFD2x/rk8o2RROuPF/BesU+faH3L
 UBBl/diHpYUBcbJvSpH6gin/E/MeAvwEW3Sp9OZoqR+PXIHTtSL7SpfS63Aehyic2Bu2
 9gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8tQh191xW5z/uqwcXTQaR6iRlPu4dlS4JjUPIzXI1i0=;
 b=R8TefJgT9zl1J/tKVcH3H4jrCD5wb1v+qbxOtsS+r5oW8chkFTjRcTuZpHq/DOcHzv
 +jl0wQHB3JL4agFQT8a7VJFjA6TgM2PCWrrBSbbSnfSxCIPPD50dwnIYwuM4azeB4a8O
 uBtqfZRMGIt3VnFHyJNy6yOMQ5snHnDWJfiMKX2LN6hPdyZTwpTB55eOifplrXi7F/vW
 FZ0gCQzPdSHnovrYzyyIwHeE9E7vAIqhkP211HEn3rIMnlrdWPRWBZVDKjgmTyeMdjRj
 1ZiKufIXllICj5U6nWuBc0/FN8xpXYRt1Vdqz1GlhKu4Lz2wu4J5S7pAQAoQrF0Xfbw/
 wTow==
X-Gm-Message-State: APjAAAWE5cLUG+QPaZ36GaMty/4Q1lYTGUHwgnCXrNZEYRVtL4cGq6Zt
 gjW9ApprM/YJgSUlz90YmqItc7yNKydrso88Fq5uiQ==
X-Google-Smtp-Source: APXvYqwDIwDheD+gFq+O5TZV6dJSFLuMVgoQGjhj+lZ8eLAYET/6IhmSX9+fvFrFVscVAgKHzz0hjQPV7iYVurKwj74=
X-Received: by 2002:a19:7616:: with SMTP id c22mr1677508lff.115.1564785087648; 
 Fri, 02 Aug 2019 15:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190716215618.29757-1-robh@kernel.org>
In-Reply-To: <20190716215618.29757-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 3 Aug 2019 00:31:16 +0200
Message-ID: <CACRpkdYsYH_z55+OeHzAp9bjj+0WrnH8LoXcEahVcX=in6TTEQ@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: stm32: Fix missing
 'clocks' property in examples
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

On Tue, Jul 16, 2019 at 11:56 PM Rob Herring <robh@kernel.org> wrote:

> Now that examples are validated against the DT schema, an error with
> required 'clocks' property missing is exposed:
>
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@40020000: gpio@0: 'clocks' is a required property
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@50020000: gpio@1000: 'clocks' is a required property
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@50020000: gpio@2000: 'clocks' is a required property
>
> Add the missing 'clocks' properties to the examples to fix the errors.
>
> Fixes: 2c9239c125f0 ("dt-bindings: pinctrl: Convert stm32 pinctrl bindings to json-schema")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Rob Herring <robh@kernel.org>

This seems to already be upstream, but I have no memory of applying it.
Less work for me :)

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
