Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7B6C670E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 12:49:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF20FC6A602;
	Thu, 23 Mar 2023 11:49:05 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4521C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 11:49:04 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id bi9so27282648lfb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 04:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679572144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P98gCKiuXHcAXO0IW30QLmGZe+1zDOszgmMTppwep1Y=;
 b=kOLDCZtRhvL2t2ixB4Ecmb2mYtVsQbpH9hOUXBtXyzSDEwmtf3LohWwaXB5dq2O2zw
 Z6PX8n6kUNNZQAxIdWGhkryNkYVIJMNdbbkGSvKKJdrMbqgpZ68Iw+hpNL8N9hZ2ghlv
 UMg9yh/qiaxJFDaHnrLOLMeFbRCKOLWUThRxhs95006FEWVpAxNVSlxPNPsDdXvp3LHP
 9KIG35rbALoZAeyE03QVGRc8OPPQkXMkXoxr0uCRbOepeaI6PUowMtYrDYQDZR4uu8y1
 e8WOM7sl8eXeFkrEA2OdFzPcaud8gkL2UgUkgv2iVthLNW+zTEA4biOipmqZ+8KroTg4
 o4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679572144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P98gCKiuXHcAXO0IW30QLmGZe+1zDOszgmMTppwep1Y=;
 b=K+EXu+D+Y2FuVwdJrwU56IufXo5l6CJBV3hKm7kgu8aTsZ8pRMxMOzRFWuyejLTg7Y
 6nbaiT7RZBSxG9lCA3YdW/fZ0Y7ej6hVsy8Ix/zDr4yxb/Q/wo9aNsKnPWtc4Zlqfk/c
 yBNcsyq9TT89WN/LyMyHMW3QM1GP3n8+StqigI2NVVebfZcFAZkmQBlO7uHsUW9c2FuM
 y4bTpO2E0vGvjUJ/OKhL4HBSmPww5mBl/uAq/z0C1BuKzlAbtLNeRjL2G+i7W4aRg0Db
 6IUEYYCzO5tK8czDTHx5BwRH7hk7x0WS9wcG5z47FZByW77y1Mlk3NF004nnY4jYOERw
 AEQA==
X-Gm-Message-State: AO0yUKW9WNymO8EROAIW3uL7iOBIv2lJJUSjhL9hB/z03RyeNzOqCyiN
 UnR2t2qOEnmU8Jd7vzNm2c4=
X-Google-Smtp-Source: AK7set+OZ5RohXKrqoNxbr5LNz9IYAEZzXjD7ahv2qbaEU7/L9WaV1ILCB8rtLSxCgXFO6/YSbF/bA==
X-Received: by 2002:ac2:43d3:0:b0:4a4:68b9:1a14 with SMTP id
 u19-20020ac243d3000000b004a468b91a14mr2636974lfl.60.1679572143721; 
 Thu, 23 Mar 2023 04:49:03 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm2912464lfm.106.2023.03.23.04.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 04:49:03 -0700 (PDT)
Date: Thu, 23 Mar 2023 14:49:00 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230323114900.l56bqiazkc5llvql@mobilestation>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-11-Sergey.Semin@baikalelectronics.ru>
 <c9577e01-b6a0-48d9-173e-2eddffd8019c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9577e01-b6a0-48d9-173e-2eddffd8019c@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH net-next 10/16] dt-bindings: net: dwmac:
 Add AXI-bus properties constraints
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

On Thu, Mar 16, 2023 at 09:06:32AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 23:50, Serge Semin wrote:
> > Currently none of the AXI-bus non-boolean DT-properties have constraints
> > defined meanwhile they can be specified at least based on the
> > corresponding device configs. Let's do that:
> > + snps,wr_osr_lm/snps,rd_osr_lmt - maximum number of outstanding AXI-bus
> > read/write requests is limited with the IP-core synthesize parameter
> > AXI_MAX_{RD,WR}_REQ. DW MAC/GMAC: <= 16, DW Eth QoS: <= 32, DW xGMAC: <=
> > 64. The least restrictive constraint is defined since the DT-schema is
> > common for all IP-cores.
> > + snps,blen - array of the burst lengths supported by the AXI-bus. Values
> > are limited by the AXI3/4 bus standard, available AXI/System bus CSR flags
> > and the AXI-bus IP-core synthesize config . All DW *MACs support setting
> > the burst length within the set: 4, 8, 16, 32, 64, 128, 256. If some burst
> > length is unsupported a zero value can be specified instead in the array.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> 
> >  
> >        snps,kbbe:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -501,6 +507,8 @@ properties:
> >            this is a vector of supported burst length.
> >          minItems: 7
> >          maxItems: 7
> > +        items:
> > +          enum: [256, 128, 64, 32, 16, 8, 4, 0]
> 

> Increasing order.

Ok.

-Serge(y)

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
