Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 033626E5A53
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 09:23:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0301C6A5FA;
	Tue, 18 Apr 2023 07:22:59 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1E3AC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 07:22:58 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so23058766a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681802578; x=1684394578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N3T4qzQ386UMm1Jq1CVcwpetcL7Lh9seXXqAFFBWSFk=;
 b=RJ5M0AFQjbLXZ2h1tv8V456IdJFFK1o1tRX7zu4QYAORmnF0xm7RZcGN6NlTQkVEb2
 c0aGg8bt/LM6D6EdYZgEqvg22PNt69KuXIcsZRPrm55DnTaTbc+u8Z3kWsuLQczP/WYY
 1kWWUKkpdmdirc5br5UpDiqUWm/ZXOFly3S1GgXScxgK5pDky4DkH2qLh0Ya4WkZcuF4
 c1/ofyONceFivJOy3O7gcCurJiFHIfKuzGGz3InCsE3rb2FQ/1wFHn20qYAxR0da5ORH
 t7jNvJe0FT0XySQfyl6tCryGQHUwbrLtV8wJTt719orO7oMho8U+NL9Emt2rn1LY69uQ
 chBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681802578; x=1684394578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N3T4qzQ386UMm1Jq1CVcwpetcL7Lh9seXXqAFFBWSFk=;
 b=iW3gJkEkcEfQlVoqVJ2ojgP2DwtgOVhfiHRg4gDgw6Exw+1uNL+Wrkf7GOUn997mnA
 dopzc+2gYAnaComJtfG/e3xfmkTyKX6AbAbUuieA1KlQ3qgqI75kRX2er/C7+1tqGTnJ
 eBKOw4bcx28HLoW/pLg/shZQFL8b9MGKoecy8wBRnc5m39LXPnLCLXmaeup94GTKG8Q5
 eKePp1NocDeXRFqVgtVWarayQTUPsPO943PJp70IitWXgjN1BMoC7WVmYh8ePn3MHBmN
 oXhVH49vmwPJg7eUF/9on0uwIah7buB7Hwytty28ZEdyB9cJOPjl2Hr1f3GGkoM53alf
 uhvQ==
X-Gm-Message-State: AAQBX9erWYqQZfYIa//vTXMlrksJV4EDK9ZpMNlS1i3J/rXQsXd0Lg1X
 zl2rM2l69OXf0Yxy9/Jf9kujXg==
X-Google-Smtp-Source: AKy350ZjmGyY8bBRAkFWWouo7cz6/70JF0hWdv8/eM8JpUuTiuEQkdkR4ZqLDoHyPgQr8BCrdAbrRw==
X-Received: by 2002:aa7:c949:0:b0:504:9e79:e86f with SMTP id
 h9-20020aa7c949000000b005049e79e86fmr1391615edt.18.1681802578028; 
 Tue, 18 Apr 2023 00:22:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77?
 ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
 by smtp.gmail.com with ESMTPSA id
 q6-20020aa7da86000000b00506a09795e6sm3018474eds.26.2023.04.18.00.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 00:22:57 -0700 (PDT)
Message-ID: <fde49fb8-c337-3a6b-811e-b9d7c3620393@linaro.org>
Date: Tue, 18 Apr 2023 09:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230417181342.v2.1.I483a676579cc7e3ac07e1db649091553743fecc8@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230417181342.v2.1.I483a676579cc7e3ac07e1db649091553743fecc8@changeid>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: stm32: Remove
 unnecessary blank lines
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

On 17/04/2023 18:14, Patrick Delaunay wrote:
> Remove double blank line.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - update commit title and commit message to reflect what the change is
>   V1="dt-bindings: mfd: stm32: Fix STM32F4 DT include fil

More than one file has the same issue. This is quite a churn to handle
such patch one by one. Please fix all of them or just skip, as it is
harmless.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
