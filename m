Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 033C6642B30
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 16:17:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A155CC65E60;
	Mon,  5 Dec 2022 15:17:58 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27583C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 15:17:57 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id bn5so13910857ljb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 07:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tubnq3Lb1VVWqLrhjxAXy/EV/eNx6+cm8xh6RrNzzTM=;
 b=AIqfGwx71gO9vLfBYjXxUMedb1KiG2HcnbySTeVyFNkdrqm8R/q3bAmVtiE5e60CZD
 XoCsOQnTeTO+JJrXz5TfPqzGSiaCdlVb5BRFShvlZhVsgTpbNmbF6bqv/FP/UPPXFRXU
 WPydXGV2z2bawxqjAGyoAaQUAdYybDPyf210uMSFDVTf/zOspHXc9GAHCeFhl6r+kNFU
 +6cWu+DrfJQiUaaUQ3bs7PZeQWf0X4UlhiHKkU15yVojPN6mRWhavScbZCCPAr2DZucN
 Kct+cf6ygsaSMG2MoCWMSeTNM8QmP/hp/zFZQJbsgmsjCqCOlbHfVpe000NAM6eTbxkk
 LMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tubnq3Lb1VVWqLrhjxAXy/EV/eNx6+cm8xh6RrNzzTM=;
 b=7uTHMdnS0nC95i8F6nSBlclMTP6PMzo9hIGcqG+c7YMw5LQGKr3k9cmDiMlrsuDqzj
 ETuSkKU4g1EzlXkCcON3rPkvixZkoUnqP3gFjodna8LOeAmbymdX5nd5WmCgztfLd9lT
 Fwc8efIvjw+aJcq9j8WWi9wpw97uFp2IQ0WIHxhqdPzCDYNGaE/ewGjzXYsjspDIBZbc
 Yad/lmb/w0KICtrzG7cQRMl10ebJKT9Tih/9NG2AK1uVS/sLz8UjPPrcNJQng+ZnfoQd
 jHq5U8D9RJdJMwsLk8NUAz9I6RPAyLFQ782EZfYCVAbAHroTnTzDem0w6qYoaE4KepSN
 JCdw==
X-Gm-Message-State: ANoB5pn8G6vo5vOrJ4U2nVTxRQ3yvl5pqMgYAxWMYtcQVWyMamtId0iU
 KLxNGUUKBkodODPNi9VtdQDXtg==
X-Google-Smtp-Source: AA0mqf7AXb6jmtQHyKyaAg541NUdZ6ve9Xm0GWLbAM0+giRLqWCe+D+MTsptwcE1Dlw0gletu1rDVg==
X-Received: by 2002:a2e:b5d5:0:b0:27a:37c:cd59 with SMTP id
 g21-20020a2eb5d5000000b0027a037ccd59mr1038330ljn.157.1670253476392; 
 Mon, 05 Dec 2022 07:17:56 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a056512130300b004b551cdfe13sm1350223lfu.279.2022.12.05.07.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 07:17:55 -0800 (PST)
Message-ID: <da51f5db-b697-47f1-208f-e710e491299e@linaro.org>
Date: Mon, 5 Dec 2022 16:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
 <20221204182908.138910-5-krzysztof.kozlowski@linaro.org>
 <167025248440.1785019.8058849269946787324.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167025248440.1785019.8058849269946787324.robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jeff Chase <jnchase@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Joe Tessler <jrt@google.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH 5/9] media: dt-bindings: chrontel,
 ch7322: reference common CEC properties
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

On 05/12/2022 16:07, Rob Herring wrote:
> 
> On Sun, 04 Dec 2022 19:29:04 +0100, Krzysztof Kozlowski wrote:
>> Reference common HDMI CEC adapter properties to simplify the binding and
>> have only one place of definition for common properties.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/media/i2c/chrontel,ch7322.yaml   | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.example.dtb: ch7322@75: $nodename:0: 'ch7322@75' does not match 

I'll fix it.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
