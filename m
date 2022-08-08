Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8306058C535
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Aug 2022 11:01:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 271FFC04001;
	Mon,  8 Aug 2022 09:01:33 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A37D6C03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 09:01:31 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id x19so3439607lfq.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Aug 2022 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tAR6MlMDHmDQO73lbvVKnLotbZsWUuiG6QGGNmumCB8=;
 b=gWVR2Kps4D8nn0alN5B/hZGj94MWs7kU7Gwqnnl2BvuVMokaEcekKRrxTI5hOCdM7K
 PhgHi4f15Zc1B7KE8+KVwzj6YPXUPs4qDSzBYRNmcEhc0d1FG3Ay90Dh3A6U70M/4mm2
 SP3fmkuUL1t/hD4oHqurrdKK+bN3wDgIx7b7HS0vy+/Hpo95vdj6sK6rey97Jf022eDq
 wol4+vnqdptvdGx0D4jEZTmFdLSe5VPfWINbZAAa7nM/tLL6+tXSQocSdFli84RofZ5j
 LZM5IefgJuEsPr7IG3MV+NXR8Artn3/kDPgFGBKdpu6BWQeBB/v9MbPySJctKuwK2Dp+
 tRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tAR6MlMDHmDQO73lbvVKnLotbZsWUuiG6QGGNmumCB8=;
 b=L+2F07HnZOxaQDhH5qM1QZ+xHAnoJFdqX2XUhiep13Q07U/qUwP9kJ/qFf2AgmurTV
 OIg85i2bJW9Ld8e3+5AyfwXbS8OqeOwOjL76QDP+9hqP6krEu2ieHXuzl6R1cqqGOzDn
 cTH3TOUEyfhSJLCWCqomuw4Ws8+pkbyUnHOZGJ9RdhQ1YOB0fh2oz1YoqozIcqGMA4jf
 kjMKmZEMaycHkLdc5URqqiN26pGirZoR8q6e8BxG2s0A4dnNNbaBltHTwwIzh6+uJUkp
 j8JY4InhNOoihkgHp4PgqNC05y8rwBfmt6OmQqA2/bR5iWdHTbGiynm1jO2kg+6MZsf7
 A+gg==
X-Gm-Message-State: ACgBeo1O/EHD/JfN5NQ542hrZpDgg0m1EFXRg4DeZL35y2PQOqzGPW/1
 mTlAB4drBnBB7URlqQgab8VE3w==
X-Google-Smtp-Source: AA6agR6JGWYSid7rm3XtqM4yDPbb3OxW1R/HkQ9bGdK161ybakPEk9MBDB6c00tdGP8rOZd5G05GEA==
X-Received: by 2002:a05:6512:2201:b0:48a:7440:aaf6 with SMTP id
 h1-20020a056512220100b0048a7440aaf6mr6169290lfu.472.1659949290876; 
 Mon, 08 Aug 2022 02:01:30 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 201-20020a2e09d2000000b0025e5fd96bf6sm1281379ljj.15.2022.08.08.02.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 02:01:30 -0700 (PDT)
Message-ID: <9ad4b4a8-988e-f185-f80c-6f15f341ce8c@linaro.org>
Date: Mon, 8 Aug 2022 12:01:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220808074051.44736-1-patrice.chotard@foss.st.com>
 <20220808074051.44736-2-patrice.chotard@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220808074051.44736-2-patrice.chotard@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: spi: stm32: Add st,
 dual-flash property in st, stm32-qspi.yaml
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

On 08/08/2022 10:40, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Add new property st,dual-flash which allows to use the QSPI interface as a
> communication channel using up to 8 qspi line.
> This mode can only be used if cs-gpios property is defined.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> index 6ec6f556182f..5e4f9109799e 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> @@ -46,6 +46,14 @@ properties:
>        - const: tx
>        - const: rx
>  
> +  st,dual-flash:
> +    type: boolean
> +    description:
> +      Allows to use 8 data lines in case cs-gpios property is defined.

It's named dual-flash, but what if you want to use QSPI to connect for
example to FPGA?

Also how is this related to parallel-memories property?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
