Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7D5EFFE4
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Sep 2022 00:08:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BE21C64100;
	Thu, 29 Sep 2022 22:08:18 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE727C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 22:08:16 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id m81so3018218oia.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 15:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=6O8Jjng3iyin8rOht5eSYjzFn9Bme9u5OQK0LkD2pu8=;
 b=H2xnaq8OLHzHn1QbjC8scKAoYn5q24oYiI/wh7JY2Hq51sF/pKATSQdSP5Ee3Tu0qK
 kNseFCILO+JrNwbtMdnEwgs3ufcpits2nOH9E2CHzfwlxCIYQXBkE6OLa24asNeg0+ho
 6ELi6zPrJ/QokIYWdwvwHpOdjVW8aYBCj/LT9TX8Ee8ujIFLvJb+9PM63VCDVv2VYDIq
 RFyXfWERKzrdwRWSRTmAR5UTPqhbTISnK7prIyWjRVNgHUO0wnGPYCPaiBlxowGChu91
 rYqlOW6+6xI/5M7k304c54Ux0+o79F3K6MMdTWEymKRRX1BE4RNn+O1avAwyFiDInFPW
 owpQ==
X-Gm-Message-State: ACrzQf2k0IchBmAYwzqP78WdPa7SjSDgV783Y53lsKqnBeesXtf63NbL
 wM7vWVVjRcFvomBu3zG+dg==
X-Google-Smtp-Source: AMsMyM6BAUAzcU5iHjhtArwxDH4lLKHBTagWqW15z6CnS+PiBi2+/SsRCLz0KEtcFaae12p9OiVr+Q==
X-Received: by 2002:aca:1018:0:b0:34d:8f7a:27e1 with SMTP id
 24-20020aca1018000000b0034d8f7a27e1mr8214159oiq.284.1664489295603; 
 Thu, 29 Sep 2022 15:08:15 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056870218d00b0010bf07976c9sm239823oae.41.2022.09.29.15.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 15:08:14 -0700 (PDT)
Received: (nullmailer pid 2832554 invoked by uid 1000);
 Thu, 29 Sep 2022 22:08:13 -0000
Date: Thu, 29 Sep 2022 17:08:13 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166448929263.2832109.15881411107607706980.robh@kernel.org>
References: <20220927012449.698915-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927012449.698915-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: snps,
 dwmac: Document stmmac-axi-config subnode
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

On Tue, 27 Sep 2022 03:24:49 +0200, Marek Vasut wrote:
> The stmmac-axi-config subnode is present in multiple dwmac instance DTs,
> document its content per snps,axi-config property description which is
> a phandle to this subnode.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: netdev@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
