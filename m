Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63B6D50C9
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 20:38:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE78C6A610;
	Mon,  3 Apr 2023 18:38:00 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D7B1C6A60B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 18:37:58 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id cn12so121145077edb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 11:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680547078;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aBrToP8ip8ocuqQF5W3QQfJWFoKsm6DBA26HLC3P3NY=;
 b=jH3iD00emCIeIOQAy/2nwD+lALHu/U3KzksgBkyiZTqngR4P5+z0T6Gdvia/0QPjFj
 xWRmH5Ly+OrRaA4xl1BrbIaJS0ZIMUxGGXOaX8k3lKlNaiNhEY4fc3R/h66sIn/qK0AI
 Jh5gjyYgdlN/ZEohhKH+bLPaqmTcdiXDtj4m+28dXNwNt8k1PnHm3HIRGJqsqd1Heehr
 SfPD/xqYnu4Uw4Rlv1wHjnaRsYPpS0plbmbA0tqewf2yKYaQCwoarKqMjE+6XoXQW2Mo
 Y0JJKxoLE/a15nR5PbP7DpLpMrZFfsb3J4osANE31UFmylgSUgRr+dE2C2+l4kULkWuz
 bdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680547078;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aBrToP8ip8ocuqQF5W3QQfJWFoKsm6DBA26HLC3P3NY=;
 b=jkVbT56N1OZALRrHxGC/fCSDYTHmTzfC762Wt/dJGtl1MesbM7hjZOOwvZtldZg/NG
 jmrtJcFBJ+x5O25DwjuD8xGJyvTijb1+F1bG9XO4k5meMb6mx7M65PYbw/VzueFYPT90
 FY7sSDj+zbHH38AZhzCt2JhVGqi38GHyZnrwrw54KjhHDg2OaJeSAcUr9wRstDCJ09RN
 hM4nVwM6vhIWqN10lZ6oDMOxyCm2aEC34G65u1e4uNmz/7QAUjLT0czo6qyBmxN59WtO
 xVi6c7P+zr+VAJimzraXRO3Gvu7IbsN41HfgCEC+8D21tLx0l8kC2E8zgVJrzJpGteC/
 vmtg==
X-Gm-Message-State: AAQBX9eQjohHp8IDdoczma7xKs4XdHsCQiqNlDuJzhMfRV1xv+4H52p9
 GWbLtBzfwYmUfpZ392Pq65MLBA==
X-Google-Smtp-Source: AKy350aXsD3/6dOMyV0mSeSV3/PpyXT4CKhCn/SEkoN08la6HF6ZObp6PbZ7cMouaDVeBQU++4SuUQ==
X-Received: by 2002:a17:906:9f19:b0:93c:847d:a456 with SMTP id
 fy25-20020a1709069f1900b0093c847da456mr40363176ejc.22.1680547078135; 
 Mon, 03 Apr 2023 11:37:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805?
 ([2a02:810d:15c0:828:ae90:d80:1069:4805])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906101400b00947732c6521sm4905391ejm.79.2023.04.03.11.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 11:37:57 -0700 (PDT)
Message-ID: <bce9adba-d08c-78a1-5949-85155802c9a6@linaro.org>
Date: Mon, 3 Apr 2023 20:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 15/20] dt-bindings: gpio: gpio_oxnas:
 remove obsolete bindings
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

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 gpio bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
