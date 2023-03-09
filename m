Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5822C6B20C2
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 10:57:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D2A6C6A60C;
	Thu,  9 Mar 2023 09:57:32 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43543C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 09:57:31 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id k10so4561877edk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678355850;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PvbVoBPjjfIqdZbLgBkw0a9rBetxh27WBo7WXmAt8bE=;
 b=O0HVd2Q8bi/I6rHFGCyMhSVuqt6f77e1+U60xowfpTNWt+dGpQfCxvYKa+E7a5zrMX
 Tc6vqXSSYrzaDsq2eahB3HyiaqEWVc1lehGVO3bUmsWszJ15vfjnoH5RpfoUHhT8Pt+K
 vPq/QM/4O+KVK5KfSc6g1PvXxMFuPayBWApnNnjrfuciryIC/qeeFO9DSUlaeyCoA036
 O9Qg5y5EteDtgUQ42brkEP7KAVe/g2VMPGNpT1OljhG1Hv7kWaQ2GeCLLAygh4Sg35H9
 5eX6jy8fqB3sZuAU79QiI/cFcXm1FCHMRIoNrZKx2YVoV/QsmG2KUmeNvtKVIQ2kbJG6
 mU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678355850;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PvbVoBPjjfIqdZbLgBkw0a9rBetxh27WBo7WXmAt8bE=;
 b=cinv8qLCq1Kpr9vdry4f34PQGUBLzO4AmuDSwNQ+YaFBMk8SRkV6ABGTPIPfPVSiBi
 Pph2xIOz4gKa397QC2E9DirXXChyb3gxziOXXKjgYUyHvCtMRs3DMIBklkfjrxjm0/lj
 pvr/BGf2nmfxa5AgQmebJt5G9/OI1/WTVcz2RBmHdAYt1FXjlHHn6pyd8hMTgv7Nui+a
 qfOeHcuDwkKkTEc1ryGJ7EpmsywY0hyAN9RIrd0b1t9wb90ga0iWXbGHH1h7B9jevPeV
 k797HEgyPHRF8NRM6IOKldxXZSzARVOMiapjMLxEhJVyPRtTHlyVAtJQ9KaBJoYY5qWN
 hQIw==
X-Gm-Message-State: AO0yUKVbJIrn9byFfOtz8DlpQPhX2GStTP2JgVCZpssC0pyRX6Er2/G3
 zbV6/Q/lYvrsGvlny/3dTD+E+Q==
X-Google-Smtp-Source: AK7set8Rcjs03myul3/AEE5V6BhpLiWOdylZc6aZfa6MjPzWDG6RJTd3SN1umOn6ln8LrRInT41qsQ==
X-Received: by 2002:a17:907:9493:b0:87e:9441:4c6c with SMTP id
 dm19-20020a170907949300b0087e94414c6cmr29028651ejc.49.1678355850662; 
 Thu, 09 Mar 2023 01:57:30 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1?
 ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906308100b008de345f4f9asm8608855ejv.49.2023.03.09.01.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:57:30 -0800 (PST)
Message-ID: <c55ecde9-b598-e6a4-be55-4ae5753a83f0@linaro.org>
Date: Thu, 9 Mar 2023 10:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230308075532.672858-1-s.trumtrar@pengutronix.de>
 <20230308075532.672858-10-s.trumtrar@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308075532.672858-10-s.trumtrar@pengutronix.de>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v4 10/10] dt-bindings: arm: stm32: Add
 Phytec STM32MP1 board
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

On 08/03/2023 08:55, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to
> 1 GB eMMC, up to 16 MB QSPI and up to 128 GB NAND flash.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

I don't see cover letter, I don't see changelog here. What happened here?

> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org

Please drop the autogenerated scripts/get_maintainer.pl CC-entries from
commit msg. There is no single need to store automated output of
get_maintainers.pl in the git log. It can be easily re-created at any
given time, thus its presence in the git history is redundant and
obfuscates the log.

If you need it for your own patch management purposes, keep it under ---.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
