Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C07EE11CAD7
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2019 11:32:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DF4EC36B0B;
	Thu, 12 Dec 2019 10:32:53 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2999C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 10:32:50 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y1so1293130lfb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 02:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VWL9+V2LMiT9o2FJLi3yEGGm0mbcqGKTZCNZjA3DyVQ=;
 b=JHNgQG4JaflzNKZS6SjnLq+BGIY0xKcrhawJ4qSCLadAe7hUlYSTTM6yg9Y3InFPme
 65GvyKU8ZgeTTvHCUQpLz3gdVifxv2sx5EB0maUrWRtmXnyQeQ2RzH4e6AwIIFn/Ocv0
 HbafD0hIdo8H/uCHiT0TBp2VElIGTB/axXoF4ZoG9VakftAWgZS11IgoT8MI8CaJ2S5P
 2tfrszsvlyNzhBe6mtgHXMJKQChMyGr5KV9reluXUNs2LuGTjNveZegBli/WGzmT/qJ3
 sLkdgkiLdb9gNFrmBa8EmK7AzxkqHOHCD9MBb052/a9h6FU3fjQSTfjAoXXWV9ze1b1q
 ZwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VWL9+V2LMiT9o2FJLi3yEGGm0mbcqGKTZCNZjA3DyVQ=;
 b=aLE34JtR0x1OlJlevRAg4Qrzaqn6KeMgBMnO7b90OaLvrgMvvgGNWW3FckOAtBihTq
 5lnLYb+PB5km1pQQaQ7sWWMQTH83Hl9k7hljqpAyczSGBqF7tcsvXFXPyfBBZddyMPFq
 RAtwTclNLSBYStVXRfwbO4eZ5BBDk96G+OsMnMYfy3OV8y8nelvsbJGLLKFp1T/ivY36
 c58XK2frhm39Df+jmg3esDTdu9SGSzm0iasN90UiMhNYedOjSjPdT7Fo2+xHAcBHu/F1
 j7AiToxZzn4tq9w2lnNikjyiqOaVdwrwJANkCw0mxjEeaF/f3EGg/jz/JsgTEGQJAiR/
 b7xQ==
X-Gm-Message-State: APjAAAXmR4TMBFcH4rqIV45N7WVTLJPJCQnXpO5Vt09wjxex2mSq9EMp
 KIC16hrMOYKUVOrLPvxR4gT2S7S3bo9ALr0xCXTr+Q==
X-Google-Smtp-Source: APXvYqywDQNwDMe4Gb7wNrl8nlViHTFAYbbKR8mGbYLzjghxmd/DxWHrpL44HVqLtiyMfWxK6a/Gv0MgTOUFix3M9V4=
X-Received: by 2002:a19:c0b:: with SMTP id 11mr5269617lfm.135.1576146770206;
 Thu, 12 Dec 2019 02:32:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
In-Reply-To: <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Dec 2019 11:32:39 +0100
Message-ID: <CACRpkdaDaM6wSfeeo6NARC0VibLMWWDDsN2LbLRooih3uGTvog@mail.gmail.com>
To: Nishad Kamdar <nishadkamdar@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Joe Perches <joe@perches.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 4/5] pinctrl: sh-pfc: Use the correct
 style for SPDX License Identifier
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

On Wed, Nov 27, 2019 at 5:46 PM Nishad Kamdar <nishadkamdar@gmail.com> wrote:

> This patch corrects the SPDX License Identifier style in
> header files related to Reneses Soc pinctrl driver.
> It assigns explicit block comment for the SPDX License Identifier.
>
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

I leave it to Geert to decide if he wants to pick this up for
sh-pfc or not.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
