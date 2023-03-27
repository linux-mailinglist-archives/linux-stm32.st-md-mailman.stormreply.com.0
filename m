Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A63A6CA9E9
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 18:05:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC851C6A5F2;
	Mon, 27 Mar 2023 16:05:11 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDEA8C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 16:05:09 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id eg48so38200127edb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 09:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679933109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+xWYiS3llu2HpwOSTJeOhknc09GbN4E66RoEIS5/sjs=;
 b=N0lhdKu1Wt1wakJ4GZ5rAE32F86Cwg+uPgtKI8cdDYcQDSOkdI5RqyoenNHspPDbZ1
 NgB6kd/48VFxqqB1/LxR55cRlGZb9KSZFaLqKeBLNE2rv801ii31R0AfpFriWlTJAfJk
 VmzurPJBhLPDddZnCNjJUn1Fc/rjbXCTUw5YL9S56uKbWTHQKMyRB8rIL+jyvKD2sScz
 73RupSe+hfofNOQJiXDWKXdsty7kiMJWrGcc98ERQzv75WJaJw650M0oNKPyHw8JyVjn
 VcSJgSlxCdLx+RnKbBLJl4v8NyWH/nVEVjlWK7IwuCSq3yiAl7lF3sgEW99m+Zuk+YhH
 Qqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679933109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+xWYiS3llu2HpwOSTJeOhknc09GbN4E66RoEIS5/sjs=;
 b=MSNz+DWlhJgOByMFnB1i8wqsp6jzct5RPh4DQMLvvmWKxdiij4vFX/HJJRZqTga0pO
 +b7H4uWJLkROX8YKHUJaNcTUEuBHd9EGyBiShMwO7PZ8c7QWrj6Mn6ozR+AxoFrg5tWf
 Pfzwspnz3rbYse3dRtwxCHh1YtGrwxXNBI7RIjg6GG++xdTWUwtMDKtSJ/fPDzVNxea2
 N6satHc7Ccy0PDG0SkeapHIL+REeVB1xv1SDol1W1gwN94BuxsvZ+KHra0j1UN4R4B9X
 SbPeOC6pN2NL6s6TEwVQngNxEKOkMcJXMvWuDTFB1UgerHlcBq7BNOoWB8t7GccvJ1RY
 Km9A==
X-Gm-Message-State: AAQBX9f4tkMIMgat6PG6TjD08D9mLOTCyLawKEgkyUKlEOhNLV2+J9jv
 oI7JYKe9o7QGcdnHzUNoZFD9uw==
X-Google-Smtp-Source: AKy350ZnoR9P3I9BdnZ/TMQKT/EOkIrQZ1OTR5vigOyQRanxSzAkd1f0gLI52BjTe6OdWnPHmIABVQ==
X-Received: by 2002:a50:ec89:0:b0:4fa:4b1c:5ea3 with SMTP id
 e9-20020a50ec89000000b004fa4b1c5ea3mr12716995edr.23.1679933109297; 
 Mon, 27 Mar 2023 09:05:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:581e:789c:7616:5ee?
 ([2a02:810d:15c0:828:581e:789c:7616:5ee])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a50ce58000000b004fc9e462743sm14685826edj.91.2023.03.27.09.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 09:05:08 -0700 (PDT)
Message-ID: <efa9a89e-ead7-8604-5d7a-07c728485eee@linaro.org>
Date: Mon, 27 Mar 2023 18:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
References: <20230324155105.826063-1-christophe.kerello@foss.st.com>
 <20230324170320.5087c223@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324170320.5087c223@xps-13>
Cc: richard@nod.at, linux-stm32@st-md-mailman.stormreply.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] depends on ARCH_STM32 instead of
	MACH_STM32MP157
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

On 24/03/2023 17:03, Miquel Raynal wrote:
> Hi Christophe,
> 
> christophe.kerello@foss.st.com wrote on Fri, 24 Mar 2023 16:51:03 +0100:
> 
>> To be able to compile the driver on all STM32MP SOCs, we move the
>> "depends on" on ARCH_STM32.
>>
>> Christophe Kerello (2):
>>   memory: stm32-fmc2-ebi: depends on ARCH_STM32 instead of
>>     MACH_STM32MP157
>>   mtd: rawnand: stm32_fmc2: depends on ARCH_STM32 instead of
>>     MACH_STM32MP157
> 
> I don't see issue with taking these two patches in independent trees so
> if nobody disagrees I will take the second one through the mtd tree and
> let Krzysztof take the first one through mem-ctrl.

Sure, np.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
