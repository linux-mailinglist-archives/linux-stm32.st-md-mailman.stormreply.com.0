Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 959145FC92B
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Oct 2022 18:25:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C246C640F9;
	Wed, 12 Oct 2022 16:25:23 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1FEEC640F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 16:25:21 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 c17-20020a4aa4d1000000b0047653e7c5f3so12496328oom.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 09:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbGkRBfc7blEHX2oiLr1yUH1nf0Co3xQFCa79h+BBRk=;
 b=ij5XAvzH6fO3vClM+EuBrn70xJK7/G3mb1uA7fN8Y2Y1FDKxo6ySt94N+WeFPfwaXa
 U6zPgZbT0iSaWdTxX8VU5G1ltme7DB2J26VdEXNb7GItBDf3fHNy4psOsXojwwrht1hd
 K2CyDcWw7jznoVl97Ry58KVqXwoxmIFuEFpvvS3nEnH8Sj2PJ8bMHsHujPVqAapr2/J0
 xMbItYcJBCI2HeidX0TNGpaSLxJ8AUYGCEMbuluumBm/ZPSBDaQiGE2pizvyl+JKWP7J
 K0xtQvSG+Oj8rOQAGYye06tLQKARNzlFCRcHWWnJ4V4b/Wf4AlDxaOjRKR8rah8SXmtE
 8Xig==
X-Gm-Message-State: ACrzQf1Cxc7OFzLRXzxyYftx62DSwI2zP7dLs8erOw2SwF9tvvCeyYJS
 oZCJ5RrbIQ0JgWiU8q8qEA==
X-Google-Smtp-Source: AMsMyM5WZKYN3WOatUVAQahyGG5zpQ2QpJ9rGf1419QBSTH+VPlsKqDKNZYOHp9EcGV1Saa4zwhNsA==
X-Received: by 2002:a05:6830:34a5:b0:661:a0a5:b0f with SMTP id
 c37-20020a05683034a500b00661a0a50b0fmr6481648otu.165.1665591920378; 
 Wed, 12 Oct 2022 09:25:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020a9d4786000000b00661b019accbsm1876633otf.3.2022.10.12.09.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 09:25:19 -0700 (PDT)
Received: (nullmailer pid 2286501 invoked by uid 1000);
 Wed, 12 Oct 2022 16:25:21 -0000
Date: Wed, 12 Oct 2022 11:25:20 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <166559192047.2286466.15301667518001122082.robh@kernel.org>
References: <20221012142205.13041-1-olivier.moysan@foss.st.com>
 <20221012142205.13041-3-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012142205.13041-3-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/8] dt-bindings: iio: adc: stm32-adc:
 add stm32mp13 compatibles
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

On Wed, 12 Oct 2022 16:21:59 +0200, Olivier Moysan wrote:
> Add st,stm32mp13-adc-core and st,stm32mp13-adc compatibles
> to support STM32MPU13 SoC.
> 
> On STM32MP13x, each ADC peripheral has a single ADC block.
> These ADC peripherals, ADC1 and ADC2, are fully independent.
> 
> Main characteristics of STM32MP13x ADC:
> - One interrupt line per ADC
> - 6 to 12 bits resolution
> - 19 channels
> 
> ADC2 instance supports two extra internal channels VDDCPU and VDDQ_DDR.
> Add "vddcpu" and "vddq_ddr" internal channels names to the reserved
> labels list.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-adc.yaml        | 68 ++++++++++++++++++-
>  1 file changed, 65 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
