Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E9A240EB
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2025 17:43:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DD98C7128F;
	Fri, 31 Jan 2025 16:43:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DAA1C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 16:43:41 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so22076145e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738341821; x=1738946621;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M4e2zWnVciebZyfvuHW95kgPCvuoCJzRXSsGttBVDuo=;
 b=Ts6lndQf5Hxa7UE61J7IuMj9cPOtkNg71rtcfbuSqRbm0sj7hO6FTaq+RIKrcrdtEz
 Fsfu7XxBVPUK1eNnAKxvwVHqIjLXVIZXd+DSaj4TIM2ntCeLwR3PgbL9H388WWZdGmyw
 7ryo8wEFKMxTlRtQQPvty26GZ5CGMz8o3oKh8I9UX4StkDRmaduU4W9tnd0Nxu8Go1SF
 tBRPU5X4/vDvpVljRZMjlDm/MOMqzkQ4Bj8EdovGXBsv85ZLN+xOGjAB+NkyTMff9r/p
 tWh5NXB5GHbZVtr6hOIbsJYD1pVVCko9qT7M5qlSFvy1CbmL5Ucr5FdyBVaCnZYTmWKv
 aq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738341821; x=1738946621;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M4e2zWnVciebZyfvuHW95kgPCvuoCJzRXSsGttBVDuo=;
 b=nfv2rHB83vifIgXwRt3wfV4QeiYWHtJlp7Fw0eTDlb3a+r885bTDZhynzmlhyqKn0a
 ZLqzuR9qZYQZY7EEN9ZyjaQ6KBmOrf9Z0wKWowYDXgTkMv9zxRW8OanJzphyXS8ixiuf
 THu+OS/RYTUrsAwxF82SbaSlpTZDoL3gI4kh0zqLV29SenQWEpE9qPGq27yXsw7IVxRY
 T8uguEDwhsGW29H91HQ8/jmhhxmH5f2BavC/EwecsExvyTOiezI+Ivv+8i9/x6+9T0rs
 8Q5KyRxN5BeBcfz3R9z6pI6hmDpygNxwCHquLGEHGjqoRCEF1fOCthYn+yxgK5GmhT9q
 6vmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+mgRD4rtzgCurVapiD80b8QlCu9r6g7ZcykRQ/7p7/Uh0kfgh/mfSGKDqCgFwUqlZbEPz/ehrAKXtwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNxBLvX3IO3S4Olk6KnZ3miRNWE19ZprvQ8KjM2lxIZz9/D4UR
 FPTskTaKupXnVsuWzfIofthfseg8955/BNl3SY1vFAPC6IhVqWF6oW/B3trxWj0=
X-Gm-Gg: ASbGnctiv6M7ZrUPvT8rJRUi4Uwuw4R+uA3EFxIqJ0HdKop1A9zME+x4EKEvjo/gD68
 OiEt+3yctbaxtFP8RM5FyfG/+IOA3QeO6Bn9/QHSVgbX/FnfkOSbvDYgBdSir70AkDgrbDA6K07
 udNFGNe0loB+uG23xx8pBOGl8Jmtz9Iet/XjhnpyBO2sAinksKPSuSrtuPjUWKY6xIiE0XP/VZT
 ++dDTu7wgP6fFmaZQeIpMD+3BvQ9M8Ml+aCkg3JbL7+SgM8Bbja0Thm/x8EsqfIgNOUQaHUyRIv
 6q9vsi17B9vzrI6Swtmero/E4w==
X-Google-Smtp-Source: AGHT+IFTTPVO+a34Yzx36UVXc0Rk4aOZPFhQnFzSj9GM9HcFqkLze7zFulEsR/ai1dusk+GIBTsVkw==
X-Received: by 2002:a05:600c:46cb:b0:438:a20b:6a2a with SMTP id
 5b1f17b1804b1-438dc3c8676mr119292945e9.14.1738341820745; 
 Fri, 31 Jan 2025 08:43:40 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc27130sm95257635e9.16.2025.01.31.08.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 08:43:35 -0800 (PST)
Message-ID: <0e3f8f35-7ab0-4c2a-b7ce-f5d4f1164af0@linaro.org>
Date: Fri, 31 Jan 2025 16:43:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250124072537.1801030-4-quic_jiegan@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH v9 3/6] Coresight: Introduce a new struct
	coresight_path
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



On 24/01/2025 7:25 am, Jie Gan wrote:
> Add 'struct coresight_path' to store the data that is needed by
> coresight_enable_path/coresight_disable_path. The structure
> will be transmitted to the helper and sink device to enable
> related funcationalities.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
[...]
>   	/*
>   	 * If we still have access to the event_data via handle,
> @@ -595,11 +599,11 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (!csdev)
>   		return;
>   
> -	path = etm_event_cpu_path(event_data, cpu);
> -	if (!path)
> +	cs_path = etm_event_cpu_path(event_data, cpu);
> +	if (!cs_path)

I don't think renaming 'path' to 'cs_path' is worth the churn. It's in a 
lot of places in this change, but I think path is already good enough.

>   		return;
>   
> -	sink = coresight_get_sink(path);
> +	sink = coresight_get_sink(cs_path->path);

coresight_get_sink() is always called with cs_path->path, so we might as 
well make it take a whole path struct. The same with any of the other 
functions that operate on path like coresight_get_source().

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
