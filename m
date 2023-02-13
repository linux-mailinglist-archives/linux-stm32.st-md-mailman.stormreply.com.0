Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BE56940D5
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Feb 2023 10:23:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C5E4C69069;
	Mon, 13 Feb 2023 09:23:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9496BC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 09:23:03 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r2so11380847wrv.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 01:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nceynFwfOSQ9gK3dwBYGl+Y9+g5oSlogmBdnLLAMDvE=;
 b=qF9OgKwoIo3IN1BRJSx1gzKZ8I4VRcThWO2fHPpvwU/3bFl/NndvGECxwJCyvo05tD
 S6hmSGetGMkTK1MSG4AkXFW+t1rV7Adxnv+oGwp5L7s//YXWBqku8JzYmTVUWZ4+XG18
 IcZp4C637ehPWZONZ0dTO256y5ayeOOcNR41VtTYZsRizzcPOiYKg1tanzLmBiYnpEw/
 TjzrW5HsIu1uqQ1Eq1w9deYclwP+PH2A8juwEUrwXSLWEF8ngX07zdhgK9wUHHo3Opra
 l5jcyE/Bp886nNY/JyOQjsypQB9pLUme36IO70cvMByt/5R6yoTD7zx0ev38D5a8LKf+
 bCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nceynFwfOSQ9gK3dwBYGl+Y9+g5oSlogmBdnLLAMDvE=;
 b=lefymXCiMM4GL3XllHoT8HlMhvFbct2toZlhLMnTNqZAVNl/erNvr3gvKhSKO36Yu2
 f8MXq/vN9Ie6LrcqNMhEl5ewwpxWVw7Z5Juc7WfmQN+Rp4d3QRIKM2TFz2SPbcq094U8
 3OP1MHL3hsS8DbEMKj8/eafXj7Y/+EzXbTXdeq3QkmJG1Jx8xVRhesKZkLzhWL+j7h3Z
 CKPh2pNXaG0CfzoYtC34Abi7c2GDGgncZMbQY1MG+5N74I4ks+OUfHyW+jM1Dhqfdf7D
 rvbhkCBgwSheXMyFZ2/v+iK9pfDOrt11HGcNjjxG50/Ibj8E3ACk8+CMzv4rYmIWL8Zb
 MyVQ==
X-Gm-Message-State: AO0yUKV0UGfujaL8kguNstYjcUORtO4be1vQUP2bf7dBvYdmdpxeaNX1
 DJD93ViLb5mH8kNL5rcBvZbYgw==
X-Google-Smtp-Source: AK7set/WMjt6si446XYviUem9Dvz4X7zmBCVn/zBEupkIDEh5g+cbzG/LyjEhdhl1+XKTXHF20iTbw==
X-Received: by 2002:a05:6000:1f8a:b0:2c5:5297:24ae with SMTP id
 bw10-20020a0560001f8a00b002c5529724aemr4519362wrb.2.1676280183186; 
 Mon, 13 Feb 2023 01:23:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a056000010700b002c559def236sm1438290wrx.57.2023.02.13.01.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:23:02 -0800 (PST)
Message-ID: <c895f199-2902-4c22-2453-829d946a8d11@linaro.org>
Date: Mon, 13 Feb 2023 10:23:00 +0100
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
 <20230211031821.976408-3-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-3-cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/12] dt-bindings: riscv: sifive-ccache:
 Add 'uncached-offset' property
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
> Add the 'uncached-offset' property to be used for specifying the
> uncached memory offset required for handling non-coherent DMA
> transactions.

Only one offset can be non-coherent? If this is for DMA, why
dma-noncoherent cannot be used?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
