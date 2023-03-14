Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1A16B9C84
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 18:09:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DC8CC65E60;
	Tue, 14 Mar 2023 17:09:51 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D29BEC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 17:09:49 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id d36so20914372lfv.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678813789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A3mTGYj7JV/DxYx8PY7Jjtyf3i3A4TY4QKPyGUShY+4=;
 b=Pt9FXMyV5qPTnBsN9S1/ue6ef/xHOAdmSIiLfyYu0b5z8FVXXS1yj4ZK1ucSROuPRG
 jDyAlusKmNAaEVi6bK3kDVBpf6AGWU9T7G5LNXbgXRxebGCYrJidVsFdZ+6LCbkTcR59
 xnKKxVKWv9z9kJBHtIXobR8p6nSXCU3GzZTqFQP7wexHJsPLFmx2tZSCK/GA+REeelbu
 0SxCODAFMY88ynul6wJCGBHe7NI+t6qu825Iptsp1ZbKcS8A9M1zyNkc1e1A84ehOq4o
 IdU+k74tQ+L39Bk+Fa/ESNr/YZwbgGVjHerqrj0/7/gdEYmlX3/IBoI1i1DggLgPpprn
 f2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678813789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A3mTGYj7JV/DxYx8PY7Jjtyf3i3A4TY4QKPyGUShY+4=;
 b=Q0C1AcD+aMVxW3DVIHQROSEtQg1K2kizKX+d+4l11njO/cATEg3GYxNQUwtl7t2ljb
 SWlQzFYFqtqGkyKFOxD1vbSJY3xIPYazJvUPR7HS7jX4HjY4N4fbUJY94sVLoSMlBedk
 Ft6HzpFo/EI/HrbSFsaQV3lpS8C3KLnvehN6et0MG2htgO/iDjhQzqPdKGQ5fpsdxJKh
 iZarzze/q0mtiVQu3VVb4jZ1CWXddn+vwGIdanNEezspgOwGvXv7xDAM4bDywEUa/dUP
 A+dVEJcSWw8Ch9UDhXjNm8HnD7oHxifFpg8I461let9jVCGuL4EN9YGbel6YbOwfISoD
 U4NA==
X-Gm-Message-State: AO0yUKWmyXArqsE6ptuurrbHdmBs07xl7ydCKDGPl25IN2CZQybGt+Se
 fm2PjNWGZ8fNebEq1px6Bi8=
X-Google-Smtp-Source: AK7set+uEt5IoqG9OS+mes6VV9AY4oMiyZ0VVvoQaK5iRVnuv11mr63pkW7lH+CP6HBvafiA2+RvoQ==
X-Received: by 2002:ac2:5449:0:b0:4e7:b481:c1c3 with SMTP id
 d9-20020ac25449000000b004e7b481c1c3mr1072908lfn.20.1678813788840; 
 Tue, 14 Mar 2023 10:09:48 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a056512024700b004caf992bba9sm464219lfo.268.2023.03.14.10.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 10:09:48 -0700 (PDT)
Date: Tue, 14 Mar 2023 20:09:45 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230314170945.6yow2i5z4jdubwgt@mobilestation>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru>
 <167880254800.26004.7037306365469081272.robh@kernel.org>
 <20230314150657.ytgyegi7qlwao6px@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230314150657.ytgyegi7qlwao6px@mobilestation>
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

On Tue, Mar 14, 2023 at 06:07:01PM +0300, Serge Semin wrote:
> On Tue, Mar 14, 2023 at 09:10:19AM -0500, Rob Herring wrote:
> > 
> > On Tue, 14 Mar 2023 01:50:48 +0300, Serge Semin wrote:
> > > Indeed the maximum DMA burst length can be programmed not only for DW
> > > xGMACs, Allwinner EMACs and Spear SoC GMAC, but in accordance with [1]
> > > for Generic DW *MAC IP-cores. Moreover the STMMAC set of drivers parse
> > > the property and then apply the configuration for all supported DW MAC
> > > devices. All of that makes the property being available for all IP-cores
> > > the bindings supports. Let's make sure the PBL-related properties are
> > > validated for all of them by the common DW MAC DT schema.
> > > 
> > > [1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
> > >     October 2013, p. 380.
> > > 
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > 
> > > ---
> > > 
> > > Changelog v1:
> > > - Use correct syntax of the JSON pointers, so the later would begin
> > >   with a '/' after the '#'.
> > > ---
> > >  .../devicetree/bindings/net/snps,dwmac.yaml   | 77 +++++++------------
> > >  1 file changed, 26 insertions(+), 51 deletions(-)
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
> > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
> > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
> > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
> > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
> > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 
> Oops, on rebasing my work from older kernel I missed that the PBL
> properties constraints have already been extended. I'll drop the next
> patch in the series then and fix this one so the already defined
> constraints would be preserved.

BTW it's strange I didn't have that bug spotted during my
dt_binding_check run...

-Serge(y)

> 
> -Serge(y)
> 
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
