Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA174522C
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Jul 2023 22:14:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B11B8C6B453;
	Sun,  2 Jul 2023 20:14:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59925C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jul 2023 20:14:39 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3142a9ff6d8so1868632f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jul 2023 13:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688328879; x=1690920879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/msN/aF74Dw7L5vp0UJekcbvD89qyKZgROZ3cEOh1Hs=;
 b=Uhkby4bQCZI750ftvrp0r1LBbPbfegZuk7UpAh1rQjWk7GufTeCqQBkeyW09rlE+Mn
 6CC032Jedh2SqZBAFpu8+ruy1rnfwhbgOrG86r/SFfL5Pf4B24ACtAUj14bbp20Epb5u
 7ZeuyzneodyGhKnxKWISBvpXeHt7m+8s+CLPXo7Ksf9Pjn4FvLOCSD2AqWIzfAMDPHmr
 rnq0aGqYg3KgTIpreyr+n8LZrEOKZE8BJAR0XL2xmCOmx2s0GU/PHo+VPqVYxX5yqdqa
 pcXqBei6CJ7tjaPBKWB1vfqafqmjY2/f4vr8CfSrpv9nhvc98bE0Kfj3IaTabM0apTEz
 JHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688328879; x=1690920879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/msN/aF74Dw7L5vp0UJekcbvD89qyKZgROZ3cEOh1Hs=;
 b=S9BEyHYUz/XUu7TPU1uTyyz80BAtlXr/AE2OVUugV3caZwBbZAnjgD05OJM1ZJ05jy
 hKkubjUpii8zmqXmGi07MCVp3++hxc4jxN1oWUxahaJulok3wpv5MF0WZRxaNb2c+2MP
 XqlGxUkqxxqpbnXGVMcP1k6tabWfV6HrItlZXmMD4zMhPacsr8OB3NLIbcfeaPDYXtxS
 oUwmQVykqVFNXLNiVwDfLfSoISR35ueFMM6xKpetjoxjQVlM+bL2ifieWKNyFu0JHZxg
 izVDvqXkQ/iqMQd//+gPcVekEdNitmXOiIO5Dpq4N/PWDW9FHvUvGKRsc/k4pVetwx+z
 18vA==
X-Gm-Message-State: ABy/qLaSuUW3HRIBQ56+E3wpql8KDtpAhbeCQJilCq1X9BDG/m5PNjgr
 6s1QE5bxU7qlEf+RANmda5yhGw==
X-Google-Smtp-Source: APBJJlEaMjzxW+IotAZmesVA1vpJP5bdewGQX0Ffdx0+UU5lShCdfPz6r+z4c0n+yANGdCIWVevPAA==
X-Received: by 2002:a5d:6844:0:b0:314:1d26:4e66 with SMTP id
 o4-20020a5d6844000000b003141d264e66mr6377336wrw.63.1688328878745; 
 Sun, 02 Jul 2023 13:14:38 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
 by smtp.gmail.com with ESMTPSA id
 k24-20020aa7c398000000b0051def9be785sm3405866edq.85.2023.07.02.13.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jul 2023 13:14:38 -0700 (PDT)
Message-ID: <11ec64ad-8fb8-e94d-2019-d3deb399084b@linaro.org>
Date: Sun, 2 Jul 2023 22:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230702103516.139440-1-rgallaispou@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702103516.139440-1-rgallaispou@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: st: add buswidth property to
	stm32f429-disco
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

On 02/07/2023 12:35, Raphael Gallais-Pou wrote:
> The ili9341 is left without a mandatory buswidth to properly communicate
> between the SI bus and the display. Add the device-tree property.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  arch/arm/boot/dts/stm32f429-disco.dts | 1 +

There is no such file. Please rebase on recent Linux.

>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> index 3b81228d46a2..5eaf95afc8c7 100644
> --- a/arch/arm/boot/dts/stm32f429-disco.dts
> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> @@ -197,6 +197,7 @@ display: display@1{
>  		spi-3wire;
>  		spi-max-frequency = <10000000>;
>  		dc-gpios = <&gpiod 13 0>;
> +		buswidth = <8>;

There is no such spi property.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
