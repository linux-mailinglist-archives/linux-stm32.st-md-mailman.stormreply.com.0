Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF33B4B62
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Jun 2021 01:54:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10D78C57B6C;
	Fri, 25 Jun 2021 23:54:03 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B0D2C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jun 2021 23:54:00 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id r5so19138961lfr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jun 2021 16:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b02+MQS+K/2ylHUHsg/KpB4uE2GVIVGma+PmBOheS/A=;
 b=AVEmQBfjU5ZUxZePdyPtiXWRVilsLPxAJLayjfsbdbyHz1DblFJ6Tp7ohyXY2u2Zp8
 emfZJh3lE0JPvmZMYL28V2WTt7j2o7kf7epNP3DSCShbqipZkEqNclXkAH+U3u9wbhYb
 bclJ+QFiNecqz/QGkVLl5d9hKW2vJrxIwI84AXKLlAcSwzIkYInvfKXpUxkb3eVtKmk5
 eeTaSJOktEHW++XRcj/dFJn/t6EIqeLC5gFruDRXVTLUP6cz2PvtTzzcZQQce7nHAzqV
 7XCG5kajX/woXMj1jvn74ztVk3tSQXF+lWIENbI5Y2Ue4jeULe6jdhzOmeIJEYRC7fCP
 ZjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b02+MQS+K/2ylHUHsg/KpB4uE2GVIVGma+PmBOheS/A=;
 b=XGOVSIFicW0/2nQumcoeM01ECo+95LLAxaYJZFuMq9W056QJqa0rDY7MFDlf4+A0Yr
 RoKJ4wdhYYILSNBtp8DiW6t9LQKlT59A+cPP0235Pn6tzr6VXptyE3c/9XtsxtPyV0BE
 o+xl5DkT7xAtyRtgi+jIcx/Mw8iLwd9jKI2ILBySBtJZNFDJzqypz7YFJZfmxYj2iKbu
 VJieE+61AAjc+wgnYDwk4rS5DGfCFxw2H4nCBQelI3vscafwFcYDvJLd8Wwq3KOTJCBc
 Q5Kfo+ycrt94Nr2kYF0Ac+gPKCBJKIm2jul2VZYXuIoBZt3sfEnKsT2c46hsTx/XiQIh
 tVCQ==
X-Gm-Message-State: AOAM533rcVV7zwb/539maC0smeXIolqXeWp557Bm4YQskRzPvVPOOlTu
 82unyMnQwHUuQFOvbq486C6rtsbcpvlqlTzLRCZv8g==
X-Google-Smtp-Source: ABdhPJyHtENVDOxhMvPBYXGHJTHQZYmleVXRR6DQgQo2NmaMqGvMXTEd23T6XvjSTCwCc1CSM77tuw4mj6tKVJ+GKtk=
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr7698391lfk.291.1624665239810; 
 Fri, 25 Jun 2021 16:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210617144602.2557619-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20210617144602.2557619-1-fabien.dessenne@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 26 Jun 2021 01:53:48 +0200
Message-ID: <CACRpkdYOk8TgrQbEOMb-ZgZ8a6ZOYPgkfyWDr-Li6w0mfFO7KQ@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: check for IRQ MUX
	validity during alloc()
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

On Thu, Jun 17, 2021 at 4:46 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Considering the following irq_domain_ops call chain:
> - .alloc() is called when a clients calls platform_get_irq() or
>   gpiod_to_irq()
> - .activate() is called next, when the clients calls
>   request_threaded_irq()
> Check for the IRQ MUX conflict during the first stage (alloc instead of
> activate). This avoids to provide the client with an IRQ that can't be
> used.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
