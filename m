Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D1E572F6D
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jul 2022 09:44:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48A81C640FE;
	Wed, 13 Jul 2022 07:44:07 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF66DC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 07:44:05 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r6so12991611edd.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpXyhJ4QNFnL4f5EJCGYwB18DxuLMU3vuswmDUU/6LM=;
 b=dv3RBfCUzpoDhS6Aea9fT3Naw2N/mY3ENtgcsvmkZHsy0KNLqjQJD/v4UUGYYT65Bv
 L42ePuEoaXv/CD2/0uxp4pR+Hk1qomsNDWmfSSncSfwjW74/Uy4iVCSiFHpQHjYU1jjR
 NGrqCSVjggpKE46fk3cabnS3319GztqOzcgIkw/Lncbgn7eBhO4m1ffr7mATJwIWL1LJ
 N2pPTmCI2kAMFJ3m5VnH6tFz8nYeAukT1AoyfYmrO4nVWXA51RstI6RO8+9iK5gPRGMR
 a2F6/+etVy9DY7zf0MJF6p/PRDsRk6EtY/DxEGWsFb+KqZDKhBN1si7KrDXIuTAT5fDL
 8SGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpXyhJ4QNFnL4f5EJCGYwB18DxuLMU3vuswmDUU/6LM=;
 b=LxBl9xXXPuRt/bb5QdYEIEpX+Sd9fkFgUqiU3qBxbgwrZs+AOn8EX2uX44IJx51AjF
 JuTV7F/DCYPThEW66pmHNjTC9n5NT2A8ipIz8ecqKS0YCOO+w1cC+u+d2Ujvy3x3H1Hq
 DfMqaiNFwfQ15Z1ECncIGTQX3tCaYHVuWH/rIuXEMOlAwVsRlyCzXlZm//IJqC1PAyBA
 GbDv8mqD7w1nRRMA9HA6VYvQUpkTfY1HPUijH9JDl/EGWBQNC8rqva/wv6eu2Jfdx5iK
 iQoPQ7xORUy+5km6Qfqwl/xF44DR8FYnypUy0sM5yvzsUQfRKjd/fD6vdkQNhD7jOmS+
 Vj0w==
X-Gm-Message-State: AJIora98b80QNXtQDMqiAbuuWxzQbNEizxNf7XSMElsvTSbj2euPMtTS
 eWnP0Vz/ULPwVEX3Alv9Nwr3DORfEnhOvrC9i2LraA==
X-Google-Smtp-Source: AGRyM1sX4F6SiKqMB+JxZ5Wx2Pmtxkg3bpG8fzVwjszy4OPlIxdaH/u7IdCdfjlRCKG7QJCUEHdRq0RDeziupAcS4J8=
X-Received: by 2002:a05:6402:430f:b0:43a:d521:bda with SMTP id
 m15-20020a056402430f00b0043ad5210bdamr3077496edc.69.1657698245380; Wed, 13
 Jul 2022 00:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220712110232.329164-1-francesco.dolcini@toradex.com>
 <20220712110232.329164-3-francesco.dolcini@toradex.com>
In-Reply-To: <20220712110232.329164-3-francesco.dolcini@toradex.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Jul 2022 09:43:54 +0200
Message-ID: <CAMRc=MeBE=V8cE2ZnuHzw65i5mx2S6iM9LDC8=M-Pa0RWHR7yg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v1 2/4] dt-bindings: gpio: stmpe: Remove
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

On Tue, Jul 12, 2022 at 1:02 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
>
> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-stmpe.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> index a0e4cf885213..b33f8f02c0d7 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> @@ -8,8 +8,7 @@ Optional properties:
>   - st,norequest-mask: bitmask specifying which GPIOs should _not_ be requestable
>     due to different usage (e.g. touch, keypad)
>
> -Node name must be stmpe_gpio and should be child node of stmpe node to which it
> -belongs.
> +Node should be child node of stmpe node to which it belongs.
>
>  Example:
>         stmpe_gpio {
> --
> 2.25.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
