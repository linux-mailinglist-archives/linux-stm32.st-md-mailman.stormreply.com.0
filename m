Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C6185F911
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 14:01:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D894CC6B47A;
	Thu, 22 Feb 2024 13:01:52 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 235F0C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 13:01:51 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5129cdae3c6so2191684e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 05:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708606910; x=1709211710;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m7Z26rH0nxtWAPBPvE/KxZ0NHjlwRm5O/7QOSN2/Ky0=;
 b=tT8EnURxQFOV+Bh55wrFH1sTzcGafbiE1PcYh3HYlhkMIAvWn9AKf/vk6p0d7bN3dC
 PLhw209+7w8SCgmo8AdMZQG5aexUzt3z5Fk2CrYiS1PSZ7De7NpU1S2IGZHqr+BNUcg3
 5r5jO94WN79UIOO6w4ortZ8HxPEy7UMuOxSJjWtz5oiH+uVS0hI+SuqwbiWEJlbWgUHo
 okJKnpxkIWmU5LbQPpZS8LyQktfIVLbov/+v1V+VTXNLljrwhZX8DZyiRDXjVTraren9
 5Q/o49EFDpZMURJAIE7aUziXIHnaEiN7Nrixi5Vk/zsdoocNlHlnB3XSQ0cosBv/azG2
 PuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708606910; x=1709211710;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m7Z26rH0nxtWAPBPvE/KxZ0NHjlwRm5O/7QOSN2/Ky0=;
 b=h1jp29veJCCGQT98cI6k6I8Ql8ZlIEAxrJLYwV5euznuhStu/eIOBcXBVeZvyR+ewK
 wZWznMorU/uk0fS21x2qPAX3qiJKYUok2rCaciND45uzva+5f2IPzcXldqmesnwVMPd5
 h/y/0E7XC8FQYJYBTCaDWlPjOFoI7hN7WCCtXAfHQBxdvz6spcdFY3AS37nzb5T0AIq+
 d9YCSY/BS6LYpwS3+XvQJKf8J0iUZI0GiweqQLr6LxRJc9llFMx79zBktP9si4AX0/5E
 KxTCjWbbdx8T7RfzRq+p78554yh+xEdbZqE/slUYwwocDGEM8YcaNsx42bNe1IqZJyXs
 34hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV72/BkBBY9eEQ5kQ4pnyk1xe5+imXBZsxLlzljt3BcJ3h/XUYDvXzjvOjZgNngpSqdXMoeJLjQnT2Lfq/eAlfMiZVIvFlB93jGSrxORzoaLlel1kscHDww
X-Gm-Message-State: AOJu0YxhFcJT54ytqXeULNaKDeFuWJjtc7+3A5KcB13XMVH8d1/IPGD4
 kPa5KbFZv/fIui3cRzAteDRY+Xcv/5eWK8+yZG/nx6NZTjaStkd5f6PYofmns3A=
X-Google-Smtp-Source: AGHT+IGkf5An0FRhTN8uAcXotjLH9vOh29NQ0tafltetUlELSWRNWwvu9X3GqAFXb4b17ycZtwCaOQ==
X-Received: by 2002:a05:6512:3a88:b0:512:ba3a:5368 with SMTP id
 q8-20020a0565123a8800b00512ba3a5368mr9141098lfu.48.1708606910048; 
 Thu, 22 Feb 2024 05:01:50 -0800 (PST)
Received: from [172.30.204.125] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 o6-20020ac24e86000000b0051186931619sm2055814lfr.146.2024.02.22.05.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 05:01:49 -0800 (PST)
Message-ID: <54b8c58a-6288-4ae6-9ed7-aa7b212e63da@linaro.org>
Date: Thu, 22 Feb 2024 14:01:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sarosh Hasan <quic_sarohasa@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney
 <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
References: <20240222125517.3356-1-quic_sarohasa@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240222125517.3356-1-quic_sarohasa@quicinc.com>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Update link clock rate only for RGMII
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2/22/24 13:55, Sarosh Hasan wrote:
> Updating link clock rate for different speeds is only needed when
> using RGMII, as that mode requires changing clock speed when the link
> speed changes. Let's restrict updating the link clock speed in
> ethqos_update_link_clk() to just RGMII. Other modes such as SGMII
> only need to enable the link clock (which is already done in probe).
> 
> Signed-off-by: Sarosh Hasan <quic_sarohasa@quicinc.com>
> ---
>   .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 26 ++++++++++---------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..9cd144fb3005 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -169,21 +169,23 @@ static void rgmii_dump(void *priv)
>   static void
>   ethqos_update_link_clk(struct qcom_ethqos *ethqos, unsigned int speed)
>   {
> -	switch (speed) {
> -	case SPEED_1000:
> -		ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
> -		break;
> +	if (phy_interface_mode_is_rgmii(ethqos->phy_mode)) {
> +		switch (speed) {
> +		case SPEED_1000:
> +			ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
> +			break;
>   
> -	case SPEED_100:
> -		ethqos->link_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
> -		break;
> +		case SPEED_100:
> +			ethqos->link_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
> +			break;
>   
> -	case SPEED_10:
> -		ethqos->link_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
> -		break;
> -	}
> +		case SPEED_10:
> +			ethqos->link_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
> +			break;
> +		}
>   
> -	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
> +		clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
> +	}
>   }

if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
	return 0;

[leave the rest unchanged]

?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
