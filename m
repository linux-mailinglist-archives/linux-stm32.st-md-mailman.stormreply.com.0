Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5541550C234
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Apr 2022 00:15:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 105E9C6049A;
	Fri, 22 Apr 2022 22:15:30 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B451C6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 22:15:29 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-2ec05db3dfbso99129887b3.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 15:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IEPmT3Gc9bc0kGpLDKNES5cFyu9wmRr1DONuGP7aDR0=;
 b=h55822QjC3AXppBz6+TPMH1WBShBvQoSl7j+Ah3WF7IH9+as3Q8+Y+oOlXw4ByoWoK
 sHTqCrEsDRmby5GV4cSZhjofTTZtEZOnDHtRKRxh8hpf/ctupQSKr+7kAv69oMCrdFHh
 8WveGXyKifkMGu9ztHfoVyOOhaZQtMPcVGIqgoUIcLYLsTGAXzwOkg2pHtRGZyqj8P9Y
 ahF/0VLwX4xIgfUKIlCj+mhF9tlQ7KUfxRQmboz89tS/Q3d+lP12iYg1bM7bndBAQKI1
 +45i6sQ0OaJlrPI1pEZsgwQYpHUc8+06+f5xxQw95OVCOsY5KO5ZyOPtfd3pOHt2SWiw
 GZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IEPmT3Gc9bc0kGpLDKNES5cFyu9wmRr1DONuGP7aDR0=;
 b=XVkV+ffTGDgCfoTRvGB+9UmQR5I3RDeezdUkE8APCMoi46/1R1CzQDPNLXm7CXljON
 8hViWMYtSI82SVGcWJUlpmvsf8zFaObQOJabjNeZeGGMCt0GAIhy6vNQrI8G84UABL/i
 H7Z0uzh/Tl7NVulmszSw2R0c/p7diJvi5IskNjhVOPrMnpg3zVBZ1XuZj74aA4r+PIf0
 nRTbX3W3hbAokrgw9DiIDBpY6M+lk9P08VacTRvIeozzWVflZxP0DB/TQzlgJut+y/Cg
 Z5/WLvGNhMUkNjeDut3p4/szwDn9eyMuXdd9NmrcQrmHVvctr2ndY0pXisGC2YgdLlkq
 1zTQ==
X-Gm-Message-State: AOAM532oc/wmELh4J76fYE4B50itZT7sGr1IK5vNXKFUagLT9aEdbk4n
 MtdkAgXpunhc0sIA1jQyc0GU/WetOJasGD2OePaiaQ==
X-Google-Smtp-Source: ABdhPJxN7EB8el/52hKdd0E0KMl71hy177PrIfN+MxrWdFqg7VvCGGjbq/I1Lz6aF6VguU+NaI5B7f3pJL4j9uTOFuw=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr6946723ywd.118.1650665728190; Fri, 22
 Apr 2022 15:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220422161933.163347-1-marex@denx.de>
In-Reply-To: <20220422161933.163347-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 23 Apr 2022 00:15:17 +0200
Message-ID: <CACRpkdZNvNqx4DR_Dcwv4AU1x=MhLLUpSTewzUnsQwh8ibqzqQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] pinctrl: stm32: Keep pinctrl block
 clock enabled when LEVEL IRQ requested
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

On Fri, Apr 22, 2022 at 6:19 PM Marek Vasut <marex@denx.de> wrote:

> V2: - Use pinctrl: stm32: tags
>     - Add RB from Fabien

Hm I applied v1 with those changes so it should be fine I think.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
