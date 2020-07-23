Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8322B053
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 15:20:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42FF7C36B27;
	Thu, 23 Jul 2020 13:20:20 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5553DC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 13:20:19 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u12so3260619lff.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h5cjN/ArrOT+SU2XjBSHJvP6yQc3qN6Wi8CCivRg2Z4=;
 b=ZIklItY1VHV8uzX/5DeSAuq8RFRtlThGT+GIFQMHPGcdBHMGU6NvLpEax2cWs8P6ls
 PNjbmKvBUO4f9DSVDXIYuz9fUPijmW/l8daaiqy0sqqzeXranjQZS0Uepn0aioaYYtl5
 ztC35RoYiW6tbudfX1LY9HL2dSZgRMRZ6617IfY2EgkblqbX/aB/ehNeGjVllikGz55T
 30A/IaOdVbjHe3Ym0XlJ8rwfkKq7TLfUFtYeTVYPSUpUbQE41gXKAGGvQKWGAY4CNyCv
 x9GlpcO18u18CCeJZXFuhcEBhLMxokbai8UMlHOBfBHKWA+SBi3lJq6f7yllZVU3ZLV2
 qtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5cjN/ArrOT+SU2XjBSHJvP6yQc3qN6Wi8CCivRg2Z4=;
 b=fbV8wicxnDvdOsUEuIaLRttF3JBC6bfZtxixoAbf/2VJPBxVb+/ohXLS1iNcR14vzj
 dPgst8a/36EdvcqW4bYQDu2t7oL5AqJAn+nJpNLR1e0zJUdFW33dFwOi78UmvmGGueCV
 zf4BE+b9BUStya+VmZs42ASIMN0S59HEjguyFJ9eZ2XYLTPdFFGezSaZjI6lGdcXSbdR
 n+Qp95RhSL0wXdghpaMo4kIk+lNB0IZqVxbzrMyvxizOmuy9iPnfJufTgN7hluQimyJT
 P0XgtBueQmQB3Db1cqfTP21bH6vgL660WBAANs4/wgTnSlD7GiWcHILBcNC6HcswyVoM
 YIoQ==
X-Gm-Message-State: AOAM533lmZ7a/p33zyja2uICUzwcWfzAeXN9afzCoeZju/OnWbDD6AIC
 uqNu+Rossv6WpeO52ni7J/vTWyA/Fr1uXE3Ohgpp3Q==
X-Google-Smtp-Source: ABdhPJyysHHdEAzrPwZMCPgLooL3Yy70BEt6ZdCnNnKy/t8d+QmtYn+XgGpvNWNaIM+UCe+nOjubYDkX69B0/wcC65c=
X-Received: by 2002:ac2:4d16:: with SMTP id r22mr2241086lfi.21.1595510418410; 
 Thu, 23 Jul 2020 06:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200615124456.27328-1-alexandre.torgue@st.com>
In-Reply-To: <20200615124456.27328-1-alexandre.torgue@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Jul 2020 15:20:07 +0200
Message-ID: <CACRpkdbWUop6hyKM80zxaz85oQ8BfDLCtxBTzjOypnDpUm-a4Q@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: use the
	hwspin_lock_timeout_in_atomic() API
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

On Mon, Jun 15, 2020 at 2:44 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> From: Fabien Dessenne <fabien.dessenne@st.com>
>
> Use the hwspin_lock_timeout_in_atomic() API which is the most appropriated
> here. Indeed:
> - hwspin_lock_() is called after spin_lock_irqsave()
> - the hwspin_lock_timeout() API relies on jiffies count which won't work
>   if IRQs are disabled which is the case here.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Patch applied, sorry for missing this one.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
