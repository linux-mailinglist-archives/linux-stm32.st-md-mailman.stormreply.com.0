Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F0B2FF6B0
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jan 2021 22:05:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF4B6C424BE;
	Thu, 21 Jan 2021 21:05:13 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25645C3FADB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 21:05:08 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id q8so4517375lfm.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 13:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZugsqJA8Q1yl6+4pzBVXRUwd28mrT2JYS1TJy5ykuI=;
 b=YZQNwK9UXQfz9pmNXG+BE9nTpQ1H3yg4Pm0NyVdfyCJei4NEyQk3cPtrjgVYXMsUVo
 sZmVCS33nXSZejVP6BWBFLZXnNgos5V6rjdEdEzEkx6XbE6+o7WAf+f9naTYJoA9sIqZ
 jM3zvaGq1f/rOnmDRHR0AExrBbzYlB18dk1u2tFKI+2MN1z5PsxKySH6pMKxWPrb0dsL
 wbtdnXQB0hj0KJYIJ3YljQs5SsvotZfi09SpNVapVNC/jiZaWXtVepOOM8+dQGOPT8DD
 v3kE6Efrsaail7nvexEiC/amqISp1CrHMjyCzwINhNxPNrBfixtDh8sl5KCkoPZI5N9C
 3IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZugsqJA8Q1yl6+4pzBVXRUwd28mrT2JYS1TJy5ykuI=;
 b=MVLe7vR24edUEzPOWA4xnZioGMpd1faEAceF0G+Vv/ST7UQFbV2nBzbKuEPRlQqUuA
 SnQT4A7SSXprwECA8G5mTZMgbNvoVqsXA1PrC1qOeCtnAs6hIPmKmpVNoHIXrYdu/ZJg
 J4qrK3HOtbUbpq+i6NQG6TLpbrf710lT+ONxvRn7lUN7sgefQYKRpOWD6x1AO25LRdi3
 slx3mLwNSGCkFJsl2j9o2kh5XF8yq9RRz2z4HFHQJxcJcJ63lsUa1EbkWENiH85J/TNZ
 O1FjK7hOSAkiMhKCdV4zejUPPh/aI4apd+b3TBK7H33o1MwD0wDp0YmypP52JilaNI0y
 kbuw==
X-Gm-Message-State: AOAM530qBJBOuElEpvjU5llVwMfIbkr6rJKlFKmnnF8CZ62zkF02DUck
 YpuDUrkq8g04j/UlONAbUQ4eP3nmpldDs2p2GIkPEQ==
X-Google-Smtp-Source: ABdhPJympICjXFgiTKputbVjOoWvR0HAhO3o4V0dJu/d9HzUmXivyzv2TH8oXsJx6QgTxw4WQsKRjZ9LH75RgC5N3yg=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr487223lfg.649.1611263107527; 
 Thu, 21 Jan 2021 13:05:07 -0800 (PST)
MIME-Version: 1.0
References: <20210116180424.57331-1-marex@denx.de>
 <20210116180424.57331-2-marex@denx.de>
In-Reply-To: <20210116180424.57331-2-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Jan 2021 22:04:56 +0100
Message-ID: <CACRpkdapEtphavg5zWgu=2trYg8LYMd31roHzfebsiyWFBn=uw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/4] mmc: mmci: Add support for probing
	bus voltage level translator
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

On Sat, Jan 16, 2021 at 7:04 PM Marek Vasut <marex@denx.de> wrote:

> Add support for testing whether bus voltage level translator is present
> and operational. This is useful on systems where the bus voltage level
> translator is optional, as the translator can be auto-detected by the
> driver and the feedback clock functionality can be disabled if it is
> not present.
>
> This requires additional pinmux state, "init", where the CMD, CK, CKIN
> lines are not configured, so they can be claimed as GPIOs early on in
> probe(). The translator test sets CMD high to avoid interfering with a
> card, and then verifies whether signal set on CK is detected on CKIN.
> If the signal is detected, translator is present, otherwise the CKIN
> feedback clock are disabled.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
