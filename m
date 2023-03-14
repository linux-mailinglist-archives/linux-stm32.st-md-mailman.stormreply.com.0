Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A46B9884
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 16:07:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 241EAC65E60;
	Tue, 14 Mar 2023 15:07:03 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06992C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 15:07:01 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id z5so16328079ljc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678806421;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vbLXsISyWgbVocJH/scN2oci69TRy0WQAp+UcL8HxWE=;
 b=p0EHmvR1vBC356rN7/hm4DOqRkE0aTTA91VTR19VIj+t/xskGgPxcVC3Swn6v9ey4F
 hbZfTPYuaYAyhipmyuQAQiT9RiKEflzSzfvMU8NftKq826q6fQGijvPoAqFXQfhx2YNM
 DZ0i8d+f5YC8PUInQ/YGggRBNF7L0zduinQoSh/szpA7/UfmEdSQZnXCD88Lw2CyoPd2
 AsbYncMjY75d3PAIP65fHKB/efe59KSueM5VSxPJOzIxxOgST+XFh4HkqwTZw7xG5WoD
 H4IY3tz0HYGYUCEVI5Y7rZ2y+Y0sOCOq+odtg7nB0dEuKuiCUypgbTjBbVm/5a2Jzwas
 QqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678806421;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbLXsISyWgbVocJH/scN2oci69TRy0WQAp+UcL8HxWE=;
 b=pYdtjD39490AvYK9qIykSPfbS/I4WAvHuIUxXciH7Ddb+ZivBwBm8VtozTLfHA4vvj
 Qz+51ELCLB3RxIhpdQ9E0aR2b6f5u8f4tqbqOMwPW7vwVxPU1tGW8npXrb2kipDYU4EQ
 Fbb/QRaBliJ9oZabthaKrTzosYywWh99B9ktaoJ5Kg+hWWlW1TmcaCUAL4R65qH9GDnX
 +Yk/QZGzICc4VE9YCc55B7xzxY+tI4F6a7rpO1hgzxR757tSTjP1P/jwNvcVQ9JK086b
 wMXhDf5tv5dPp1oEYr2wetjZ81zxg+Ai3v+Yp4UkrtL2zEEm01E1apG7A4l2k5GV+dmi
 4BXA==
X-Gm-Message-State: AO0yUKWmKaNf+pq/v6/TJInj14ZPUStKZTHtT+ppwweatBYPr+R3wekn
 T89+ndiw+MSMMSnPbBIGulg=
X-Google-Smtp-Source: AK7set+bnaLvSzK+Qv9g7g8oQCKeqApzg3XCPn/W6kdtRZtalZ50JNrzKxOFyptmqs0wq8VDOrJGng==
X-Received: by 2002:a2e:8e8d:0:b0:298:6f36:dd6c with SMTP id
 z13-20020a2e8e8d000000b002986f36dd6cmr7223147ljk.11.1678806421025; 
 Tue, 14 Mar 2023 08:07:01 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a2e9e8e000000b00295b1b6e063sm482600ljk.34.2023.03.14.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:07:00 -0700 (PDT)
Date: Tue, 14 Mar 2023 18:06:57 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230314150657.ytgyegi7qlwao6px@mobilestation>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru>
 <167880254800.26004.7037306365469081272.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <167880254800.26004.7037306365469081272.robh@kernel.org>
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

On Tue, Mar 14, 2023 at 09:10:19AM -0500, Rob Herring wrote:
> 
> On Tue, 14 Mar 2023 01:50:48 +0300, Serge Semin wrote:
> > Indeed the maximum DMA burst length can be programmed not only for DW
> > xGMACs, Allwinner EMACs and Spear SoC GMAC, but in accordance with [1]
> > for Generic DW *MAC IP-cores. Moreover the STMMAC set of drivers parse
> > the property and then apply the configuration for all supported DW MAC
> > devices. All of that makes the property being available for all IP-cores
> > the bindings supports. Let's make sure the PBL-related properties are
> > validated for all of them by the common DW MAC DT schema.
> > 
> > [1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
> >     October 2013, p. 380.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > ---
> > 
> > Changelog v1:
> > - Use correct syntax of the JSON pointers, so the later would begin
> >   with a '/' after the '#'.
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   | 77 +++++++------------
> >  1 file changed, 26 insertions(+), 51 deletions(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

Oops, on rebasing my work from older kernel I missed that the PBL
properties constraints have already been extended. I'll drop the next
patch in the series then and fix this one so the already defined
constraints would be preserved.

-Serge(y)

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
