Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C8C29AE8
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 17:22:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7A09C10CB5
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 15:22:23 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEE9CC10CB4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 15:22:21 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id l26so7426350lfh.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyF3o58FFX1H1q5j3kdiPxjWQwX8mwAfxQ1M8ShVyoI=;
 b=R2nXicON9l8j67j7PadKSRB4aV4W8j0X8VrwwypSh5dc/jQT2y5uUN8rZSpBv12B+g
 WI80lgH2mR8r7dRtZOOv2HePNQnSEUDtSG39KhmqNSiNiNkYA4OzyUBagAy3bsf7YDqU
 WpU+CA4s+vDA1kVZj7mmPnOOihogo5bRT1jbpXir6J/KOpZ27oTLsUSdfYAaozpPatwA
 1sRNLToQWgrSwoDi8cex+LE58QAxSyaW4ykyLPlSzUgydnGj2DgGMBXKvmwm1baKM5dv
 u848+Lu1/GSCycSO+lRYhXvlzCIviyFwen68e8/QHujHkVUwZLTw5Y6Vk3wuTMC3KND0
 JKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyF3o58FFX1H1q5j3kdiPxjWQwX8mwAfxQ1M8ShVyoI=;
 b=W3GQmbhwhguEWWogFqnVNnE5g5YMw7IkGY0jGYx9MCG9fLdwN9CSS2/59o2v0iEaK6
 YgpTTuK9o9PFn6Xnm/z7MU18oxxOGVFOVyElLQsCNsEyZlUpGMQk91RYEO5drPSz4NZk
 EYGepwSEDWtTLE+TYXc/j1pdZ83tQiD822s3MmH7um29q639fMcPe3RywZPxrBuQq0bM
 n0j3UcL6H6HAt7i0e6EhNkI4pk7PgqlMS2Q00RnW40XC+06j8I4phDEnd7aMns0ew9ng
 2XaFH4vqbLb1CbYURe3L37qcbxl2JxFYNC3sAFu87rHeuxw7VQKaRYSta9+N+7Ny1/mh
 728w==
X-Gm-Message-State: APjAAAVK3upj8sedmTKvoGmz4bEFUAZW/QT+niwFKCs84mMYmmHk06Iu
 e03zGJ6qRDDX7NmBc0/CZeegVLrOiVjQXyWWtCEhDA==
X-Google-Smtp-Source: APXvYqwmvwWHGvypE/OcPxIOvNOsboOsJx8yQtKE+WMD3B1aEcSgE8sirRO4jcp62+tgDg3VjDVnaACWJ1dbGLlT+EY=
X-Received: by 2002:a19:f60f:: with SMTP id x15mr351461lfe.61.1558711341073;
 Fri, 24 May 2019 08:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
 <CACRpkdZ4P=PSCu86p48nBPeVk-h5T0Ytc1CYV3XZGd4fLuJLGw@mail.gmail.com>
 <ae00fd9c-d25e-c401-4d21-d526a63538f2@st.com>
In-Reply-To: <ae00fd9c-d25e-c401-4d21-d526a63538f2@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 May 2019 17:22:09 +0200
Message-ID: <CACRpkdbJKAGyeBU1tX77-wSYzGXDBqRYR1gQyzOZ_XT4RGFbsw@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lina Iyer <ilina@codeaurora.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: add lock mechanism for
	irqmux selection
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

On Fri, May 24, 2019 at 2:27 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
> On 5/24/19 1:26 PM, Linus Walleij wrote:

> > Patch applied, can't say I fully understand it but you know what
> > you're doing!
>
> Thanks :). Do you need a better explanation ?

What I need to understand for hierarchical interrupt controllers
on GPIO is what I can pull into the gpio library. I am working
to extract some code from drivers/gpio/gpio-ixp4xx.c
to make generic simple hierarchical domain support available,
and Lina is working on generalizing some stuff.

But these complex domain operations in the STM32 seem
to be some special beast.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
