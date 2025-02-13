Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DAFA348BF
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 17:00:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B77C0C78F6D;
	Thu, 13 Feb 2025 16:00:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 525DCC78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 16:00:10 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43961c966a8so6296935e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 08:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739462410; x=1740067210;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pgDN29uKkb88V0um0RfTC0vvM9HPPQBtETeV1yITKoQ=;
 b=dJTRNBmPxAX8WeE1sB0gH90vPaoVRA9ovHuVlwIP/Q2Bg0Cb9Yk/SHpCSc/JrZaHgz
 zMFqBYOSB/ljIva9gp39lbyaSA8KYliGjd4MY4OJ9n5/m3wnn0bL0zHG5B67hUoWxPD6
 b1uEQlGQrxk0tI+kHHO4VW1jShNMjlQYNUhdz3CAAV1RehgrrLjSbmRnr90WAU9RSeXh
 n8FVF72VIUu2kf0prSzcVO1KoDBRyN6jw9X8VNmdosvVQl+h3h0eWqpGC25Yv6mKK0cY
 IpZyB6mu10j0dZnjebCebx7IA7GZGGV+kLvf6nos7uDC6/LAL+VA/KuF1aTdiAuVr0Db
 WH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739462410; x=1740067210;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pgDN29uKkb88V0um0RfTC0vvM9HPPQBtETeV1yITKoQ=;
 b=mQibNnd3+OdygPECeIFSs1cPzArPULp0To2Whl594ABNUeA/X7v9ixgqJXHqxAvZl8
 xlZ/hE4JpAKW+lIKnvKSpQtlqdqfifK5HStefjnfVtQ59h0mqy2q2KThFU8tvTR9jrN/
 NAPB+cFWaiN9eAsnSugsRqP/4BGu4InDV5gvHCQXAOJ3ZmIeKr2MMj5C9rwRb9AmDQAj
 ebwgg03Ih1zJPin7lWjDBBReMvFCDdA2LP3EHaMzRCZMqpUGzkAWibULaAU2eOu8Nf6T
 HckoUfocCn/XajiLSQJuU2LTOfKXK+rUvDUcuUMa98Dcu/jTIMGQtDnFrkOkMsF1/SY8
 Qmng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoBctp60MFUOdEMuK9SxFIUKMh7ix+5CdcQcChBtjoxylr6c9DUHwZvl73DV93RuYKverzxwPIr/J16g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwJkRP835gmOznu2kykhsuFztrEnBveSgva8r0tTog9UArOQuJU
 b9ZO/ZaAVA/goei1AI5Dkyb4Ff1mYFHWCWnQdgzSUtGrpsth129UmOuRTQXONYE=
X-Gm-Gg: ASbGnctRQjNuP6a76E41YeZ+JcVNHPcNuVnhBxtxEqhSeGYU0Kx4jrJHW5WHWzR7M8Y
 9Ok5isYSK1K7KymmJDxiMs9k7rVROC0/k5ynR0O/UXlwf0O0UPC6kVIJdOnWlgJ1NsCK9HXYzI5
 cf59jkGZH2VQH5/FIWxE+Bb5lmHpcG0VGXV0BD0XydIpH3ECN2WaWcVTDBon4PArJjsYDNEVa3x
 inDREI3VhDw1oonPMlhdR3BjCH48Elb7cBKcAZ/OOojxwGX1H7Vm308H7cOuiApRItE6aXey/sc
 iKtSBd0Mhn3i58XaN7UXKw0bkQ==
X-Google-Smtp-Source: AGHT+IF/wXtprc1U4VPmJ1pAueprsYzKR20H2MkrRTKmejrcGzsEoDZgejq84H03liicKIeACJ4WAA==
X-Received: by 2002:a05:6000:2ce:b0:38f:287a:43e2 with SMTP id
 ffacd0b85a97d-38f287a45b1mr2767766f8f.11.1739462408125; 
 Thu, 13 Feb 2025 08:00:08 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.174])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dd5acsm2283106f8f.35.2025.02.13.08.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 08:00:07 -0800 (PST)
Message-ID: <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
Date: Thu, 13 Feb 2025 16:00:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH v10 4/7] Coresight: Introduce a new struct
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



On 07/02/2025 6:42 am, Jie Gan wrote:
> Add 'struct coresight_path' to store the data that is needed by
> coresight_enable_path/coresight_disable_path. The structure will be
> transmitted to any required devices to enable related funcationalities.
> 
> The trace_id will be allocated after the path is built. Consequently,
> The ETM3x and ETM4x devices will directly read the trace_id from path
> which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id
> being deleted.
> 
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 106 +++++++++++++-----
>   drivers/hwtracing/coresight/coresight-dummy.c |   5 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  30 +++--
>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>   .../coresight/coresight-etm3x-core.c          |  54 ++-------
>   .../coresight/coresight-etm4x-core.c          |  54 ++-------
>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>   drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 ++-
>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>   include/linux/coresight.h                     |  12 +-
>   13 files changed, 143 insertions(+), 157 deletions(-)
> 
[...]
> @@ -352,7 +352,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	 * CPUs, we can handle it and fail the session.
>   	 */
>   	for_each_cpu(cpu, mask) {
> -		struct list_head *path;
> +		struct coresight_path *path;
>   		struct coresight_device *csdev;
>   
>   		csdev = per_cpu(csdev_src, cpu);
> @@ -405,15 +405,15 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   			cpumask_clear_cpu(cpu, mask);
>   			continue;
>   		}
> -
>   		/* ensure we can allocate a trace ID for this CPU */
> -		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> -		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
> +		trace_id = coresight_path_assign_trace_id(path, CS_MODE_PERF);
> +
> +		/* Can be 0 and valid, ETE doesn't need an ID */
> +		if (trace_id < 0) {

Not sure why I wrote it like this, but I think we should leave it as it 
was with !IS_VALID_CS_TRACE_ID(). Even with ETE it calls the trace ID 
allocator, so nothing has changed here.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
