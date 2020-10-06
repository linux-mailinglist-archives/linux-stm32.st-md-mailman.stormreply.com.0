Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF7285494
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 00:28:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89699C32EA5;
	Tue,  6 Oct 2020 22:28:26 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1841C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 22:28:24 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id m128so309966oig.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Oct 2020 15:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BK9fnoo1uA83BhzEQ3W88lbLalesaiwBhSmKSbszAEo=;
 b=PW4aQ0N3kgyS6CBX+Nad96HhThzcIMdTMr0VKN8o+HUgSatW+I3nSGPEkq6AZ9urPp
 92FqoNH8RKTKoL/ENmiCN3Gw2AckNx2gVM5vxKwrbyaLnQr/nADjgawJ5W5tYjSNQWyJ
 McdMJZlMi8itaAuYaCQsilO7/kKaS2NRN3mIaTpv8i2+BBLThAOKcf4M9UBF9JDAWgmD
 FGkGW2FeD4SIcCG+kDfn/cgOk0ei1rgYWvbkA4YJ29xxWoQa/UcncJcRVd7dV+LL0eDl
 E15CjiR4bBWWez+sJL/WJQf9Hk9slA5U3XFD0ncIlpq/H/IiqdV9vClquESlAb5kQ0gE
 jkmw==
X-Gm-Message-State: AOAM533AfumvwvIvJqOnkkdIB03Jfkmw7pqY60l4F4EDAdB16V6ssT/b
 dV2XM+kBZkuAVlQXV8YoCg==
X-Google-Smtp-Source: ABdhPJxoVcEzp/l6VNBrV6AdkDsAonSUtV210T7j1H1LSoBOsP96XXbUFBTHpRVqHhawYzCR0qUyPA==
X-Received: by 2002:aca:af07:: with SMTP id y7mr298067oie.176.1602023303569;
 Tue, 06 Oct 2020 15:28:23 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k51sm86028otc.46.2020.10.06.15.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:28:22 -0700 (PDT)
Received: (nullmailer pid 2970094 invoked by uid 1000);
 Tue, 06 Oct 2020 22:28:21 -0000
Date: Tue, 6 Oct 2020 17:28:21 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20201006222821.GA2970040@bogus>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-4-post@lespocky.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 03/12] dt-bindings: mfd: Fix schema
 warnings for pwm-leds
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

On Mon, 05 Oct 2020 22:34:42 +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     v6 -> v7:
>       * added warning message to commit message (Krzysztof Kozlowski)
> 
>     v6:
>       * added this patch to series
> 
>  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
