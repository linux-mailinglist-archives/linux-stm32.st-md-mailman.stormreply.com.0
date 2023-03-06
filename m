Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B85F6AC306
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 15:21:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8F4DC65E59;
	Mon,  6 Mar 2023 14:21:03 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DB9FC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 14:21:02 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-53d277c1834so10953577b3.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Mar 2023 06:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678112461;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5dOWzz5ptG78/24FUVPQGUEThQ6H9diL9d3zhvn+uWM=;
 b=GNs48ysPbT/xZ24D4CfgtbT9TZY3jSruyqLWF5Fty1geh6KAQp8eXevTTOfRrxGoqR
 mEG1UOzDvKmcE14L7+UEteRTt1OAXVAa2ExjPl98v7DlH34ZFXtGgrBBr3FTBs5BCqgc
 xhBv7a5nSXvLqYxurnCASKlNTk/gB7RxuxujOSiRFBjGXExeWMO/WKqXI8LzgfDw7jvw
 z65e6Xw0SRWVGgPKZkBREn9O6AC5oGztdhduwBZVu3cH05+XgSWEINmgjl0FRJorH9sg
 eggxDRSs4XVFSNvXGkZBQbbXObC/ezaFPG4NiFrb8t6yZ6nZ7LCs3kSMVTOCqsf4WoqH
 3v5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112461;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dOWzz5ptG78/24FUVPQGUEThQ6H9diL9d3zhvn+uWM=;
 b=b6/TEDoWY6DDqv2Mu3qVc3WwT8Bz1KSSXvBw1dDL13I98K4OOckdc8Wnjq/lGgwLY+
 HPryxM44dqH5pQ+KAUZ7t4kCaspiiL/BPldNp9dnTyr34D1oLkry/mnO1iQC/nlGvd8X
 xxGVneFlncyzly57u4h1BIJUAW+KebNx9EujX1Tst/BwLj8nK+ZkF109wG8FzmArvGCg
 Bjdw8hiW3CqDpoSpD1PiK9Aw6kfeqNfuaNEfBdTGyuulae3jwaWzUioymbM7g0f+C9/v
 RhIfYxMDc+FI70O88nmeVJ/08Kio5ujZsSZ8ZFVaxpI2ePxXiORVxXD2XgVNgN8hcBQ3
 nC+A==
X-Gm-Message-State: AO0yUKX7yTKyUumcyFfOqNyda8e2JhLb10bgIdij1QsGAzpCAljv+Whr
 twKY6LwUjVaXyiqnzsPLcgyiwtFImCaQ9nJd37iw8A==
X-Google-Smtp-Source: AK7set8qwioBxXmsDhA0H0TuRhZ8UNvJ2+iD4V1ti22S71JgWl+a31bTY+XLGka4hSvMtw5SMO+aM+npxDywx06BCDw=
X-Received: by 2002:a81:a12:0:b0:533:9d13:a067 with SMTP id
 18-20020a810a12000000b005339d13a067mr9186983ywk.3.1678112461287; Mon, 06 Mar
 2023 06:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20230227205131.2104082-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230227205131.2104082-1-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 15:20:50 +0100
Message-ID: <CACRpkdYLRyAzRuQDe2PZxOGQG_YwmE2YNnE8UDcj_c+Nt0HH5A@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: use dynamic allocation of
	GPIO base
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

On Mon, Feb 27, 2023 at 9:51 PM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> Since commit 502df79b860563d7 ("gpiolib: Warn on drivers still using static
> gpiobase allocation"), one or more warnings are printed during boot on
> systems where static allocation of GPIO base is used:

Patch applied for fixes.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
