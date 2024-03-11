Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EAF878FB1
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 09:29:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEA21C6DD9D;
	Tue, 12 Mar 2024 08:29:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26B83C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 15:29:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4132cbe26a9so4361115e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isovalent.com; s=google; t=1710170951; x=1710775751;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oBRdUgazJ1HnLsYGkRF0jKMpPcVcTcXQbKGRIqRZPjY=;
 b=SVn5KyaD5eRJZwzCqZtN5G8s/NuKSZNM/zveCXOzs50Kk3FhAOQaO9+wQ+cRvLIJ1t
 +TaP0fM8HQmhrgyOV0WZXBxGpMzyWijj6B5FxGXW1oUmQLmj5dyGCU1W8X5Ve0g3VE24
 r6ZUMQsWlOx/qDUSsOsxdQxeGs1Ag0IOzkrId056YbWTLrY428zvT3vAT9npPP5Q5cMK
 AHFplmlU2cs8e+8aRkdLHfERCsRh4O1yD8TH12sNnu18rs7X/3UcGidbbuzbNC146fpp
 U4A1nEUgP+t/DzHLT9JdZa3pC4cThtwlurQxJXZrTYoYaMbBDPhatb8aATDVJeSJTZmL
 bGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710170951; x=1710775751;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBRdUgazJ1HnLsYGkRF0jKMpPcVcTcXQbKGRIqRZPjY=;
 b=Iq2fK9cG9PPgpOatmkT62uZnz7cDk3pT1LyTC/oabtDWmLTNG/vDbEHZ+qwbArhB5g
 Cu4kSc5Qt+HdfyI0x1BayGV89O1m1ZHpCCMg0pzWEdOCL9y9Sbg5HN9ZA4kMcGH+iH2H
 bTH6WQI3B68+BcQNTbVJr+CVfhxWyUfdMzfmerEaA+HA2ug2WPOe3WL2NBd9nOhbZeHf
 3h19LRXCVhJGuTvYB347lDxmXMBNI27Cpz/RRB1bPQ/26qWSZgmgHGkBtUH38bI3pX9m
 Cbn9giAp+oEIwFMoM25sIufjx2gf5zQki68MiWh14904ulyZUoNnMAOFUxtIMq4DmNTn
 979Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj5H7edZuIvhkViAaaqB8eeZGryz252YuWttGH0ASVpMmL9borPoSe5Bh+plXInOpoIAQkuTIUPi9h00dxu9pUpFggur9MXbdcQHrlfEpqiC/rtuovot4i
X-Gm-Message-State: AOJu0YyToJEAvm+U17jGdCAobgIf+DWUV1tli7M9oYr+cH0ae6kdbMwC
 nX851Z/sG2L+j4/LFF27feQBBYj3VG1u6aXnKayJ4TyH1MoSuyLAyr1ZE9vXszY=
X-Google-Smtp-Source: AGHT+IEwgdh7H+9crLcV9S5SLA+JZoumOzg/VaQuwX7biWBYjQ6DqPv+BHttGcsj9IyOJw9JoIyg7w==
X-Received: by 2002:a05:600c:4449:b0:413:1f5c:baa6 with SMTP id
 v9-20020a05600c444900b004131f5cbaa6mr5344265wmn.30.1710170951441; 
 Mon, 11 Mar 2024 08:29:11 -0700 (PDT)
Received: from ?IPV6:2a02:8011:e80c:0:5231:db44:25b0:339e?
 ([2a02:8011:e80c:0:5231:db44:25b0:339e])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c4f8400b00412ff941abasm15941091wmq.21.2024.03.11.08.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 08:29:11 -0700 (PDT)
Message-ID: <e8f37842-1ddf-4241-97f3-b83ffcb32ddc@isovalent.com>
Date: Mon, 11 Mar 2024 15:29:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Menglong Dong <dongmenglong.8@bytedance.com>, andrii@kernel.org
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
X-Mailman-Approved-At: Tue, 12 Mar 2024 08:29:06 +0000
Cc: linux-kselftest@vger.kernel.org, dave.hansen@linux.intel.com,
 ast@kernel.org, song@kernel.org, sdf@google.com, yonghong.song@linux.dev,
 agordeev@linux.ibm.com, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, daniel@iogearbox.net, x86@kernel.org,
 john.fastabend@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 borntraeger@linux.ibm.com, linux-trace-kernel@vger.kernel.org,
 rostedt@goodmis.org, kpsingh@kernel.org, mathieu.desnoyers@efficios.com,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 eddyz87@gmail.com, svens@linux.ibm.com, jolsa@kernel.org, bpf@vger.kernel.org,
 martin.lau@linux.dev, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 8/9] libbpf: add support for
 the multi-link of tracing
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

2024-03-11 09:35 UTC+0000 ~ Menglong Dong <dongmenglong.8@bytedance.com>
> Add support for the attach types of:
> 
> BPF_TRACE_FENTRY_MULTI
> BPF_TRACE_FEXIT_MULTI
> BPF_MODIFY_RETURN_MULTI
> 
> Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
> ---
>  tools/bpf/bpftool/common.c |   3 +
>  tools/lib/bpf/bpf.c        |  10 +++
>  tools/lib/bpf/bpf.h        |   6 ++
>  tools/lib/bpf/libbpf.c     | 168 ++++++++++++++++++++++++++++++++++++-
>  tools/lib/bpf/libbpf.h     |  14 ++++
>  tools/lib/bpf/libbpf.map   |   1 +
>  6 files changed, 199 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/bpf/bpftool/common.c b/tools/bpf/bpftool/common.c
> index cc6e6aae2447..ffc85256671d 100644
> --- a/tools/bpf/bpftool/common.c
> +++ b/tools/bpf/bpftool/common.c
> @@ -1089,6 +1089,9 @@ const char *bpf_attach_type_input_str(enum bpf_attach_type t)
>  	case BPF_TRACE_FENTRY:			return "fentry";
>  	case BPF_TRACE_FEXIT:			return "fexit";
>  	case BPF_MODIFY_RETURN:			return "mod_ret";
> +	case BPF_TRACE_FENTRY_MULTI:		return "fentry_multi";
> +	case BPF_TRACE_FEXIT_MULTI:		return "fexit_multi";
> +	case BPF_MODIFY_RETURN_MULTI:		return "mod_ret_multi";
>  	case BPF_SK_REUSEPORT_SELECT:		return "sk_skb_reuseport_select";
>  	case BPF_SK_REUSEPORT_SELECT_OR_MIGRATE:	return "sk_skb_reuseport_select_or_migrate";
>  	default:	return libbpf_bpf_attach_type_str(t);

Hi, please drop this part in bpftool.

bpf_attach_type_input_str() is used for legacy attach type names that
were used before bpftool switched to libbpf_bpf_attach_type_str(), and
that are still supported today. The names for new attach types should
just be retrieved with libbpf_bpf_attach_type_str(). And function
bpf_attach_type_input_str() is also only used for attaching
cgroup-related programs with "bpftool cgroup (at|de)tach".

Thanks,
Quentin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
