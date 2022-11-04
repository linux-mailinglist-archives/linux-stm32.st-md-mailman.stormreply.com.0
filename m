Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA2E619686
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 13:48:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8A15C65040;
	Fri,  4 Nov 2022 12:48:33 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7BCCC035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 12:48:31 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id k2so2939737qkk.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Nov 2022 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wqi3a7cqHo4gFUwQ2K8FyfWJWVq426ywagQKpCR6FTQ=;
 b=ceYrr4P00mg2C+4LXesfpJ2xHjDKHdtvHNKCey4w9AOIBHLXMjmQIsKUhWfypjJryJ
 oWq1DVFTeKx2bb3TOHIy84crddZ+w0Uk4EISB6W0OYMDRcPpXoCxDFjKbsiJOzrbXxq0
 szAr9OIV1X2DxT4VSzxs8m3mofyW6/xv/m+e8vru1aEUPV9xhDUE4FKM4u8MywqYr+Ob
 n/5OwmJAyDQhUNsresN9GUFsYuJOhjBFrnmXpmkJTd4l4TWy9GikmG3M7JOB204EJQe/
 yRrcrtAlZ0pPD1GbBMLa6bXszAGAopdxZfE2sywzAK+Jeq001QhFcTzUvtfS335heTsa
 9Few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wqi3a7cqHo4gFUwQ2K8FyfWJWVq426ywagQKpCR6FTQ=;
 b=SDNcfxiA9ZuL4ql37KoJKkS7JnxpyUIBBWPUxTVT88rGK0f3pDcwj39XZRHYuXxzuQ
 aSM75Lm/lV+QHMaEGE6J8MGXqoX8+PPH5zOC+V8g0JrP+SuNUbQiWwBDUP74tK+MKu7u
 5BxWrSFCe4vknvIDoF4OTUialU/Ndj1iHgfAafyL36PBlcb0AsnfJdbkx16xVWxI+PtT
 kCHZO6ncoI8a/dAngtHdyCT/5Erod6+0KEkiMCiMXJkiOBnEjjFToN9E25MwYIeklQmJ
 KyCue8aWt4znYPhHJQBVrswwfVzpFa142pHGB/Q6QJgYCfA1ZcN4oM+9wKE/AEGDJ0ji
 tKKw==
X-Gm-Message-State: ACrzQf3ufrvzF1N9RKWx5yQZwtlgDdVWhNyzFpxDSAXWwg+K1K4oD4OS
 gRH5m+bCSuC4Co+7WYNTXnoVag==
X-Google-Smtp-Source: AMsMyM7hFBnhwzxMdmYULTQCkhwuO6DS/PcegMqy/ry3a33q/5BTspu8Y7iX3IJ6fzly0f3yRTxyig==
X-Received: by 2002:a05:620a:22cf:b0:6fa:1e61:9cda with SMTP id
 o15-20020a05620a22cf00b006fa1e619cdamr22976665qki.774.1667566110890; 
 Fri, 04 Nov 2022 05:48:30 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 x8-20020ac85388000000b0039cc82a319asm2311507qtp.76.2022.11.04.05.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 05:48:30 -0700 (PDT)
Message-ID: <a764159c-e67e-1ee7-4b0f-1a08a06b3b3a@linaro.org>
Date: Fri, 4 Nov 2022 08:48:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Sriranjani P <sriranjani.p@samsung.com>, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20221104120517.77980-1-sriranjani.p@samsung.com>
 <CGME20221104115841epcas5p490b99811e257b8f3f965748df0a57be5@epcas5p4.samsung.com>
 <20221104120517.77980-2-sriranjani.p@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104120517.77980-2-sriranjani.p@samsung.com>
Cc: devicetree@vger.kernel.org, Jayati Sahu <jayati.sahu@samsung.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pankaj Dubey <pankaj.dubey@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: net: Add EQoS compatible
	for FSD SoC
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

On 04/11/2022 08:05, Sriranjani P wrote:
> Add FSD Ethernet compatible in dt-bindings document
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>

I did not get cover letter and patch 2. Your CC list is incomplete.

For the record - DTS will not go via net-net but Samsung SoC tree.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
