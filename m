Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A30126FA37B
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 11:39:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C0E6C6904E;
	Mon,  8 May 2023 09:39:22 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 693E1C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 09:39:20 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-50bc456cc39so6506460a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 May 2023 02:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683538760; x=1686130760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZmptdmWS7uTkEU8fh40xpc7xUHUTR53ITknLtuVQiB0=;
 b=NuRDzAD1ygyhZBZz7Bp+NMxpuUS2wUhDMEhCbJffC4hZksr0PvoLy7nvxNu4mjxS0+
 rPLAEP9rodeT6m5jnfKbHOFBfJFHF2lyQ4qr7s+zOciO4YqeTRT59meoJLjhavkd+NuW
 /F30LR5FaaqEykcc7QSX4AWJ4jpPiKvZw0XfC18GWfWQgAgsEIEABm16KwOMksbJ0Zpb
 IIGyIykAIipA2XVykVWpsP6VvcP8z6tYKFr9Hyd4XKYQK/EDP8eC8/zvIvmJcUr340H1
 fUjM6+UpswMBXg0vuCr6RtEYjm179PzIJrf0RaXCjmq4JDO4XriJZZ50LcQ0p6eujtF5
 k+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683538760; x=1686130760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmptdmWS7uTkEU8fh40xpc7xUHUTR53ITknLtuVQiB0=;
 b=ETbUlxqRhEab8B3QukY1Q9NBhOFEX03wSPr6eyjwTthWO6aIS0m4TytgnsSfM5ds4R
 NZxskzrm1JG/oM6qT0HT6nH2mIq9rrFq6KEv9gsFNLu9uJBmgLD2NUxQwa5nhdseRRlp
 smDxz0s0yEOlMwOfHzhrjtgnhV5GfCinbOPDQUmJI493oWoO1XSVqlo9ct5gqOeSa1pK
 uowlAcIXB9t+RFd5qudMkkjwpZzRcKsEkovmyC9ULJPYpVdFpG11orynPVPT6EhGyL3S
 HdF0le2wLCNgaCE4d8mwdfIDA7gmA16I8WGMPVN2jXqNdUn8/Rk4Wqgi4U7QUqxIKRrB
 UbMA==
X-Gm-Message-State: AC+VfDx2ugRkmqQI4cDpBE0jfTRF0DvrC2XDofjpWUNeAg0bdDzVgWHp
 NbC4RO6d8J2vndR3AuCEAq3etA==
X-Google-Smtp-Source: ACHHUZ7YjGBPSw63wEkXpDGE0keBJD1105dLULq1Q0SKPwXRtl6KRdeWwIeeqmypOi9r4q8YuWEJEg==
X-Received: by 2002:a17:907:3d86:b0:967:5c5f:e45c with SMTP id
 he6-20020a1709073d8600b009675c5fe45cmr1640816ejc.0.1683538759858; 
 Mon, 08 May 2023 02:39:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300?
 ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a056402516c00b0050bd2f16ef5sm6019815ede.84.2023.05.08.02.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 02:39:19 -0700 (PDT)
Message-ID: <a34b7181-e635-7fcc-2684-e1ee2efe7096@linaro.org>
Date: Mon, 8 May 2023 11:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/2] STMPE device tree bindings
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

On 07/05/2023 23:19, Linus Walleij wrote:
> This adds the missing GPIO bindings for the STMPE port expander
> and converts the existing MFD binding to YAML.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v3:
> - Update to review feedback
> - Collected some ack/review tags
> - I guess Bartosz should apply 1/2 and Lee should apply 2/2.
> - Link to v2: https://lore.kernel.org/r/20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org

2/2 depends on 1/2, so it must go via one tree.


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
