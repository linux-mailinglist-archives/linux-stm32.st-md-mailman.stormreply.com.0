Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A2701CAB
	for <lists+linux-stm32@lfdr.de>; Sun, 14 May 2023 11:40:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D144C6A60A;
	Sun, 14 May 2023 09:40:29 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95A66C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 May 2023 09:40:28 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so21627697a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 May 2023 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684057228; x=1686649228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BUW5Igqs7LC8kFWD+gx7NXGPi2rebIGLbHvwwwSiejg=;
 b=qXXhvc16BjYtVI3RbWOmC2jcpEyJzngGFk7rTOlKurSjGDFWBpYgdEvBtpF7PbvqPk
 LcF8bPTz/Z2ubuDmYhgV4xpBsUpjue1LmwZElZ5UBB3Ko/KlU8ajA0UnrVTl7a6MrT/R
 8ZFK0CXEPdUAYwSd9NrcTMyzrHZRaCaEjkk/f8HcdW4jOnbwkRi+iFozOOjGzTn/WjNP
 EMVB013lxv2F6V1fzPbMtP4n/+dw/vhcALq2AUFAFTngW/dtGKYKjRISLzCtnwDsoa0L
 rNozicmyV8IeEo9P2/2j3Gntpa75d5DBBMc1QToOBDpLjhFPh5WWT9e59MeOz8xE+zL4
 1FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684057228; x=1686649228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUW5Igqs7LC8kFWD+gx7NXGPi2rebIGLbHvwwwSiejg=;
 b=lBWEm7OOfRJymHyRZEtf0k2mxGxkRwNBNTk5MwT6E23etGYGmrubl9NmufdTKchx+X
 1xCl80ugFhttGCdm+CKTIk1RM+uMyA0nTwx/WFQvsxFSiqDsDfWM4sI/xTe7wB+gVHWb
 T12CQHLkcV2OQoeOhydYYhwR3AejIHlJZ0Yt9mmJNAQmMXdjrw28vr5+cZhPsBY8YRFp
 gB9BL48lmaCRZ5XTRyUMVxvgr5eYP9dVWyz1OtJt06AuJQfwguq/ow5fwy9/WazWZ38e
 hyeZ0Zb+RjESUtK/Mz7BgRD2Rr+xgvxX5FOPpimfoJ7Ya7sVwXfK6branSOoGZOIY2sm
 iLcw==
X-Gm-Message-State: AC+VfDyqNfIMyEfRcG2Efa9iPrhh8thAFUqvPLDQYlsJpaCuJUz8aU/Y
 veKNPH40+FP/7K3FTMK10g2Q/g==
X-Google-Smtp-Source: ACHHUZ5tvbL4jEsqJPpeimvea31dJCAToYMyDZrxSAb7ema2CejXD77WW74NrQEAUWZyA9z90xWIjA==
X-Received: by 2002:a17:907:1b29:b0:94f:2d5f:6949 with SMTP id
 mp41-20020a1709071b2900b0094f2d5f6949mr32171616ejc.42.1684057227954; 
 Sun, 14 May 2023 02:40:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:715f:ddce:f2ba:123b?
 ([2a02:810d:15c0:828:715f:ddce:f2ba:123b])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170907270a00b00965e9a23f2bsm7882998ejk.134.2023.05.14.02.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 02:40:27 -0700 (PDT)
Message-ID: <e61d2168-9114-6f95-2607-a553d1046caa@linaro.org>
Date: Sun, 14 May 2023 11:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230512093926.661509-1-arnaud.pouliquen@foss.st.com>
 <20230512093926.661509-2-arnaud.pouliquen@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512093926.661509-2-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: remoteproc: st,
 stm32-rproc: Rework reset declarations
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

On 12/05/2023 11:39, Arnaud Pouliquen wrote:
> With the introduction of the SCMI (System Control and Management
> Interface), it is now possible to use the SCMI to handle the
> hold boot instead of a dedicated SMC call.
> 
> As consequence two configurations are possible:
> - without SCMI server on OP-TEE:
>   use the Linux rcc reset service and use syscon for the MCU hold boot
> - With SCMI server on OP-TEE:
>   use the SCMI reset service for both the MCU reset and the MCU hold boot.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
