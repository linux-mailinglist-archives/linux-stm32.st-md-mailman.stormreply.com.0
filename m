Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4505A28A4
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Aug 2022 15:34:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CEDEC640FD;
	Fri, 26 Aug 2022 13:34:05 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49D6BC640F8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 13:34:04 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-33dba2693d0so35792127b3.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Aug 2022 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=qiR3kqY1FtS7aluiuV2htyDwOrHtB3ABTNirVnY7LY0=;
 b=Badek9Z3Zw7k7MP3T3YzVdM7CAxTgNBC24Y9sxs8xUcI7ApWgF7W8s+Gcvz5ZVhKP1
 Gv/BM4JpKuQ0UsB3GLYAcuMHJrwhuMYNb4FXaxY6qW5KzLK0QVcBuDwguYH4jNNxTedj
 lCUZuv+5g6OWaGpzsg7CujNCCX8jo0zwxY/d62havl0hP9HtOY07Lla1ygso+jhceuRo
 c6zerpixbQK+eKtQ2/j8/OVTJ7t+7dCHSEbF6H4JAlv0ncMGq4l8alqAwd7ZBJWq49W7
 dduQbKTdmgNjW5trp2/imaB1kqDb2eJN79QRGfSzutp/zKzz9em/stAFPeeyWGJku245
 agtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=qiR3kqY1FtS7aluiuV2htyDwOrHtB3ABTNirVnY7LY0=;
 b=sQqOnUCsxzBOeiPOeDPeWRRMAS4l15vRHvWqn9rBDDJ20HF0CsyN+bGvRH8HOvxeSD
 vUkO1UMx45n0OoG+A21zhECsdolxZOYGdKgIuq5y+AfhlCzpN6GYWNpH9t9FNlIoRPYy
 uKRU9q73HvOGI4ByGVGZnVRPdQI+vQOXlM3hm+GfQGrlgDDal/5bEqYwDgvp0/u9REpS
 AtRAislQK50YD7nrNsTUwYEqfF+qbLSVg0c9Ckf/2wXdUP5rIdG2lxkCmplyACiai9tD
 8IPHaPc9ktPig1X80hPmZkSpZJ5rKUxc/MxVbiQo/wnsD9PXamNP4mLEnSIX49pq9iZ2
 mLsQ==
X-Gm-Message-State: ACgBeo2LOMB0fBThROW3aX8xtSZT6C9yJRaYfjgZ+VxMtQbLlIFORHxH
 AnUpW72I54UZjetOCaFrIxyUhKt5AyQO2BFm+6uUQw==
X-Google-Smtp-Source: AA6agR4cSYDUjHjKqgs9zKaZ58NNESabUJfIrLT+OTCGH4HwSfACpDx/ctbx5ozgIrEgXjQk7zDpKuMhmKfrTiLRGm0=
X-Received: by 2002:a05:6902:124e:b0:668:222c:e8da with SMTP id
 t14-20020a056902124e00b00668222ce8damr7302689ybu.383.1661520843052; Fri, 26
 Aug 2022 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220823145649.3118479-6-robh@kernel.org>
In-Reply-To: <20220823145649.3118479-6-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 15:33:51 +0200
Message-ID: <CACRpkdZ3syQzLaZJ1aksB6o7Q_xOMGSC1RfT_9iVYgpXHi_mfw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
 Andy Teng <andy.teng@mediatek.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mediatek@lists.infradead.org, Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: Add missing
 (unevaluated|additional)Properties on child nodes
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

On Tue, Aug 23, 2022 at 4:57 PM Rob Herring <robh@kernel.org> wrote:

> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied to the pinctrl tree for v6.1

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
