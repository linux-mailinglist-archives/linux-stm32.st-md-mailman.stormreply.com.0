Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D1255AC0
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 15:04:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 283DBC32E90;
	Fri, 28 Aug 2020 13:04:09 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04D26C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 13:04:06 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id t23so1224580ljc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kY6QohH0kHOg+QzN8imLnNqmKHUkcybm8RndPGRcKBY=;
 b=hEEhM6bXCEN77L0tGNTDS6zmOH04mOyuhnqNM5uPZYN0gYXTGXcdFAqeulpAUvxcWh
 DCCXZNQm2W0N8pG5Q4oIUMSHcG+kSdHUexRSjlZzGNpsRL+09rLkUl8e9Ty9YRfA8xg/
 zsviZhnOWi6K/8Se0ecZs49+o1JpUI0ouq1tOYIBK9lk72V2kJL3oTdKTp7G9JLHHmCA
 VJ/Py+m0DYy20mN5LcZ9yqol6X9R+XQ9ZjGCIZvBAxdw3UZj0mnfSalWOQd4EIPK36wE
 c7pd+QX7k2WKJoKBmSKL/j1M50mHmPityogf7HshbDgyYj4WAlQiauK+oot7jpk5Wut7
 R1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kY6QohH0kHOg+QzN8imLnNqmKHUkcybm8RndPGRcKBY=;
 b=GOfCX56ITkJlHEl2dVcIrET/zzgI2gVtBXHdDI2cxWqC4Zu/BBOjv46B72IDLvfJxD
 33+pOvR4vzT5L8d/4bUcKM29LAxILSGQ1Y3/TIHIGEeGlJ3DDPzhbS3gaLWSb9jjrSbr
 tAbY95YksstSCl0odB3twW8hgzI/p0ibxB6dGa6W3UZIEnv8tGQ+vUu828OGd92bZXH7
 cKc+k3mScIqydL+OFZ18XhtDsRhVksl2wkrAKhV1APIJNaaYRbkPyOixsKW7lZ0/kiet
 jgyep9Q9tKKooXxOvXRGI7ItOJma8Ryr7YX1hpCJ/OWaxWBUGX41mlJAzsriVFJV42iX
 3G+g==
X-Gm-Message-State: AOAM532fZYzr5uicuETnyXa1i6u8NOyK24t0XaeOAGJiBpJjAuBUCoiJ
 X/ziZj2M0ETANDIBx7LI8l2PwoP83AlNpXUypki80Q==
X-Google-Smtp-Source: ABdhPJwsd1zLLYUQfLBwKIUDzPngm5BPAn1Oi62bpRLI87FQeo/xi46FUBxuYdvnnmkfHALpRVoAob1SKb1fomVrKmQ=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr772794ljc.338.1598619846247; 
 Fri, 28 Aug 2020 06:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200826145153.10444-16-krzk@kernel.org>
In-Reply-To: <20200826145153.10444-16-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 15:03:55 +0200
Message-ID: <CACRpkdarHXwpNfVqODTn3ZZ02W5GTfynQDL3=Y+Mg8ytY8SOvA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Marek Vasut <marek.vasut@gmail.com>,
 Kukjin Kim <kgene@kernel.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 16/16] iio: magnetometer: ak8974: Simplify
	with dev_err_probe()
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

On Wed, Aug 26, 2020 at 4:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
