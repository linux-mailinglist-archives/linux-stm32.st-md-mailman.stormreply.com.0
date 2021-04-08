Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 108DF357D57
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Apr 2021 09:29:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B910DC57A41;
	Thu,  8 Apr 2021 07:29:23 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 263E7C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 07:29:21 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id u4so1081403ljo.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Apr 2021 00:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ebwLVYpldkG0uYyReL7zrcqCaChQ1ELokt7fpV5GePM=;
 b=pihToTlGYl1J0OP+c1jetM3wPk0eO2LCjXJUQuzGe8WBvu5yE/4q9sLjIJ+By4+khR
 3EMqEBLCqNhv6oyjw7jbwwb1p9/j9zUwSyimuzvV8jY0X8Q/Y7ywOivstZbdLSZWMtro
 qvFYJRmHq58iYAh+A+FtM3pDTDxN5bgGCUADWRTdECc6n5jdD+EYG7IF20I4ZZ/tQIDB
 McaFH8OKN8sS9JcJEFAudovTieVV8jx2XZKmSVeQDrKAEne1C1APH/1YzDxFgkYynLtX
 FY0hdp1RY+CtfuMohCNvFOnN+eW2xZnpOaVMY8t7z3f8fiIO3rk3dQCghaHH2kQ5Wm5i
 E1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ebwLVYpldkG0uYyReL7zrcqCaChQ1ELokt7fpV5GePM=;
 b=AHUk6/fxnlogyc9LuRDqhGXFxkzZwSeTQKZURpBPZNkO9dh7n7PPyAGQ/bTrKj9xPe
 gPWP8UAAsCmNpp/pK3aOrXZqpm5kSOtKV/Rz+YgTnu3BhKiQV2tJHPi2NpaJln4wQVRT
 9DExNSgPBm/1I6R/IH92mALafJ368bV8HjfXMjBNPymSQaOtqQA6UWyMlKkbBTLMKZQO
 oWg5+UksouAShREIubWQefPauFTqR+gkp1+RcK2Apa9kwgkxQ3Ox0Vz1PdeNTqdDUOw2
 F8/ThGq0ssKfX25OquV5tatCqqpms4hHrrtbKVGxpuVpsMTjdf+XajyzNjZcDj3ERd+g
 AFlw==
X-Gm-Message-State: AOAM5335sunGFqnrtH6XpRebTzguhAj00h6rMblxQbwGPY6n8HAopb5h
 b6f3kqcDBcUUVQ3gm80io9rwGPo6VT4XS1aNhKnOjQ==
X-Google-Smtp-Source: ABdhPJzyN9e0wGot7O17d6Su4U3GaawgupcfwjXGBjg/bJIBkK4DxYApQu43Aqth+HPoAG+eWlVteGL7+VbcrNmp7Oc=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr4680040ljj.438.1617866961305; 
 Thu, 08 Apr 2021 00:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210406180035.279249-1-marex@denx.de>
In-Reply-To: <20210406180035.279249-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Apr 2021 09:29:10 +0200
Message-ID: <CACRpkdaZmwoFwqinoX63cZaoauL7jGpK6kMW6pULkBn8aP=D3A@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: Print invalid AF warning
	inside stm32_pctrl_is_function_valid()
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

On Tue, Apr 6, 2021 at 8:00 PM Marek Vasut <marex@denx.de> wrote:

> The "invalid function %d on pin %d .\n" message is triplicated in the
> driver in different variants, just pull it into the function and have
> it once in the driver. The bonus is that all variants of the message
> now print the pin number and AF consistently, so it is easier to debug
> such pinmux problems.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Fabien Dessenne <fabien.dessenne@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
