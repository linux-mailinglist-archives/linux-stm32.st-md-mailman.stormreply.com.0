Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E56EC6A24F4
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Feb 2023 00:23:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B19FC6904B;
	Fri, 24 Feb 2023 23:23:14 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 299F8C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Feb 2023 23:23:13 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-536cd8f6034so20803677b3.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Feb 2023 15:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JJloBPukjosp0Co3bwwIxo1Na9CysMVJH+mDRCTcgY0=;
 b=mQfsAqFRu1lR3UwE74SBhH1BARt50OxJKOy+g64t4XNTrgyQCrPnHRedv9N0jlLotd
 IxIJ5XI8j43YBOv3tqgCss8qU9C76Nq2l6JYpY6tFSkdFR4EWZHP05jRFVT+N/YiDeVx
 5NPEV7R9weBdjpzSFrAAQzYhI7dFyXZZmAIwFu+8jG4CHZsoUiR7gUV+pBpigPhcgBiu
 zgrhXu2WWGrwvQLQY0KoVDxLSn3BAWGf92VCPXJpBNqv5t1rSTCoBU7el3zEC8cREBQt
 AYQXi/a8PcdopK+yYyHOOZPfINcmsv0J4A9HFBCXFR0C30ERpi0nYBaIeExEv3zRMh9j
 MMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JJloBPukjosp0Co3bwwIxo1Na9CysMVJH+mDRCTcgY0=;
 b=aeRX5I+vFs+SrqcOVxxbpO4Lijkf1LQsNOFI7d/Qi0Z0A4QMDwdKVOZHL5d5kXDXZS
 Wpb1X7xjbuyiqVzujSZzMqUn493nnEYXFz/Cv7wvGN8pESbLLPVauQnKm+lKzry16yNv
 pXGHv+mbJ/jvW6sC//f18nIpnqqNXQ7LlDzYuEk9MepmlXCby785dugmCOABQFZaSTZO
 9RQi51r+80b3opAqK4W0SS8O7felwgrPIdh64z1yePa+ihdkA0xkpO7dgKyKoI+lMdcd
 2MKl30h6Dhawr5mdd5GiOewpogrN9aW7mpfeOSp47KH1wHUiyOqaMpUpkWBjggIyeH9Q
 0hPA==
X-Gm-Message-State: AO0yUKWsEuUNjcAnwsleWn81DI4EX6/DOgrWspf8z+KrtI4UX7OHtIYa
 BqrjxmiveQ8By0n5Es6+1QJeCv+qJAmrVeYjuzA9HQ==
X-Google-Smtp-Source: AK7set80l9b7wx0n0L1HwF0zisFs/rqgF9dYT4DpqFQ2vP3QBA8LDn1hWX0f5G2GLMcFuJw2CDgOl69eMN1vThG6DA8=
X-Received: by 2002:a25:790d:0:b0:9f1:6c48:f95f with SMTP id
 u13-20020a25790d000000b009f16c48f95fmr4133553ybc.5.1677280992025; Fri, 24 Feb
 2023 15:23:12 -0800 (PST)
MIME-Version: 1.0
References: <Y/hGU7r56Phsz3wN@gondor.apana.org.au>
In-Reply-To: <Y/hGU7r56Phsz3wN@gondor.apana.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 25 Feb 2023 00:23:00 +0100
Message-ID: <CACRpkdbMXKeiHPCSdupFRd50WjcidT22odYuu-VNvHYgeuYTrA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] crypto: stm32 - Fix empty message checks
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

On Fri, Feb 24, 2023 at 6:08 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:

> The empty message checks may trigger on non-empty messages split
> over an update operation followed by a final operation (where
> req->nbytes can/should be set to zero).
>
> Fixes: b56403a25af7 ("crypto: stm32/hash - Support Ux500 hash")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks for fixing this Herbert!
Tested with extended tests on Ux500 without problems.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
