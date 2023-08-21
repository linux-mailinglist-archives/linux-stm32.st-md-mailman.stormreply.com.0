Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE67828C4
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Aug 2023 14:15:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EC2CC6B44B;
	Mon, 21 Aug 2023 12:15:53 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1908FC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:15:52 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2bbac8ec902so51880801fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 05:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692620151; x=1693224951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w291kJh6Uu4i4etCsCc/KObNvq4GhOSiMKf8RO4JKwI=;
 b=liw57Uk0Mr3v9AE32HoCED+Z+eGisXzD1N2TWMBDG7+2J7cZASovAwzpbehu5BECoJ
 5kxctTz67o5i9WB2Q1OW3g24p2644aigARruVJ9BlfHAEeyUr8Q/534H3YquXrNoSy3e
 K0OywqMJYD6dC1J61zJlEt0QrkuZbJkaOcxQXgg0vQhFWRmGcnhdcymwtx1zZg5B39FD
 ovVT87klInKXCp2Q6qDOGGuhvlUcM7YVKZSFN8CtTWRuclX+Y79zB0lErGQld+1pt/0P
 +tcmDoDM3jiqph/FeJMiwm6acjbQgeXnrlT9VaIZuCm8Ec+jQlB/86yoZ/WaOpPEISCA
 iC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692620151; x=1693224951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w291kJh6Uu4i4etCsCc/KObNvq4GhOSiMKf8RO4JKwI=;
 b=VGH3D/IkKBFoO8un+nixuLil5QkIxyxKOk9bxs7u9+6EHFs56W/M8jKVc/5wlNXpdt
 fIOR2FFPX/13cqwLP+SvmrEJvakNogf5N3i7ne4wLeSQG+DG8XcmqcE3T2JGbv4k1L9S
 5jexu6UWcaFQ0J0HCUyxD4cy11oc3y5qklCXmKKm7FCV2DD1TtXzIdwodRD8cx7hsXT7
 MYXzgVxYzovSdnHjgbvyXvnbbFkmW+mEP0uFNOtwavexwQYNQU9KrG+46TPO5cn04Y9g
 mpwHxfdDlD2aogViynlSMkeTNt12znSBYlIf6Kf5GmafkUcklret+26euFagZOczDZlZ
 7m+Q==
X-Gm-Message-State: AOJu0YyXAHglrnZmz3Eg81lQmAi9e2GCgn941YftYiWK7cRjIGYzB8p7
 zgNygTfjvgrxXe++Jm9gYYM=
X-Google-Smtp-Source: AGHT+IHkdl1866Q0i9AdsppGYbOCZ6YcrUSM97FL7UV/7xWTfPO8VGxEiDCIbt+a16mcLybwg7FGnQ==
X-Received: by 2002:a2e:9b8e:0:b0:2b4:6f0c:4760 with SMTP id
 z14-20020a2e9b8e000000b002b46f0c4760mr4707503lji.11.1692620151262; 
 Mon, 21 Aug 2023 05:15:51 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a2e3a10000000b002b9ccbe074bsm2250181lja.73.2023.08.21.05.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 05:15:50 -0700 (PDT)
Date: Mon, 21 Aug 2023 15:15:48 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <amprmav76sigvwr3vfxhb4sw4srzpld7qn3yrtue2cpxw7qsh7@qlnwdnjv4os5>
References: <20230819023132.23082-1-rohan.g.thomas@intel.com>
 <20230819023132.23082-2-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230819023132.23082-2-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/2] dt-bindings: net: snps,
 dwmac: Tx queues with coe
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

On Sat, Aug 19, 2023 at 10:31:31AM +0800, Rohan G Thomas wrote:
> Add dt-bindings for the number of tx queues with coe support. Some
> dwmac IPs support tx queues only for a few initial tx queues,
> starting from tx queue 0.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index ddf9522a5dc2..0c6431c10cf9 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -313,6 +313,9 @@ properties:
>        snps,tx-queues-to-use:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          description: number of TX queues to be used in the driver
> +      snps,tx-queues-with-coe:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: number of TX queues that support TX checksum offloading
>        snps,tx-sched-wrr:
>          type: boolean
>          description: Weighted Round Robin
> -- 
> 2.19.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
