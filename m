Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32681644921
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 17:25:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4637C65E6C;
	Tue,  6 Dec 2022 16:25:34 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B9A8C65E5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 16:25:33 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id h132so17498733oif.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 08:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/ais45k9vzwCVRwJ6whVGyw5sNpBkvpT+u93PldECuY=;
 b=SJXK9Njs3/WtQdYO1n5tuMWFnm8eLIT/BZjadd4iLnQyhAXZ8ONXFwPHzYKYFKmvRY
 RUbmsPRvmSN+4oRKBXgX6i4ctkwgVYGNtMm2wdZFidfCSaQ/DQ5AEL6FMxUl0f7Vqi/N
 T0dFcibaJyb7eo5g6dZzXHexJ1NL2vz4ACpEiBj9q+fnBYHC2WM/yLNoY640QEfGORVL
 q3dXAZiHthjklcd02ga4DtsYdCLhAJK+YRTSkfjhD91SGLZT+gmG1wBYXQfyNTybrdWy
 1ej3vsNkXbAOc2pSxX2XFUQEI92czeXwYRrMKtznQZsR9SW0y3QbuZ+2/3P50aDtpYBQ
 0zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ais45k9vzwCVRwJ6whVGyw5sNpBkvpT+u93PldECuY=;
 b=FBVv5VUyPCC4qTtq/T1KkQhN9OdRcL8vuvhizeic0jNkgCLRB8f4VjK8ONofmAl62J
 AgPXLbPrb/i1rDpikQQQg299zz33wGaDcSMzGf2Vq9pavT47eB9Tup226K9PU+Y3JUUw
 O5ZvYzvb6NnRyoK+gF3zsTPb1GEqZ1SdkB5krh7Dy+dV3N/JeZsNsK8hDI12d5AFiWi1
 /VJjEZK1AAAYHxPdF0PpVmWa4DU0EJI2FPul8o6Sv+bn0gWZqKahX1PCpA/cR2FXrGc5
 X7w93mYbEAAnAGBpRnhQnhX/7j+705Vh4V6WH0XxdaJyJss93ViBzNsfpNDo50IlCVJT
 ZcLg==
X-Gm-Message-State: ANoB5pln7wuO89Qkz8utqS2LMmJzWpZnsoNcoJHh2gqCusTDGO3OBMml
 fNKh+GU8vdYP63fc1ZIXOsGFPjO7tv/t4gEOZOxKAQ==
X-Google-Smtp-Source: AA0mqf7slrigjIb2YU0eOuwcUhtuWW55HhFXBRbOprBZ/PpE0rScnzOSK1B/21a3d6JGXEaZoNeytI+ZqJu+h+XBOmM=
X-Received: by 2002:aca:de45:0:b0:354:58db:8639 with SMTP id
 v66-20020acade45000000b0035458db8639mr32339713oig.152.1670343932030; Tue, 06
 Dec 2022 08:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20221129023401.278780-1-bero@baylibre.com>
 <CACRpkda75U=b50rK=WecNvaEoTdN2UzGyEwfPRaO6jG9FGyWhw@mail.gmail.com>
In-Reply-To: <CACRpkda75U=b50rK=WecNvaEoTdN2UzGyEwfPRaO6jG9FGyWhw@mail.gmail.com>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Tue, 6 Dec 2022 17:25:21 +0100
Message-ID: <CAP2ifjN-czBPKsm6o9U0Zx3dgau6bydFSrZmtwNJecSQu9VMzg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 0/7] Remove the pins-are-numbered DT
	property
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

On Sat, Dec 3, 2022 at 10:22 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Bero,
>
> long time no see!

Hi Linus,
indeed, I've been doing mostly userland stuff lately, and my latest
kernel patch was x86 (got to keep all of my hardware working ;) ). Now
that I've changed jobs, I'm expecting to be more active on the kernel
side (though still doing a lot of userland).

> > This patchset removes all uses of pins-are-numbered and marks the
> > property as deprecated.
>
> I don't remember any more why this property was introduced, but
> I am happy to see it go.

I couldn't find why it was introduced either (and git blame wasn't
much help). I'm assuming there was some other mode in vendor trees
that never made it into mainline (but the flag for switching between
the modes did).

> I applied patches 1-4 to the pin control tree for v6.2,
> please funnel the rest through mediatek/stm32 and
> SoC trees!

Thanks! Remaining patches reposted and currently waiting.

ttyl
bero
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
