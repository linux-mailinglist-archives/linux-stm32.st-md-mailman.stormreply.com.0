Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 344DD6C678C
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 13:03:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE070C6A602;
	Thu, 23 Mar 2023 12:03:42 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E824C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 12:03:41 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id e11so13487757lji.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679573020;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d2mt8Dc/ocS7AxhWRTNt2+9WEZGZV0jc7YgGpq/l2wA=;
 b=PKA51kt0JsQLOKFobEusgiO4xJ1YNpSFSbrAdYyVvaGFYamI5SD9/YMoX9/hn344/I
 CJ1dNvsSMFw+jgrkeVxmecO/d7TOM5wfn+PnXRkBAhhdRy/+gtszDOPoVy9Cex/UEWKF
 ThhaO9Jk5LKsGJu75nAaK4P16JF6HtTRCjXmb8pb7rmUkit8XLz+XX98FrNkeJg5EZjR
 EVFVBxyyMh3ZGoARC822bXiG7gyfv3Q8JglwenH2yUQt9w8S6SLC0uYg5fBNo1tkL3TA
 LyOfJL1LcAeeHU0Ib/SHhRi1fNOBWmeYyiYjBCmvER3Vnc2oVTUnn/o1OtA4wXyz/m4t
 LRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679573020;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2mt8Dc/ocS7AxhWRTNt2+9WEZGZV0jc7YgGpq/l2wA=;
 b=hbFYS5R8Fsn6PHh8Q6THJRJ9Chnm181QdIXSTmPeXO0Ed5662plQoZZQZEB1dbuXIj
 0aF1ec9f64YWcpSexBd+KqIRr7rycrDMcRox0EU58OpvCnRp1ppo8O2r4jS+IvtlvByC
 IOIhWjvq9U65XkWTumM1DrzVpiw1BUZaoEO9KxW77FyrCGQBqYs0Xx8qtELVJeexS2w+
 cIlOna1JzIqPO/gE20X0TqzmmX/C5Aoz6Gdsz4x0G7btzIzy4J7HKEZec+HDVHDH7yYe
 xyRj34kxDbA0urP7pMaRjtFIUDB4Efb2EPU/vG1g/bbSYQ3M+HS9SiDosq0eCd9T82F4
 ga/Q==
X-Gm-Message-State: AO0yUKVmAy2UV3qXoKyPCGma/y8CdQADbV9oH2oBSh2j/UYy/r0xkdYA
 jk1zycjHyTYnG/+T6r2p498=
X-Google-Smtp-Source: AK7set96yscptfSwhFYLFTxrBRamLAA1lhCOjFEeDzgEeGGXtplepcLYTAzk8FeHyTyPHNUIF654Sw==
X-Received: by 2002:a2e:9697:0:b0:29f:7525:ce90 with SMTP id
 q23-20020a2e9697000000b0029f7525ce90mr3078096lji.11.1679573020385; 
 Thu, 23 Mar 2023 05:03:40 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05651211d000b004db3e445f1fsm2900003lfr.97.2023.03.23.05.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 05:03:39 -0700 (PDT)
Date: Thu, 23 Mar 2023 15:03:37 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230323120337.xdqetfgnclkmbt7o@mobilestation>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-14-Sergey.Semin@baikalelectronics.ru>
 <cee5e3d7-132c-2c6a-de11-c02ca6499231@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cee5e3d7-132c-2c6a-de11-c02ca6499231@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jose Abreu <joabreu@synopsys.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 Biao Huang <biao.huang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 13/16] dt-bindings: net: dwmac:
 Fix MTL Tx Queue props description
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

On Thu, Mar 16, 2023 at 09:08:48AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 23:51, Serge Semin wrote:
> > Invalid MTL Tx Queues DT-properties description was added right at the
> > initial DCB/AVB features patch. Most likely due to copy-paste mistake the
> > text currently matches to what is specified for the AXI-bus config
> > properties. Let's fix that by providing correct descriptions for MTL Tx
> > Queue DT-properties utilized for the AVB feature (CBS algorithm) tuning.
> > 
> > Fixes: 19d918731797 ("net: stmmac: configuration of CBS in case of a TX AVB queue")
> 
> Fixes must be first in the patchset.

Ok.

-Serge(y)

> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> 
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
