Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F79166712C
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 12:46:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB1FBC64106;
	Thu, 12 Jan 2023 11:46:31 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3F29C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 11:46:30 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id i9so26493454edj.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 03:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v0wMg8B+r7Uh0cXEXrMRR61VwVmslR4aMO0Co5YCjg4=;
 b=jfW0ER6XAvO3XpL5d0jBIwp9w5hHbxKvWUQpMOrrIVtgvEv2y6Deb3b31gYIbqA7Lc
 0uvaFYiNtNHcoMpCk81Y6NR+ZGRtP0ugQnW9W7LzWfHBICUZEQFEtlHgMw01QzMcZSR7
 ni3MPC4z4QmjvaurSdSs1tL0k9st6RJ5zN8YDrSiSsjTKD3xRTvJ9byZPBecQvDe6rj+
 WNrXXg7NKXTWfDYFwZED1N+usQaDDy/EZL2Mz7I5vovd/8SYbd3OIda9pl6ULDs469C8
 PVZ1h4SU+ZEbUuy8H+8b13oeRb44gnCtafU0GLU2BDRbjFF9+3rKIY7EBPajzFUAw8cO
 xOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v0wMg8B+r7Uh0cXEXrMRR61VwVmslR4aMO0Co5YCjg4=;
 b=qJOTrtsUFSsZWFN52inwBC/t29l1FH26WBslRqsEc73uCQperZUsYy2oyszmLVozke
 msEt9y2DsWjRXMGcQXJQsrmYQA3Pw44Dsrl0eZmBAAfFjfZ84rRJLvLfFFzHKlin5d/N
 VIofBeSelaNNpJtt+Y6ObxOzHmiAz9icBEIu8WSkja1lnXFrtsFHlufcsKIhwxqaWEOD
 gIthj36OIJr7MN/QPF/Skbdk12HkQGsUZaq1GUoibO413WrUxeY32edk5gfn+3C4D2Q3
 Y2YuEWWH4+H4xfS5dAUGoqCTlyuWy7AJKDDAUoJ8eaZlJ73vbi3WCX1f21G2jLMxhNWz
 S0LQ==
X-Gm-Message-State: AFqh2kqeWDmS3pZ3+cFOB7Tu2Btcjl1qHWWGMAhQ348i4MkepScQXu/O
 /RjEKVtt59B9wEijvB8qpRu7KA==
X-Google-Smtp-Source: AMrXdXtSbLH+vPTwFa7s5QFzuqgmjnm09Vumds9TuMIKXzbtvRe1pyrQK2tDi1jhB1ftncECuNBnFQ==
X-Received: by 2002:a50:ef12:0:b0:499:c516:fc41 with SMTP id
 m18-20020a50ef12000000b00499c516fc41mr8248842eds.36.1673523990236; 
 Thu, 12 Jan 2023 03:46:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 w1-20020aa7dcc1000000b0047a3a407b49sm7107913edu.43.2023.01.12.03.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 03:46:29 -0800 (PST)
Message-ID: <3985f697-d363-0f1f-0b4f-bc5e9e2b7b34@linaro.org>
Date: Thu, 12 Jan 2023 12:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230112104446.1140551-1-olivier.moysan@foss.st.com>
 <20230112104446.1140551-3-olivier.moysan@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230112104446.1140551-3-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 02/10] ARM: dts: stm32: add vrefint
 calibration on stm32mp15
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

On 12/01/2023 11:44, Olivier Moysan wrote:
> Describe vrefint calibration cell to be retrieved through bsec.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index dea1c53f2b1d..eec5e9992bff 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1632,6 +1632,9 @@ bsec: efuse@5c005000 {
>  			reg = <0x5c005000 0x400>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +			vrefint: vrefin_cal@52 {

No underscores in node names.


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
