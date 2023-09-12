Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F00C79D3DE
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 16:38:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0456C6B46F;
	Tue, 12 Sep 2023 14:38:32 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F7ADC6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 14:38:32 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-529fb04a234so7551671a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 07:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694529511; x=1695134311;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xPClHxIpUCf5nYYKWhxYGcTCf6NB8tvz8LxGrJZ/EA4=;
 b=Bo6xeqQm34OK7QPy1h/gqXhXUbDQOXQvoRXwPRNKVFIVtQuSbCfDtBitiePkbP2w95
 BBD0fRIx/4eiygXF8cCG3jtjXsNx7EnGJmDoLraXLlT+eQKYxWGD1nwIWg223iUDGIHs
 ibyCEzTX6UBZyfGdLg4i00fFQ62LNeoWxAl2cvECPg6ot4/oZ5/cPMKGILKwWkjXVouo
 U2S3W7VjRdj7cimuq2so6rj5qF6ADqDWxqQIByGabBQIa1WbRyHUi6x88wgOtcJO7/xD
 HIoGQNi+EVTZy1EmUeWhCcQuVPi2TR0oZtHr8mWU8j4qc4K0ecL7dM/F7duxpQdPfOpE
 G0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694529511; x=1695134311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xPClHxIpUCf5nYYKWhxYGcTCf6NB8tvz8LxGrJZ/EA4=;
 b=CkGrXDI5EqlfNKR9j1Yca+FFwIw4pyqAqsM+U0gYcC/psaMpoHQSixPNEiLE4CYP9l
 LzUl2d0g00DkSWujjeVCGR4pI/zFkMkuP69U5O3KBVfw0TtXC+7+Gw3pEwjJUWLR5dLU
 kBHnVVhDGnuaJI6bKe0pkfR+BH8iFIOcnJ9iXbafRf+Lf9UYt1tZSUqNBpCU4pzpr1Js
 RG0+aLD0QlGiP80j16D5x4fo3TMofy9wQEgIHXicripjjfyC3O2xOiKlph23oHdKuHPn
 k8HvaPwV0umLE5hI6xa4hP1CI6U+eJtlJOseiIUELf0rr+Y6yjY4yPlY4jkkohQuQGNd
 ozVQ==
X-Gm-Message-State: AOJu0YxSbqzVTeUgVRxEeMGnUsFjw2cOIgKZAIrvCON7JX0aqCanRr66
 mKC6fhOjH6jDhK7oy7gDqbU/lw==
X-Google-Smtp-Source: AGHT+IFmUj780LbX2T6zHpN8hv3UphKJHTdpIZGfJ+/DErxhCy6hzxbdSiwEsEIOLOOYc0C9202pqA==
X-Received: by 2002:a17:907:788e:b0:9a5:bce9:ffb7 with SMTP id
 ku14-20020a170907788e00b009a5bce9ffb7mr11943852ejc.19.1694529511560; 
 Tue, 12 Sep 2023 07:38:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 pv26-20020a170907209a00b00992d122af63sm6910095ejb.89.2023.09.12.07.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 07:38:31 -0700 (PDT)
Message-ID: <28ec58a3-63d5-f604-cef9-571b062fe244@linaro.org>
Date: Tue, 12 Sep 2023 16:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230911120203.774632-1-gatien.chevallier@foss.st.com>
 <20230911120203.774632-8-gatien.chevallier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911120203.774632-8-gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 07/10] dt-bindings: rng: add st,
	rng-lock-conf
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

On 11/09/2023 14:02, Gatien Chevallier wrote:
> If st,rng-lock-conf is set, the RNG configuration in RNG_CR, RNG_HTCR
> and RNG_NSCR will be locked. It is supported starting from the RNG
> version present in the STM32MP13
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

How did you implement the comment? There is no changelog, so was it ignored?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
