Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F623039A8
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 10:58:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F54FC57182;
	Tue, 26 Jan 2021 09:58:50 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECB46C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 09:58:48 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id n18so8693787vsa.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 01:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l2QpuY8rM4toyVpou9vFx2TY09PAPQwcRntc7oTA0is=;
 b=REheRH86QOMZ/fp5spJI+HYISUR+or1vKvxmyLai8utojsCRMMqRZNCOUCtr9iDzzT
 XKCjgZykN3eQ+Yd4tWF8Nx84mDqCcPaAX51DnmV1EQb0s+BU7FQ4/dGwbq8Hjyx4lb8X
 1bz23M3gWrmtbp0qNqGFhbDKnqcf/r4Nv8yHm996ztOvPdgDCz+F3cpsXgpcSvwX9/BB
 5M1Ld2sSZPlcwZEZgnauow/fO1i+zZ2dRrWkLhVtJm6FyvYm7Mzu7FdKu0qA41KQHY+c
 5mtgGQP6aqes5Uoo/O6YvxTu2aLRM9Al9fxuL8529+GWQY26Y2Za0GGLeltGrnjt6kff
 l6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l2QpuY8rM4toyVpou9vFx2TY09PAPQwcRntc7oTA0is=;
 b=mK8R1CnpdU2qhLNc9Yzpd/JKqeYzDV6892v5rVopqIB9lXjSKAqjyVT64uiPMtvL7w
 FvFKK3GVEiFwQvG9zVTHHS75bEfKwKGe2BTVvxrZluPcPcPDEe9FeMNUz3DKkw7NXNhT
 2f3X0CjGCt965wf4m/oZmmDTMLetGEZpgVTX5fyf++93q+pLAXWPChJYPdjcB6Eh7AyG
 em+wrAQ+Qqk7AqudgN9Nr5FULRF2cbt6Mc/I7BYnHVPdb4+jtexz/9T7o7DVtpMs6Z4G
 GgbhUpMewwKmD93dtGa9mbCc0Qsts7aeFiNdbaTXqobJH9HMKGzq2DKKqxfZ4Q92mgtO
 /dNQ==
X-Gm-Message-State: AOAM5304uCyT2lGLGcnP6pAljDEndn1ZrrGlfQJ/XbvmqF6EArzCrCA7
 0MbZy6vhPqhaPvrJaEAX4MLQQUNZnwUzrwAsHJS+dw==
X-Google-Smtp-Source: ABdhPJyTySMXS2eZMh5eS03L32cNf15ToE5AvKZz7eICs1uJdhhGYno+oad4aRW7fF20tSBBSv54Xp63sFrSLCAF2oM=
X-Received: by 2002:a67:f997:: with SMTP id b23mr3471696vsq.34.1611655127850; 
 Tue, 26 Jan 2021 01:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20210124170258.32862-1-marex@denx.de>
In-Reply-To: <20210124170258.32862-1-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Jan 2021 10:58:11 +0100
Message-ID: <CAPDyKFrUnx4XSyxx=H8reDV=_vRORe7fE=6HQivC9T7OkHfyRg@mail.gmail.com>
To: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>
Cc: DTML <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 1/4] mmc: mmci: Add bindings to operate
 CMD, CK, CKIN pins as GPIO
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

On Sun, 24 Jan 2021 at 18:03, Marek Vasut <marex@denx.de> wrote:
>
> Add DT bindings to describe GPIO line associated with CMD, CK, CKIN pins.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: devicetree@vger.kernel.org

Applied for next, thanks!

Kind regards
Uffe


> ---
> V2: Rebase on next-20210122
> ---
>  .../devicetree/bindings/mmc/arm,pl18x.yaml    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index eddc1f6bdbe5..47595cb483be 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -127,6 +127,26 @@ properties:
>        driver to sample the receive data (for example with a voltage switch
>        transceiver).
>
> +  st,cmd-gpios:
> +    maxItems: 1
> +    description:
> +      The GPIO matching the CMD pin.
> +
> +  st,ck-gpios:
> +    maxItems: 1
> +    description:
> +      The GPIO matching the CK pin.
> +
> +  st,ckin-gpios:
> +    maxItems: 1
> +    description:
> +      The GPIO matching the CKIN pin.
> +
> +dependencies:
> +  st,cmd-gpios: [ "st,use-ckin" ]
> +  st,ck-gpios: [ "st,use-ckin" ]
> +  st,ckin-gpios: [ "st,use-ckin" ]
> +
>  unevaluatedProperties: false
>
>  required:
> --
> 2.29.2
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
