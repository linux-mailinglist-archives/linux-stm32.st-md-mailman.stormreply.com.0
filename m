Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9034372B6
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Oct 2021 09:26:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D918C5C854;
	Fri, 22 Oct 2021 07:26:06 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28E42C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 07:26:03 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id k3so3307818ilu.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 00:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xGW6THywkFBuOv9pHK/lIzKrkZB0E8ZIytUvD2+0Xw8=;
 b=Eh4hasD9RvEAh6ImQl27Ae2v7t2vwvorjoDgIoYVCE+rXO0eIBgQvFwbIQD/g7hjG8
 SSTAEDjo228I1eH+2ZxK0SNqiNxVzHLqlxLwDSAwsd18aQLw0b1mNmAb9all+hB2mt1P
 HtjnOE/qSbehdmf4XR7Q2K1EF4Es5SwxR3eVL7gO/+iHL/XLFauKArm0YveFUS5BOF6t
 JDpgpVP0CkCf1I9qARXL2F8saP3ocO6f3XRCFHfsLo/u+yY5EoF7iMCN4Xb1riPwcuB1
 azWIRU2HmiQ6tokGswRjYjrvzN7oI8HAkjpBXK3cqtAA0umeZIVp1MTovtBth4wAqrWx
 knzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xGW6THywkFBuOv9pHK/lIzKrkZB0E8ZIytUvD2+0Xw8=;
 b=49immcVzK8vbyqlaprGF2baEw2TXmjzDcYRyZRulU9jJ7P+EPK6YUhv7MPjixnEIal
 u35HtrW0X93xVZNHf0VlzIMmx4q6nzSDTWzyJYFEYhI/H5lyDaOCtT6qnPrh1ncshWyz
 S3H4MA8f7iAPOORN6s03as/UufH4grnhVxlvnL2kFD2DLGAODFwV5CIpAPppF7yq6UX/
 1FeP73xUmLu0o7m+Ft6/zr/DG1mH+SXVUVo+wClf73OkEVxpoKJJ45hpRl/m6UDYlAws
 rMy1hmALwKQTiT+X2Wl+e4iigIK04OjVGq2Aj/ECoV/3UnR2u1aGY1xhw08a9WpnzUSZ
 RWRA==
X-Gm-Message-State: AOAM530FlZjExs/poqSDaQBB4nl2RaJvLNUXRWusXDMtXqCEr59IrAl9
 cHPvByBeSz8ZXDf66LyF49/1xTfDJo30FF4C5hI=
X-Google-Smtp-Source: ABdhPJzptGfW29mWmQ2t1Ao8a4dPISAZrav5sOoX2pl1Jm+Kj5xoE3Qsw272r5sA9jxvbALGZVvbQPMQ5FuvNiZm1XY=
X-Received: by 2002:a05:6e02:164e:: with SMTP id
 v14mr6777429ilu.320.1634887561381; 
 Fri, 22 Oct 2021 00:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
 <1634633003-18132-10-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1634633003-18132-10-git-send-email-dillon.minfei@gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Fri, 22 Oct 2021 15:25:25 +0800
Message-ID: <CAL9mu0Jw99aeSmwy7gnY3XQK3V1V-C1-R8ET5jvSMz7niH=g4g@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, mchehab+huawei@kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, ezequiel@collabora.com,
 gnurou@gmail.com, 
 Pi-Hsun Shih <pihsun@chromium.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, hugues.fruchet@foss.st.com,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 09/10] clk: stm32: Fix ltdc's clock
 turn off by clk_disable_unused() after system enter shell
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

Hi Gabriel

I guess you are the maintainer of stm32 clk subsystem from [1], Could
you help to review this patch, just give a brief of the history:

- this patch was acked by Stephen Boyd at [2].
- reviewed by Patrice Chotard at [3].

Without this patch , the kernel will turn off ltdc's clk after the
system reach shell.

[1] https://lore.kernel.org/lkml/AM8PR10MB4785545DC980090C1E7D66B281009@AM8PR10MB4785.EURPRD10.PROD.OUTLOOK.COM/

[2] https://lore.kernel.org/linux-arm-kernel/159056850835.88029.9264848839121822798@swboyd.mtv.corp.google.com/

[3] https://lore.kernel.org/lkml/6915fa2a-e211-476f-8317-6825e280c322@foss.st.com/#t

Best Regards
Dillon

On Tue, 19 Oct 2021 at 16:44, Dillon Min <dillon.minfei@gmail.com> wrote:
>
> stm32's clk driver register two ltdc gate clk to clk core by
> clk_hw_register_gate() and clk_hw_register_composite()
>
> first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
>
> both of them point to the same offset of stm32's RCC register. after
> kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
>
> stm32f469/746/769 have the same issue, fix it.
>
> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
> v6: no change.
>
>  drivers/clk/clk-stm32f4.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index af46176ad053..473dfe632cc5 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>  };
>
>  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>  };
>
>  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>  };
>
>  static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 23,      "sai2",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 30,      "mdio",         "apb2_div" },
>  };
>
> --
> 2.7.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
