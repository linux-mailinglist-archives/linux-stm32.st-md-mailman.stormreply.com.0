Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C78D7FE4
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 12:24:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8EEBC6B460;
	Mon,  3 Jun 2024 10:24:55 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A84AC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 10:24:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a6266ffdba8so358326766b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jun 2024 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717410288; x=1718015088;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AqA1PXrwcCN98Nii3x8SpO9ZeqKqzlhOVt86I0o4hY8=;
 b=dQ4CGcBKzHyoZYanEWnsHTpLqjq6Ga9Au+qXn5s5fWltGl1zkUWOAjVF0+XfvquBEe
 +lOekenSQPmeoyipkfb035ckASk14O08byjTOelkgg+JorgK6CY0+8usNALlbgcbT9Up
 DuH+KwomuYLPOYxJslr7sXUNCrkCGuPOymZzhbwPvPdqbsHFnGg5rRGa8R5ktDBDnE6I
 R/Jklyzl2vusS6Mjy1DZ721hSXQKETiQR8t6JuqoW6zIqJ+omVAlJwaWLycfBawuID++
 NqEkVY1cHE0eW4+RGlge+ej96fH2ihijWWWy1YXKe4mpL7OOrTb+ovw+0m6DskivqMAl
 1++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717410288; x=1718015088;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AqA1PXrwcCN98Nii3x8SpO9ZeqKqzlhOVt86I0o4hY8=;
 b=cJclNEcP7Pq4ZHLRT3RoMTiMlzDv7x8h/RNhT111nAVkwNbo8PC73a8YV0nvZCyrR4
 zw88I3BhDxr1YnITgygibbDLT9oQnmykPFX4QoZ+tNie0GgJsqeRklru960b86GH9SB4
 yNbUrNm7lCGnrhp8bvfgYxUSDQ9GktQff0vg6kaW07pZT+oEmehaalgICzRtT0hyjkM7
 qVQxMqid8dYXUSkLOUL5yfUvNDnbpjg4+bPT0F7ldR+piUGduenSTh9zD2iW+MZmhXxy
 XhJWbXR0juglhnZ2m0F/8t0BrcjTHBreI0yKOvOrXjig9gF6pXXL9vox0yWwoyICl2si
 LvMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXnou+eyHjTCnbOcl3QxX5d5/LfhdH4ANKSJ7XVy1b+7+ck12oMHsQ+2oq21UgBup+uQdmgI44N6pnKDaXfLODtCSb6E0Ulq56zrOaJq3nV1KC5aOlbu4s
X-Gm-Message-State: AOJu0YxPVuSARWquJ0M/oY1MEjICCmTlaXF2YBZ/gsYvSPU6yOdXf05s
 tcZSBpqpr6myD9j2bOXvy9OECygVx6cgOeLnENG5Yw44o7AuB5+K
X-Google-Smtp-Source: AGHT+IF1CtcgDyhj37LHv92BCOpjLvOTVmffDU90JlA3fyLw8/2VlZTAH8nbqfafha5QeK5FmMjkNQ==
X-Received: by 2002:a17:906:da89:b0:a59:a85d:31c6 with SMTP id
 a640c23a62f3a-a68224460b9mr684563466b.66.1717410287636; 
 Mon, 03 Jun 2024 03:24:47 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68b6ef0d8esm328804366b.105.2024.06.03.03.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 03:24:47 -0700 (PDT)
Message-ID: <a61bb06d-bb06-49d3-82e8-7262fdbb0031@gmail.com>
Date: Mon, 3 Jun 2024 12:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
 <20240413-rtc_dtschema-v3-1-eff368bcc471@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240413-rtc_dtschema-v3-1-eff368bcc471@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] arm: dts: nxp: lpc: lpc32xx: drop
 'clocks' form rtc
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

On 13/04/2024 22:22, Javier Carrasco wrote:
> The RTC does not provide a controllable clock signal (it uses a fixed
> 32768 Hz crystal, the input clock of the SoC). Remove the 'clocks'
> property to better describe the device and avoid errors when checking
> the dts against the nxp,lpc3220-rtc binding.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> index 974410918f35..f78d67e672b4 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> @@ -384,7 +384,6 @@ rtc: rtc@40024000 {
>  				reg = <0x40024000 0x1000>;
>  				interrupt-parent = <&sic1>;
>  				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk LPC32XX_CLK_RTC>;
>  			};
>  
>  			gpio: gpio@40028000 {
> 

A little reminder: the rest of the series was applied, but this patch is
still pending.The nxp,lpc3220-rtc binding was moved to trivial-rtc.yaml
and it is already in the mainline kernel.

Best regards,
Javier Carrasco
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
