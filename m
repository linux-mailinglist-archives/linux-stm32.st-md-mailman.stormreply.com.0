Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C5F60A584
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Oct 2022 14:25:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA1BCC03FC6;
	Mon, 24 Oct 2022 12:25:25 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D8BAC035A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Oct 2022 12:25:24 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id a18so5964167qko.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Oct 2022 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kVYj3QCBceIQ1q0wupJzLP0eSYUUbr2KRyu/kK2/7zc=;
 b=G0DWAFKOqyqQFdFIXlj6kLBpRnL5JYzlLp0E6WVy4pls3/6j1AeLtxzxBZ+jhLV++/
 PxHwC8uWse4I21Ym1lUCctWJicItZ9iEVOYX8Zcr9KIfD34MRXA+/Po28atn5QAX6ZNy
 k0v0iZYVXFg+8BTYHuXTpqhOYFcbX2bEFUF5ZlIPXjXBnibhTJnVqr8Xf0zyHHEoUwMk
 BuPuwWFDZdb7LxzX9D/z4tHwdMqfwK8ojwOnJJ9APk1xpHu9coKLCb2z+3XGXdrbx4gD
 6cS65pGdMJEyUJ+/nb33LGpxrL9SaqhVoD30uprXtaUUNXFTopDYnugtpAsxcLkQNqcU
 qAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kVYj3QCBceIQ1q0wupJzLP0eSYUUbr2KRyu/kK2/7zc=;
 b=rnSZOlHB05AxwUKA6wYfvJlxJ/azI88/DtEGYbKD8NHYphJAE9igrfn3gpgdgVKQ1c
 aAc70fjDZIpyb2eqIWwHN8K9e+/izAwk1oMM9RLpAAJupi8ey5148LjmaFFStb8PlJ8R
 PrpWXRdxGKq12PxB15XVZ/CbbfSKt7ZhReXcM1a9dZFxBvRGPmU7U6BbrplMixl10cZv
 6EMm0as8YJnA8ugqW02rF53+0krfQ3RmpEmWLf1KGz6tDlsBGE0yQ56EwBWO9NBvqJex
 Ct10WqpX7OsY3FEKnaa4i0FE1n4hKXV494f0Lv7NIshvxQhgX5uVbbThdn4mKXpXBYf2
 Kosw==
X-Gm-Message-State: ACrzQf0Rvc1a8f+bKJEVHyb9D0BimqcC3cQKIIVSeI8nEFYqWrydIrPq
 ZZPePSIc6L53fzClPzhwfPzNuA==
X-Google-Smtp-Source: AMsMyM6WG2RrPBdlHGOnuUF5Zn/OxURzRJxpLn8hbsfkyCG52+3lz7p0PbPJNXd2mLDYhFv1n98JaA==
X-Received: by 2002:a05:620a:22cc:b0:6ee:3e43:ac40 with SMTP id
 o12-20020a05620a22cc00b006ee3e43ac40mr22841775qki.454.1666614323567; 
 Mon, 24 Oct 2022 05:25:23 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93]) by smtp.gmail.com with ESMTPSA id
 f4-20020ac84984000000b00398426e706fsm12571885qtq.65.2022.10.24.05.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 05:25:23 -0700 (PDT)
Message-ID: <41060ee4-0103-3c09-632b-81af396c0a06@linaro.org>
Date: Mon, 24 Oct 2022 08:25:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-1-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-1-arnd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org,
 Guillaume GOURAT <guillaume.gourat@nexvision.tv>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Christer Weinigel <christer@weinigel.se>,
 Arnaud Patard <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-stm32@st-md-mailman.stormreply.com,
 Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org, soc@kernel.org,
 openmoko-kernel@lists.openmoko.org, Ben Dooks <ben-linux@fluff.org>,
 Simtec Linux Team <linux@simtec.co.uk>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [Linux-stm32] [PATCH 01/21] ARM: s3c: remove all s3c24xx support
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

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The platform was deprecated in commit 6a5e69c7ddea ("ARM: s3c: mark
> as deprecated and schedule removal") and can be removed. This includes
> all files that are exclusively for s3c24xx and not shared with s3c64xx,
> as well as the glue logic in Kconfig and the maintainer file entries.
> 
> Cc: Arnaud Patard <arnaud.patard@rtp-net.org>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Christer Weinigel <christer@weinigel.se>
> Cc: Guillaume GOURAT <guillaume.gourat@nexvision.tv>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Simtec Linux Team <linux@simtec.co.uk>
> Cc: openmoko-kernel@lists.openmoko.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
