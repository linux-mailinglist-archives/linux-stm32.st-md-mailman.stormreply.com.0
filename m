Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F5B9581
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Sep 2019 18:23:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96501C35E01;
	Fri, 20 Sep 2019 16:23:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80F1BC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 16:23:56 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E573821835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568996635;
 bh=SDWrzZuVG71v0J2X6nPbnKE1kFEZUtHXnpXPTYAQdcM=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=Y0NPYxXS5lxvCc5BrOJBS+38DHx4Vw4tGLuccuPjWhQHZjLN1+SP2QJbwffe6Fo6R
 SGaBxYr0YFTOcZZ74KP24FDLyP9h6k+pQ2VXu9tF4gCqFBfBD4s3DyPTPENUcLZ1/t
 wlNhYEZpL/2F2pyw54AFDUqkleli+20BjzwXfEhY=
Received: by mail-ot1-f46.google.com with SMTP id c10so6657840otd.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 09:23:54 -0700 (PDT)
X-Gm-Message-State: APjAAAWu+IhqXl0eJMGnBJc3XCDTZ3suKealB1VgvDDEoafkjO82HS3U
 958Vb9XXYa0MRfT+nsitzLHkMJE5vjDpg39HE9k=
X-Google-Smtp-Source: APXvYqzVXOyysg9607AyFbe3o2oRNE6mFVRauJhZAfa1N2RVl6I/Rt2f5iakVGo4VwLzm014Px6jKLwO2nAgy6rn4nA=
X-Received: by 2002:a9d:6c9a:: with SMTP id c26mr12313571otr.241.1568996634274; 
 Fri, 20 Sep 2019 09:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190918173141.4314-1-krzk@kernel.org>
 <20190918173141.4314-5-krzk@kernel.org>
In-Reply-To: <20190918173141.4314-5-krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 20 Sep 2019 18:23:41 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfQFg5wC-JcHUs8btYJRfpC=NW2FOpWTHkTD6zekzHV0A@mail.gmail.com>
Message-ID: <CAJKOXPfQFg5wC-JcHUs8btYJRfpC=NW2FOpWTHkTD6zekzHV0A@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Matt Mackall <mpm@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-pwm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 5/8] dt-bindings: watchdog: Convert
 Samsung SoC watchdog bindings to json-schema
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

On Wed, 18 Sep 2019 at 19:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> using json-schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Remove unneeded timeout-sec description.

Superseded by v3 (although named v2...).

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
