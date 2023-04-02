Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FFA6D3725
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 12:18:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C010C65E58;
	Sun,  2 Apr 2023 10:18:59 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15122C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 10:18:58 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id t10so106261130edd.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Apr 2023 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680430737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OtKdrX4/WYAWGE/oihOuzGoYfmWNzeAKoe00y3BPSN8=;
 b=D+szkCU7Xi1hnPAayL38twbm9pO3fqDI9qeOd42UZkG7444L+rQobQCRhAvQOCqrSA
 kmDTr9aINpjhHtM7q+A1FLgjCKm1w03SEIYf+QBLC0DfQbK317bJbyR7u9P6y0JVsnaK
 exAx+RJ6ewcq0d7yjYyHo9Y0xsGjWQWDC6cQ6XM7wgWpH3DrDA+W3sA8u6ovkahKcX9w
 K4x+ZAijcG3jIdDZZ6KPeFjnkhJUTKVAGY9mLCtEVeefg/0bZ8Zr1hekU63vsLU9dldq
 tKxB446wBeUoYa1hkh0vxsost5Gtf3tt9hcmfd6m1wdJrZ+sIMs9uzBdbf+3ap4CyoTz
 1vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680430737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OtKdrX4/WYAWGE/oihOuzGoYfmWNzeAKoe00y3BPSN8=;
 b=Z0oLbRvqhDzXcPbg8SwuJDXWitYMMiFuh2jhZDRkX1yXgk+lAV517Og3CBdlPeoiRh
 mw5GyAVzk9dFxGQyb7kibHqOuqLkPt3qOOuKRF/8VdsRngNs03sKhRW9aUZfsWrMqNRW
 zXAQTmOk/oFWr8ewcWkiXMScTV+7jovGFxBV2Btdm7aY7tp/bEFzMMJWvkNX6isxKzs4
 CRlxDRUwy42gdPsXy6BWmG0dobRkx3bvC08vU6QNnHwcC07ZbIzkojgKNQkrph4y9Mod
 5H/ybQfsIgGlAf7h4P7pzH+tV8tNXiuRup5LKzgeiPBwb4NurAiQCwYwp45m18LB3JXt
 jpBQ==
X-Gm-Message-State: AAQBX9cYVKvGr22ENAePMvx+INk09tOXqyhu3ZDoYbpQmqTqQv3afKQj
 OWG5ie3sPliH4joQSSTszEj2yQ==
X-Google-Smtp-Source: AKy350alqKW+Mo2o+XyvN+VkTY02grNM59TxjbAC9a7rEScQk56nn27JU+ggSLKxyElt2GWi/vqu/A==
X-Received: by 2002:aa7:c145:0:b0:4fa:ad62:b1a0 with SMTP id
 r5-20020aa7c145000000b004faad62b1a0mr28417046edp.41.1680430737670; 
 Sun, 02 Apr 2023 03:18:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5?
 ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a50c282000000b00501cc88b3adsm3105800edf.46.2023.04.02.03.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 03:18:57 -0700 (PDT)
Message-ID: <775f687b-bc80-a9ae-86f8-d821775f4e72@linaro.org>
Date: Sun, 2 Apr 2023 12:18:55 +0200
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
 <20230331-topic-oxnas-upstream-remove-v1-10-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-10-5bd58fd1dd1f@linaro.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 10/20] dt-bindings: mtd: oxnas-nand:
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
> for OX810 and OX820 nand bindings.
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
