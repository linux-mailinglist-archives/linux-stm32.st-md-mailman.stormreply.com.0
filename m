Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0744FBB98
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 14:03:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28179C628A6;
	Mon, 11 Apr 2022 12:03:22 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0E0DC60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 12:03:20 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id b15so18095172edn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sryDvYgEFOGv4IJF4K9rpE4qtbHpyGvRB0BObkRxaW8=;
 b=ZeuqxHL/xUOhw5sAPzbxJiW+mJhv3tLnVd1zttqHoikIexQgEMDzM+4xsDCWR2apar
 oI7AhLc2by1lLL6ho7hSn8JKR0sJPmgqjVyY6s4nvpRusOCaM6VuF8awJGJy5DwRtODF
 aHOKshJCRPSvu3Rw3gD5QAC2273wgiNYnNUnXFnSIlgev7KYQOMwOhwS20E+aF/Z2FHW
 egUy+D/7mLCVl6M3fTm2PM15/ePGufZF1kt8lTTt20B25HTcm7jCI6sZhOiteX40Nqpk
 UdJMYBTyZ78iouZsh8cblU2innmiGIr3OJGCPQwRU9bLivSpl2avqwiu5C6YQ7aBxsqb
 afIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sryDvYgEFOGv4IJF4K9rpE4qtbHpyGvRB0BObkRxaW8=;
 b=Yz/hz6iNxUrkkiQhA/exX/83ywoAbCUERWkLv05WIk24trktY6vCyQEp4Amn6PF4yw
 jtX8K+Zgs1vvCfVvcvU9q30/+god1646iEMNHm7wAP72xbY3YGqjUhX7LfhiUY3Qf71s
 cmI7qcyQJqDHhl2f1CsQuBJCUqxgIJ//qXuKsDKi8n0tvUn0L2o8l4ZEu/NQECAodjJk
 P8NorGYEWr7rmat280E6iqu2B22bi1U1xMw7AGK3wp1ny29ZZYkfzoQC/8by1DgWlb9g
 GoP3Fl95MKpuSAkQPa6sL+RIOAj0LiBPM8NxqX04FfoyITJ+YZlhJBFz1H+8/hZW/4m1
 vV8w==
X-Gm-Message-State: AOAM530AvRzN2eJ400DvhBeVhSigWUmyHRjz/IcZTeoiXH4GMU3pEWMn
 o4jCty4xwC9v7os5uPq8ETh2NQ==
X-Google-Smtp-Source: ABdhPJwfxX3gqy6wbrPbt0StZfR/zFoOxk9BdsKT3mp55beZn2LBapIU+Ud3zwIytSzkgcRx+Htamg==
X-Received: by 2002:a05:6402:1941:b0:413:2b7e:676e with SMTP id
 f1-20020a056402194100b004132b7e676emr33445108edz.114.1649678600506; 
 Mon, 11 Apr 2022 05:03:20 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 vz13-20020a17090704cd00b006e86ff07609sm2854334ejb.33.2022.04.11.05.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 05:03:19 -0700 (PDT)
Message-ID: <9e168479-9fcd-d3ea-3c06-8d186e53a18b@linaro.org>
Date: Mon, 11 Apr 2022 14:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
 <YlBXSVyj88CqjGj4@smile.fi.intel.com>
 <3b527700-444e-1f6e-fee1-5cd6ed2ef7f9@linaro.org>
 <YlQXZ3Ye13rObMy8@smile.fi.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YlQXZ3Ye13rObMy8@smile.fi.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Marc Zyngier <maz@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>,
 Nancy Yuen <yuenn@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
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

On 11/04/2022 13:56, Andy Shevchenko wrote:
>>
>> Makes this change smaller so it's easier to review.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/log/?h=review-andy
> 
> That's how it looks like. Tell me if it is what you have had in mind.

Yes, thanks.


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
