Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E9CA35C33
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 12:11:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B264C78F8C;
	Fri, 14 Feb 2025 11:11:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A5ADC78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 11:11:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso12941955e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 03:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531459; x=1740136259;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qeZsog2iIKuGpA11cPJmZ8pu44QO3rd34voFuR0wY1Q=;
 b=p2GIn5ZBau3Zd9Upb5QY7937tNLDIFRDI0V6wwX6VyOH7jcrxIwvZi25VSGtS0APvn
 LqRrtZwU8W8ljN6+23Wi8l96xIvHFrr4la8rb0YMzDOgTlVTZEKvdpvoq8IWYNkARMID
 azny46o3ba9faYKXgceHUplX1sOf5OiM+bEdY/MW8c52XJukMxiQdJ7UqO9rDnvrozFo
 3gyF8hhNREK1WER99g1a/znM7Ts+zwEzgumleLF8MRwt20A44041kwFO3Xre96yG12r1
 QZGB/V+ho0KjG9+7Lpt8j8DB8qaTqH8YVbRHmvbI890LLkuUcKSTHGNrIzs4r63WPgZp
 ZfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531459; x=1740136259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qeZsog2iIKuGpA11cPJmZ8pu44QO3rd34voFuR0wY1Q=;
 b=hLZyWVcQToKIBL4qiJll5DxdgYdmuaQ1gt9cCvtr8JEYP2b2uyLom8VX/0m/1BNO6M
 cyiMAgKHSop5/HlTXbGf6A0SUw29UYLZc/Ld3s+4RCk0v5mYGZSoJexxwrTrfezdLPpX
 amoOSff8ogySI3MW6iLtBj8VhW5/KQeZzbr8vV6eqapUEJTIromdk7kuacl7CT1pHEvN
 8/7RiKFyJCBXjgh6GDpWkVq+CgFcvc71baADKjOnPnQYj9V42V/+tnWArRfLxuSBGN+1
 OjaG4fnbX8iRqrlpDwR1r2bEPlu/1HhmVJuFj/WuE5mBZ6l8y+9O0qwETJRX6d2rMktf
 RgmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC1+Wfs33FILHg09sn2HMvDFljfQaTIj3sa8fEvLn4NXwY3hi22mPeMAKYvA/hhG74nSfQQimvD+pfkA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwStEt0qP7Vi0ld4YmHIgVL3lRzv7nEYgpR/e30XhbGAVeFYxH0
 ea11sh+hvELeBSj+gsbjbl3QLUXycmKtm8HoJE4vdUBJxxV6eGtaQnNWDE1NSkU=
X-Gm-Gg: ASbGnctdLFX18LlXBSzU+Q5Azd73p2SWFK2qqslGbDIrbdLVo1X3PQYzelmeOoSLpFV
 3L9xl8UU52kyMWiYUT8AGfx14xuzAtU/eYfuGb2X3xInF533qJGySz4gXEYBNwaNw0pvqBDxz0r
 M0TMLTRXZVWmWNpzSEe6cxTj8hK+SaMq8lv9JIm2pUazKzNczp7XCZXHPvykHOcxurT+YZQzsGJ
 5WyGDoGU+rC790xd67fw8BPRrKRy2ziZM2hxz6MTRvVJkYPvMqrig7jN9oadm+wzta+kb8WLt4D
 kAn3zUMbve9HSQq1rqiPw1UUsQ==
X-Google-Smtp-Source: AGHT+IG0FqoM1XNBiFLdY+14wrQsmMAdQi4bqFYD8ks4h0kO06myymwcWJElrH0RMxv71I5w/kY5xw==
X-Received: by 2002:a5d:6484:0:b0:38d:e48b:1766 with SMTP id
 ffacd0b85a97d-38f244d5466mr8728379f8f.6.1739531459463; 
 Fri, 14 Feb 2025 03:10:59 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm4398625f8f.66.2025.02.14.03.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 03:10:59 -0800 (PST)
Message-ID: <44123d40-aae3-4248-95c9-21fb9335020a@linaro.org>
Date: Fri, 14 Feb 2025 11:10:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20250214024021.249655-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250214024021.249655-1-quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v11 0/7] Coresight: Add Coresight TMC
	Control Unit driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 14/02/2025 2:40 am, Jie Gan wrote:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CTCU device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>               |ETR0|             |ETR1|
>                . \                 / .
>                .  \               /  .
>                .   \             /   .
>                .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> Based on the trace id which is programed in CTCU ATID register of
> specific ETR, trace data with that trace id can get into ETR's buffer
> while other trace data gets ignored. The number of CTCU ATID registers
> depends on the number of defined TMC ETR devices. For example, two TMC
> ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
> and ETR1 with ETR1ATID0-ETRATID3.
> 
> The significant challenge in enabling the data filter function is how
> to collect the trace ID of the source device. The introduction of
> trace_id callback function addresses this challenge. The callback function
> collects trace ID of the device and return it back. The trace ID will be
> stored in the structure called coresight_path and transmitted to helper
> and sink devices.
> 
> The coresight_path structure is created to address how to transmit
> parameters needs by coresight_enable_path/coresight_disbale_path
> functions.
> 
> Here is the definition of the struct coresight_path:
> /**
>   * struct coresight_path - data needed by enable/disable path
>   * @path:               path from source to sink.
>   * @trace_id:           trace_id of the whole path.
>   */
> struct coresight_path {
>          struct list_head                *path;
>          u8                              trace_id;
> };
> 
> The atid_offset mentioned before is the offset to ATID register in CTCU
> device.
> 
> Enabling the source device will configure one bit in the ATID register based
> on its trace ID.
> Disabling the source devices will reset the bit in the AITD register
> based on its trace ID.
> 
> Useage:
> Enable:
> STM device with trace ID 5 and ETR0 is activated.
> Bitmap before the enablement:
> ETR0ATID0:
> 31..................543210
> ==========================
> 0000000000000000000000...0
> ==========================
> 
> Bitmap after the enablement:
> 31..................543210
> ==========================
> 0000000000000...0000100000
> ==========================
> 
> The bit 5 of the ETR0ATID0 register is configured to 1 when enabling the
> STM device.
> 
> Disable:
> STM device with trace ID 5 and ETR0 is activated.
> Bitmap before the disablement:
> ETR0ATID0:
> 31................6543210
> =========================
> 000000000010111...0100000
> =========================
> 
> Bitmap after the disablement
> ETR0ATID0:
> 31................6543210
> =========================
> 000000000010111...0000000
> =========================
> 
> The bit 5 of the ETR0ATID0 register is reset to 0 when disabling the STM
> device.
> 
> Sincere thanks to James Clark for providing an excellent idea to handle
> the trace_id of the path.
> 

No worries! Thanks for working on Coresight too.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
