Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 624BF375E1B
	for <lists+linux-stm32@lfdr.de>; Fri,  7 May 2021 02:55:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B9BDC58D78;
	Fri,  7 May 2021 00:55:25 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2477FC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 May 2021 00:55:20 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 c28-20020a9d615c0000b02902dde7c8833eso1621404otk.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 May 2021 17:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LOi26ePLcMhTv9NBLT2b9h8iasffGUoNExW6gEB59Hg=;
 b=p1r44QQHpanI1FKx9J1xuWpv77TWQGry9sKLjNkN88IFlTTPBHo3mT7nHHx26QwJmz
 GNa4dAr14aojaFx9jsCtq8s5kr/EiBL7/LqGmQ6UJr3KsUY8EgvEqKSQeZ6RZV7Od2P2
 WzhOmeckOMVrEQ5x2gezK042FbKKdSuNtbSth86+UA22cgKzYW4aFORXq/clzqYr7kAW
 HJlOwO1NznAk8HdX/1CDW/V9zGHu3bcWvcl86bsZQXIRe+yxOHc0YTkBRx+G/hIK6P97
 xBVJIx+pfOp0kkJ5Fb7YZ2Brq2LRgPcYSvEiZa3CNyk+ktdixTLuBOz4NTyidi14jAe6
 0teg==
X-Gm-Message-State: AOAM532N2nechAj3VK48ihlGWSASy3D1FJNM7qG6+NCQyJHSYxbciYgu
 NQMmpV9bKHqN5qApB0olBQ==
X-Google-Smtp-Source: ABdhPJxeyomDM66blWkjlzllouut9B4dA4muWExmIjhFAk5mmRPq+Z8eGugC9Zp/pbuJPuBLvSakTA==
X-Received: by 2002:a9d:6244:: with SMTP id i4mr5796115otk.182.1620348919518; 
 Thu, 06 May 2021 17:55:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g9sm805749oop.30.2021.05.06.17.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 17:55:18 -0700 (PDT)
Received: (nullmailer pid 1101099 invoked by uid 1000);
 Fri, 07 May 2021 00:55:17 -0000
Date: Thu, 6 May 2021 19:55:17 -0500
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210507005517.GA1098665@robh.at.kernel.org>
References: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
 <1620220479-2647-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620220479-2647-2-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] i2c: add binding to mark a bus as
 supporting SMBus-Alert
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

On Wed, May 05, 2021 at 03:14:38PM +0200, Alain Volmat wrote:
> Since SMBus-Alert is an optional feature of SMBUS which
> requires an additional pin, the smbus binding cannot be
> used to indicate its support.
> 
> Add an additional smbus-alert binding specific for it and
> update the description text of smbus to avoid mentioning
> SMBus-Alert
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

This needs to be added to i2c-bus.yaml too.

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index df41f72afc87..b864916e087f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -89,8 +89,11 @@ wants to support one of the below features, it should adapt these bindings.
>  
>  - smbus
>  	states that additional SMBus restrictions and features apply to this bus.
> -	Examples of features are SMBusHostNotify and SMBusAlert. Examples of
> -	restrictions are more reserved addresses and timeout definitions.
> +	An example of feature is SMBusHostNotify. Examples of restrictions are
> +	more reserved addresses and timeout definitions.
> +
> +- smbus-alert
> +	states that the optional SMBus-Alert feature apply to this bus.
>  
>  Required properties (per child device)
>  --------------------------------------
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
