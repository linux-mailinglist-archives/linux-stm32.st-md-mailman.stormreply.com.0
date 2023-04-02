Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4CA6D3732
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 12:21:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFA80C65E58;
	Sun,  2 Apr 2023 10:21:27 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46087C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 10:21:26 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id eg48so106338151edb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Apr 2023 03:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680430886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0dHtm6rEwdmIURaK6uwg13/SivrIWW9+hRVkQN5p4kM=;
 b=hWRZFnUzy/AO/MrrHGptqieSYv8r5ivl++6jYZxkWvmMxEye8miSsugXiCJBi5sqvL
 s719hTzx6xAsRH6O+8+R9ZEN4ZJOlMD6r2NdJ32bzEnaZmYynk5Oc2nlmJmRHXdUSkfQ
 qsbxUVvKFP7ACEIsS4RBi2a3SONFntKaxPE5/QMz4WxQD3+uAHQJO6pFs4XTeMC3pSGT
 onjtT+bDjrtAZx9GKQ5NBHQZEDwIaZRLJaOvD/2SIFP+Dhx0u02i4Uvx3y4spp4V8PRL
 g2AylIyMAALt7BOVeMXKB/5gE8oSD9J36tN636+e0ps1uHv2/DxBdfi/DCpIQ6LBfhEC
 B+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680430886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0dHtm6rEwdmIURaK6uwg13/SivrIWW9+hRVkQN5p4kM=;
 b=nn23oKuQjCw2B6ZXSuoz7OB+a0M/n5Mv7ls17+la546SBuA5wjWkPg2XAIo1JU1egd
 triGrgTg3X78Ls0S736p5Ek8wy58ppSzQnsHi4GNWRO7C4aoO/7PlarkG9jr/+9XoRgo
 4oBjAe+xFu8CmdW5rxHehAyAYibYiQ3e/XMerEQdbTbp/R8jRbeQx0UUVqRnE+aCfJfr
 5PQFNqskaxnQWaUZ41VwGv59GvvSyEOb/ZEjwgPmJYXBT+LwLIVBeQZenIXM7l/J2o0j
 67UY3LvTuhVCCXBB4b+QFdNuU7HbDaR9RHH+nqyFtBlL3ct3/J+Vka1KzXJBI/1D1HqI
 CvEA==
X-Gm-Message-State: AAQBX9danvzyW3Tb2JfxxJUMSOAr2bJ92e9QjqzBpte/SVXpabMM43q6
 1XTiFMvLgv4RvPAmVSlbiHVvIQ==
X-Google-Smtp-Source: AKy350b7C1SmwO8vWgBCIzK+/qLm6HfLt8cxKJ4Flko7Ti/4JiMy1EgB0vrkdSSZLLB43zm7wiLJkQ==
X-Received: by 2002:a17:906:3da:b0:931:95a1:a05a with SMTP id
 c26-20020a17090603da00b0093195a1a05amr33727013eja.62.1680430885727; 
 Sun, 02 Apr 2023 03:21:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5?
 ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
 by smtp.gmail.com with ESMTPSA id
 cw1-20020a170906c78100b0093de5b42856sm3055582ejb.119.2023.04.02.03.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 03:21:25 -0700 (PDT)
Message-ID: <b207a77f-18ac-0da5-e95f-bd38fc1f0d11@linaro.org>
Date: Sun, 2 Apr 2023 12:21:23 +0200
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
 <20230331-topic-oxnas-upstream-remove-v1-1-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-1-5bd58fd1dd1f@linaro.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 01/20] ARM: dts: oxnas: remove
 obsolete device tree files
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
> and since no new features will ever be added upstream, remove support
> for OX810 and OX820 devices.

Lack of development and new features are not really a reasons for
platform removal. Platform can stay in decent shape for many years,
without new features.

Lack of maintenance could be a reason, but first we usually make
platform orphaned to give community a chance. The best reason is lack of
users and any relevance, but your commit msg does not focus on that.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
