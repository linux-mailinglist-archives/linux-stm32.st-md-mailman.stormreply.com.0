Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3099D8CE22
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2019 10:14:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB877C35E01;
	Wed, 14 Aug 2019 08:14:14 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75AA1C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2019 08:14:13 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id t14so1723828lji.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2019 01:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zaG/7UdyaIFhX05cS2xYIpIbPOrXrLv/mGC2XIacwH0=;
 b=Yc92OLlHBJQCnEKSWpA1mKGG0JUh8gbeUrjAtI0OgS4P418XH/eDOCHlX93E/2CJ3w
 d1wVJLzVs+QKABy2uINiVW3n+eQ+UwW23Jda6fPVCRvh0Ldbf8c2Sb2cx49oWtoO1ihz
 BEQn19zyNr3n1EtxMBrqW7D0A9q+0YjwY96Zx8BOUEgfGD8yXls7zW3oiNFCJKkVTnQr
 g+CGPNvkG+yr9OCI/vdaAiqde3Pc2q5agepXdge3hlOHLgcFmzIt+Jjpe2ydAorCndKi
 +8Sp6oH4puH+hQpgUK5SD7uUYefUib5RIzFvc46O8y6RuG/vyofxy0sOCdwxhWhYWwQ9
 iOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zaG/7UdyaIFhX05cS2xYIpIbPOrXrLv/mGC2XIacwH0=;
 b=IJ1TAZvIaGftgzU2MTBr3hiB7YDbPpEBOBTwwMPWHw8uSWH9L7Bmy117SP/1vWcI6V
 GU+oN2QmJu9REE/3gykEzzu18F73vcmUXhD90uykeKy/Noqo14omt89yjjsG8fYz4T87
 8YZJsiCnyJfuAExfOTtrFWrY7nNHX1dN74zHjKUqsygDvLbX1VYDdzYsIc2SZ3px5Kzb
 y4RkcTLNGhvqyDPR0YK4ZFD3u8YcCr0M5ClZ3yZx95uumonDN7c2P8/k7XvgO++YpRWt
 KuRUQQcoJPZpNq7+oElvnFy5NNPZ40+Cf5TJ3jmlanjHnf0aBX/uBgC+jC0eGEztlqCj
 /hmQ==
X-Gm-Message-State: APjAAAXYyu77UUdC6fXEbtCbff/trdAdd70InlK2z2naAnypzgxNX9dy
 vDceqLxfAZNi5iIig9PqZkKJrUzjZV45Pkf3PYSXoA==
X-Google-Smtp-Source: APXvYqzIyGCVXUJvtCqFdjeExOWBR6oTr+xberM5+BO82NhIej28AjD92DKyh3qHI3IcHXX0bYXMJJjnsrhwkG8yczo=
X-Received: by 2002:a2e:b174:: with SMTP id a20mr9290636ljm.108.1565770452799; 
 Wed, 14 Aug 2019 01:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190813205528.16651-1-robh@kernel.org>
In-Reply-To: <20190813205528.16651-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Aug 2019 10:14:00 +0200
Message-ID: <CACRpkdZztpUBWnUtJiZY030qVJMEB7gNstyXQeTYWUZ6LMwx+A@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: stm32: Fix 'st,
	syscfg' schema
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

On Tue, Aug 13, 2019 at 10:55 PM Rob Herring <robh@kernel.org> wrote:

> The proper way to add additional contraints to an existing json-schema
> is using 'allOf' to reference the base schema. Using just '$ref' doesn't
> work. Fix this for the 'st,syscfg' property.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I've got some other fixes queued up and can take this via the DT tree.

OK!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
