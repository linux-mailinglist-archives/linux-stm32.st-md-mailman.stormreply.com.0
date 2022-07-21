Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F157D193
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 18:32:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C72A5C03FD6;
	Thu, 21 Jul 2022 16:32:21 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7C21C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 16:32:20 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id bp17so3644837lfb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PMTz2Yy7eX0OLuWGsHne5sObvYwaGJFYNT4TztuyWn8=;
 b=PQm7aYZ33ELOxkmXRdndLEA9HsEdv542cb44Henwb27bHr5RWyfdobu89UJVIxWIwS
 GzasgX6jGCzfCgctkloPVvfsIKCn+wBbKBggKA8iaogsN6dbqwq+66dlqQWvlr0pq7VV
 /9QsQ4jvEkXZApgIS1UiEpUZz9ESS6o7zFLqVQpkm2JRerjz56DH9ATW/0kLbL0q1aWu
 ZSmpbsa5/BMqvyN+Pdjv6FkMOEWZfddz56pErWEyrhSCnMG045VRiw39My6imIRnDWSr
 Q2Igu5Ib8YEijviJcui66qv+IeON/hUK5KASI0eBW9NnFcSEL213jTeIWKHYocbfWo8p
 O9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PMTz2Yy7eX0OLuWGsHne5sObvYwaGJFYNT4TztuyWn8=;
 b=VX+kKgIRqGIe6uxJGS8KqK0AMQDjt467zBZRV7sKDuMpWbt8ddFKyvIl/9VCCerX/H
 RydUkGwTtW0L3yI2KBLjilAjsGEK/YX9yW4nGoTYlhG+j72OSZezhAQuvuw9/4mrThIc
 a/jMI9HF0m9qyD83PK18wOFsudqEj4hazP5vu2HVpXopKJeG8oTM2Knrs4J4djTQ3O8l
 3vRqbz0LoMDbFs/m2WA5BXchZYFKwXlgwmU2i6nuLFW/oWnLcFCPuACc2mxyF3mLeEL6
 pYDIWPrv3cB4NdZ/ax3JBbHY0GdcujPInbpoyN0RihYNph8HOvt+dUCADl5dOoYTEJmD
 9UCQ==
X-Gm-Message-State: AJIora9dhNmfq+YEQSda3WqDv0X0haUoNy7eYW9DtVM0Nwu97fGwZ8Dm
 xxlHA/SYGhiViLv9AgkcUPUKZA==
X-Google-Smtp-Source: AGRyM1tgG0kWlEhuCQ9FFmWivGt8MrVKTDBjqz3VTmyi7sOfPlP1oHHDgJpiV/3qtHyIbQJgVLGk0Q==
X-Received: by 2002:a05:6512:3a85:b0:48a:7229:ca59 with SMTP id
 q5-20020a0565123a8500b0048a7229ca59mr1251075lfu.453.1658421140269; 
 Thu, 21 Jul 2022 09:32:20 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 f4-20020a05651c02c400b0025de685f3e9sm530394ljo.139.2022.07.21.09.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 09:32:19 -0700 (PDT)
Message-ID: <c7e13adb-8584-6e24-11f3-9a27c7122da4@linaro.org>
Date: Thu, 21 Jul 2022 18:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>, alexandre.torgue@foss.st.com
References: <20220721153455.3805586-1-alain.volmat@foss.st.com>
 <20220721153455.3805586-2-alain.volmat@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721153455.3805586-2-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: add spi nodes into
	stm32mp131.dtsi
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

On 21/07/2022 17:34, Alain Volmat wrote:
> Add the 5 instances of spi busses supported by the stm32mp131.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp131.dtsi | 70 +++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
> index da9e8a6ca663..db3d1b900d5c 100644
> --- a/arch/arm/boot/dts/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
> @@ -97,6 +97,34 @@ scmi_shm: scmi-sram@0 {
>  			};
>  		};
>  
> +		spi2: spi@4000b000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32h7-spi";
> +			reg = <0x4000b000 0x400>;

Unusual order... rather first compatible then reg.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
