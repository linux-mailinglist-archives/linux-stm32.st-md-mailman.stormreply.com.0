Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C4301F6E
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Jan 2021 23:51:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 815E0C5663B;
	Sun, 24 Jan 2021 22:51:59 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C70B1C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Jan 2021 22:51:57 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id f17so13076367ljg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Jan 2021 14:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HuGZS3FXmpI/CZ9WRJi1GTxY4eR6JlbnQlmIWJDvhs=;
 b=NUPplP+vwWcGNZku67kF6v0Zc3+oX52TgC4UVnC9NbzphbJ7yOo3lZgx0NHXvAzi4/
 xnRCAIHE0ruAJ8HvkZDbaiyl/5VEQFlcXHUyUOg5W0tXmw8xRR/9ZGxYRibTCKQd2Em3
 JGzKjFrj8IqxAGlyzt9x8qfsWUU1NwCPVqpRz2nhXoRxd+1G7sHECm9fdWqcPoKOiUDE
 xoPn9xr3ZkalTIBSogHq2aR3gkTcYeyYoFzZivXKeIY/XR4ENYkwdlJ7WamTamtbwtXi
 hTYSsVxmsDFQD9NO4GyfrEW+6KtsLs3TFca+J5YdXQ+PCtX8ME9+98DFYwf/wy+DY0Rd
 Gc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HuGZS3FXmpI/CZ9WRJi1GTxY4eR6JlbnQlmIWJDvhs=;
 b=pOKFKSxNQbrb/+4cxJt/PeruwmpPutaQlb2KlVjxXgV4KcR5M6Cu5N8njEV40GzQVz
 MzKHyNa7AUeXvZKuFFZtDsvQQlF6LKgsVnpaFMjdrifs35weXKvjetoRaFDXDlHVdIGk
 FUUIfgarS0hhn96W/8v9JKzLvdsEiHZUPpk3KwAH8I9sdVXN01ejHoT7XKE72z1u7IrO
 dPCJiMagxDeBpeHigaztMwVA8jaiNfei5KwkVlBBed7zY+4GXyjPwWU2WkVJPFQNA1nA
 VwzmCeZMOsXR2QaZKteyRrYPckh6IlVyfwLpOO2UW8hPzyQqgBzxprHLcYI3xqoYwO8T
 AyHg==
X-Gm-Message-State: AOAM530RoFVwAYRk8BuVcwq/iPE9qnd5UG4pNV6CDhc3eKrARTNcVWa+
 w97IJ2rGkf1p6HwcAPKpvyzHpRg1HXPKMSII8iicsw==
X-Google-Smtp-Source: ABdhPJxQyfKzJabalN+bedwoS7NGWpYLLpd54boyq2sKBZ7lVn6U5490067UEc04d3r+vv3OMoYA394NyqYfuciT6KQ=
X-Received: by 2002:a2e:9ec3:: with SMTP id h3mr120887ljk.200.1611528716487;
 Sun, 24 Jan 2021 14:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20210124170258.32862-1-marex@denx.de>
In-Reply-To: <20210124170258.32862-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 24 Jan 2021 23:51:45 +0100
Message-ID: <CACRpkdaLN_Q9rmMnuVhB8wuZJzMMzqdc+O54WOKfc4a2bgnUwQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 1/4] mmc: mmci: Add bindings to operate
 CMD, CK, CKIN pins as GPIO
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

On Sun, Jan 24, 2021 at 6:03 PM Marek Vasut <marex@denx.de> wrote:

> Add DT bindings to describe GPIO line associated with CMD, CK, CKIN pins.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: devicetree@vger.kernel.org
> ---
> V2: Rebase on next-20210122

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would probably add an example as well, but that can be
done separately and isn't super-important.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
