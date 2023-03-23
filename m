Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA616C6736
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 12:55:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59283C6A602;
	Thu, 23 Mar 2023 11:55:49 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDF13C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 11:55:47 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id bi9so27314439lfb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 04:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679572547;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pHYNa83tThQ0frWDsHo/QOWwz8cR/Huh6dJxDrDmET4=;
 b=d81+39x4T8gwhwD0voOXLnGjRi0m4lXLzZQbM4rcY4LigBG+OX7ZZ96LpmQRdtPxX6
 w1bn1TLk7uFeXt8uWdica9hKim26bA/XH/GEWJMXD4AjH5t/URAoRcooZqlDrDENuNP2
 bghCIRj1iLAOVT2l9d20s++OesHhu5JiAEhD0FUFNcjF7k9YaOIfRDYL7xfTk5ylhiYf
 UupgoVyOentJkbDLQhbDoWFUHw/z8tarHjfd41Edtwpva4nb5QJzJtTTgqtW8Kg+493N
 vXwxgP0hGJErnw9Lu4d106vIbE6neWnhVITO6tFcQqffd4tgxOytPdMvHv8QaZJ+GOql
 5UCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679572547;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHYNa83tThQ0frWDsHo/QOWwz8cR/Huh6dJxDrDmET4=;
 b=S5XDeGysmK5FoilxF1Zxj0lsuj+4CtsWkNUc062mVHAnohYTQb7kG2mfrjY9dIEpCq
 s4qvDIrlBdokbGZcopYNThaC0SQRvXzzKK5JLeqpHY+PI/VH7MlmX7v8hJJvfiTbS50n
 /ITNRqQy8QYe1cp+Cjjifkes1s/H2xtjo285FzbKlAPX4sPSOGtGCmhN4lYGn13iCorG
 Tp5rxN+Y+W2CSTuhOdFnhJO2tr8Ab+L+bC/bdfv3l78hzxyduAuSiJ6xhgeMTEt6gSma
 j9qUI/4TJ7hni83/uao/8jfz/CAktYhzUdcRA14IhtFledkjSobxXyPH43caB9iZiubH
 v0iQ==
X-Gm-Message-State: AO0yUKVj7+U0qpBHQcE4Nb9PUfxQCtFqx7t4tOrOw2otMtozY0M/z7gg
 EkIyWpinVrurDyJvgwQ2jcU=
X-Google-Smtp-Source: AK7set89jZchCIsXX8h5YTQ2Zx37B5rmzAxc7o7bY98z7lG5jEKTSU6uW9D5YFkz2yX8SL9IU7b3Sw==
X-Received: by 2002:a05:6512:4c4:b0:4da:e925:c95b with SMTP id
 w4-20020a05651204c400b004dae925c95bmr3804924lfq.62.1679572547008; 
 Thu, 23 Mar 2023 04:55:47 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 w19-20020ac24433000000b004eb00c0d417sm92313lfl.130.2023.03.23.04.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 04:55:46 -0700 (PDT)
Date: Thu, 23 Mar 2023 14:55:43 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230323115543.3d25i3hdhvqvz2d6@mobilestation>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-13-Sergey.Semin@baikalelectronics.ru>
 <60ce1510-6f2f-dad0-005c-7bcb3880872a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60ce1510-6f2f-dad0-005c-7bcb3880872a@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christian Marangi <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 12/16] dt-bindings: net: dwmac:
 Add MTL Tx Queue properties constraints
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

On Thu, Mar 16, 2023 at 09:08:02AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 23:50, Serge Semin wrote:
> > Currently none of the MTL Tx Queues QoS-related DT-properties have been
> > equipped with the proper constraints meanwhile they can be specified at
> > least based on the corresponding CSR field sizes or the DW (x|xG)MAC
> > IP-core synthesize parameter constraints. Let's do that:
> > + snps,tx-queues-to-use - number of Tx queues to utilise is limited with a
> > number of available queues. DW MAC/GMAC: no queues, DW Eth QoS: <= 8, DW
> > xGMAC: <= 16.
> > + snps,weight - Tx Queue/Traffic Class quantum/weight utilised depending
> > on enabled algorithm for the Data Center Bridging feature: DWRR (up to
> > 0x1312D0 bytes to add to credit) or WFQ (up to 0x3FFF - least bandwidth)
> > or WFQ (up to 0x64). DW MAC/GMAC: no queues, DW Eth QoS: <= 0x1312D0, DW
> > xGMAC: <= 0x1312D0.
> > + snps,send_slope - Tx Queue/Traffic Class Send-Slope credit value
> > subtracted from the accumulated credit for the Audio/Video bridging
> > feature (CBS algorithm, bits per cycle scaled up by 1,024). DW MAC/GMAC:
> > no queues, DW Eth QoS: <= 0x2000, DW xGMAC: <= 0x3FFF.
> > + snps,idle_slope - same meaning as snps,send_slope except it's determines
> > the Idle-Slope credit of CBS algorithm. DW MAC/GMAC: no queues, DW Eth
> > QoS: <= 0x2000, DW xGMAC: <= 0x8000.
> > + snps,high_credit/snps,low_credit - maximum and minimum values
> > accumulated in the credit for the Audio/Video bridging feature (CBS
> > algorithm, bits scaled up by 1,024). DW MAC/GMAC: no queues, DW Eth
> > QoS: <= 0x1FFFFFFF, DW xGMAC: <= 0x1FFFFFFF.
> > + snps,priority - Tx Queue/Traffic Class priority (enabled by the
> > PFC-packets) limits determined by the VLAN tag PRI field width (it's 7).
> > DW MAC/GMAC: no queues, DW Eth QoS: 0xff, DW xGMAC: 0xff.
> > 
> > Since the constraints vary for different IP-cores and the DT-schema is
> > common for all of them the least restrictive values are chosen. The info
> > above can be used for the IP-core specific DT-schemas if anybody ever is
> > bothered with one to create.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  .../bindings/net/snps,dwmac-generic.yaml      |  2 +-
> >  .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++++++++++-
> >  2 files changed, 24 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> > index ae740a1ab213..2974af79511d 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> > @@ -137,7 +137,7 @@ examples:
> >                  snps,send_slope = <0x1000>;
> >                  snps,idle_slope = <0x1000>;
> >                  snps,high_credit = <0x3E800>;
> > -                snps,low_credit = <0xFFC18000>;
> > +                snps,low_credit = <0x1FC18000>;
> >                  snps,priority = <0x1>;
> >              };
> >          };
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index e5662b1498b7..2ebf7995426b 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -250,6 +250,10 @@ properties:
> >        snps,tx-queues-to-use:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >          description: number of TX queues to be used in the driver
> > +        default: 1
> > +        minimum: 1
> > +        maximum: 16
> > +
> >        snps,tx-sched-wrr:
> >          type: boolean
> >          description: Weighted Round Robin
> > @@ -296,13 +300,16 @@ properties:
> >              snps,tx-sched-wfq: false
> >              snps,tx-sched-dwrr: false
> >      patternProperties:
> > -      "^queue[0-9]$":
> > +      "^queue([0-9]|1[0-5])$":
> >          description: Each subnode represents a queue.
> >          type: object
> >          properties:
> >            snps,weight:
> >              $ref: /schemas/types.yaml#/definitions/uint32
> >              description: TX queue weight (if using a DCB weight algorithm)
> > +            minimum: 0
> > +            maximum: 0x1312D0
> > +
> >            snps,dcb-algorithm:
> >              type: boolean
> >              description: TX queue will be working in DCB
> > @@ -315,15 +322,27 @@ properties:
> >            snps,send_slope:
> >              $ref: /schemas/types.yaml#/definitions/uint32
> >              description: enable Low Power Interface
> > +            minimum: 0
> > +            maximum: 0x3FFF
> 
> lowercase hex everywhere.

Got it. Thanks.

-Serge(y)

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
