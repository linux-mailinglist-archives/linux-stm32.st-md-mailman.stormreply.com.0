Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A31349E71
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 02:13:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1CEDC57B60;
	Fri, 26 Mar 2021 01:13:15 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D3DEC57B5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 01:13:14 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id n198so3870143iod.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 18:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zbkw9Y7KdSrwPhBVHuNS2fuewhP21jNF8VYuw+vghOQ=;
 b=UL0j72gBW6BSXu7MmCE2UkzdllPTtfCozg6tmVdKcInqaQPfvoa9CJMrpKUqKab3X2
 l0i62M1hKR+VzdFaWEEtM0PwZF8vDOqyXPeF+/YKKfQeONYSfXf+kv1rOw723iuA3yc0
 rXapRpkl3sx045vs74QL/MLBMCAugQlYg9gDWWzowpACwSRWuaOHumOQ9gj/RUlr5JEB
 TC8St8i+0dkDaqbWoyeWx+lCSduw9bcgTg0uluww+SiZyXHP2cSLhrs2i7ikedb30pbx
 EHdLqLZjhNy/8xqsfaD283TqpSl2H8Bxm8NwSHNVL1r/f8z187A+o+HKWxuqPZD0dJ7o
 xheg==
X-Gm-Message-State: AOAM532N1luR/7ZAAUrcCjxAc2Ks16qHBOZD+8Kp2Id9iGNOW40VKHRc
 igBDjvZFKmk34+qTk+dS+w==
X-Google-Smtp-Source: ABdhPJz/kkzII6gaHn1Zz42FMOTzrlw/itwIj30ByvIYMFs2vADjcapKqUr0+yzTejwVWkn/CIALjA==
X-Received: by 2002:a05:6638:2101:: with SMTP id
 n1mr10049485jaj.7.1616721193112; 
 Thu, 25 Mar 2021 18:13:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id d2sm3490299ilm.7.2021.03.25.18.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:13:12 -0700 (PDT)
Received: (nullmailer pid 2102175 invoked by uid 1000);
 Fri, 26 Mar 2021 01:13:10 -0000
Date: Thu, 25 Mar 2021 19:13:10 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210326011310.GA2090957@robh.at.kernel.org>
References: <1616075089-28115-1-git-send-email-alain.volmat@foss.st.com>
 <1616075089-28115-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616075089-28115-2-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: i2c: stm32f7: add st,
 smbus-alert binding for SMBus Alert
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

On Thu, Mar 18, 2021 at 02:44:48PM +0100, Alain Volmat wrote:
> Based on the SMBus specification, SMBus Alert active state is low.
> As often on SoC, the SMBus Alert pin is not only dedicated to this
> feature and can also be used for another purpose (by configuring it
> as alternate function for other functions via pinctrl).
> 
> "smbus" dt-binding has been introduced recently [1], however it is also
> used to indicate usage of host-notify feature.
> Relying on 'smbus' binding for SMBus-Alert as well as it was discussed
> previously [2] would lead to requiring the SMBALERT# pin to be configured
> as alternate function for i2c/smbus controller even if only host-notify is
> needed.
> Indeed, not doing so would lead to spurious SMBus Alert interrupts since
> the i2c/smbus controller would see the (not configured) SMBA pin as low
> level.
> 
> For that reason, SMBus-Alert needs to have its own binding in order
> to only be enabled whenever SMBALERT# pin is configured as alternate
> function for i2c/smbus controller.
> 
> [1] https://marc.info/?l=linux-i2c&m=159531254413805&w=2
> [2] https://marc.info/?l=linux-renesas-soc&m=159361426409817&w=2

Please use lore.kernel.org links.

> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2: introduce st,smbus-alert property
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

Though I defer to Wolfram whether this could/should be common instead.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
