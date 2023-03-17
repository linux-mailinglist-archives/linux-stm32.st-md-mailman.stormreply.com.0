Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 493636BF33A
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 21:57:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C83AC6907C;
	Fri, 17 Mar 2023 20:57:06 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88D73C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 20:57:04 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id q6so2872223iot.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 13:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679086623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLFg5SJlhums3IhrKCKFmTnC2PnKge+4XwzniRuOanQ=;
 b=aaTGBlC96VABKmNAeacW+uqYNA4XyFUjLashAuBUcHap2G9fkdGH9l3ul50xPKMi0y
 22LWiMvoKX18FHu0AgbpBT+l0ZX+xYm1rpU5KYZoKXRFJ4ZWdqb6V08imT5Wa6HnImJY
 yl/93PkrQVG8iCP0UkCZvlC05E8mx0GaCb6vXnSCLQDPOdf4lfX8Rp484dvL2azKsPY+
 NiN+qTEPkneI1Pr4yeZ1X9HKAVtJ7moJIC5oF2z+Zx+nHl3l/oAf9Olhjz1dtIZxyuvx
 vPiCAQsWMRYEEb6LJbhmfgnDFPScoXZtorCCxSKkU7aKnTVICgQRohBMst70tMh70Byq
 n8JA==
X-Gm-Message-State: AO0yUKW7EUDTU9SJrdOyCLySyD/NLyMtn4zCULip2QcwMUk2nasJ96Sn
 PGyNNMC+LesWEz3LJLV+vg==
X-Google-Smtp-Source: AK7set/Rej6w9mB2VDRi5FHjVEC3hMKbesjJ9soHth3jWZgIRADTjBlxR2RmJUvd0fxae8dMdcK3qw==
X-Received: by 2002:a5e:a918:0:b0:753:568:358e with SMTP id
 c24-20020a5ea918000000b007530568358emr472070iod.20.1679086623499; 
 Fri, 17 Mar 2023 13:57:03 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a02a191000000b003a958069dbfsm1009918jah.8.2023.03.17.13.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 13:57:02 -0700 (PDT)
Received: (nullmailer pid 2788499 invoked by uid 1000);
 Fri, 17 Mar 2023 20:57:00 -0000
Date: Fri, 17 Mar 2023 15:57:00 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <167908661916.2788441.13598395924571888568.robh@kernel.org>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-17-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313225103.30512-17-Sergey.Semin@baikalelectronics.ru>
X-Topics: 
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
Subject: Re: [Linux-stm32] [PATCH net-next 16/16] dt-bindings: net: dwmac:
 Add MTL Tx queue CBS-algo props dependencies
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


On Tue, 14 Mar 2023 01:51:03 +0300, Serge Semin wrote:
> Currently the CBS algorithm specific properties could be used
> unconditionally in the MTL Tx queue sub-nodes. It's definitely wrong from
> the correct Tx queue description point of view. Let's fix that in a way so
> the "snps,send_slope", "snps,idle_slope", "snps,high_credit" and
> "snps,low_credit" properties would be allowed only if the CBS TC algorithm
> is enabled for the MTL Tx queue.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
