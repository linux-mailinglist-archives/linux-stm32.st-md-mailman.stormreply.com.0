Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 532DD6BDA4A
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 21:40:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEDC5C6904C;
	Thu, 16 Mar 2023 20:40:43 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EFD6C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 20:40:41 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id i19so1682282ila.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 13:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678999240;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D2MOq1ae2jmvldoEjIFleYkdU8muYIA0Owxizbdn6tU=;
 b=Uac6Cv4skUEWMC7o+xAr3TTn6MLxY97Ob3Gtk565qLnQP6mP17ZrRrZFITnf7XT9k7
 xT2ANhelJSKqOwrT3pdqKHPbcnO3Uujqex5KeeCDE/KqcZVcUY+u1MD2Q3Ej1udNxCiF
 Rd1nkut4ecjhZr6aVTTL16Lh0ZBkkbqD6EqXjZJWVe5tQJWi8nLEQKulMRq1hckDWdd4
 4I0O/45O6FDynGvEz5hw50xl4/3yttw1qBFJreX1pXM44cqXz09nR1s5geuH4WxITwLL
 0tnOO2S1AnUsY5uZ2b5omvzWgdwhIgfo8WawCQ1MgIoL8xERqS7vVCGXUvC4GbPFzByj
 PcPw==
X-Gm-Message-State: AO0yUKVBZxLD1UMI1eEIDt81IVYAiE/zmOoshJthQG/sKSyy8cN5aW2v
 yt9Ea7p5HGe17u3hPJrSRg==
X-Google-Smtp-Source: AK7set9VGmL4NQP8ptL/AQeYRXFeHQSoAkCWC9EhuNamHjr8AzWdzLTX5M2cZtySvCE9EkSC6peA6w==
X-Received: by 2002:a92:d090:0:b0:317:99d0:8ad1 with SMTP id
 h16-20020a92d090000000b0031799d08ad1mr8619161ilh.21.1678999239994; 
 Thu, 16 Mar 2023 13:40:39 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a0566380dd500b003eac69029e5sm81952jaj.79.2023.03.16.13.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 13:40:39 -0700 (PDT)
Received: (nullmailer pid 3845579 invoked by uid 1000);
 Thu, 16 Mar 2023 20:40:37 -0000
Date: Thu, 16 Mar 2023 15:40:37 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20230316204037.GA3844212-robh@kernel.org>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru>
 <167880254800.26004.7037306365469081272.robh@kernel.org>
 <20230314150657.ytgyegi7qlwao6px@mobilestation>
 <20230314170945.6yow2i5z4jdubwgt@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230314170945.6yow2i5z4jdubwgt@mobilestation>
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

On Tue, Mar 14, 2023 at 08:09:45PM +0300, Serge Semin wrote:
> On Tue, Mar 14, 2023 at 06:07:01PM +0300, Serge Semin wrote:
> > On Tue, Mar 14, 2023 at 09:10:19AM -0500, Rob Herring wrote:
> > > 
> > > On Tue, 14 Mar 2023 01:50:48 +0300, Serge Semin wrote:
> > > > Indeed the maximum DMA burst length can be programmed not only for DW
> > > > xGMACs, Allwinner EMACs and Spear SoC GMAC, but in accordance with [1]
> > > > for Generic DW *MAC IP-cores. Moreover the STMMAC set of drivers parse
> > > > the property and then apply the configuration for all supported DW MAC
> > > > devices. All of that makes the property being available for all IP-cores
> > > > the bindings supports. Let's make sure the PBL-related properties are
> > > > validated for all of them by the common DW MAC DT schema.
> > > > 
> > > > [1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
> > > >     October 2013, p. 380.
> > > > 
> > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > 
> > > > ---
> > > > 
> > > > Changelog v1:
> > > > - Use correct syntax of the JSON pointers, so the later would begin
> > > >   with a '/' after the '#'.
> > > > ---
> > > >  .../devicetree/bindings/net/snps,dwmac.yaml   | 77 +++++++------------
> > > >  1 file changed, 26 insertions(+), 51 deletions(-)
> > > > 
> > > 
> > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
> > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
> > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
> > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
> > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
> > > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > 
> > Oops, on rebasing my work from older kernel I missed that the PBL
> > properties constraints have already been extended. I'll drop the next
> > patch in the series then and fix this one so the already defined
> > constraints would be preserved.
> 
> BTW it's strange I didn't have that bug spotted during my
> dt_binding_check run...

Perhaps because you set DT_SCHEMA_FILES?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
