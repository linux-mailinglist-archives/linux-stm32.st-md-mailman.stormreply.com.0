Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854954E8ED
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 19:55:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9D22C56630;
	Thu, 16 Jun 2022 17:55:35 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9143C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 17:55:34 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id a10so2235998ioe.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 10:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UCSKOFubArDq+VHloMg+XZw1B8bXUpscLNFoCONjN3k=;
 b=AyFtOXepqZoEpJ8gkG/Op1D3qnmy6U9Owr6UJTfscIMqF1oWP+vaOkhF5U6W4yIgzU
 35JbFRxwEdwkudCLsvsWdtfzn2ae4lYZ2JPXQPXio3TS2sEcg5XcSLDOQfKVgq1CoyDm
 NpqYMADj3hQeHrTRUs7AJ/QuaQxmFU0gg5soFo990ngS6PwUR0ypES6TQJYqb2ZXmbK7
 U6d3z7bFJpHSFONzfMjwwevQ2Pucl2O8luSWE8ZpmB4o8h44T1Jwt82yq2OZCauBACbA
 DeSAaZWdagbXN42tPOJVCUq3OY2yVWjGTZpXQ6MjTRReLOfi498kq07lNHxmEwat/SCv
 nueQ==
X-Gm-Message-State: AJIora+heXtlAx6geMyarZKWmO8GdXQSXxQE3tqPqO7kXH/p7xHSOadI
 StyvtJFzdEkO16nSFUv3LA==
X-Google-Smtp-Source: AGRyM1tMLpMB9XlihUQw1iwu/e98dvS1bYPkybTgmIcS7g74288Gn+361K8LstpmpF4HGuseMkNL8g==
X-Received: by 2002:a6b:2ac4:0:b0:66a:3695:abb with SMTP id
 q187-20020a6b2ac4000000b0066a36950abbmr3075205ioq.34.1655402133762; 
 Thu, 16 Jun 2022 10:55:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a02cc18000000b0032e168fa56fsm1149921jap.83.2022.06.16.10.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 10:55:33 -0700 (PDT)
Received: (nullmailer pid 3721404 invoked by uid 1000);
 Thu, 16 Jun 2022 17:55:31 -0000
Date: Thu, 16 Jun 2022 11:55:31 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20220616175531.GA3716982-robh@kernel.org>
References: <20220613093815.18334-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613093815.18334-1-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rcc: stm32: select the
 "secure" path for stm32mp13
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

On Mon, Jun 13, 2022 at 11:38:15AM +0200, Alexandre Torgue wrote:
> Like for stm32mp15, when stm32 RCC node is used to interact with a secure

'st,stm32mp1' is stm32mp15?

> context (using clock SCMI protocol), a different path has to be used for
> yaml verification.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> ---
> 
> Hi Rob, Krzysztof, 
> 
> If you agree with this patch, I'll apply it directly in my STM32 tree.
> 
> Thanks
> Alex
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> index f8c474227807..242fe922b035 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> @@ -78,6 +78,7 @@ if:
>        contains:
>          enum:
>            - st,stm32mp1-rcc-secure
> +          - st,stm32mp13-rcc

You don't need '-secure' because it's always secure?

>  then:
>    properties:
>      clocks:
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
