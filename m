Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8676A6C3A
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Mar 2023 13:22:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CFF9C6A5F9;
	Wed,  1 Mar 2023 12:22:29 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39C59C6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Mar 2023 12:22:27 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id e194so104067ybf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Mar 2023 04:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l8Nz7GHrjsKkrFAhlS/NkKdyC63Tn/KzsoBmeKFSXCw=;
 b=w+EvywvXa3hPR1XRdg3fT9+2+j3fg01b9pb8YjCHXKBafIgJSWWztnhMRN78aDH1Gl
 tIeHLL3AoQD9YS0rnC3Aier7ZvdJU+ue3uDqfCYSye3KgmjuM/ws69r9wlmAQaReSTX3
 NElMSx/U74nuneh6v1fjqAVQeC0wPYvKtaMBRWpF+L4TMLK7WYs65RM5vWaPAtuTt+Kr
 ypXDt+vTfG8L73u0jM6oN5/3R9TgvRBMmSEKL0gUiJU2UOX/EqKdHgRjEi8pCu6A9TmN
 uU4ER6e0X5mDuDbr9vmHJy4JhNb/OXaJjONAEFZ35cJpmmzKjdFofE9FJ0L0MZ61wWQM
 M2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l8Nz7GHrjsKkrFAhlS/NkKdyC63Tn/KzsoBmeKFSXCw=;
 b=HFU0J33iZLqh1o+s27eFYnEmcoazg1Z+cRY0Ls4mGcs7FeX+ZSZGR4eS8+hi6oC01S
 oq6Wr7eRczg5rklLU83ipIpQgvB2mPx4j18HiAOufAhhsVyP+MV3affJ1V6QnIGs3+gR
 vsFMJPprVtbMJKs5QkfnOKZLMmS4ABsHknja5nnYDa9GE2xTB3pw1yi0T5/zOgBjkyNw
 dabpnOfjiTqGRIcrzQe78YcxRVLbiTn9g7Ftr2dH1a1jpyUAAUpXfAEXg2p+Tf7h6ddS
 BzBKUILdEA8TezRU6XrVfYSXCenD+S0H3IpR0xhTVK4qahsFav/feNcAouxPOC+EPnqW
 L7Fw==
X-Gm-Message-State: AO0yUKUbWzXTCL8RiG8jWsQ6VKA31epqh+dss5NzyFdPM4o8z0Kz8SkN
 r+EYO7P+KhVwABFy/9zGkmrhS6N+8VGJasDoqO7mIQ==
X-Google-Smtp-Source: AK7set/3PSECcYx5SDkKwfxXxVfKsTGwUn5f13PiuIuMv3U3cT7CDjiLP8yKUH8w5up+OiziuGYjkVabAyYxu7cUyWk=
X-Received: by 2002:a05:6902:4d1:b0:ab8:1ed9:cfd6 with SMTP id
 v17-20020a05690204d100b00ab81ed9cfd6mr2429104ybs.5.1677673346062; Wed, 01 Mar
 2023 04:22:26 -0800 (PST)
MIME-Version: 1.0
References: <Y/cy5wUtk10OahpO@gondor.apana.org.au>
 <CACRpkdYyB=-UnE1bmdVszSSB5ReECZ0fUoWJX6XtYbKHEe52tA@mail.gmail.com>
 <Y/c7iVW67Xhhdu8e@gondor.apana.org.au> <Y/hQdzsKMYgkIfMY@gondor.apana.org.au>
 <Y/yIbPBVCPx9K/0s@gondor.apana.org.au>
 <CACRpkdZC4z2Xng4=k94rmM=AFzNzTdXkvtkArMnK7afouz=7VA@mail.gmail.com>
 <Y/3FYZJeLE7DVPBf@gondor.apana.org.au> <Y/3IA4OjmUmjMgh1@gondor.apana.org.au>
 <Y/3N6zFOZeehJQ/p@gondor.apana.org.au>
 <CACRpkdZ3rCsOWqooNkPL6m7vZ2Z2Frh2sdxruKhrS0t3QHcSKw@mail.gmail.com>
 <Y/6sCC2nH0FcD6kJ@gondor.apana.org.au>
In-Reply-To: <Y/6sCC2nH0FcD6kJ@gondor.apana.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Mar 2023 13:22:13 +0100
Message-ID: <CACRpkdYN-SDfxXKLt3HWGVkWb3V1rABwvWuytwDrzfTqm81fNA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v4 PATCH] crypto: stm32 - Save and restore
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

On Wed, Mar 1, 2023 at 2:36 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:

> The failing vector is the first one where we save the state from
> the hardware and then try to restore it.

Yeah that's typical :/

> Is your device ux500 or stm32? Perhaps state saving/restoring is
> simply broken on ux500 (as the original ux500 driver didn't support
> export/import and always used a fallback)?

It's Ux500 but I had no problem with import/export before,
and yeah it has state save/restore in HW.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
