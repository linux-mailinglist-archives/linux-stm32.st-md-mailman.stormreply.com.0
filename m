Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126C72EB6E
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 21:02:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DEA8C6A61A;
	Tue, 13 Jun 2023 19:02:29 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F508C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 19:02:27 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2b219ed9915so71573741fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 12:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686682947; x=1689274947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2EVZcCPFB1GTJ+QWap3KhHJTy/gr52NKGXQAEAB4e6g=;
 b=d1DaQKWjqf0ITS2F+w4PLAzozKd3B2kVEP+nM0xGjvFWXaDuKQZ5/EBkiiIvK/g5d3
 nk37E0ZroYqpL3NOw6Jmo6h44Ub5TLb2ZtLRE5aBNmEF8tkGfpyYppmg7E/RbH1egjVM
 RrRDPmZGgVucBOsBf3vDDqLEP9HfwjfY5nIyldccS02j3inZljQJzsS3LGP6CF/0K+4C
 XYR6RxrUel3RHQ79ZDG4oa5w3twaAUZjKzjYngWvvIv3yRxhVQpGMpo99U1sQNKHcdQ6
 F1j8bxAgKZXNk55/5sf5pnSVplpGCeBIaRlFhKN+m4y73YOPLFXxip8YhQWc7vLnfnyr
 sppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686682947; x=1689274947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2EVZcCPFB1GTJ+QWap3KhHJTy/gr52NKGXQAEAB4e6g=;
 b=extBQ98OKxU7RWzIh435BLBf2CLMWHuDKUiNi1PXrIVYJpQwibUdCQDkdKZ+vW8J/7
 CqrgLE4E/TtRZ/Ipj7UI+KBhQVbxRovG/idI8jysoeE5K66nHAinzVfG4IwPMbshte+4
 8AyW5sghRKVXGBFkLwqcndX7Vxfz6DjGmKODlauMszBWkkE/Q2rXbo2ylVdvL/GBdgCK
 AYloPaUpDzqciaGCBbmBSXZQJJ/H2ASh8dOZ3FDpAcWHwC4oV4V5kg4dGJLz0lxjPROj
 PgLDU3x7piZQEAa4BjmyuEbbDRDTdwwuH6c2U5AaWhMGN8vZL3SE1ItZvH2mJRA/NxpF
 8FOA==
X-Gm-Message-State: AC+VfDzvGlyhBUuEDHJSeC3c13qqLqnMjy87NwuczAPdduKXeoUQ8BVY
 GTdir3N8WcBZvDaUUYy1VLvXdg==
X-Google-Smtp-Source: ACHHUZ6DjJpRPOvESX58e85nO9sR6PlnFNzsWTps7zd03Gu0DU4gLGE7Uf0OlVChY2Jv6wdXtQcFjQ==
X-Received: by 2002:a2e:9096:0:b0:2b2:16:45e3 with SMTP id
 l22-20020a2e9096000000b002b2001645e3mr5023381ljg.53.1686682947178; 
 Tue, 13 Jun 2023 12:02:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a2e96c7000000b002b1ad0e7357sm2258898ljj.51.2023.06.13.12.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 12:02:26 -0700 (PDT)
Message-ID: <0a57a9ad-67ab-cf1a-9bb7-c645de833450@linaro.org>
Date: Tue, 13 Jun 2023 21:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-25-brgl@bgdev.pl>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230612092355.87937-25-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 24/26] arm64: dts: qcom: sa8775p-ride:
 enable the SerDes PHY
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



On 12.06.2023 11:23, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable the internal PHY on sa8775p-ride.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Bjorn, Krzysztof.. I was thinking whether we should even be disabling
such hardware by default..

Things that reside on the SoC and have no external dependencies could
be left enabled:

pros:
- less fluff
- we'd probably very quickly fix the missing PM calls
- possibly less fw_devlink woes if we fail to get rid of references to
  the disabled component?

cons:
- boot times
- slightly more memory usage

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index ab767cfa51ff..7754788ea775 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -355,6 +355,10 @@ &qupv3_id_2 {
>  	status = "okay";
>  };
>  
> +&serdes_phy {
> +	status = "okay";
> +};
> +
>  &sleep_clk {
>  	clock-frequency = <32764>;
>  };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
