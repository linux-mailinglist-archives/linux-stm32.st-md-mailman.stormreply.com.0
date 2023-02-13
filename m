Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE356940D9
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Feb 2023 10:23:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55F8DC69069;
	Mon, 13 Feb 2023 09:23:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A01EC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 09:23:41 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id co8so7646078wrb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 01:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cHoRZcfHnIFM/oC3aOpK3TRch8E+QyoPOEKfxdwkBv8=;
 b=KoDMYqGadRN7PsbcW9GwxNijCYtY/+rQK2zDk7nJQcE1QA2dP049DBiOqVnnig+9Cy
 +FveKLRo76vu/dhorjmsfqKskxbu2Vx8oekRd72gpDbZYSPXJ9o2WnU8OmSbb0+aDdsc
 IRP2L+1znjb/SUtUD4X6zbxGyYft3Fc43vZ0TlNunnuCeAuKhlrlCw2Ihgsi7H632u5C
 4qDd8ULILsIncDdioChS4WYvKKyt0OFfHWp8OtAIOHdMl6TQtEbm6P+t1lF87aOHiwss
 VPJdeIlDtY0tRvCBShC8O0ufhE5n0W7LStEO8OCgE5zfzMxvOx8fekOTwFqXMFc0+KPO
 +2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cHoRZcfHnIFM/oC3aOpK3TRch8E+QyoPOEKfxdwkBv8=;
 b=Gidpl+y41CUaguEq+il8DPztt3J8joeIsHcFNjUY11ip8zaZuqYSGXxIEkhCvf7yeL
 N6S36U0g4GYC3iHejVwdp/ajbF6c08yH3Gd81vGKLMTmBAqvrh04R/upxKzpEpF9rllz
 jahqkHuns2X+go+l2rmo2dgRF1ItS/UoP5XwjXsxoXKlND3L7rlTDM3LRedUXABH0Vrv
 sg8dISGzUstRRGZHJHIf8Xaq672F6FRmgZc3276ZeIwCvFTUMXeCkeDcePSzCHeQKH9h
 0kGPMxXw1rU5P7d5czj9RGmIx+Dv+l/R1SifXkXpjsGj4PZ394i+vzAFip/k6tAD+0+c
 se6w==
X-Gm-Message-State: AO0yUKU6qdCWqbXOc5/ItFbYzGvOO2iQXKgAn78ffWTR9CTUURfvEd6o
 56iQkdd8cDFIxskWQ+XOJ8qEZQ==
X-Google-Smtp-Source: AK7set+5J2AHVY7RTQkkXF+Kq1camPxBbxMZhhHAmk/fwsI1GQPGvSOL9sQseWRnR6eKLc1S3b1XlA==
X-Received: by 2002:adf:e442:0:b0:2c5:4fb2:80a8 with SMTP id
 t2-20020adfe442000000b002c54fb280a8mr5675765wrm.12.1676280221262; 
 Mon, 13 Feb 2023 01:23:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm16209935wms.22.2023.02.13.01.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:23:40 -0800 (PST)
Message-ID: <44d672f9-2a79-4291-9ff8-7b3a48e61c16@linaro.org>
Date: Mon, 13 Feb 2023 10:23:37 +0100
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
 <20230211031821.976408-7-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-7-cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/12] dt-bindings: mfd: syscon: Add
 StarFive JH7100 sysmain compatible
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
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Document StarFive JH7100 SoC compatible for sysmain registers.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
