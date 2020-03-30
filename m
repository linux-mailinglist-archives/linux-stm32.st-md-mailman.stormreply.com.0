Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C257C198817
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 01:21:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C182C36B0B;
	Mon, 30 Mar 2020 23:21:19 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72D2EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 23:21:18 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id f16so17623046ilj.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 16:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J6CtYXa3sClSqnbvBiuHvvlUuxEGfNZdWolqywsT7lk=;
 b=fZCO5FzXPTN7ywQAldEuNiBIyKhkQGJ9vsndlW31kedNjINpxx1aL0mjlOJaS3M14j
 xz/08GJlFRTL9LamypKS5iZwYiQGCpL/uf5YPcGme3qGNrFTadsxD4m7c2AKhiQPgXsX
 +JumvDJdGaln+aaHCI9tT6pthd+9QhoEuZifoUlRNq3SVp/MnRX7dL0SmO2kVrywGzX4
 mqqwCz2FlKeE4T9S+khwRpL5FqunYYMO5NsUDj/1Zksazjaq0A4ThaS+iTI4iibFNlaY
 ClRIrBg9pJ5cZWwl4uRIaCS59aac+nMW6o+regwLcQeWD2C7qVZv1I0osY4w4hqayoUB
 /5vQ==
X-Gm-Message-State: ANhLgQ2r2HDXQDNDnciBRF1ZCFo+DOxoTVSgCp/1z1124omVnKL3KjvV
 sYH3g8FCw8YwGBvHzHnVgg==
X-Google-Smtp-Source: ADFU+vuaKs6BtYALVaqgUXUnIFTShETJESYag2YrRrycS+2I8mzQdSm2bGh9kir55sPT0pkBtVUhBA==
X-Received: by 2002:a05:6e02:be7:: with SMTP id
 d7mr14208948ilu.238.1585610477255; 
 Mon, 30 Mar 2020 16:21:17 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id t5sm3578511iom.3.2020.03.30.16.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 16:21:16 -0700 (PDT)
Received: (nullmailer pid 17537 invoked by uid 1000);
 Mon, 30 Mar 2020 23:21:15 -0000
Date: Mon, 30 Mar 2020 17:21:15 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200330232115.GA17380@bogus>
References: <1584641907-8228-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584641907-8228-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: adc: stm32-adc: fix id
	relative path
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

On Thu, 19 Mar 2020 19:18:27 +0100, Fabrice Gasnier wrote:
> Fix id relative path that shouldn't contain 'bindings', as pointed out
> when submitting st,stm32-dac bindings conversion to json-schema [1].
> [1] https://patchwork.ozlabs.org/patch/1257568/
> 
> Fixes: a8cf1723c4b7 ("dt-bindings: iio: adc: stm32-adc: convert bindings to json-schema")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
