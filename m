Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4539597FFC
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Aug 2022 10:22:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ACF2C640F6;
	Thu, 18 Aug 2022 08:22:58 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C6C6C640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Aug 2022 08:22:57 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id by6so992726ljb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Aug 2022 01:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Oukdp3ac9qqmQBD3wCXZkJHdViHJb4roazf84j0mgps=;
 b=rgrYDh4DIWTHc1pC+Hr4CW2Fhzft/HWBMPrRDWCf6mJB4iZEDrQqT3Ktaezc6UzbVB
 DZrlU+a5yCfeUiQVbQPQ4zyNRRmNyIh8N6F1RZQJgvfmbqrnxnxmWQV0m1r4TT4UyOSK
 l+W0nhRkuiiXDVgpH9rZpU1urn1eR95WGh+dIgfClasl5WbcJ1SEBH7DH0vltvi+5Fyu
 QOAL540HAh+vJA5hc+wnHAJ2lZNFYp1SCcV5UpLau+/6VL0+EIyoV33B/r0FIO2+jtvW
 jm1gB2/AonIl9wC0z2c3+CTXXcTOqcV0idgg6bkHY6qEDS4Xj0AdQXSTMggBJRL5/PkG
 RnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Oukdp3ac9qqmQBD3wCXZkJHdViHJb4roazf84j0mgps=;
 b=cSjbYnb8iVahHwtMhwtosj42ojQmxIntHhpqizJP8SxQBQ/oiRetkHQN5jEmtSt4BY
 cIqraqUONdNPXEp91AUxXjcynsMoOKgx11tKYsqU9M4A5HgHYZNmgYViPaRL4TF4lWpK
 8YI/K1kZHb6zt/0YXEaTeOwurGzBCorTwKsC+ypWEC7iSGl2XwSrLwTbkxcSIyQp9r7I
 716xUjBaVqRGzW1OHxbsv0sa2HFg2P1iB2/AdA9PDRCiH/apS4d6TEtKX1Ka8l0+6Py9
 kWFeZ+mYSNqpCBMdj2gwrxKiSPrAkzRMGCuJlJRzUODixoj8awGmTYtR0lqtXhFwyKX3
 mM7w==
X-Gm-Message-State: ACgBeo21svp027P+F+yRSB8nqjUm6q7b6byCJC2Gb8g/J1WlDXqclXsw
 gx6momyiX5A4Rtv1C2TsKzecug==
X-Google-Smtp-Source: AA6agR6oiQVF7XV1u0uY0tip2B6M7NTHF39GGUO71n6giDIrB2ZiB9S6KSEf4dkqS6QFJEoPXpXycw==
X-Received: by 2002:a05:651c:168f:b0:25e:59f6:24d3 with SMTP id
 bd15-20020a05651c168f00b0025e59f624d3mr597703ljb.456.1660810976407; 
 Thu, 18 Aug 2022 01:22:56 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5?
 (d15l54z9nf469l8226z-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a05651203f800b0048b0bc13615sm135193lfq.88.2022.08.18.01.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 01:22:55 -0700 (PDT)
Message-ID: <f71cf3c7-9e1d-12ba-035f-70c63510d44a@linaro.org>
Date: Thu, 18 Aug 2022 11:22:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20220817143529.257908-1-dario.binacchi@amarulasolutions.com>
 <20220817143529.257908-4-dario.binacchi@amarulasolutions.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817143529.257908-4-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: Re: [Linux-stm32] [RFC PATCH 3/4] ARM: dts: stm32: add pin map for
 CAN controller on stm32f4
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

On 17/08/2022 17:35, Dario Binacchi wrote:
> Add pin configurations for using CAN controller on stm32f469-disco
> board. They are located on the Arduino compatible connector CN5 (CAN1)
> and on the extension connector CN12 (CAN2).
> 


> +
> +			can2_pins_b: can2-1 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
> +
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('B', 12, AF9)>; /* CAN2_RX */
> +					bias-pull-up;
> +				};
> +			};
> +

No need for blank line.



Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
