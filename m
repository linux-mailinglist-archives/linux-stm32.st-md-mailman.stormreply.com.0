Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 564436B974B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 15:10:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0420EC65E60;
	Tue, 14 Mar 2023 14:10:32 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 497FEC035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 14:10:31 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id r4so8712516ila.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 07:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678803030;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jH1SOi85K699n5gOfmS0IKz7KMvDRC6FpXntoUDhE8s=;
 b=C3SJsuk9D1umO88ho6RS3atAPSErFbulDku/QAkT71Jq+ILLsd1zPMlRkQOHP1AfYZ
 THUIi6TaL4WOgiZjTQl7rXi9Y0HYg/W5ObIHMANqXOjQCLH8TuzED3yY0qMueWDrcPFb
 JSPVA88SpkHvKsr4E+XJK60+F8Bels617s0/wUvym7JIXHoUGikx9/gypsTHQegqsWoq
 eP5kG7Tci5Q3b5LrRRBSu68C6TclNs142BH4MpRRr00CY0YVdcfsaCwG1tRRDsj0ibjm
 F1ayG0Cx+T9cHdCXqgaSxR0SXCczFPXOwNr/otBRlGwzuYZsgWZNc5ikHJ9kyrd5hNvI
 NO0A==
X-Gm-Message-State: AO0yUKV8MmDLakl4li7HyS862sjCg/eQdXi33sGQoMVzrxW3MnHhW04k
 FweV44HeKiNVyw/O6Qyruw==
X-Google-Smtp-Source: AK7set97Yuhz44i0lH7n9ZIMLWNIgKj/fvYuQB9FFs3g1CeDCxrOCx6cMMtgpjYvzcNDqtmwzf3pLw==
X-Received: by 2002:a92:c10f:0:b0:311:13c1:abd4 with SMTP id
 p15-20020a92c10f000000b0031113c1abd4mr2181500ile.24.1678803030034; 
 Tue, 14 Mar 2023 07:10:30 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a056e02130f00b00318a9a35341sm818199ilr.79.2023.03.14.07.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 07:10:27 -0700 (PDT)
Received: (nullmailer pid 83791 invoked by uid 1000);
 Tue, 14 Mar 2023 14:10:19 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru>
Message-Id: <167880254800.26004.7037306365469081272.robh@kernel.org>
Date: Tue, 14 Mar 2023 09:10:19 -0500
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
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
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


On Tue, 14 Mar 2023 01:50:48 +0300, Serge Semin wrote:
> Indeed the maximum DMA burst length can be programmed not only for DW
> xGMACs, Allwinner EMACs and Spear SoC GMAC, but in accordance with [1]
> for Generic DW *MAC IP-cores. Moreover the STMMAC set of drivers parse
> the property and then apply the configuration for all supported DW MAC
> devices. All of that makes the property being available for all IP-cores
> the bindings supports. Let's make sure the PBL-related properties are
> validated for all of them by the common DW MAC DT schema.
> 
> [1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
>     October 2013, p. 380.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changelog v1:
> - Use correct syntax of the JSON pointers, so the later would begin
>   with a '/' after the '#'.
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 77 +++++++------------
>  1 file changed, 26 insertions(+), 51 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
