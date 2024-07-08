Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13957929BE5
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2024 08:08:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB66AC6DD96;
	Mon,  8 Jul 2024 06:08:08 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC0ADC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2024 06:08:01 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ea952ce70so1693818e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 Jul 2024 23:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720418881; x=1721023681;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yF9h3aMnBs4w0EwI4NF6ZofLp2oNZvbzRR5gRprUOtg=;
 b=Sq3kVTABJGD7AtA0ZaYjJmZSgKjqWOnCqHc5sDf9kKD+Uem2AgKmKcu+v5YIfVM11/
 hPfWjj255yE3xbbAFNqPthrWzGrrGv0ZXWkxkqMupiCTjBigE6Z9MaT+M7puySdLi5Cn
 eMzuqbORdZ2G3A6XPPs5VpOQ8Q4DOYXHOPl7yPWMx78T1V9gBHCCPId/wSvB/HokOxFj
 ZGFTiOT6MHPVswLoS9oTIxdtP9MTcwXAuVa0xjiWEonwwod661Cml6rwrQexzIEU0GqE
 UPO9M1Rd7AwUonwCsB6GC95UudFZBG30ZmiBAQ0FvycuuXbgoZ8uywLi1NzNQP6dN404
 tIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720418881; x=1721023681;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yF9h3aMnBs4w0EwI4NF6ZofLp2oNZvbzRR5gRprUOtg=;
 b=BKpwHP2iLYo6UnXZeTHpnWncTEX3HwKyOFaXn1+e0+dEj8VGkIahS8lzBTbOwPCiAB
 IJXGtTXHb6w6Md1kFq+5rVfjtdeOdgspBw53lvjdr2r5xmCAIiZgTM1dFAYNR1JN/H7m
 XN7l/vog8KeAn3Zk+Vlvz2Jcbb3Ni4SdUESU6A7yvnwyt1TEkTPkvQ/t8ET+jcBsVcd5
 AZFODZE1840Um2KPQSzx/WL2wzKP9EgbF8hPLzg8CQIfPN94jRJjjv0sN6skmyKRVwD+
 8lNhZBtt9Z6qD+tfEx/HkZJKdgb5k6lUjD0FtMDvAhFaJm5JI/78jiF3OmV3sPF/r5Ug
 X2Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfkBmLx70Da8YFKtbYHA1Uk9yHjrhBULGnlQ1uCJP9cs6J9uJu/ourBjw+dxWlheg8mUO3uWS9eE97MlgbIXn6s53b4gAu4odhVzi78seghOJalxiCd1EG
X-Gm-Message-State: AOJu0YxKyLoYuti80bC2zM8ZbD2rRRTNiY0zvXI3qkVSnh+2MWSb0tml
 APDZkfzuo6Oec/m5IiYWx0XGQE+pRH6nHufp+zCA+0T3hE6lX/RRJloh/M/Fc1Y=
X-Google-Smtp-Source: AGHT+IFoN/cWlR6BXWuja0//SDZxE8pDDT582ybc9/L5NsyVsJgSeB4EHViANbhzaOEbDfbWarVRfQ==
X-Received: by 2002:a19:6b0e:0:b0:52e:7f16:96be with SMTP id
 2adb3069b0e04-52ea06ddde5mr6820176e87.65.1720418880803; 
 Sun, 07 Jul 2024 23:08:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4265fe7130csm74789435e9.8.2024.07.07.23.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jul 2024 23:08:00 -0700 (PDT)
Message-ID: <f8f3c4d4-bf24-4195-a7b0-eec95cd64b57@linaro.org>
Date: Mon, 8 Jul 2024 08:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tengfei Fan
 <quic_tengfan@quicinc.com>, andersson@kernel.org, konrad.dybcio@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, djakov@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, jassisinghbrar@gmail.com,
 herbert@gondor.apana.org.au, davem@davemloft.net,
 manivannan.sadhasivam@linaro.org, will@kernel.org, joro@8bytes.org,
 conor@kernel.org, tglx@linutronix.de, amitk@kernel.org,
 thara.gopinath@gmail.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, rafael@kernel.org, viresh.kumar@linaro.org,
 vkoul@kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-2-quic_tengfan@quicinc.com>
 <665f6c8c-4f43-4d20-90e9-9e037a942066@kernel.org>
 <fbeb5969-0b3a-455e-88eb-b83734bf2c50@quicinc.com>
 <97c9484b-e257-4163-a104-3457d59bc69b@kernel.org>
 <63eb3f58-d4a4-4a27-b78c-f4cb83e62c63@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <63eb3f58-d4a4-4a27-b78c-f4cb83e62c63@quicinc.com>
Cc: joabreu@synopsys.com, ulf.hansson@linaro.org, quic_kaushalk@quicinc.com,
 kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org,
 alim.akhtar@samsung.com, quic_rjendra@quicinc.com, otto.pflueger@abscue.de,
 linux-riscv@lists.infradead.org, quic_tsoni@quicinc.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org, kishon@kernel.org,
 quic_sibis@quicinc.com, kernel@quicinc.com, quic_bjorande@quicinc.com,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, bartosz.golaszewski@linaro.org,
 quic_tingweiz@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, luca@z3ntu.xyz,
 iommu@lists.linux.dev, agross@kernel.org, danila@jiaxyga.com,
 u.kleine-koenig@pengutronix.de, rui.zhang@intel.com, ahalaney@redhat.com,
 quic_rgottimu@quicinc.com, bhupesh.sharma@linaro.org,
 quic_devipriy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_nitirawa@quicinc.com, athierry@redhat.com, avri.altman@wdc.com,
 robimarko@gmail.com, bhelgaas@google.com, peppe.cavallaro@st.com,
 quic_cang@quicinc.com, quic_shashim@quicinc.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 quic_kbajaj@quicinc.com, linux-gpio@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_msarkar@quicinc.com, quic_wcheng@quicinc.com,
 quic_tdas@quicinc.com, mantas@8devices.com, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
 robin.murphy@arm.com, lukasz.luba@arm.com
Subject: Re: [Linux-stm32] [PATCH 01/47] dt-bindings: arm: qcom: Document
 QCS9100 SoC and RIDE board
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

On 08/07/2024 06:45, Aiqun Yu (Maria) wrote:
> 
> 
> On 7/3/2024 5:33 PM, Krzysztof Kozlowski wrote:
>> On 03/07/2024 11:21, Tengfei Fan wrote:
>>>>>         - items:
>>>>>             - enum:
>>>>> +              - qcom,qcs9100-ride
>>>>>                 - qcom,sa8775p-ride
>>>>> +          - const: qcom,qcs9100
>>>>
>>>> This changes existing compatible for sa8775p without any explanation in
>>>> commit msg.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> In the next verion patch series, I will provide relevant explanatory 
>>> information in this patch commit message.
>>
>> TBH, I cannot think of any reasonable explanation for this, especially
>> considering rest of the patchset which does not fix resulting dtbs_check
>> warning.
> 
> The existing compatible "sa8775p" warning can only be addressed When
> @Nikunj's "sa8775p" changes merged.
> 
> Let me know if you have other suggestions for this.

I don't have, because I don't understand why do you want/need to change
existing board compatible.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
