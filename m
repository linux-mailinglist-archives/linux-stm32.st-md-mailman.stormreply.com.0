Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD0373FCFC
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jun 2023 15:39:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE7CDC6B44D;
	Tue, 27 Jun 2023 13:39:24 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF822C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 13:39:23 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-98d34f1e54fso461542366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687873163; x=1690465163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2HnWTfaDhyrvrN7IFESFvW8yOVuG/8fkShyZlJdY1o=;
 b=Z9whTEuxXKPkLsRfaRcCcbEafRicrFHWLk9nws32cYhEkiq7Um/8t8RxYwVyZ8BMsR
 AfAEi6GqPszTI3hIscpXmrvEapft8HEcY/2QqtRQ6LLsl/iGfThtiwEn9tMRi9QTqRaX
 dKUgXlJkjxaeaS10JpADUjSqt3ctvUxBAnFBve3Umjz48R92rOPVVHKvn5Oi95EP7PQN
 7ey1+U0ZD81REJ9H3SBYXJuh0V4Gu0QUCnfn8BcpF6PKJ401Df/3EePF5PRY/M2yEZlP
 bKZUx5ElvhGaqgwLEBwDhvXoT4KVZAFAw40KklkP/nu2tIYR15WgNKXYuZrRraIpAXGY
 7YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687873163; x=1690465163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O2HnWTfaDhyrvrN7IFESFvW8yOVuG/8fkShyZlJdY1o=;
 b=l/aFTLchqhl3bkZ1A8DsTUSAVq8PFV/Hcq56y76cLs3uGZpmEl89ykfkGDKi/jRwva
 JpPmAoo8f68VyEjD3qmHXPI5R8PmHiiUrdTuMAzZhIul2pfUkuo30fEiRu5cPK1CNGWs
 B+iIoi+BVpn8CnutHblAz8BV6fQrQcRSzVvz4+W+HWuIdTDZmfcveNfDrt6mvIOdEgIO
 2EEJZf88/mcXMwYfd+J7pjqEeJ/soohWpcEKgtNQpMmCCAfUbsLsrWE9bEKnZ6OcXRbt
 Lzz5PSFeVXjn4NC/9r6AfcbstowbIMj/J+S3//SIImbB3IF1SjU0YyC3UaHJ/TvJnEMT
 je3g==
X-Gm-Message-State: AC+VfDxbeIwIxax16X9gEQOXwIggB9HgDD5EZohFJxtfhY9ub8y3nKZn
 tuYv8Mf1pzNwGpc0q8NPHFMBqA==
X-Google-Smtp-Source: ACHHUZ5ldtIaI4rcBReseOqa364qcf9nr7plIe4j3DJCtNy46I6HS7F9UeXE7WhP2SxTtqfs+fX4dw==
X-Received: by 2002:a17:906:eecb:b0:958:4c75:705e with SMTP id
 wu11-20020a170906eecb00b009584c75705emr24138869ejb.17.1687873163190; 
 Tue, 27 Jun 2023 06:39:23 -0700 (PDT)
Received: from [10.230.170.72] (46-253-189-43.dynamic.monzoon.net.
 [46.253.189.43]) by smtp.gmail.com with ESMTPSA id
 n5-20020a170906088500b0098963eb0c3dsm4552560eje.26.2023.06.27.06.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 06:39:22 -0700 (PDT)
Message-ID: <0815474b-a8fa-f486-fc6e-a85df88ed9b9@linaro.org>
Date: Tue, 27 Jun 2023 15:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Valentin Caron <valentin.caron@foss.st.com>,
 Mark Brown <broonie@kernel.org>
References: <20230627123906.147029-1-valentin.caron@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230627123906.147029-1-valentin.caron@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: disable device mode with
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

On 27/06/2023 14:39, Valentin Caron wrote:
> STM32 SPI driver is not capable to handle device mode with stm32f4 soc.
> Stop probing if this case happens, and print an error with involved
> compatible.
> 

...

>  
>  static const struct of_device_id stm32_spi_of_match[] = {
> @@ -1798,8 +1802,16 @@ static int stm32_spi_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	bool device_mode;
>  	int ret;
> +	const char *compatible =
> +		of_match_device(pdev->dev.driver->of_match_table, &pdev->dev)->compatible;

The goal was to replace it, so drop it.

> +	const struct stm32_spi_cfg *cfg = (const struct stm32_spi_cfg *)

Why do you need the cast? To drop the const? Are you sure it is really
needed?

> +		of_device_get_match_data(&pdev->dev);
Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
