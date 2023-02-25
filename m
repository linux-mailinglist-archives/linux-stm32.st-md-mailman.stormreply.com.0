Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDFF6A254A
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Feb 2023 01:02:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABD78C6904B;
	Sat, 25 Feb 2023 00:02:00 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D18CDC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Feb 2023 00:01:58 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5384ff97993so23845837b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Feb 2023 16:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YGce1k7vLcc005CSr+hSLKXBF5SLmaJtWY6pcwxKx0Q=;
 b=wmKV6llXzbyV9ZIrbyej2OunFiU741qhFzyT++YfHdH+wiBtK7OyXKguWCb/kxA5lR
 DgiV/yoxIJFHFT7HIAGeNE09zKS75YuufpetByYC+zQvHhisK1MF1WcBapNZQL2eZoTE
 QHiLj96u/q3tU+9/uJa4MeMk3UhGRkOxdXZPb8EDh1xZ3nxCyran5snsFAKmTd/5JtEu
 FzHlHgHlzZp3XLv5EM9LwJixEhKTFFF1gIvYyhd8N03lSvOiQxUSedhNiJdnX0om6B9S
 ntCGHIcAFPwdHLJL2q3LRLX9MSEOB3M4l/aQIIHL5vFmWJgiaeGOAcJ+ZKIBu2P0b/sx
 fnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YGce1k7vLcc005CSr+hSLKXBF5SLmaJtWY6pcwxKx0Q=;
 b=CpB7H0QIP4b3oNJ4QEI/k9vdQ4/69YrFXtCilQlo86V9sNVdIjkn/Ey3m74jeEh6yT
 s3pPPbN7EC6KYKUR0QZnUhwcHJHEahN7jSwk33XiZ/MJcnKX8LUxR33+TAWyE4c+5Nyp
 E9JfakjPvWZy9SoAwlMAmOd95yn60lmyX8Q07AwqqMovQRHIYtA53vAX63m7N98gpp5C
 Szg3FN1MRRwDJdKrvkBRPe4yElZS7T2dET644AXncsikbKkd7utvKufr29UAxZbUKHy8
 1MbtMFtFhq8ar0bxXeseq8l1EP5hJXjMTlIinQowfZqtj8XUCp4rHYW0sk1366YqoBvI
 vfSA==
X-Gm-Message-State: AO0yUKU8Ad52zB76lKCXtVOtaTfhvMweZR9o2db/OJS2CLufiUhew1Z1
 SnL8rBcHLUPwq/cp5/Tgk1ScPPpzqGhh53MqI7C7qw==
X-Google-Smtp-Source: AK7set99QV/uEaIf43VqawXg5tt6DNfPTfljZt6PYvMnndqiUknRY5fA1wfLo7lx9pLsVMLGPQvxOcTnIyR7ML4cJf4=
X-Received: by 2002:a81:af1b:0:b0:533:8080:16ee with SMTP id
 n27-20020a81af1b000000b00533808016eemr5627579ywh.10.1677283317533; Fri, 24
 Feb 2023 16:01:57 -0800 (PST)
MIME-Version: 1.0
References: <Y/cBB+q0Ono9j2Jy@gondor.apana.org.au>
 <20230224231430.2948-1-kunyu@nfschina.com>
 <Y/cy5wUtk10OahpO@gondor.apana.org.au>
 <CACRpkdYyB=-UnE1bmdVszSSB5ReECZ0fUoWJX6XtYbKHEe52tA@mail.gmail.com>
 <Y/c7iVW67Xhhdu8e@gondor.apana.org.au> <Y/hQdzsKMYgkIfMY@gondor.apana.org.au>
In-Reply-To: <Y/hQdzsKMYgkIfMY@gondor.apana.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 25 Feb 2023 01:01:46 +0100
Message-ID: <CACRpkdZe3cMMxJesD0mpqHTwvuWHjSGVHsiFUQQyuA+VWknMTQ@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v2 PATCH] crypto: stm32 - Save and restore
	between each request
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

Hi Herbert,

I tested this on the Ux500 and sadly this happens
already in probe():

[    2.802539] stm32-hash a03c2000.hash: dma-maxburst not specified, using 0
[    2.809342] stm32-hash a03c2000.hash: No IRQ, use polling mode
[    2.815226] stm32-hash a03c2000.hash: DMA mode not available
[    2.821140] stm32-hash a03c2000.hash: will run requests pump with
realtime priority
[    2.828815] stm32-hash a03c2000.hash: Algo 0 : 0 failed
[    2.834144] stm32-hash: probe of a03c2000.hash failed with error -22

I don't quite understand why, we never get to the tests...

On Fri, Feb 24, 2023 at 6:52 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:

> v2 fixes potential state clobbering from the disconnect between
> hdev->flags and rctx->flags.
>
> ---8<---
> The Crypto API hashing paradigm requires the hardware state to
> be exported between *each* request because multiple unrelated
> hashes may be processed concurrently.
>
> The stm32 hardware is capable of producing the hardware hashing
> state but it was only doing it in the export function.  This is
> not only broken for export as you can't export a kernel pointer
> and reimport it, but it also means that concurrent hashing was
> fundamentally broken.
>
> Fix this by moving the saving and restoring of hardware hash
> state between each and every hashing request.
>
> Fixes: 8a1012d3f2ab ("crypto: stm32 - Support for STM32 HASH module")
> Reported-by: Li kunyu <kunyu@nfschina.com>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

I think I understand the direction of the patch but it seems
the pm_runtime_* calls get unbalanced since now this is taken
in
stm32_hash_one_request
 -> stm32_hash_hw_init()
    -> pm_runtime_get_sync()

But no corresponding
pm_runtime_mark_last_busy(hdev->dev);
pm_runtime_put_autosuspend(hdev->dev);

Exist anymore? You know the semantics better than me,
I'm not sure where to put this, I guess where you save
the HW state in stm32_hash_update_cpu()?

I don't know about the DMA case then though.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
