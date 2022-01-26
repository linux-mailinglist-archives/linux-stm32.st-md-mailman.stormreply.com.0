Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17749C3ED
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 07:58:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7A2DC5F1D8;
	Wed, 26 Jan 2022 06:58:49 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10F54C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 03:30:14 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id 71so11032361qkf.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 19:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7anDpLimRE6bYis5gbdpa/RPki6eh1XfOHxrRk/P/4=;
 b=SXRlHFjRWC2Mv38MUu2FfMqDEb49bJZfxYE559Kw+D0Pn2YltH77SpBW3HH0YW5AsE
 m8kzbCMD9MZIkkdaMBt1JMXzZvL87DNz+apl6ePX/TZd6D1vEa2xLP9paVzPlpB014h9
 6RZ8KymN/gMgkdABfFHWVpzVAjSf0rYQjS5yktG4rHR6VGF8OAEdq4nqpvvJE1pRreRm
 qEtmS903LkbFXgqIFXymoOB30fFzO7Q+H8PFLqPdEYHjfqzuqV+Z7QsD3pCwq/2lJ9gm
 h+TZI7RIh7QW5QG05fDEDYNnEhfg5DP4DhdGFoRo5ptPvIqzokYrOMe0xQ5f3KanUOae
 L9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7anDpLimRE6bYis5gbdpa/RPki6eh1XfOHxrRk/P/4=;
 b=yZ7HtQzHoHAckwevHxY6EQiCWntggL6q6tGTFLVwqpJNXMjBVwKsLvPIIj6Nd6nekB
 LsSLCBWPZlCqpZkY8t0HWyfPXyEvNXfemXZH5MzdnnM88RL5GqUbdDF+sBvmmbEDXXWx
 f6YeULCGRR1u0WJKCFlLqfznXjdhXwstZXuzjJK2S1YzhH6S+ysA/eSjxT4mNzsBTQcS
 Dc9sgjkMLEtdA75nI7g0OOn2XYdRxeZaSTv2fuAErtn6OHLW4JaD5hwwr2FHWmEx8IgQ
 bb++BLCSf54i+9Z+DL6pTWKXX12o1KZUYswnUHHKevP8FkypBYvRKzJIDPqtVwF+uUvI
 LlXQ==
X-Gm-Message-State: AOAM531zSIFqa2FJvXz0feAl9dqgLhkkpq1cTxxtUpTruu9xnNluOxYq
 V5ouZvbPVKA35RTVcuowFTsLZ4hA1fc0MvZYPEE=
X-Google-Smtp-Source: ABdhPJzOxLW8ANKOJuqP39xeWiTHWhbAJym/4GNx7fbso6asTpJBhG97tat7EMYA2eWqagLzlBUDXMJW3yhDFcy0HzY=
X-Received: by 2002:a05:620a:d95:: with SMTP id
 q21mr16790410qkl.74.1643167812983; 
 Tue, 25 Jan 2022 19:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20220125021353.GA29777@embeddedor>
In-Reply-To: <20220125021353.GA29777@embeddedor>
From: Baolin Wang <baolin.wang7@gmail.com>
Date: Wed, 26 Jan 2022 11:30:55 +0800
Message-ID: <CADBw62opvW1kdZbjxc0SBidjn0teYLsrfxTqfKoua6x9O84Neg@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Mailman-Approved-At: Wed, 26 Jan 2022 06:58:48 +0000
Cc: Ohad Ben-Cohen <ohad@wizery.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-remoteproc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH][next] hwspinlock: stm32: Use
	struct_size() helper in devm_kzalloc()
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

On Tue, Jan 25, 2022 at 10:07 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
>
> Also, address the following sparse warnings:
> drivers/hwspinlock/stm32_hwspinlock.c:84:32: warning: using sizeof on a flexible structure
>
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

> ---
>  drivers/hwspinlock/stm32_hwspinlock.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
> index 5bd11a7fab65..716ad4401249 100644
> --- a/drivers/hwspinlock/stm32_hwspinlock.c
> +++ b/drivers/hwspinlock/stm32_hwspinlock.c
> @@ -73,15 +73,14 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct stm32_hwspinlock *hw;
>         void __iomem *io_base;
> -       size_t array_size;
>         int i, ret;
>
>         io_base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(io_base))
>                 return PTR_ERR(io_base);
>
> -       array_size = STM32_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
> -       hw = devm_kzalloc(dev, sizeof(*hw) + array_size, GFP_KERNEL);
> +       hw = devm_kzalloc(dev, struct_size(hw, bank.lock, STM32_MUTEX_NUM_LOCKS),
> +                         GFP_KERNEL);
>         if (!hw)
>                 return -ENOMEM;
>
> --
> 2.27.0
>


-- 
Baolin Wang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
