Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D650EA209FC
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 12:55:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6663FC7801F;
	Tue, 28 Jan 2025 11:55:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A786C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 11:54:53 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso3046913f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 03:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738065293; x=1738670093;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gmf7mcPtQwX9tpVIZFfSi4yhDQ1AXN5DwMHqelwsOGg=;
 b=gZH5Ao+69r7NkeAIb10zeDX9bZe8XXngt2grA3LhVMwH+KFjQM7Cz4ajJ2Xha5OoW5
 3D9hr2EjpjOGTBWQQFSiOsY84ysuO/g617ebnBHvLuO0flxvHRCEZ+i7oI9xjwcmnuK/
 zk4aPSA9n94UIJNG3URobpqIFZ/xzXeaBl7nLsjEjMl8jNyn+TZYnYwt1Q0Fd9NgEEHU
 33Uu17+BM0BBrdkpf6QzrnITGll565Kmc2fiLh8XRRXkiIP6aszllb2uHHse1Lp5VqWM
 C4Yf8P62BpDRtD34QZCyNPV2cG2DN//GnmaVazU/2TAoT5IyPAeQAkhT8sWwiuhLoK10
 o0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738065293; x=1738670093;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gmf7mcPtQwX9tpVIZFfSi4yhDQ1AXN5DwMHqelwsOGg=;
 b=GeDdtYhhosRA4pgHzkAaO16S3CdwBZrLotR2yDWWdAC+eg+C15HlnHb1K2iGi9fWJq
 YhC2SupzxaLUvhV5z5MgdY4/m7PpC0hMEw6RrP1YTKwtLBBav6MkqLIPwKdsyGut/0sz
 xaa69jSVBjpXle+KPCnNP9HYv/zuQv7MdXd2rzsSqBBefTang/YrmP2GaSwIwWxgyMRa
 oQYLWBe+TtLW3GeQenszmhtvEoT0QcjxX8uBeY3/mLmviQSEgv1WGcW59bwHPBiNzMUQ
 oKNdzMdpdUVI7cLH7hH66yGZI/agHNeRdN8WSOc7zKWVDn+novrQKbj8l6gJ/Yn3Lhep
 RH/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV16soeOnJ4P+/IS0qek5u8T/9kivWEAoa6uU7I9jyXRHuYHtcyY1QngOY3AxJu/mbOla7VKIvbz6mTvA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzmhfzditAMbId8p/HryQddoljk1TswailAl59i7PIKm4ScWF1
 eQTXzP4dQ8om8LhoN19XYt5EOh59+qS0uu+HfJXEHwUHUSOjnTWdRdbc7Ev0FJs=
X-Gm-Gg: ASbGncvHnQS5q+yfIrjT5vkrxPW47pacYJanJ8fPBBcpQWldn04vtL+vbXeF5raupz9
 Ic6wSqmyorpNbZEI7eDHVTZQfoFhU5DX1lr44vo5x26xCBPUpOWdg6aRoT5b9O2HFM2CVF15wmQ
 y14HLi85Np5v472QnSXoK8dlAj5BhJXa6+HFv+2oOACXQbQSah7LPk7X+yYTBksP6MHUr/Eb9su
 /6qO+3b7wzdJt44sXCgk/+ocnI3TICCXDsYbuMg7BByDR1NlpVkM75SgfSCo5sVg12KJOhrDahp
 3OcjfW8VPZtNaKLfwuZFBT5m/A==
X-Google-Smtp-Source: AGHT+IHDFuV7bbeobdH8NJ7zs7YKsojRKqZ82J0IkoSCP3pGxLQVoQ/0mthDOYphu4LwsfSwyMaGvg==
X-Received: by 2002:a5d:6505:0:b0:38a:88ac:ed10 with SMTP id
 ffacd0b85a97d-38bf5789edcmr34949134f8f.25.1738065292604; 
 Tue, 28 Jan 2025 03:54:52 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb0besm14135821f8f.79.2025.01.28.03.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 03:54:52 -0800 (PST)
Message-ID: <538ae543-4c43-4df2-8adc-911096fe14dd@linaro.org>
Date: Tue, 28 Jan 2025 11:54:50 +0000
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
>   drivers/hwtracing/coresight/coresight-core.c  | 87 ++++++++++++++-----
>   drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  | 52 ++++++-----
>   .../hwtracing/coresight/coresight-etm-perf.h  |  2 +-
>   drivers/hwtracing/coresight/coresight-priv.h  | 21 +++--
>   drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++----
>   .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
>   drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>   10 files changed, 137 insertions(+), 76 deletions(-)
> 

[...]


>   	INIT_LIST_HEAD(path);
> +	cs_path->path = path;
> +	/*
> +	 * Since not all source devices have a defined trace_id function,
> +	 * make sure to check for it before use.
> +	 *
> +	 * Assert the mode is CS_MODE_SYSFS, the trace_id will be assigned
> +	 * again later if the mode is CS_MODE_PERF.
> +	 */
> +	if (source_ops(source)->trace_id != NULL) {
> +		rc = source_ops(source)->trace_id(source, CS_MODE_SYSFS, NULL);

I don't think we should do this. Doesn't this consume two trace IDs for 
each session? And I'm not even sure if it's released properly if it's 
overwritten.

It should be possible to consolidate the all the trace ID allocation to 
a single step when building the path, or another function that gets 
called just after the path is built. At the moment the ID can be 
allocated from about 5 different places and it's quite hard to 
understand, especially with these new changes. I have some of it coded 
up, let me finish it off and I can share it.

> +		if(IS_VALID_CS_TRACE_ID(rc))
> +			cs_path->trace_id = rc;
> +		else
> +			cs_path->trace_id = 0;
> +	}
> +	else
> +		cs_path->trace_id = 0;

[...]

> +/**
> + * struct coresight_path - data needed by enable/disable path
> + * @handle:		perf aux handle for ETM.
> + * @path:		path from source to sink.
> + * @trace_id:		trace_id of the whole path.
> + */
> +struct coresight_path {
> +	struct perf_output_handle	*handle;

This is only needed to avoid adding *handle to the enable function call 
signature, but having it here implies it needs to be stored. And then we 
need to manage the lifecycle of it by nulling it on deletion. All of 
this can be avoided by just adding handle to enable().

Unrelated to this patch, but I'm not sure why we were passing around 
void* for handle either. It just makes the code hard to read and implies 
some flexibility that doesn't exist. It's always "struct 
perf_output_handle", so we can change void* to that in the enable 
functions. I also have a patch for this that I'll share in a bit.

> +	struct list_head		*path;
> +	u8				trace_id;
> +};
> +
>   static inline void coresight_insert_barrier_packet(void *buf)
>   {
>   	if (buf)
> @@ -132,16 +144,15 @@ static inline void CS_UNLOCK(void __iomem *addr)
>   	} while (0);
>   }
>   
> -void coresight_disable_path(struct list_head *path);
> -int coresight_enable_path(struct list_head *path, enum cs_mode mode,
> -			  void *sink_data);
> +void coresight_disable_path(struct coresight_path *cs_path);
> +int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode);
>   struct coresight_device *coresight_get_sink(struct list_head *path);

This needs to be exported otherwise the build fails because you use it 
in a module in another commit. I assume you are building as static?


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
