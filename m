Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F897383AE
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 14:26:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 778D7C6907C;
	Wed, 21 Jun 2023 12:26:01 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BA3AC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 12:26:00 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-51bdc87feb1so718942a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687350359; x=1689942359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EGk3oqjnNfHNIndAjqYr6Ubn4S+JmM/i7wpQCzmK7X0=;
 b=TDon5/PIbqBy/Ab2NWNtGLR3goBGa2sjDUeYrPM6Y0qhvkUsZvHTyLzdA/WDGtECes
 yCyjL6jjAvC/LjB/kFAJbwnMCoROQcEmZv/prrMeRcx/BZURkbsd9ZYDnDCXBSeYWbPJ
 r8V/n3ZyWu1A3YIzyLV0o/J+vc6eCC5hsrSuAAa4zgz3MF9LSPoBeiVvvXF24X2f1FNU
 49mfSD2inLZwX78ar8Vj1WVxTJj2Q3PX/tSUU3KVHqKuyv6/JtF7+AfsVUoRYDaEhDO+
 KH/J2H9HaRckvJSHXcNT/s7OCtkSrwZCeztjPTFrk1Ao6ebmI1/5gDGB2pY356aEyUSA
 4tFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687350359; x=1689942359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EGk3oqjnNfHNIndAjqYr6Ubn4S+JmM/i7wpQCzmK7X0=;
 b=A7JKlQT9ciLtGHKT7Yh7BOgU5s3CxWSmJod2ovbWy4FfCDZxst3peFWTlu0qEqf5Wa
 UL0eLJXCg2CmgukWkwMxOXSdyX5kIGidRhDouxxf5qmjZg06KA7tkwTcxc56wrk6ix13
 q7JFBq1DL5renEH84EY0k7GA2nWd62fWh8WPNmwfZpZjA1Zryx9h+k9VK/ZMoKTwp43m
 RFSimcpIzjc2sUJ4CLI9IIBynuPo4dSFKXWCxKbAj2QZDmIWdqNxeoYc5DJg00N7Fe5D
 iQLe2V+BLlDnvUVOUGwaAIKCugqBf6x8ooG1xNieJIrL1MxHb0aIgb1q/vm6xhI8iKXK
 4qrQ==
X-Gm-Message-State: AC+VfDzSYI/Y+qIqRjFGZQ+1LpwV9nOqezTYvdf2+EMKYW8faeaDi3RD
 qU1s+E19qV6k5+YqvCzGQhMxYQ==
X-Google-Smtp-Source: ACHHUZ45ul/F6dXXQy/jtZVfcMApc1r5PDXrdq2EaA1pSCoE6yOWuKq1vxIO7aPtxItfkHTVcxfmOQ==
X-Received: by 2002:a05:6402:2cd:b0:51a:2125:74d5 with SMTP id
 b13-20020a05640202cd00b0051a212574d5mr10619396edx.20.1687350359644; 
 Wed, 21 Jun 2023 05:25:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a056402049600b0051bc58b8dbcsm2512156edv.59.2023.06.21.05.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 05:25:59 -0700 (PDT)
Message-ID: <29666c1f-c670-b38c-8555-e606771b480b@linaro.org>
Date: Wed, 21 Jun 2023 14:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Valentin Caron <valentin.caron@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230621115523.923176-1-valentin.caron@foss.st.com>
 <20230621115523.923176-2-valentin.caron@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230621115523.923176-2-valentin.caron@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] spi: stm32: disable device mode with
 st, stm32f4-spi compatible
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

On 21/06/2023 13:55, Valentin Caron wrote:
> STM32 SPI driver is not capable to handle device mode with stm32f4/f7 soc.
> Stop probing if this case happens.
> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

...

>  
>  static const struct of_device_id stm32_spi_of_match[] = {
> @@ -1798,8 +1802,15 @@ static int stm32_spi_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	bool device_mode;
>  	int ret;
> +	const struct of_device_id *of_match =
> +		of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
> +	const struct stm32_spi_cfg *cfg = (const struct stm32_spi_cfg *)of_match->data;

It seems you open-coded of_device_get_match_data().

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
