Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA93A3981D
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 11:06:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2280C7128F;
	Tue, 18 Feb 2025 10:06:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DE55C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 10:05:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43962f7b0e4so31943245e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 02:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739873154; x=1740477954;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sYzIjw5m52Pb+IT0lkVGBcTiFW2c9Bpd7NnljROy9VA=;
 b=mHxtyaYAVHqf6/A+E3/v9pOD/SYHGoq7rYa0q3eke7R+cV10QLg4gPEL2KUnRaCdo4
 NSYaOzFu/Fe+2cp34ryPiFehMwfYj0R7Cusn7R75Gs+1bncJXsvavNCwlHmi6L80/Hvm
 okPn5u4n27b1FJqdkOwg0q+SiUanOosltY2a+Xyg33USoTR1I/AYyijNVQYlrG4n/yyx
 f2Vn0Ei7yG4QUTM4+d6/ipNxQqMJOMSNkPbOO90nv9dl9/XYG2r+yo8RliOzkpBuubF8
 oO3uHmbkdJyTBZDoxRMjO/ZJaKLWoxh3T8dM/EbB9Yl+JXAM6tBIgIs4/qbMAuPxAlwZ
 8eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873154; x=1740477954;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sYzIjw5m52Pb+IT0lkVGBcTiFW2c9Bpd7NnljROy9VA=;
 b=pR9Iejxk78sY+gBm7eFWYOFx16fNJLlb1P3c2Wl1CJMmYpjsYKtmYp/jNN3ffYJ8s9
 stABFVFyI00e+UryoriB1M4sqZEP4EyiXlBpuHcihZsxLFRdg7PCiUcd73cafyFur4vk
 b0V2pZsrX/mFpdsyzj7P3qgshE+l5SvBeouDScvfzNTBfP+xgIG9YT2U+ukKSZKB6mho
 kP4urzAAvH0yliz/TiHiZ8F6FYm0swLdiYysjB5BJitHcI8WjEftSeG48iO709MimXMo
 jjbP8YmZhq5tg9hfaf5UcHF1QLP64mBAwGXOaBSbvONuhFD3Hza/QHRmGz5E9RDm1lH/
 YzZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVf5iuv8WglNpbR99ixI/TtLV1jx37Kri+TI2vv643HK3FcZ0gYN0i8cN75HI4YJxBEPeYytapWxiwrw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyG4fBsl8dEe0zr8ptM6dvDoyuDuQ+q3f5Ox2cV3JobeH9ZN5dW
 nAK/GOfTp/HLZ7QcIrPXB5RQwadRwuZfULZF0Eemce/kWulNiJTITAKWljR86JA=
X-Gm-Gg: ASbGnculPAHSObThlHzN4GzpHvaxfkXO7ti7VJQxYIKxiDp0xY65VaaqfIHszm3jmtC
 keGdLgd3pW1EWKi1Hmt5ttH9MopECEqYBfCdJ/RNPjMTVRbHv1ORWT/uQEptBz0MnkAJjcREw/S
 KWuM0soBCASE429ggS4row1PM9d+gablp8hCRMqAbvDqThaNTv1CLhrzAOoyzHHzhDbLGKL8QZl
 RdrC8VLNGA4m3AHQ2vLagY4R08tyFm15keMRLg15z8sRPanWGWGLRKEbL5WS7YbwwvauuUb06Ep
 svQsvGzphpa6SB9jQ3YmT4nKWQ==
X-Google-Smtp-Source: AGHT+IHgIFVIHEo609omEOPIL5QR94PggfZ8Q3TFUk8tAi1jFgvW0FkFC6iIanB2i61fvsZwwgB5Fw==
X-Received: by 2002:a5d:6d06:0:b0:38f:4cdc:5d36 with SMTP id
 ffacd0b85a97d-38f4cdc605bmr5085888f8f.43.1739873153792; 
 Tue, 18 Feb 2025 02:05:53 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43992ad82cfsm18910875e9.37.2025.02.18.02.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 02:05:53 -0800 (PST)
Message-ID: <0f6369fd-3236-40eb-bf8f-3c3d675137c9@linaro.org>
Date: Tue, 18 Feb 2025 10:05:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v12 0/7] Coresight: Add Coresight TMC
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



On 17/02/2025 9:30 am, Jie Gan wrote:
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
> Changes in V12:
> 1. Update the method for allocating trace_id for perf mode.
> Link to V11 - https://lore.kernel.org/linux-arm-msm/20250214024021.249655-1-quic_jiegan@quicinc.com/
> 

I tested the latest change, looks good to me.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
