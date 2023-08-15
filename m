Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9E277D4E4
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Aug 2023 23:09:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C95A3C6B45E;
	Tue, 15 Aug 2023 21:09:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20257C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Aug 2023 21:09:33 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3180fd48489so4832557f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Aug 2023 14:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692133772; x=1692738572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E8bBzfKoERpsKitiZN4nMKM6RbRCpRMSgVwMeOyuDg4=;
 b=OjxSJtIN2ZIP+L8D41IWH1CGQyReANeeXBAPLe69Hpr+3kS54QfG/oynwDua/CAnHi
 Nw72Vp5E3PUMgDzPld8Q8GpMHfJCci4b71+2wmbo7cMaAZA4wz1t08sJzfDqqMVqSvHM
 fJoFmh49Fkc/sd8FtHOtRVe7/ftXUrfoYxSOgNAOq9MzuLaGQTaZ7y/6Xa8HGNAa3uEu
 G7vGn9EFWuibwGW9FIC2JtJ9f2ixiRzBDF/IIGiCYvYeaLpMQVjPFwkYw/Suk79SLR6M
 Kh+MWNwFD/jJC5leFulRdQzOljIyYv2KZAg7DGR4zFqRncV/00jgOBRTOkIIirFyb7SY
 2VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692133772; x=1692738572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E8bBzfKoERpsKitiZN4nMKM6RbRCpRMSgVwMeOyuDg4=;
 b=aXBJl5rqmE+bn8wILNhtd63+Y3CtVKUEPZVSInckfYkZbYrDCvqaEM46YRIKl8njO6
 jE63CCgAlaVBDCAq1mNN48RyM1dujbagkV6FoqO5Ykd15gt5WmDRdQinWe/Et3rCZTQi
 emTTMtJ5Xqc5Cv70T0T66E59wTLYZJIcXsVHqdAOZjRwl+t8tKoDr0ptNfpGGqkQihWA
 AdeLRgPLbb2QuNX+io2gq8P1kQhNi+TqhNWfboW2h3jowcFKcPB4MWuG7zrP8MuXxeIK
 70jj2YDd6avMaCOApjplLqZ1QlcCMSEV07CKVrVSid55KvJCW29qPbDMs5P4FE9a2Umh
 criw==
X-Gm-Message-State: AOJu0Yy+NHlxUPiYFXMYZ8Dk1pDfY9+jKwkL+qurCZSyluRbciu7Ypu7
 YR+SNK+ICroP+qsjjSbDMVmUdQ==
X-Google-Smtp-Source: AGHT+IFeyYIxvUFpoWnFQI7t+pjFr9Q0npWo2Sw9oiEPkR63padzY60CtlGuUN1fxXnm795IfPPgtg==
X-Received: by 2002:adf:ee87:0:b0:317:5e0d:c249 with SMTP id
 b7-20020adfee87000000b003175e0dc249mr11068136wro.35.1692133772560; 
 Tue, 15 Aug 2023 14:09:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adfe9cd000000b0031934b035d2sm18253015wrn.52.2023.08.15.14.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 14:09:32 -0700 (PDT)
Message-ID: <2f1cb309-9cc7-cdf6-261b-ee5bc8095d67@linaro.org>
Date: Tue, 15 Aug 2023 23:09:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20230809165007.1439-1-jszhang@kernel.org>
 <20230809165007.1439-8-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230809165007.1439-8-jszhang@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 07/10] dt-bindings: net: snps,
 dwmac: add safety irq support
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

On 09/08/2023 18:50, Jisheng Zhang wrote:
> The snps dwmac IP support safety features, and those Safety Feature
> Correctible Error and Uncorrectible Error irqs may be separate irqs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---

Please share, how did you address comment from Conor on v2?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
