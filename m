Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E56A4D2B
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Feb 2023 22:28:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EECDC6A5EA;
	Mon, 27 Feb 2023 21:28:51 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B289FC6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 21:28:49 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-53916ab0c6bso214586667b3.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 13:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KmeRELRjX+toI8U9S0q+sHldmJmMtE+gM2tXQFayu+U=;
 b=y4E6zHRqFiXuN7c7PneeDu+wNuShz4nVMZLDBPxHPc3IA1/g6oiV5bwS1dwa2qJlig
 KK4dWSPTjhffcVsaO4aTSzFFcUYefVckve3Lqz/d23Ku1SkxUs2z95BXpGkjq0SBaGDR
 xikjSnYwK3gGAR02DOI66/HgvXTQaH7Z8BsB8Nl057AR/dZ0ooaifnLjYdXRJc9YhxUZ
 cIQ1U9NO8IuUbe7aSJuaGMQsftOEbRyzhzqMum27EV68+cp4U1hkmPU6Gk2hwEqhr7+z
 867smwfEWVpn5Clzl4UCKbsxtFx0VU6oT1hlR5vB9Id0crzEpWjB5n42WVV09TrTo5HJ
 WsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KmeRELRjX+toI8U9S0q+sHldmJmMtE+gM2tXQFayu+U=;
 b=gXMvVdR0LlVXh/zO10z5ondYh01b0MDVPMXe/MYAfJ72cMFTnEkbnBe6JkKsaQuMSb
 FYcTHQxg2UJ47f//ac9AyjAMvQo+v9w+g4OmM3WxYoapORhxdgLtpnRUNdjrsKJCF728
 Edy60SAg+k2g4N+74rtwxwgzZuq+kEBk8rAYOfbbu0LgxQC9zvsx2TwSS5yHIsSlefDC
 sLWj8Ozf/QcG7iP2o1nWAC8reidJK2j/7aCbI7PYdZcGgZVP4qXd1EqrEdYSr08lrRrs
 9d1uStLLnVtG3uEtmHE7wa4NW0SYtfjPQ+OHQkc4JFSpDqz8sAnw1ZoM4TZBQ5qeZKrq
 ZoAA==
X-Gm-Message-State: AO0yUKXBw+UT9HJ04xAvzVZvpxdRBks714tm9LbH//CZRl5DdJi17jqC
 eIHvPcWd1wMmSkYBrmmnBQY/VhLKUrzYws1ETQIr/w==
X-Google-Smtp-Source: AK7set9Fm6aG84DkHYFF3B61/XmBl2EHBKxyDQxJVBl73mnj2YUhHJ2iyh2VMkT65oKlT4cTP/s5LNQWjMHpy1cdbI4=
X-Received: by 2002:a5b:8b:0:b0:932:8dcd:3a13 with SMTP id
 b11-20020a5b008b000000b009328dcd3a13mr105010ybp.5.1677533328652; 
 Mon, 27 Feb 2023 13:28:48 -0800 (PST)
MIME-Version: 1.0
References: <Y/cBB+q0Ono9j2Jy@gondor.apana.org.au>
 <20230224231430.2948-1-kunyu@nfschina.com>
 <Y/cy5wUtk10OahpO@gondor.apana.org.au>
 <CACRpkdYyB=-UnE1bmdVszSSB5ReECZ0fUoWJX6XtYbKHEe52tA@mail.gmail.com>
 <Y/c7iVW67Xhhdu8e@gondor.apana.org.au> <Y/hQdzsKMYgkIfMY@gondor.apana.org.au>
 <Y/yIbPBVCPx9K/0s@gondor.apana.org.au>
 <CACRpkdZC4z2Xng4=k94rmM=AFzNzTdXkvtkArMnK7afouz=7VA@mail.gmail.com>
In-Reply-To: <CACRpkdZC4z2Xng4=k94rmM=AFzNzTdXkvtkArMnK7afouz=7VA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Feb 2023 22:28:36 +0100
Message-ID: <CACRpkdb3xVYspjHTZ+z8Xh0mgd+Ht3VCA_F6xon90gyK-bdPhQ@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v3 PATCH] crypto: stm32 - Save and restore
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

On Mon, Feb 27, 2023 at 10:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> I am trying to debug!

I am confused by the use of the state flag HASH_FLAGS_INIT in this
driver.

In stm32_hash_write_ctrl() that set up all the algorithm properties
this flag seems to mean "initialized the control register", as it sets
the flag after initializing the register and then does not write it
again if the flag is set.

I wonder if this is in line with the crypto driver expectations of that
flag.

I am wondering because at the end stm32_hash_dma_send()
you set this flag, and that function calls
stm32_hash_write_ctrl() first thing it does which will set the flag
unless it was set already.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
