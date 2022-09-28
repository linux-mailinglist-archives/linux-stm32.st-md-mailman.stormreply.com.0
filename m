Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ED05ED5C8
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 09:17:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B85A2C63328;
	Wed, 28 Sep 2022 07:17:34 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 438F2C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 07:17:33 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id p5so13325336ljc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 00:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=TE4dxCPLnQRstcdplswZZPEWrYHTl04zyo0o16usTaA=;
 b=As/0q82nUum+sJyLoPBd6GtuWJl33qN4O68taKfghJIh7FQcvreh6Gu11qEj8hvGul
 fPEWOM4BF9GuUvQfEJS1gQH3PwuyGEpLTGcjHwHfxYZLsZL90hZftF/CWn0BT3CoMwOE
 eIOtIlq4gnuT1G72keew31h6ZB5F/aKsknGcaK1NUYTiDaCmvRIQ5Kp7tUigCFD7s1Hk
 6dVteyyPIfqTmkagSSXeufu097WmwCxuRI31twbg1vIReTe9XTK8scaDpsHHn+yJBqnP
 JmJ1rQAmuBAf8mhBRcfvDXhHFr3Hq9662lsY5CG/NxErdutSRODVcQtyiOMRFAvvOQX3
 +vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TE4dxCPLnQRstcdplswZZPEWrYHTl04zyo0o16usTaA=;
 b=b3DxvatU8l+7H2YK/D1gApX0AjVKWufmSfDSjWRZehvX9fPR0Uh8ne6dRMT8ZbtCac
 27tRvkkAMRG7+TWJpO4GrbU1K+Tm5JwWh6OYQn6yCxSn0Ov/dt1cJ3xPaUbfq6FSt4Ri
 bHMIPe73dLojhri2LPftCgi4dQeOTW1SG1Mk1tVLWS2DBC+lH/F+ekaLgE+n2iAA07EJ
 3wK6BiraJ0lyCGEAzX4Jhwm+jqc/bxD7ZunvUi1UqJTFIGQR665kDdPpbi4qR3din08n
 Q6FE3L2CSHVWetp8khJrEV7thCo3sDkK/tUvMbzKmxS5tVCA/isOoMHbsk6QpZ04jDap
 SnSg==
X-Gm-Message-State: ACrzQf39xMOg7Ag69Y0Ceeopn8cOYIuNISi8YINZZeeyVmDjFNpk7zOA
 oq3jKdt7D1xohRyanLYuvnWTNw==
X-Google-Smtp-Source: AMsMyM6z76iK8/Qm0pj3jD1AipgrGpEdJt+xFjKYGD79qqx9g2bJoS6FRXYROgJD1rVI1r9QXVPtHA==
X-Received: by 2002:a2e:9b14:0:b0:26c:7f8a:e740 with SMTP id
 u20-20020a2e9b14000000b0026c7f8ae740mr4578796lji.256.1664349452610; 
 Wed, 28 Sep 2022 00:17:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v18-20020a2e9612000000b0026c0158b87csm358913ljh.29.2022.09.28.00.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 00:17:32 -0700 (PDT)
Message-ID: <ff577b86-44c8-3146-3388-78021bb7edb4@linaro.org>
Date: Wed, 28 Sep 2022 09:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
 <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
 <4f205f0d-420d-8f51-ad26-0c2475c0decd@linaro.org>
 <80c59c9462955037981a1eab6409ba69fc9b7c34.camel@mediatek.com>
 <888703a8-a8e5-e691-7a53-294f88ad7a4e@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <888703a8-a8e5-e691-7a53-294f88ad7a4e@collabora.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] net: stmmac: Update the name of
	property 'clk_csr'
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

On 27/09/2022 12:44, AngeloGioacchino Del Regno wrote:

>>> OTOH, as Angelo pointed out, handling old and new properties is quite
>>> easy to achieve, so... :)
>>>
>> So, the conclusion is as following:
>>
>> 1. add new property 'snps,clk-csr' and document it in binding file.
>> 2. parse new property 'snps,clk-csr' firstly, if failed, fall back to
>> old property 'clk_csr' in driver.
>>
>> Is my understanding correct?
> 
> Yes, please.
> 
> I think that bindings should also get a 'clk_csr' with deprecated: true,
> but that's Krzysztof's call.

The property was never documented, so I think we can skip it as deprecated.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
