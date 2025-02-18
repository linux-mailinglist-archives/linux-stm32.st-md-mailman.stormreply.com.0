Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B076AA3980B
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 11:03:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74A61C7128F;
	Tue, 18 Feb 2025 10:03:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E106CC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 10:03:32 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso57366555e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739873012; x=1740477812;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0839DbdluWzWpmaiM9EB2MAfOdwxjWy1MJ5estDULzs=;
 b=NYV3b+0zVc7N0Zj7lhw2DQSiBg8gPRqRhVp5eD1bLEL0TCEH0QSChAioT9tsGhheEf
 in2OzvXN1aCjpqrGsUGP0MjYLboq5iXcb/7i4qEeAyuepF2HqgEnTg2hd4Z/8V+MUy3T
 PzGb0GzDdDw3fCA0pKgpF/QlHTHwD71rcOY6ysjjO9FEEjdkPl8T3xUpOf60jlb5As/p
 kHClqg1VJNVVb25ZH25eIwyfU5ztMz7ryL6jiHsjpx8NG+Qso+8nAoVP4ld4lYN8Wx0o
 mJkyiAi09yOi1t1I6d1zR9pvlpAYaJHgAbdRCVvz4gsUjHC6FNjx8B5+pXr9zgEqrz42
 0S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873012; x=1740477812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0839DbdluWzWpmaiM9EB2MAfOdwxjWy1MJ5estDULzs=;
 b=Mu9amZis39TMrNbXF0dkbIZNwxAO+c8rUXJtHUaPkeGLwXOTnJPkvGeI8Gq7wCtuUz
 r8OjLySbj/7wn/dHjCAWOi7AQiGmEb8B8TEzGCDXLv9W4hD5byfuX+POUpEI2lvDDfDr
 dDYs8Nrkqv+aWEpbDseny5QOcMSsSwI1b0Rbe4Pp2nrDJD9e2yaVQrKGVSSRCFkBkoRF
 FSSlyfQEsw8jVLf+Pl7PE0or5J2f5+a/B34V6E9x8RR+afonuKl6sGyf2ScoaEXByrPm
 3ufzx6A3isIbOf4GyqBXoivSWIVO7LwMml9OOYXRi9h7lcBWbbTnleKPHAJ4v6CBJPEb
 uTVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB8xtt1WI0I+QnLfskq96u83tHMKT7AdDG+qKLqteni4zJXDRzhOGer5WTOTwiA4N289q9A8l1SbuTdw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyV1nE9ctRLgOudyp9ZCZwc0HQfJZUNTBf4Yx+Md7IXhxQPxxCh
 aWvTVdGwSLCP8ESuC0moQVBiCsogObrQY0ufIFN9v/gKvtqLJ8Lq10DPVoIBnP8=
X-Gm-Gg: ASbGncvWK12qhNPPFzctxbdgm9SQS7bf6Q0YB9D162JMUilkGzN8XHQCZ3OAZ4g7oIB
 iYOL+KjryTrluDMASazLAFZssBv1seU9qCSVpBwORkwbkflMnzvaMcdrsnWQH5lCRzFJaUrC1TU
 dRC2Jt198+yl+DAa6jE0EZCyAGi8y4MlDY/SJNIi34X7lHRsk9yCZmlHtsPrJUuYMtOW3hc6SkM
 eMa4nTo36yZMM1CCMhrJyPkG7+MMAo1gPlCf2QYfTUIrMir9I5/nZ25B0t7jWli4mLNe8Y5z4yd
 cdyXE+E0cr+pu0BHQqrNN6ZtNA==
X-Google-Smtp-Source: AGHT+IGWbXagYwqDWRSF8X9rCootz68CXEnP/Ij/n5wLMpuiaoorUGPClGjqgWRNOLdoR1bU27EBOQ==
X-Received: by 2002:a5d:64cc:0:b0:38f:4fcf:d295 with SMTP id
 ffacd0b85a97d-38f4fcfd742mr3216642f8f.29.1739873012294; 
 Tue, 18 Feb 2025 02:03:32 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbe0sm14730522f8f.39.2025.02.18.02.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 02:03:31 -0800 (PST)
Message-ID: <9adf9f13-128d-4ef0-ae31-4db4d295e2fe@linaro.org>
Date: Tue, 18 Feb 2025 10:03:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250217093024.1133096-4-quic_jiegan@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH v12 3/7] Coresight: Use
 coresight_etm_get_trace_id() in traceid_show()
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
> From: James Clark <james.clark@linaro.org>
> 
> Use the new API, coresight_etm_get_trace_id, to read the traceid of the ETM
> device when call traceid_show via sysfs node.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 3 +--
>   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 4 ++--
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 68c644be9813..b9006451f515 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -1190,10 +1190,9 @@ static DEVICE_ATTR_RO(cpu);
>   static ssize_t traceid_show(struct device *dev,
>   			    struct device_attribute *attr, char *buf)
>   {
> -	int trace_id;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
>   
> -	trace_id = etm_read_alloc_trace_id(drvdata);
>   	if (trace_id < 0)
>   		return trace_id;
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index c767f8ae4cf1..e5216c0f60da 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -4,6 +4,7 @@
>    * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
>    */
>   
> +#include <linux/coresight.h>
>   #include <linux/pid_namespace.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/sysfs.h>
> @@ -2402,10 +2403,9 @@ static ssize_t trctraceid_show(struct device *dev,
>   			       struct device_attribute *attr,
>   			       char *buf)
>   {
> -	int trace_id;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
>   
> -	trace_id = etm4_read_alloc_trace_id(drvdata);
>   	if (trace_id < 0)
>   		return trace_id;
>   

Reviewed-by: James Clark <james.clark@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
