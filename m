Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8D75F3E81
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Oct 2022 10:38:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92FA9C6334A;
	Tue,  4 Oct 2022 08:38:43 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C38CC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 08:38:42 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id bj12so27258216ejb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Oct 2022 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Pdti2+VhEQ2CFlIE/PBt8L7tRJaOHxC5L8ndWyKwiZU=;
 b=elp0SRfKxekqptIq4cG4gkRkrnMlQURZ7afE2SiDE5v44N9xYtH1F94+7TB6DFUIAo
 S9kdb+SLRpnBcsfWcxwWj1fsnKOGtoZzWKfcJkO2gBKoRYlU6DIsslOze7ds/MGdchNb
 WyyXd3l9ruuxyK6ErnfpYHTvmEKq9ZB+fuE20f+D/dvDrkj+QQAFe8KZkkkfFkjYOISX
 7ASOtgS4pGyk5LqNNqFbn0Oggl9hxVJ4PSf8O3H+xqw9Z/i9DuC0fx2JpfhBPhOA7u2Z
 upXElt1p/zJcGkST0CRd7uvGPPqwm21q/kEq4VQCGPhx2vZyP45gRxjOCHXAjuQPelgK
 9r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Pdti2+VhEQ2CFlIE/PBt8L7tRJaOHxC5L8ndWyKwiZU=;
 b=nIyes50msLfew8BSptOOHu4hwm74sLicNGuhplm/PnGpMoB1r/pfkte1uqAWECWxFb
 77dMtUbY9au4ytq9PQy6X5PX+hSNBFEeo4RzME/pJYtbgTYTzCvfEgW55f/KYj1xM5RU
 uIWnE/83bftczJ9/2PZtK9zJNXk9YMnLpeNk2atMaERhochKEk/r51sxbZ011ZXxX3Ea
 6EkKV88Gvhp2e13+B0gg+ESpQLMhKeI9NVBYOGNVEdVHNoxAbx2jo8TDNg0l/pauPTcJ
 NEftaK+cFcFsI+P3bE7Ob/a7QCSw041NtldO9BqQYMLeHHDUFoNB2JiS3bHrE4ZwHK4a
 uPew==
X-Gm-Message-State: ACrzQf3dZ0/7PfRM4S4RPf1JK6ZiBRwOg/O+MtNsgEzRDfMLFlumYSls
 810oH2+/X935fwaFWOKH9iqBVra7pWxDa5zFPecrUg==
X-Google-Smtp-Source: AMsMyM4spjtMLizp56G5eP4S4o6K8cWN2P8PGJo/ZmF98Z9LCxo7Fcz3HCJKOpi6prC6ZYE5KdISvOTCqgwzo9uT1Nw=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr18268600ejc.440.1664872721922; Tue, 04
 Oct 2022 01:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220926204735.381779-1-marex@denx.de>
In-Reply-To: <20220926204735.381779-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 10:38:30 +0200
Message-ID: <CACRpkdbYndUNAoQ-bnf8O3Kdx38kt2Czx_N8J5jk0tasM6onTA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
	stm32: Document gpio-hog pattern property
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

On Mon, Sep 26, 2022 at 10:47 PM Marek Vasut <marex@denx.de> wrote:

> Document gpio-hog pattern property and its subnodes.
> This fixes dtbs_check warnings when building current Linux DTs:
>
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@50003000: 'rs485-rx-en-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
> "
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
