Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3A55E508
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 15:41:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A580C5F1EE;
	Tue, 28 Jun 2022 13:41:21 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0077AC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 13:41:19 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id p128so12866728iof.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 06:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mwOBShGTICMgOdqz3MT5Sv+scZgbcai7ONXkEa1E170=;
 b=YAOrG9KdAHDPo3qBDR+AyUU8D1tZFQd6uYdcbT2Bc0lSSWf06BuY32zkWeEVQUgeed
 w1VkM5NzB+S0sbct2JnZ20tzT+t5JjfUhRQVjH5oqhd8ctfkE6Zjz1MoHf8K8qH3hhXT
 lxEpqn0wytaCVVOrZQWbgDMIcF7CQ1IQSi8XKly+xlq2aFYdHX8mr7w+a9S3ww37LJUy
 9lX721EcNDrDW4lS2/X8LTv5dlbj1GsMjxJzrxtGSmz65Svjxw2imJZdDZgjIz4wS2K6
 yQQqJMQQoJXdjhbceRyvBuNHwKbFK7+MnjWWcGDmxTGGLOHT1ag+mFl/E5NhQQ+BNcJz
 /VVg==
X-Gm-Message-State: AJIora8xCdgfWcxPJ2sCvYq/QaOmwOW0DwBEfwc2Vw9dOfrC9fkhh4Bo
 8Kg9dxJimfticPFLCyycBQ==
X-Google-Smtp-Source: AGRyM1vezFgpYiRSAOEMIGspLW0FyDakiQT+VyWz3hQV83fc87ID8ATA7tp7O9Lc6ulOVPgPAdG4Sg==
X-Received: by 2002:a05:6638:2481:b0:331:e12a:5e32 with SMTP id
 x1-20020a056638248100b00331e12a5e32mr11010467jat.90.1656423678724; 
 Tue, 28 Jun 2022 06:41:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a02330d000000b00334748f85easm6124556jae.106.2022.06.28.06.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 06:41:18 -0700 (PDT)
Received: (nullmailer pid 348635 invoked by uid 1000);
 Tue, 28 Jun 2022 13:41:15 -0000
Date: Tue, 28 Jun 2022 07:41:15 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20220628134115.GA345270-robh@kernel.org>
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
 <20220620105405.145959-2-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220620105405.145959-2-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsa@kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: i2c: st,
 stm32-i2c: don't mandate a reset line
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

On Mon, Jun 20, 2022 at 12:54:02PM +0200, Alain Volmat wrote:
> Update the dt-bindings of the i2c-stm32 drivers to avoid the
> needs for a reset property in the device-tree.

That is clear from the diff, but why. Some chips don't have a reset? 
If so, this should be combined with patch 2 as part of changes needed 
for a new version.

> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index dccbb18b6dc0..8879144fbbfb 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -94,7 +94,6 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - resets
>    - clocks
>  
>  unevaluatedProperties: false
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
