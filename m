Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DFB55319E
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 14:05:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13553C57B6C;
	Tue, 21 Jun 2022 12:05:34 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E26A0C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 12:05:32 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z7so19017608edm.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 05:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gg0RvHiFNrDfGIJW8Fr2n4Nc3yuuRyadriq/REJxjvs=;
 b=FyuzVou+E5Fpb+qmilQqXBhU2RV48ugWQhOqPpUt+3mVxqrYecQH8XalFd19KBs4T3
 XRtVD2RVj3AxD8HtWYLK9fd+jd0rze3pzCNWNsjJYB60Iwm4zufMcrbHRvhuN1wCZD2u
 DSfS7JM/EiapgfOsMK3cyNHLNuD5vpFmk7D/mAp9UD2u0mWI3YyJEWcNdTV89bnuPhL2
 jKRSjutkCtXYrq3b/c8ti/wOAj59zQxp9/Z2zyA8HqS7nXeUwis4WZsYeabyu1HJegPG
 OCiBuvEgttzjkLb2vWhqn3NHzn0NSkUEEaBnenddbfmMxAyCexnwTmukHGtjtai8Yl4q
 pEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gg0RvHiFNrDfGIJW8Fr2n4Nc3yuuRyadriq/REJxjvs=;
 b=wDsPMphinXI2jlrgGZpdxU9d9rYWMKCbFev1BSTq3BevP5uU5CdtIXHYFgHwAnCzOE
 8i9IQBkL/iKCb6sKKNISBY92oqA0njvZ8kk0HPKE2PKNq1Vr8LEon6TkD2O4ym9MGiYP
 hBFRgJIsUvZFFdXi/mFIT1nawfgStpI81x+n5YOtygdst5UyxzL2+Vf2GFZvcU5J3Yki
 Hyp/PegQliOQ+9ehTPGR4pmKnCpiSecWFiroIxCXdrpmjQXWzfkit/7kbOHUGIZvN6lQ
 4WDmVQZQXwYmntX0c5EjDLoz01xPJ3W9Pu7+kRYHzyngk1G5BxUhJBNbvMgJ0xsdiCx0
 fd3A==
X-Gm-Message-State: AJIora+h7BEYJpCrZdz0OfVnWpvUb+s2fW4n+lx1TcOcxrs7OvacXjbx
 mBYeH2ahUWHd4yo14lxt9titaQ==
X-Google-Smtp-Source: AGRyM1vZgrHk6IfMuXVCzD/k0L0+6qUUZLAkkj6Fwhg5AO2EVJ9Wr+faNLG6PZJdtYBWQzdDqYPt+g==
X-Received: by 2002:a05:6402:414c:b0:435:1e2a:2c7f with SMTP id
 x12-20020a056402414c00b004351e2a2c7fmr34443889eda.132.1655813132374; 
 Tue, 21 Jun 2022 05:05:32 -0700 (PDT)
Received: from [192.168.0.220] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 e7-20020a50ec87000000b0043561e0c9adsm9941388edr.52.2022.06.21.05.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 05:05:31 -0700 (PDT)
Message-ID: <cd2ae9a8-7d7a-e3e3-a9dd-6c254461bfbb@linaro.org>
Date: Tue, 21 Jun 2022 14:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20220621101538.481143-1-s.trumtrar@pengutronix.de>
 <20220621101538.481143-3-s.trumtrar@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220621101538.481143-3-s.trumtrar@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 3/3] dt-bindings: arm: stm32: Add
	Phytec STM32MP1 board
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

On 21/06/2022 12:15, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB eMMC,
> up to 16 MB QSPI and up to 128 GB NAND flash.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 8b31565fee59..4bae21769ca1 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -143,6 +143,12 @@ properties:
>            - const: seeed,stm32mp157c-odyssey-som
>            - const: st,stm32mp157
>  
> +      - description: Phytec STM32MP1 SoM based Boards

No, this should be part of the first enum for all stm32mp157 boards.


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
