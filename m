Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 821484A7AB
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 18:53:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DBBFCB51F7
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 16:53:12 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45342CB51F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 16:53:10 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id t16so7982745pfe.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=IqqtXsFGosoxNpPkm5wyCgfinoqyhByKBZjMuz4MB0I=;
 b=bg323twPxByid8peFGN7CaP7DYTzxD48CEFt6vzKFLuZr27ZPVeYR9aqapgK/NZyMX
 VwWDxuPluBaWMti4Db1jhMO8vU/6BpjUYDcDWPDqPIvC8V72JIX4y5qjBmafMOwLeDC+
 ex3OfhlOOmJs9zSa/1f/dp42YA8jMBbipGqeaijIyJMFO3zPZKzEYTlm6JJQaYMvayp0
 YcOwru57r9aSI06mvYdo4y0QlmqTtTz7ltIdOozdK1wEgu14p/fq2LSvG9qOBut3BD8o
 fU4dXkm9gaS6lKhpmdzsnMcIDNm+U2NyMlAqoMSX6bh2OonBDJ48eTnIkbyGgA+1Ugg+
 5hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=IqqtXsFGosoxNpPkm5wyCgfinoqyhByKBZjMuz4MB0I=;
 b=kQOcGB3F0Nq8EH32QnOwW6CIA1cErVSnTm5XodITRwfqhMyh86Zb6dV5LiLCwUQnqL
 edz0zbejNHZfAgL4CMjaIEJAWMNajKQoXAbWknPqeg4V+NMN6zqRObqJxyvzLaYPY+1m
 L1y3VZPv6vEwNAnel1FjANdPQ5Vve82Z/+SvchDYDKG05LzexR1n5O3dt5TFGjX2keNz
 RHxQW3HUMg5G3hDFzWmBiMIXSw1Z+p+JggOT4ENQjMVZpKjvSlbcimh9ek1d1o8lk+lU
 6ydJqgTyfpvQ/xscyGRNOUfHSYFHb9mLE59oqzsrEU3drm1WqgUs2vhNx+Q/5XOCcvQQ
 Onag==
X-Gm-Message-State: APjAAAXkCq/zI7tSd3EPvje7IGFX1FAMqQWbZ+WZ075YoM+BmXZ14xYZ
 gCxPW7OeNTUTP8yc+jYW+DaI/w==
X-Google-Smtp-Source: APXvYqza2rYN7tr43Lk9Mo1yoxZIdHHve48RruCrOAFPMAW78pCSNW6feYT0xc+hh4kEhI6LzewVVA==
X-Received: by 2002:a63:4a1f:: with SMTP id x31mr3594318pga.150.1560876788415; 
 Tue, 18 Jun 2019 09:53:08 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 a11sm15966693pff.128.2019.06.18.09.53.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Jun 2019 09:53:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "kernelci.org bot" <bot@kernelci.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "David S. Miller" <davem@davemloft.net>, tomeu.vizoso@collabora.com,
 guillaume.tucker@collabora.com, mgalka@collabora.com, broonie@kernel.org,
 matthew.hart@linaro.org, enric.balletbo@collabora.com
In-Reply-To: <5d089fb6.1c69fb81.4f92.9134@mx.google.com>
References: <5d089fb6.1c69fb81.4f92.9134@mx.google.com>
Date: Tue, 18 Jun 2019 09:53:07 -0700
Message-ID: <7hr27qdedo.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, "kernelci.org bot" <bot@kernelci.org>,
 netdev@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] next/master boot bisection: next-20190617 on
	sun8i-h2-plus-orangepi-zero
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

"kernelci.org bot" <bot@kernelci.org> writes:

> next/master boot bisection: next-20190617 on sun8i-h2-plus-orangepi-zero
>
> Summary:
>   Start:      a125097c8410 Add linux-next specific files for 20190617
>   Details:    https://kernelci.org/boot/id/5d07987659b51412add51503
>   Plain log:  https://storage.kernelci.org//next/master/next-20190617/arm/multi_v7_defconfig/gcc-8/lab-baylibre/boot-sun8i-h2-plus-orangepi-zero.txt
>   HTML log:   https://storage.kernelci.org//next/master/next-20190617/arm/multi_v7_defconfig/gcc-8/lab-baylibre/boot-sun8i-h2-plus-orangepi-zero.html
>   Result:     ce4ab73ab0c2 net: stmmac: drop the reset delays from struct stmmac_mdio_bus_data
>
> Checks:
>   revert:     PASS
>   verify:     PASS
>
> Parameters:
>   Tree:       next
>   URL:        git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   Branch:     master
>   Target:     sun8i-h2-plus-orangepi-zero
>   CPU arch:   arm
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     multi_v7_defconfig
>   Test suite: boot
>
> Breaking commit found:
>
> -------------------------------------------------------------------------------
> commit ce4ab73ab0c27c6a3853695aa8ec0f453c6329cd
> Author: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Date:   Sat Jun 15 12:09:31 2019 +0200
>
>     net: stmmac: drop the reset delays from struct stmmac_mdio_bus_data
>     
>     Only OF platforms use the reset delays and these delays are only read in
>     stmmac_mdio_reset(). Move them from struct stmmac_mdio_bus_data to a
>     stack variable inside stmmac_mdio_reset() because that's the only usage
>     of these delays.
>     
>     Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>     Signed-off-by: David S. Miller <davem@davemloft.net>

This seems to have broken on several sunxi SoCs, but also a MIPS SoC
(pistachio_marduk):

https://storage.kernelci.org/next/master/next-20190618/mips/pistachio_defconfig/gcc-8/lab-baylibre-seattle/boot-pistachio_marduk.html

Kevin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
