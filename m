Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B99F6D3716
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 12:18:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B04DC65E56;
	Sun,  2 Apr 2023 10:18:32 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A6ECC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 10:18:30 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id i5so106618926eda.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Apr 2023 03:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680430710;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5vbY+hH9xlDJ5JkvEylzYvLfmOyGSfk8lVRHgqhEHvY=;
 b=jt9PRfw5VQJUcClBuDD0yW3taPLHmIYTZT+hRzcnTsZeLzqTwOu592kOF52dyvMgmN
 jWia1f1dvudUnIMCqV/J9ddLPR4fuDVkJM/43X+6sdC0vLh4pkc4zEOBUy0H2h0enKHJ
 /IbIgWIWbuMI5DZwbCxvTn8TD3CPiLHME9Qjd/Pu15AtH27jrmtxex4QLF0fjsnN+1CZ
 TKvYD5ccYK1rb3AWi6KkV+vQnvdUd5CI87AS8JYq/dA76yknzmqbx5ErPLNiJgBKps2i
 0336/3xyzwLIt2xofO6kU6atVVguHVcQwncUdT2PkiUg+34YkOH58yJpOdEaK4T/dIl0
 pByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680430710;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5vbY+hH9xlDJ5JkvEylzYvLfmOyGSfk8lVRHgqhEHvY=;
 b=ULqLXoJJ98IxfExjQaxwDFXPwIusz0NSodOz8JCj8ySUWTo2n6w69xQeJ4nsDyQxic
 qFc2I0h3ji6xRVSiMJvz4+Os7yLPcswsbeJJKJU+e8iU+KL+0iurPCOtPGxE+5npy3z9
 uTDC2PrUvdqlHfWmRbU3XIjWPPoumaeN5c6kNPt+Alc1hI9SVZLCQuR/9TVaW1pIRe7q
 wdFgob7w8htCDhhhpVqmri2tTfrynzHeYDBSAVMVIPXDls+jfmd8+qTXUpS3sQxG/hfP
 unZMpMMwkNfI+JX+8mKRuCZvqLHb3F8bf/cg61Gn5RhJzuMJI3PRtUN3sjCxdOTiIfMI
 vbaA==
X-Gm-Message-State: AAQBX9cp+VUYYtedE2MeoOnmI+mchwTAAmBp1hEVRMykuoDUBs9Ac6AM
 9O+xPSzqJkW7EO/RfpAz5nKckw==
X-Google-Smtp-Source: AKy350Z6IQ1DInGgJ1tkTuG1NeZ3Izk22lBovEOzygEIjFvMr1KmPSan8ScnFcJMV6jOJPTmKXwNWw==
X-Received: by 2002:aa7:c859:0:b0:4fb:78a0:eabe with SMTP id
 g25-20020aa7c859000000b004fb78a0eabemr32523704edt.14.1680430709888; 
 Sun, 02 Apr 2023 03:18:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5?
 ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
 by smtp.gmail.com with ESMTPSA id
 9-20020a508e09000000b00501dac14d7asm3129576edw.3.2023.04.02.03.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 03:18:29 -0700 (PDT)
Message-ID: <d79d35af-792d-4f42-03f0-37ff0abce461@linaro.org>
Date: Sun, 2 Apr 2023 12:18:27 +0200
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
 <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 04/20] dt-bindings: arm: oxnas: remove
 obsolete bindings
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
> OX810 and OX820 SoC and boards bindings.
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
