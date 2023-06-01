Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BED71F0DC
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 19:34:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38952C6A61E;
	Thu,  1 Jun 2023 17:34:23 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE42EC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 17:34:21 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2b1a86cdec6so4688491fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Jun 2023 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685640861; x=1688232861;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y+b+rm5/R5ibyZ6r+rF+iVWDROGMd6iETnPBcFk9ix0=;
 b=DjlDIFNQZZGoxm1uB8R37Rjp2aLRL2RDbSWtuhgWaVxwcGTOcOj6y3qv+MKdft3aGn
 NdtUdrvjh32aTOHDk1kgv5IC3amiUISeVyqGPOtEiSBH32tHleRafyshPLJbdMtffK77
 pqUq3ztqF/ZTblQjr3nCozLnKPrC97dU/uw5YEbTR3nO3g6/O2ukfhKEEG7bn44BU1pQ
 rKAd645Psbmxs0qH57GZ8d1dHPiLNZyzQgHj3T3/qMOMh5JfYms0ETSmvSIoefTdbmz+
 o01d6TxTpIf82ewAeqILFkUQn7DdWUb1mnmRH6HsPj1TletzRiko4juIJE4a3lFdPcJ7
 82+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685640861; x=1688232861;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y+b+rm5/R5ibyZ6r+rF+iVWDROGMd6iETnPBcFk9ix0=;
 b=FruKXNyHSZAd+LzwEZTFtI1+pRRvDOmfhiC1rLE2AeKAbM0qJ6li2LY0eJeEQ/Kpx/
 i0AdmFDaJ/J258KzUEUhAqvLdtQ6wW2UEwJklv4/jGuy5yUsMN805QDegrHs73Jb5JI1
 CTr3+OFO2uJGfz2ucOOzQbvExRVWKBaBBbznhguDvt+L0h3y3+3EbatOWf7tJsVaLtPY
 as1wzh7cAZbTtg5f8neYNYy54P+CjhlltsvNNdaKXUKjCADmHW9E1uBlfLdtcy32r3pz
 3Zj4mbmRplx2DQr5R8NmV41KlLYHlmqEDKszNuqvkslQx67yTVTtSjjZwrME2o6nJAtg
 NCug==
X-Gm-Message-State: AC+VfDwrQMeGXZr6bAeSzpDEjFz8xhVgCC2HNrBpI7Qtv7kYa7DacMfF
 J2lSRqk1p86lJgS41X/NP7jMUQ==
X-Google-Smtp-Source: ACHHUZ5irQ0RkTnQ1lBHCjsd2sQ1wVrK2U3EDXl6D//XltvtFhl1/qp+G0DqX6qDFNUg5cCMBSrGgQ==
X-Received: by 2002:a2e:8ed0:0:b0:2ac:79df:cb49 with SMTP id
 e16-20020a2e8ed0000000b002ac79dfcb49mr97407ljl.27.1685640861002; 
 Thu, 01 Jun 2023 10:34:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 y1-20020aa7c241000000b0050bfeb15049sm7294362edo.60.2023.06.01.10.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 10:34:20 -0700 (PDT)
Message-ID: <d74a4aea-7e8c-cde7-0293-2c3a41997e41@linaro.org>
Date: Thu, 1 Jun 2023 19:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
References: <20230531102113.3353065-1-o.rempel@pengutronix.de>
 <20230531102113.3353065-2-o.rempel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531102113.3353065-2-o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: net: pse-pd: Allow -N
 suffix for ethernet-pse node names
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

On 31/05/2023 12:21, Oleksij Rempel wrote:
> Extend the pattern matching for PSE-PD controller nodes to allow -N
> suffixes. This enables the use of multiple "ethernet-pse" nodes without the
> need for a "reg" property.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
