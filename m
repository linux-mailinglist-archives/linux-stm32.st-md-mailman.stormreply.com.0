Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AAC6BDA61
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 21:50:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BE45C6904C;
	Thu, 16 Mar 2023 20:50:46 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF09BC640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 20:50:45 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id y20so4004290lfj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678999845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tm+CR5BUEZPIc6XrcLK40BWz/iwrOweB0rbSxedxb6c=;
 b=DgFpRDyQ6ojzdXRizZH6TFtk+GAyYW0lqAuQCMMBbGoDuLzPT0H77cdP1mV9opDXwB
 6xKWAd7Th/DWIIx4BFYiTDX0yCcjvUuaDmHtHV+YakvBj2YSV2LiGMfn8b3JdMZeXRLD
 P/mQlgYRFi1Zz5icl6QD8T8iuq6vSd8Ig7g1qBh/N63rahkv78/GhY+ItG9FWuqTAwQC
 6+j4mlgSlfPfztlufjqnWDckg6tKHnvUbVDktywcTfMyrxo5QjgRuyw8kI3bEaK/pqbX
 jMycNKQaHSAlbAIGyVOpgkjvcNByY775FhUI1LpaKp26skX+4dGlPqP0ASIPZ20i6lFv
 PypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678999845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tm+CR5BUEZPIc6XrcLK40BWz/iwrOweB0rbSxedxb6c=;
 b=QPS7NPrVLA7zxZCvoBS+ejZe4hH7oyoR0pRVfLmRyLX2dGLk06RSrUsrjAQsJwecpt
 ziOss0U08mn+jlbVu1lRdOlUHJo54LolRWBkzmW3eEtXSoMNbRp6zzkw6sn21ZjfigDV
 BFo1X+/qaifcBFQlvsHHSJjtzPll+9QAtnm/6YigtE619i4qw0Gy1q6KhisxwmpkFQ1Y
 f77QEyh4DqPOrr1UwX5JaZwF2IJtbZTR1vV8NPqsulGXcN4D3HUnglMiDQnmYOnq6hkk
 hvR1ZZ7F60A9UTxSShOpcD3fJF8FrI+sa30vFjZ5ToVUHRHcmVh8A25tdHuMheUz9teK
 ukug==
X-Gm-Message-State: AO0yUKVuvvajI2gAu6EDhZ3/6yHNzYc66QB7pQKHZ2LoCKQX/Qr6krZD
 tMVRPBL2odHNV3/isK+KG5c=
X-Google-Smtp-Source: AK7set93Hh4wAnzsV+brV3vssp16g1107+6Kt8j0R3UNFEyry4cAodJdQraD2u1FFr5AcThx4B+/YQ==
X-Received: by 2002:a05:6512:33c7:b0:4dc:790c:9100 with SMTP id
 d7-20020a05651233c700b004dc790c9100mr280464lfg.12.1678999845018; 
 Thu, 16 Mar 2023 13:50:45 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac25688000000b004d863fa8681sm36473lfr.173.2023.03.16.13.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 13:50:44 -0700 (PDT)
Date: Thu, 16 Mar 2023 23:50:41 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230316205041.vr6nrfbrrbwetng7@mobilestation>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru>
 <167880254800.26004.7037306365469081272.robh@kernel.org>
 <20230314150657.ytgyegi7qlwao6px@mobilestation>
 <20230314170945.6yow2i5z4jdubwgt@mobilestation>
 <20230316204037.GA3844212-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230316204037.GA3844212-robh@kernel.org>
X-Topics: 
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Christian Marangi <ansuelsmth@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 01/16] dt-bindings: net: dwmac:
 Validate PBL for all IP-cores
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

On Thu, Mar 16, 2023 at 03:40:37PM -0500, Rob Herring wrote:
> On Tue, Mar 14, 2023 at 08:09:45PM +0300, Serge Semin wrote:
> > On Tue, Mar 14, 2023 at 06:07:01PM +0300, Serge Semin wrote:
> > > On Tue, Mar 14, 2023 at 09:10:19AM -0500, Rob Herring wrote:
> > > > 
> > > > On Tue, 14 Mar 2023 01:50:48 +0300, Serge Semin wrote:
> > > > > Indeed the maximum DMA burst length can be programmed not only for DW
> > > > > xGMACs, Allwinner EMACs and Spear SoC GMAC, but in accordance with [1]
> > > > > for Generic DW *MAC IP-cores. Moreover the STMMAC set of drivers parse
> > > > > the property and then apply the configuration for all supported DW MAC
> > > > > devices. All of that makes the property being available for all IP-cores
> > > > > the bindings supports. Let's make sure the PBL-related properties are
> > > > > validated for all of them by the common DW MAC DT schema.
> > > > > 
> > > > > [1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
> > > > >     October 2013, p. 380.
> > > > > 
> > > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > 
> > > > > ---
> > > > > 
> > > > > Changelog v1:
> > > > > - Use correct syntax of the JSON pointers, so the later would begin
> > > > >   with a '/' after the '#'.
> > > > > ---
> > > > >  .../devicetree/bindings/net/snps,dwmac.yaml   | 77 +++++++------------
> > > > >  1 file changed, 26 insertions(+), 51 deletions(-)
> > > > > 
> > > > 
> > > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > > 
> > > > yamllint warnings/errors:
> > > > 
> > > > dtschema/dtc warnings/errors:
> > > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
> > > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
> > > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
> > > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
> > > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
> > > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > > 
> > > Oops, on rebasing my work from older kernel I missed that the PBL
> > > properties constraints have already been extended. I'll drop the next
> > > patch in the series then and fix this one so the already defined
> > > constraints would be preserved.
> > 
> > BTW it's strange I didn't have that bug spotted during my
> > dt_binding_check run...
> 

> Perhaps because you set DT_SCHEMA_FILES?

Can't remember now. I might have missed that in the long log as well.
Anyway I'll test it out one more time before fixing.
Thanks for your response.

-Serge(y)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
