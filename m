Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C156903C3
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:32:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93114C6A5EA;
	Thu,  9 Feb 2023 09:32:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6296CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:32:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so3622938wmp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Feb 2023 01:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FM/LdjIE+BK9yrqTkrCHMJMpaRv/ioCSi0KOvlCQF0M=;
 b=Ab5Rk0IPhDRT3p3+6b6/XqYQFBMnsyXnqWcyU3Fc0ETszZm8HjzAVBZXr76NL6ysc+
 nVTzZ0DXhRS/Vwg16kt0lkoCZjVyppxM2jLitI+Yd8yh60POFC7m7CTrhYT3Z279M5AI
 DLJ+YVVvVOWKSoCrxitDL3cDY9IM4RgMwNja8G0tuOzUWDhEPGL227pvIpsgmJPgJvIk
 +ZaCGMxQKRWv7lzvZsSDUUHO2NxahRLY82QF5caZMgG659Nsx1Qjwh3tDC1tI3W2A593
 6YrG5ESGvUvi8bj8Y7Yy1xvhUO9ESfwU/sB3p3NVR2ADTxj6vh+cTamvKgwRhCYZZ7n3
 E3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FM/LdjIE+BK9yrqTkrCHMJMpaRv/ioCSi0KOvlCQF0M=;
 b=RjPADnPcShINGM5ukQ6/3Sr4sxEX0a1GwlnSa0NJpXrWiSVS0boS0U645193kUTyMv
 MhcdSqUda2D7WUNGgQLWOxZRL57vhhaDNDqoEWkrX55aT+Xnx7Vx8bgSqTpTfGp6paAk
 XzhCUMz9mElga+reKtaBCKMaNIMYyfrnE9ELTEWPsSr57gehenYWcehl2wF+9++LHwVq
 YE8+sQRccR79avrFQTnnhJvesyBJxlAdFrc3ymYlhD61FUvP1BROQgqaXfpSAwRy40dd
 kYKpWPLyOkAUSUEU5XqyZ/6/mnfDtHUKpUZ8lVcEI9R+KxsNpYgJqCXaI6BT4kH8JZbp
 1CSQ==
X-Gm-Message-State: AO0yUKVTzXqzMxv6Cl1nRG+ScNrEEI/GvrrXz0mKHOLKf5qE0yM5O/Ts
 6sjbuUM1/dPC8x5EGJzfwWzeAg==
X-Google-Smtp-Source: AK7set/bb5JZ/smFZZcz/mFj0FHilPsYO6yLjt7ARyOcT3vLv3AYvtmm5BO7UJGXBKpMQrZgcE65gQ==
X-Received: by 2002:a05:600c:4386:b0:3df:94c3:4725 with SMTP id
 e6-20020a05600c438600b003df94c34725mr9409250wmn.38.1675935127999; 
 Thu, 09 Feb 2023 01:32:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003dc59d6f2f8sm1302911wmq.17.2023.02.09.01.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 01:32:07 -0800 (PST)
Message-ID: <a7bbc64d-1b16-490a-5424-4a2f08aba111@linaro.org>
Date: Thu, 9 Feb 2023 10:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Alain Volmat <avolmat@me.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20230209091659.1409-1-avolmat@me.com>
 <20230209091659.1409-10-avolmat@me.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209091659.1409-10-avolmat@me.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 09/11] dt-bindings: reset: remove
 stih415/stih416 reset bindings
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

On 09/02/2023 10:16, Alain Volmat wrote:
> Remove the stih415 and stih416 reset dt-bindings since those
> two platforms are no more supported.

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

This applies to your other patches as well.

> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>  include/dt-bindings/reset/stih415-resets.h | 28 ------------
>  include/dt-bindings/reset/stih416-resets.h | 52 ----------------------
>  2 files changed, 80 deletions(-)
>  delete mode 100644 include/dt-bindings/reset/stih415-resets.h


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
