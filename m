Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 728E942CF0D
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 01:16:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36C86C5C837;
	Wed, 13 Oct 2021 23:16:56 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67D44C5C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 23:16:54 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id i20so16179514edj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 16:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tiCnQHVrdBabcToDZIXeMhi1lk1+r3rn3k08DaY++3k=;
 b=gXp7ANWKXJjGzPX8TUlAUpIrWwa4yllom1qQmDKgBHfENLyvHx5P2aT5JqhvjUHg7u
 eUAsV84owtZ5nGVG3xN+XfpnyICgDndXnGFWVxGJZnI9ZotQk02eFB4tTTSoi4Dcmui8
 LvWYwMAnRZtOfCJ4/5YgIvAne78HKKPSGVZQFFNXrWDJvYC4VrBKSAXawZsQjE6fFBrB
 6twNb9t/gbLWUzoVKSkY/GZ/OjS9w7NApeAyWkEjifx641uWxcq5EjFlRNVov/Pa61uU
 cqqM5CUENzoh29AAnwd1oSryY7ZLY9zSG+KKJHTCvUFgb1bSNLps8T/RBwSOhC0sUzbz
 ZskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tiCnQHVrdBabcToDZIXeMhi1lk1+r3rn3k08DaY++3k=;
 b=aWFOMr2v6+EhlxEgbu7nxZ+0pgSJyTDF/XYZ1E+hYdBnlcrSXCX1h/OPMlDqvc8dZ8
 bTw93bzh+Jdx87NuXAK10ml3OkWVagC6IDx30MgRJ/v4PuX9Lc3zZCGt36Xe/dbDiqtf
 5kxlvEjaMCl9gdkSpKqe1mBQrbe86X4d/P1Y9uFqDRBHOFRrXpW6TDLHv0G4q7bo9ENn
 WDud4ttHutMRdD76H7Up3iZmWgnMBpXuKut6b6zDDdOXB6ttC2H9KXEBBOanu5mI4IZg
 HLU+iV4dyYZKyrx5tFw5SeoRfJV0LTAqRY3wz9cjcR2fYgcTPNxY4bzlnQK7NIuPB8s2
 0waA==
X-Gm-Message-State: AOAM530D2Y4CXdXexW/Sm3yhgxuOhJSXkOldBFnTb9F0TUQTsz1Vorzx
 fYu2PtetxyIJnJ//NydoSgBeVUhBgXIodRye10Awrw==
X-Google-Smtp-Source: ABdhPJxu0km3cFQTmT8RT+LuC6goiXXQsKlnz/Be1AH+gs6vANTgQ5AtYZTSuZjdyka1+YfqWnTR3cs3oqVz8LGFO64=
X-Received: by 2002:a05:6402:1d4e:: with SMTP id
 dz14mr3538927edb.348.1634167013772; 
 Wed, 13 Oct 2021 16:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211008122517.617633-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20211008122517.617633-1-fabien.dessenne@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Oct 2021 01:16:42 +0200
Message-ID: <CACRpkdZqioY0uLJz1yQfxwmKreuJcwkNh_PbJNZ2c-Eh0aMPbw@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: use valid pin identifier
	in stm32_pinctrl_resume()
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

On Fri, Oct 8, 2021 at 2:25 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> When resuming from low power, the driver attempts to restore the
> configuration of some pins. This is done by a call to:
>   stm32_pinctrl_restore_gpio_regs(struct stm32_pinctrl *pctl, u32 pin)
> where 'pin' must be a valid pin value (i.e. matching some 'groups->pin').
> Fix the current implementation which uses some wrong 'pin' value.
>
> Fixes: e2f3cf18c3e2 ("pinctrl: stm32: add suspend/resume management")
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied for fixes.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
