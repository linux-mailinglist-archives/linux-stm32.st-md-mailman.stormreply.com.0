Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C176C66C5
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 12:37:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F14AC6A602;
	Thu, 23 Mar 2023 11:37:54 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47078C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 11:37:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id y20so27280916lfj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679571472;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9wqfCTQu6TpSkQBuufTN+FDVnW3u9zukJQMSdPwg2XI=;
 b=Op0RbaHTvg7xYxUMJ5x37/ssOSmmCk314Ar6tZMsow7cQf4VpukR5WbwpoKvNPlu2w
 qpLueWiBUoznP+bidlh55yerR8HD4zeejtChefwtTSe1QazWFMbdyGnY7mUCCXIN+C5p
 UtnU1MO4sn6fjSneBxTpdUUWbf/OTjbDO2fQyhJFMTedWk4Q8Hz0fa2g4qKvUuPB0R0L
 pOA5cNoFm5zLcVhgdJ0m8/KbohJNPJzBwmiyVYWwPrA/h+CvdZpyS1elXEd1H4aTKx2K
 M5V9cImzOfpBDW+UvHUuaXJGB+wAOK6qAO5qwuxxINZy8nyW6mJW1jCqvnH/gYAcr4fB
 81Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679571472;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wqfCTQu6TpSkQBuufTN+FDVnW3u9zukJQMSdPwg2XI=;
 b=I21kdY6UwGwYKJj0ft7uUtthrlbbG9pip0pZ4NtNq+koH/mqi67YQ0cb/D8fNI6FI7
 Jp4dBLNR+4CYdW+BBvzFSZdohQkD/qchJFTGhDCiYziMcjfPmlc8M/6amF3mCbm9TYrO
 7SfTp0USORFsIAIIg78cQiyVsdWs8FRfszK5Kjh+TYgQfSHGvSAkaXj7pBR45X+3+EhF
 kxxajjZcMx41SeqigtcLXUZ/llTuoOY0wiksNaBX7ZAXBIijPr1iLcx/HOW87kG/8OOl
 ydhNAybNGVqybxqhzoc4kcKo7NK5uzk45lQS3dTOd94icScoktJ7ERiffMPcc15lBbpB
 Ehfg==
X-Gm-Message-State: AO0yUKX8/sSzGEMmjRRI5MgNSqQtZ9dFoSZlvTcSURMJ+NjHOS6jcwWC
 6Q3rPMFPNLn2vV43eli3cqw=
X-Google-Smtp-Source: AK7set/GwotgsUGGJrT8NBvp53IUC4qj6qO7Ly+8+IGCS8e+OHcK+s+ODAxaZ68ZV4PenA/B0IUpqw==
X-Received: by 2002:a05:6512:102d:b0:4e7:fa8a:886e with SMTP id
 r13-20020a056512102d00b004e7fa8a886emr2704920lfr.51.1679571472098; 
 Thu, 23 Mar 2023 04:37:52 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 w9-20020ac254a9000000b004e845b49d81sm2898087lfk.140.2023.03.23.04.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 04:37:51 -0700 (PDT)
Date: Thu, 23 Mar 2023 14:37:48 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230323113748.bj45qbvut2cthvyr@mobilestation>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-10-Sergey.Semin@baikalelectronics.ru>
 <78224241-00a3-2e8e-4763-603b27ac3b83@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78224241-00a3-2e8e-4763-603b27ac3b83@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christian Marangi <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 09/16] dt-bindings: net: dwmac:
 Prohibit additional props in AXI-config
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

On Thu, Mar 16, 2023 at 09:06:04AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 23:50, Serge Semin wrote:
> > Currently DT-schema of the AXI-bus config sub-node prohibits to have
> > unknown properties by using the unevaluatedProperties property. It's
> > overkill for the sub-node which doesn't use any combining schemas
> > keywords (allOf, anyOf, etc). Instead more natural is to use
> > additionalProperties to prohibit for that.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 89be67e55c3e..d1b2910b799b 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -466,7 +466,6 @@ properties:
> >  
> >    stmmac-axi-config:
> >      type: object
> > -    unevaluatedProperties: false
> >      description:
> >        AXI BUS Mode parameters.
> >  
> > @@ -518,6 +517,8 @@ properties:
> >          description:
> >            rebuild INCRx Burst
> >  
> > +    additionalProperties: false
> 
> But why moving it? Keep the same placement.

No firm justification except that vast majority of DT bindings have
that keyword placed at the tail of the schema body. Anyway I'll get
the it back to the original line.

-Serge(y)

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
