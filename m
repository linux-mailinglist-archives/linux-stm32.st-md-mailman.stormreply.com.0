Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0359F5FF222
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 18:17:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B1ECC65040;
	Fri, 14 Oct 2022 16:17:55 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7E51C6411E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 16:17:54 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id 8so2779718qka.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1gzC+6pIKgTRrlwCoquBVcFiz8VbT8QxkPUglAW6yjw=;
 b=AA/+P5YcqpsI8jTynPbHxeED8efo3L92Ft5IK7ZzFKCeZmZ4nv3SKnoENmrrbu/8c8
 fZkq4I5jbeaxW/bTEvgFGJ7vTxd6kJQO2Wd184HbCSRGuN2a7jyS0+iwTGwUFRiyQOo2
 hyPZFOOti4Ql9unYGK/ye9LyGhSkdQhmSqCahl4S5rlO+8NUf0+zQhaMHLrptVab8xy8
 JMnrDZbsLvRupj2sQiwFt+WLO/BGVgXo535qowjp1AVNKRq1x//oIv1EP/Zm6JAup12+
 jxubr6v9hhJEh4TeZ6RJwgnEw6q4SEH2E80BJNRbWIGpMqT9zebQVtGdpwHmeJM0Gc93
 NMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gzC+6pIKgTRrlwCoquBVcFiz8VbT8QxkPUglAW6yjw=;
 b=i9ibAs2SFbGK07rZt1rwM4811GfCfo2gtdkrZCLbg0hcQLkIbCfnOpU9ddEHR9MR3a
 frNaGZ/uSqqG2QtFe9HhJYDBS4M0PjWIkb1gPADoAJssD9egk0k/v4FmeKtmB/uWgmhS
 nmkgWt2x1TtuX/RnguFUBANUWovuaJmAWW/2iS33ozsXs0z3DCSPupnC3CQM7inU8VQX
 QgQtQZF9MaM2QHGKnwXiB7igGNAolcDoz/UkW1UJ2Qo3E5q1Jwcv0ZNLhvAvdxlLxyTI
 /KFEkgIGY617AM1F0Hc/iz9MYfPC+Nd5/2RxXX21EvsgKQF38I90z66xx6GCM7a1CDiY
 D22w==
X-Gm-Message-State: ACrzQf0PF6ZEYzN5QG7aNbR77Ph6wKjf3WiMb4PPc1JvWwsDhbbQVCWj
 mUTM2HDWecqNgF/5nzVPMuR33IpUt5+96Q==
X-Google-Smtp-Source: AMsMyM6zeraRWOrhtxrEgxldJTmnsoJAKyRx/WeT0BIT3KKR45k0neMZPYTh54xC8XbnEVvqPXN4dg==
X-Received: by 2002:a05:620a:b05:b0:6ee:cb0e:3c94 with SMTP id
 t5-20020a05620a0b0500b006eecb0e3c94mr3673383qkg.379.1665764273917; 
 Fri, 14 Oct 2022 09:17:53 -0700 (PDT)
Received: from [192.168.7.170] ([12.190.236.102])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05620a441100b006ce813bb306sm3137040qkp.125.2022.10.14.09.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 09:17:53 -0700 (PDT)
Message-ID: <de4726f5-d7da-041a-31a3-dc7177786bf4@linaro.org>
Date: Fri, 14 Oct 2022 12:16:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20221014092651.25202-1-fabrice.gasnier@foss.st.com>
 <20221014092651.25202-10-fabrice.gasnier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014092651.25202-10-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 09/10] ARM: dts: stm32: enable USB OTG in
 dual role mode on stm32mp135f-dk
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

On 14/10/2022 05:26, Fabrice Gasnier wrote:
> The USB OTG controller provides the USB data available on stm32mp135f-dk,
> on the Type-C connector. Data role is determined by "usb-role-switch".
> 
> A STM32G0 provides the USB Type-C and Power Delivery connectivity.
> It controls dual role power and dual role data through UCSI protocol over
> I2C. It's wired on I2C1, with an interrupt pin on PI2 GPIO.
> Its firmware maybe updated over I2C, so use the optional firmware-name
> to enable firmware update.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp135f-dk.dts | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
> index 02ff2bc664da..1c92bf096397 100644
> --- a/arch/arm/boot/dts/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
> @@ -95,6 +95,28 @@ &i2c1 {
>  	/* spare dmas for other usage */
>  	/delete-property/dmas;
>  	/delete-property/dma-names;
> +
> +	stm32g0@53 {

Node names should be generic, usually typec.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
