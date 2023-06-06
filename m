Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB2E724219
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 14:29:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC9DEC65E70;
	Tue,  6 Jun 2023 12:29:42 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0655C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 12:29:41 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-9768fd99c0cso776892066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 05:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686054581; x=1688646581;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W8bjNW006lIGeXXTvLEmyObQQvWZdXaKzwPi+Kg6QFQ=;
 b=UANglB0IvH5VFytUBHWTDZr279hkDNYZk3bE/mwXdOIJ7a/USJf7JT6YT4ZlctCbJz
 V/CbT4QIfMBx0oNExmEx1Ij/xUHn56+RkvgHEiSouvLIELitNpRnb5fRv0rMNDjc1Tl9
 VAvbPCj1O0oSo0ZGenpnc5S4sJqXEJRcvB8sFoTDPCzSxoZeUCbdUtsJsDa/2bwXg7jA
 P2PQuYDoNqPZK+24zDTYSUgGI1WwS8Ve0VcxUmYlJxuMPrkj99Y2nJGjz03w/F8E24E6
 QKioE5gtAQLwV3ugVZNCGApZ5NfE5ijPrYUvWsWcW4mDYXftPpr+P8qKUyusJwJNk1V6
 GW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686054581; x=1688646581;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W8bjNW006lIGeXXTvLEmyObQQvWZdXaKzwPi+Kg6QFQ=;
 b=aukGnNGZEEFu8PCpeOiVRGQ5VO2V4VLU7FUH5Wz5H296nqAN0bJNXW6/dgCfngzY3g
 6lXBNzonmH4hEtzEEkEVmEtY2zdR0rI1J5JUeFKsPmfeNYkRX1Y1p4OEPodkaEspeWaC
 5zL7eqTfNCnbZo+lZIx4sE9nDbbf13UVkAFdy+QLsxfVBPsWOlRxEY+8HyGSe4wxV8Co
 tiNnG902s49GIsp85HVcNuOrarq3Uki76wJetzdWclROs2IXbtB0SlOff7FSoIn8ko3Y
 lSilPkuFWGAUfeiFGo7VYXSdmb7W1V1YEEzHt4tCtNVqNH3oNs6jZdszRoJSrKX4UaIm
 eSAg==
X-Gm-Message-State: AC+VfDztrYixMWlnbxTQ3q68gh5k5Ieq1QA4+diTfo1egsZsbVVcqQoO
 +HWoxiff4M1FD/hjeLah3t1r8g==
X-Google-Smtp-Source: ACHHUZ74gCkWdqGt68D2uqIK/FVkMqv6PEjoxCaeOaRCVaW8otYDttPJwhpDSCZcZtZGFkgL/JjU6Q==
X-Received: by 2002:a17:907:70a:b0:94e:bf3e:638 with SMTP id
 xb10-20020a170907070a00b0094ebf3e0638mr2152290ejb.11.1686054581099; 
 Tue, 06 Jun 2023 05:29:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a170906644400b0095707b7dd04sm5421948ejn.42.2023.06.06.05.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 05:29:40 -0700 (PDT)
Message-ID: <ba853327-9faf-3b2f-6e4a-e674c8b75b8f@linaro.org>
Date: Tue, 6 Jun 2023 14:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230606115605.1633595-1-olivier.moysan@foss.st.com>
 <20230606115605.1633595-2-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606115605.1633595-2-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] ASoC: dt-bindings: stm32: document
 audio of graph port for i2s
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

On 06/06/2023 13:56, Olivier Moysan wrote:
> When linking the STM32 I2S to another DAI component, according
> to audio graph cards bindings, an OF graph port property is expected
> in the node. Document the port property.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
