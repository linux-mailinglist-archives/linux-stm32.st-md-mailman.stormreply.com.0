Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F210F694109
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Feb 2023 10:26:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8C59C6A5F1;
	Mon, 13 Feb 2023 09:26:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F7BBC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 09:26:54 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso3102007wmo.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 01:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nYh18SRYWwEYT43tGPEGOedVgwnc/ZspcfJBm/Zqmek=;
 b=AKjeUMptruiqhGqwkQ5nHL5+lyE+zu52lmYtfXa5oRKvpSgDnmquHytkHfyWkATZK6
 P+ofaXVgQqlyfPI1iNH3JNSFSwMayGi/2EsRFdVRCNrsGLdBNCKHT9KOCF0sjFVZ7rVX
 zLBnj9KXTsvSqan5Dk9kjiXkerhXvVyW0dXjQVsHR5+S1Vfz0F7cSqG2TmfPVTxm+gpz
 vLs6RHE4dd25pDc52obVhfsPvypjEMQnXMv9VYbiWOdrzjifhTtottn/Uam/oYlBSk3a
 tCUrgfUDq4uSXv1+pZjndkwyBtyYm9nNy5+7bGVrFg4qhm1zV83ydSkVP2RGecBR8Ug6
 5+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nYh18SRYWwEYT43tGPEGOedVgwnc/ZspcfJBm/Zqmek=;
 b=g/SnJjhFPWerBhke6OEpBd6rUkNitWsIphh6En9Bpe5B6u/rE1EZvvdHpsKsc9sbay
 QqeiftxexBxCvL92XbLs68SmKXUiVry3pgrUFHktFGKe0UZe2HlBYyZKI7E1nyG54jpr
 HwICG5FWRxk2ylztJ2dxTLuQ3GYiZTXFvZkavyWsCSaQce7qqN/D5mnk/p8TNeu2j5Qg
 yvEvdWCB+agnYpRv00JuRXy0equ2crVAg7CK5TqLE6TL2563ygiRh6nz7lUIMonazAZB
 PGd+DQUjBSgE2nbuTY2J5xdWoeimYx4DjkwZAGCMVmK35dQQKFySljCMFF84fa8HIqJU
 3tbw==
X-Gm-Message-State: AO0yUKXDEOIWCy3915bTxHaJY1lEfjfwBoycd89fT4cmpbPUtXfsmXRH
 OFdN+nTDbVzHIzskDUfe7aiX5g==
X-Google-Smtp-Source: AK7set9WbqP7fVCp5aNzouWbxo5iZbnRURawxE90BjtXUD6SO1P7jgEKPf81opQ2QS1yr8C6vyNxIQ==
X-Received: by 2002:a05:600c:4a8a:b0:3dc:54e9:dfd7 with SMTP id
 b10-20020a05600c4a8a00b003dc54e9dfd7mr18140208wmp.25.1676280413915; 
 Mon, 13 Feb 2023 01:26:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 j37-20020a05600c1c2500b003daf6e3bc2fsm23780634wms.1.2023.02.13.01.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:26:53 -0800 (PST)
Message-ID: <34d5e299-3b4b-d176-0010-a9af1220f2e3@linaro.org>
Date: Mon, 13 Feb 2023 10:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-12-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-12-cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/12] riscv: dts: starfive: jh7100: Add
 sysmain and gmac DT nodes
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

On 11/02/2023 04:18, Cristian Ciocaltea wrote:
> Provide the sysmain and gmac DT nodes supporting the DWMAC found on the
> StarFive JH7100 SoC.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 38 ++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 88f91bc5753b..0918af7b6eb0 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -164,6 +164,44 @@ rstgen: reset-controller@11840000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		sysmain: syscon@11850000 {
> +			compatible = "starfive,jh7100-sysmain", "syscon";
> +			reg = <0x0 0x11850000 0x0 0x10000>;
> +		};
> +
> +		gmac: ethernet@10020000 {

Aren't the nodes ordered by address?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
