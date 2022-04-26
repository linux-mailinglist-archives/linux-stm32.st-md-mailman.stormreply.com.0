Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C877B51067D
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 20:15:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F9C0C6046D;
	Tue, 26 Apr 2022 18:15:06 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B604C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 18:15:04 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 i3-20020a056830010300b00605468119c3so13584241otp.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 11:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Oib/ExV10ANnQvwwrlprqgTr48+7URKhjUPril72gdM=;
 b=vJFD9f96atUyxDRTJGxh/GMATlxwIXA+QNIuz+irKxZky66Y9SEUKSBxa/wxCgVn/f
 5zNra9eR+cLJJdI5YBnOnk5vXe2nbAe9ibdaXvBVOPL0dwljg2ttp/gxDV+J9/wu8og8
 nbEKFsLx5NE9N1Z8ZNmPk4mB7bLl8zRb9OZ3A2/Yx6mACmkMs7XsPG4yUQBf5P8zdD5q
 hlBodEjlTEbG390xp+UHi4LtNBO9T5SYHL60gN+6f06qdN1/xieiYc2kU66olDv5UK/P
 RVVEzLgXRAQ1lV+ls82IzdJMDotfNCpc321OEhVBpRq1G32NcSw8e+WNHZE/AyJqMmK3
 oOMw==
X-Gm-Message-State: AOAM532ffMMH6rt3BWKI+4uX5QLGcY/98vYAajXOt7q0fCz0WLp5C4ax
 reLJcEloB6AAlwMvfvzMEA==
X-Google-Smtp-Source: ABdhPJygMH9HvK7IP3j9u7OmyyH6K204kPiiXtsJ5q56r+EUYX7A8yfGg5V4YihTUBZW7KLxXuYhEQ==
X-Received: by 2002:a9d:2a9:0:b0:603:e74c:e4e7 with SMTP id
 38-20020a9d02a9000000b00603e74ce4e7mr9031635otl.85.1650996903014; 
 Tue, 26 Apr 2022 11:15:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v20-20020a056830141400b00604d7cb9bb1sm5332468otp.43.2022.04.26.11.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:15:02 -0700 (PDT)
Received: (nullmailer pid 2288840 invoked by uid 1000);
 Tue, 26 Apr 2022 18:15:01 -0000
Date: Tue, 26 Apr 2022 13:15:01 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Ymg2pVs+qijxOmRj@robh.at.kernel.org>
References: <20220425140436.332467-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425140436.332467-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kernel@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: stm32: narrow DH
 STM32MP1 SoM boards
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

On Mon, 25 Apr 2022 16:04:35 +0200, Krzysztof Kozlowski wrote:
> The bindings for DH STM32MP1 SoM boards allows invalid combinations,
> e.g. st,stm32mp153 SoC on a dh,stm32mp157c-dhcom-som SoM.
> 
> Split the enums to properly match valid setups.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/arm/stm32/stm32.yaml  | 37 +++++++++++--------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
