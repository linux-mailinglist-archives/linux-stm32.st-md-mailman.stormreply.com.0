Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E778153D
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 11:18:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9AA2C35E04;
	Mon,  5 Aug 2019 09:18:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E1CBC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 09:18:31 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE1D621841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564996710;
 bh=3y/xyKQqQxOI/5O7S65myq1HgXxKlZai9ugc4r5PFAs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZVGEXyWfKHiNU9ykvQl6iP/vhiDaIIbECZVQoz2dbKXg0o9tNCy9OFZbp1ZbwMw5u
 vtFxzrASGVSEXmSa62HUtsG05ILylao9uKfI2n+4eJuhzYlYWjorLeb1C2fe8A23w6
 pGRPWmqT9BT+nmjsc6bnzwIbMDRuMZZZ05gPQ21o=
Received: by mail-lj1-f175.google.com with SMTP id i21so78680386ljj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2019 02:18:29 -0700 (PDT)
X-Gm-Message-State: APjAAAWCYh87yh6Nz7c3Zuu3FoSAKi8n2LeYVtrnGKt/dU6LEiDdmdV9
 DISftcIPs0C0MFnh4D1LHSR1NgwXS6L4YYz7uHM=
X-Google-Smtp-Source: APXvYqzggkPHLZ3va+adONzA3B+P4PCDn3noO8lcrGqBRgo8WuH7Fq5Bq7XwbmzdzXRtDWDsIpDJCC30bufng4pCbXM=
X-Received: by 2002:a2e:124b:: with SMTP id t72mr78893429lje.143.1564996708108; 
 Mon, 05 Aug 2019 02:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190802132809.8116-1-yuehaibing@huawei.com>
 <20190802132809.8116-4-yuehaibing@huawei.com>
In-Reply-To: <20190802132809.8116-4-yuehaibing@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 5 Aug 2019 11:18:17 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfvMLehLn+iNOGDEFvsWc93eShUx0=8fn9JWiBOc7wpFw@mail.gmail.com>
Message-ID: <CAJKOXPfvMLehLn+iNOGDEFvsWc93eShUx0=8fn9JWiBOc7wpFw@mail.gmail.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: heiko@sntech.de, gary.hook@amd.com, clabbe.montjoie@gmail.com,
 jamie@jamieiles.com, linux-stm32@st-md-mailman.stormreply.com,
 jesper.nilsson@axis.com,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 herbert@gondor.apana.org.au, linux-arm-kernel@axis.com,
 linux-rockchip@lists.infradead.org, wens@csie.org, agross@kernel.org,
 thomas.lendacky@amd.com, antoine.tenart@bootlin.com,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 linux-mediatek@lists.infradead.org, lars.persson@axis.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com, kgene@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH -next 03/12] crypto: exynos - use
 devm_platform_ioremap_resource() to simplify code
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

On Fri, 2 Aug 2019 at 15:31, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/exynos-rng.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
