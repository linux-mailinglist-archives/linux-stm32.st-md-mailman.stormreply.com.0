Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B03FDA209FF
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 12:55:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C141C7801F;
	Tue, 28 Jan 2025 11:55:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D4F4C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 11:55:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so56716785e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738065353; x=1738670153;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pLXaRDqxo+mIH84hjRiHW1wB2c5SwAr+CdumW+V6OgA=;
 b=Voy6mgmPaXeKmSbHi0Ku2bo5kLXzp68H9RjNWH3vKc9zufYdxOb1ATuy8bTzDT7W9J
 5NQpSOcQEJ5UYuygnlF+Q8MvfwlaKwe7lBhULVOUNgEisCH25KcrKgOU45nHo/Lurlr5
 BCmWFXBTT5eYgOVGNRGhZIIO4RyPzwNRS0S2Yvq36P7c2jEOWslai9i6bbtFtXkIHD+a
 hcoJwT6VA8EfT6oB7pgT4RCvGVxisULExpIK75iVQSENAdAthGJcNPQFXNFyZWPG7/Je
 Zr0RcNib1OIsGMzi9sZeu0p3s9kaRQ2SYIZgmd7XEGryKYY8P8f+jkJS8dPyBJCDLdXL
 QFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738065353; x=1738670153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pLXaRDqxo+mIH84hjRiHW1wB2c5SwAr+CdumW+V6OgA=;
 b=Q+7XhJ5w32G54K4YV+A3p9nsNo7JFD5bfP6m8mSz4gPpsq/WZcnJAPmkLlVu0Jprkn
 qOP8oyyQjV0bfLq3RMV+8T4sjVz008X1H0vcYNr299/nzeLjc9vTjSnNslvV3Nr0VJGd
 IYifsyz0d9TS9uojuPHSdnE8wEuPcpsbP8W9CDOIsLjMBWEhJHx1G03b+13AtynkDgsU
 diYJhRVNLeAto7Kqpm2dJaPtYNYywIKGp6KxSvMrsAqLVumE85s7VFjDTS78O8jr1gYb
 hcMaZvR21HISq4EMkChGoYznReMy0QAv+wp6zNR5h1xSmEDOYTiiY+Ap8Ff1Q5IMXW2e
 tXSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKz81ku69sAMcZh4lhitiHsCkHXQHXKa9IW/bUlkI3+PAFCkrJxKta4c6h0qGOJVtPlD9V19uWnsBW7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwlSpff2bSNrKS5eGyy1WyJiCxKiy0kt9KksovGpyEws9NhgoBb
 TrWEcCJtMa3vj+tUjhCHtNUZs1bGKwBS1IyWD43L3iW6xgqb9kjUbrltKSSbPy0=
X-Gm-Gg: ASbGncuiJLV82GSCDbpO6tjYVzc7wy8xWyCy1eqbTl+EP05Z320znVrn4ONtOuwpjMp
 V94SYg3zNaGIkevrApEIoYO6TP4XASFaYcV3Leuf7a1KJS11C6vp+1lRfR1oG2iuY4lM/dw60Wt
 YqnbNAmxPGVyRKTZQfuLnibVSDBTc1VDVbG8yjklig3Obp2GYF/JHPYl9sFxhdHbBu0Z2j4T/Se
 eiosjJoXjsllQlwXvFvo8bMwIlOE//5uCn4z5Rvgy5dOb5wfi7IdCprymVIML5RWfRkm2TSz5lp
 FAGTbSiUCGnqYZumC2LFtALy8A==
X-Google-Smtp-Source: AGHT+IFARZscANUjyT1VVjHj9FJwPk0o4/Th44Oh6jzNuT8s/RE6rZZ0WJ9ZR9mNGMKADe5Y64JxbA==
X-Received: by 2002:a05:600c:3d05:b0:436:469f:2210 with SMTP id
 5b1f17b1804b1-438af40851bmr234818545e9.1.1738065353123; 
 Tue, 28 Jan 2025 03:55:53 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.109])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4fa599sm174728255e9.7.2025.01.28.03.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 03:55:52 -0800 (PST)
Message-ID: <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
Date: Tue, 28 Jan 2025 11:55:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-6-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250124072537.1801030-6-quic_jiegan@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH v9 5/6] Coresight: Add Coresight TMC
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



On 24/01/2025 7:25 am, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Kconfig          |  12 +
>   drivers/hwtracing/coresight/Makefile         |   1 +
>   drivers/hwtracing/coresight/coresight-ctcu.c | 276 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h |  30 ++
>   include/linux/coresight.h                    |   3 +-
>   5 files changed, 321 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
 >

[...]

> +/*
> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
> + *
> + * Returns 0 indicates success. None-zero result means failure.
> + */
> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *cs_path,
> +				bool enable)
> +{
> +	struct coresight_device *sink = coresight_get_sink(cs_path->path);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	u8 trace_id = cs_path->trace_id;
> +	int port_num;
> +
> +	if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(trace_id) || IS_ERR_OR_NULL(drvdata)) {
> +		dev_err(&csdev->dev, "Invalid parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	port_num = ctcu_get_active_port(sink, csdev);
> +	if (port_num < 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * Skip the disable session if more than one TPDM device that
> +	 * connected to the same TPDA device has been enabled.
> +	 */
> +	if (enable)
> +		atomic_inc(&drvdata->traceid_refcnt[port_num][trace_id]);
> +	else {
> +		if (atomic_dec_return(&drvdata->traceid_refcnt[port_num][trace_id]) > 0) {
> +			dev_dbg(&csdev->dev, "Skip the disable session\n");
> +			return 0;
> +		}
> +	}
> +
> +	dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);
> +
> +	return __ctcu_set_etr_traceid(csdev, trace_id, port_num, enable);

Hi Jie,

Using atomic_dec_return() here doesn't prevent __ctcu_set_etr_traceid() 
from running concurrent enable and disables. Once you pass the 
atomic_dec_return() a second call to enable it will mess it up.

I think you need a spinlock around the whole thing and then the 
refcounts don't need to be atomics.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
