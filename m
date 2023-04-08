Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 452EE6DBBB0
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Apr 2023 16:57:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7135C6B44D;
	Sat,  8 Apr 2023 14:57:55 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B108C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 14:57:54 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id dm2so3133162ejc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 07:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680965874;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r2/qlTZK3oc+3BcIiO+i7wsdJpDN0YCENNW/riWaWBw=;
 b=hEiQFv4Ri1VXTALwil3u0QmuzXY0NHaOpRgLjpVfPDSS3CDBk/tqGai+aC2FpNSmSC
 WdE0SI1vxEIPPW4zKU67JMvoFtxvR3KkYlkXTyw/wR+Fi6IwLsqQL/DKFLzNqc77L+Dx
 y4aca0jvgoH1AvWAyWcEkvKN8oe/WP6bwIdYOaQU+vOFvKIxhIalNIt4GERDacNG2dvX
 e51p/jb08wUSRuPTKASgPD++ZBUFmHy6dhhZZOmBUVL7MJW9MQr3JFgETcb+2ZWICzKW
 ovr5iEDN1OoKDBozgKXEoESyxAU4fcC4hbFs1xUYEBIunL48uwU6VwVJbexyrmyc3LJq
 IS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680965874;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r2/qlTZK3oc+3BcIiO+i7wsdJpDN0YCENNW/riWaWBw=;
 b=QzpWiSj0wFAXg2TvLOUZt9tvilZHhpsObR11JeXMgUe8duRAd7IfJYs70TIj/fX8zX
 O/05GUs+fYPJOKw1Q6eGA5cE04DqgRtvXPUuV7lJX06VO/gMPPIjUhA5mNrlBhJipe8p
 wLwRbBOT7IDuYg8WvhzP++LvF55D0UnaqahIodsKDEzt62Bd0sBcYsz4MgX3OOSqePCU
 E81L/h/qwryHrB+kHKfGwMAO8XYSQ48ZBx7pDsT6/giMAZ5dQXPBLRL2q9ohojjCN6ta
 ICm03y3B0wdT1EWxx6wVWuD2BdQJnhU+m+RUr24dGDLWmelauWMpypHUXQymSXkKcPFP
 zxiA==
X-Gm-Message-State: AAQBX9eV0Z0H2uJ8NSvo7UTxUnwT/ysSM4e9trtVZUhS652Vg0trUCBJ
 eK9399bCb5aScfJIE9nwxuQOxg==
X-Google-Smtp-Source: AKy350adYYuy2WWnFavedFp4QpR1b9dBllUR2MoosuAuU4Q4DaBN8J38njDCEHhG4EuXGlh6kHrcZg==
X-Received: by 2002:a17:906:784:b0:949:c05d:73b6 with SMTP id
 l4-20020a170906078400b00949c05d73b6mr1966937ejc.17.1680965873987; 
 Sat, 08 Apr 2023 07:57:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:e293:da16:7aac:96e6?
 ([2a02:810d:15c0:828:e293:da16:7aac:96e6])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a1709064dc700b0093f83562f09sm3191976ejw.87.2023.04.08.07.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 07:57:53 -0700 (PDT)
Message-ID: <0205fab6-3665-f985-41a5-3fed24644665@linaro.org>
Date: Sat, 8 Apr 2023 16:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230407193253.1.If11ffa6edfdfef0869478412ec3cec3169483cb9@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407193253.1.If11ffa6edfdfef0869478412ec3cec3169483cb9@changeid>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix typo in
	stm32mp15xx-dkx.dtsi
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

On 07/04/2023 19:33, Patrick Delaunay wrote:
> Remove unnecessary space in device tree stm32mp15xx-dkx.dtsi.

Your commit subject says typo. Where is it?

> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 11370ae0d868..ccd6c4722bd3 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -382,21 +382,21 @@ vref_ddr: vref_ddr {
>  				regulator-always-on;
>  			};
>  
> -			 bst_out: boost {
> +			bst_out: boost {
>  				regulator-name = "bst_out";
>  				interrupts = <IT_OCP_BOOST 0>;
> -			 };
> +			};
>  
>  			vbus_otg: pwr_sw1 {
>  				regulator-name = "vbus_otg";
>  				interrupts = <IT_OCP_OTG 0>;
> -			 };
> +			};
>  
> -			 vbus_sw: pwr_sw2 {
> +			vbus_sw: pwr_sw2 {
>  				regulator-name = "vbus_sw";
>  				interrupts = <IT_OCP_SWOUT 0>;
>  				regulator-active-discharge = <1>;
> -			 };
> +			};
>  		};
>  
>  		onkey {

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
