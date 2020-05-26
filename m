Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E43A1E1C7D
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 09:46:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C4B8C36B23;
	Tue, 26 May 2020 07:46:50 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8EADC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 07:46:46 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w20so4586928pga.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 00:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9hP2gJKDW99uKK2ci16iXnlfh+TatIfa89bbfH5MoI4=;
 b=IhzaWHQ1IZn6kk5fS4iMMRliwb3dMakoIny3kYQoKhPJfWBCrUDuqY1zF35nu+X3uM
 IIMZHSik2wI24wf1Rbv55Zfau50NYOZqwT5E3HJ44qFUyMAbvbwjtiMrX7FzQXecd9kx
 lGIyMAkM6o6NpxpWeGv6qArvRioOMHh8MYr9HAxc+AY0J3ndgjB/AAgwouQuApmwW/2x
 0i5kA8i2KdLS9Cry6afAJIVKO38W+8pxUNG0/aCJmn9FuhIrJGeaz0t9TNXu05wmWp60
 LvOyWZwuhdmVr8GBpjVVjopbyWV+x35/HsE+p0t5/nrUupNP/bELGe190S/g6BN5d+FF
 rd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9hP2gJKDW99uKK2ci16iXnlfh+TatIfa89bbfH5MoI4=;
 b=QkTzFsgrJUDhQbtOrJ0e0EXq3B8bJkSuidJTKR81BfRURAPa3aHSLnxxhzWrATGjxl
 YLaU7lP6LK0B2ykzjC/pYuPdU/+KLE2Y4gyK+yScOhU7BJWeJpaLA3REOvgyP0dVDHy6
 M9r347GS8ugnmgJ1NXzGOwXpy1kB2BTlNtPCrIOZVvm5/uqjG3mPXeyJHn+wrQJTeEEo
 Zm5N+ocW0EXmieE9bKk181B4A7bOg7NE/5fyJPYk3GVkUUQhZqFJ3qkCD0Q6avRsziez
 ls52EicvmHLuuH5p2MhkooV8qUCBHRsdQ8/oog7mgTf9t+b0oFmKoMq8VEIGIr4AeOeO
 8o8w==
X-Gm-Message-State: AOAM5314FClsSa9xyrjCyBaiSueYFzgqZcl9kbr6pbWvXEpHE2W/G858
 8jAR4QAHnAaNfC1JvG91nNEyRAg7u2CDeZDx3OQ=
X-Google-Smtp-Source: ABdhPJyxzAObFo2fGXgOG0DTaZEGiMDEiM/XhPzUWJLhBUpA9j5+1D9nbFN8JF/guHMeGKz5o2jOHBt1rP1W7jAGnnM=
X-Received: by 2002:aa7:99c8:: with SMTP id v8mr17942364pfi.36.1590479205218; 
 Tue, 26 May 2020 00:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 May 2020 10:46:33 +0300
Message-ID: <CAHp75VebSZa6mwAETnM0t42RQCp4iM6_SNjmy3TB48ixsGKV8g@mail.gmail.com>
To: dillon.minfei@gmail.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 6/8] drm/panel: Add ilitek ili9341
	panel driver
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

On Mon, May 25, 2020 at 6:46 AM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
>     This driver combine tiny/ili9341.c mipi_dbi_interface driver
>     with mipi_dpi_interface driver, can support ili9341 with serial
>     mode or parallel rgb interface mode by register configuration.

Noralf told once that this driver should be unified with mi0283qt.c.

So, what should we do here?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
