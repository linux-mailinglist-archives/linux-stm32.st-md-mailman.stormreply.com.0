Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 575EA6940BC
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Feb 2023 10:20:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02C79C69069;
	Mon, 13 Feb 2023 09:20:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C29DC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 09:20:07 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id y1so11400895wru.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bNLG0F4sytAFJuPLCGJpmTMcMTuRJI0BMdm+O22mIWk=;
 b=h65cQMGeWFtfyp2uBNLZIv4aNJ8crvS/MegClRzuhEPjPg+BDdR7aqGJ9/8XON1Bbu
 2XZckirgzIKPNipgdUySyNJHJrZukrIayPooX+QCE92pl9aI7oQ7xxgpdLjhBnpDDAPx
 ZhZyBa5ldmmym80vqoKngS1doGl41+7ZaRSDZNOjybDPD4DsJsWs3Z+64em6pAzfT/Iu
 xCCuMtGP0ejC69sEtvzbxgq3YINw3hLGcc2NKAVJf7649m1FuUeyHhG+EzSEIGZu4wDd
 rWYQWhSxHz6TCKYelQvbL1+SZVCWz5+AjihuLGHlsfu4ryj01UUEvu3Emw3dWnybevup
 XjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bNLG0F4sytAFJuPLCGJpmTMcMTuRJI0BMdm+O22mIWk=;
 b=R9op05v/hwez/+ZcIkrEcWk8TALBpcbNpbPhv1jC6OKuFrK87Vm1xEmVGok4XXgUvk
 eT7pDb4bgZ0Ey3bazuz0LwViNMrNrQTxl9gRRYiAYaU0NClAgxoFU99U4juvcvxy9d/D
 IHp9Rzhevy3z4TBNkwG6NO7LEMC+kyE69/o4moP0rjLVTwHm8a1Om5363YFooaq1CiSj
 fmCIQbecOJ7Mzsxl5ugvGkiSgcXxA9w6enEZYWV/Gu3tCCjIiWsVJDv4Rh0+QDjn/UxH
 qCVTcjW9x+nnffx4Kap6OVMRpfYU43+V+/njdkopGdHMlC24jyVznxF8eGHPmbJ/EEpz
 hEWA==
X-Gm-Message-State: AO0yUKUtNtp5VlOAVM/hwTpjxHg6EUXXCmqFKmuOxfY58X08AX/Yb3Ps
 TxicGPQeoMVyLGshUhr5I0/7ZQ==
X-Google-Smtp-Source: AK7set9P9Rf/AgDFodMfFUkknlWiakKXK72hhfRuVm1tf2m8kXJEnbrxw1VZm/dlh2YKzny9lQPCuw==
X-Received: by 2002:a5d:4682:0:b0:2c5:588f:c5c4 with SMTP id
 u2-20020a5d4682000000b002c5588fc5c4mr2650463wrq.37.1676280006817; 
 Mon, 13 Feb 2023 01:20:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a5d6252000000b002c3dc4131f5sm10133668wrv.18.2023.02.13.01.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:20:06 -0800 (PST)
Message-ID: <17e7a0f4-38b2-cfc7-3058-1fea7bb28b81@linaro.org>
Date: Mon, 13 Feb 2023 10:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-2-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-2-cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/12] dt-bindings: riscv: sifive-ccache:
 Add compatible for StarFive JH7100 SoC
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

On 11/02/2023 04:18, Cristian Ciocaltea wrote:
> Document the compatible for the SiFive Composable Cache Controller found
> on the StarFive JH7100 SoC.
> 
> This also requires extending the 'reg' property to handle distinct
> ranges, as specified via 'reg-names'.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
