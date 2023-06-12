Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4772D0D9
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 22:42:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BED9C6A617;
	Mon, 12 Jun 2023 20:42:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAFB2C6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 20:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686602576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a+9OvtK97veHl6+HegxVNiurUYmzQbeChvO9xmQ5r5g=;
 b=I0R+X/uZrLtGtzAyQYDm9VNqRRCGuGZZ6pawqilQTJyOrTv/2dbXcM8eBri/7jGELwHtkw
 ZKFJ72U/FaKu6P+VGZuRhrez1f22al6IBxVTPqgfV5l0nExYXCpoQSMpt2FBLfSt9ZVWxA
 lfqHIjRPiDtj6KEtI0fioEnWwlKRoI4=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-oziSkl-kNayiEzgUYDdQlw-1; Mon, 12 Jun 2023 16:42:55 -0400
X-MC-Unique: oziSkl-kNayiEzgUYDdQlw-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-565d1b86a63so69925217b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 13:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686602575; x=1689194575;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+9OvtK97veHl6+HegxVNiurUYmzQbeChvO9xmQ5r5g=;
 b=a2k9UdtDVsvRbUSpmpJAubj7zD7Dq8sK7b53mt7lgzJt5mx3IkOW3MW7xudM0lkuwj
 5Qq8478EtHNmtvRliFv5NBFeKnvMH/xxMPkYv8aj5hoQ2l//B3D0cBwsvYhg/IyAlVrG
 orzAg1+WKDZraqCkFdAyrBaz1lSXzIj4rwH8+KXHq1PgDsRXJlCnV7Kx/u/dBpyjZ8dO
 DvhzrZIKqsYY7HbE5YABXar/pWL/rPpnSvVFcxrzb+pKRMQzSmb+fC937siim1ra1h4p
 WVK4Hq1g31LJAtScllroHqWqT3gg16QV4R5ol9JNqeiCiC4KxAbDZ5wb37Oo61/+/sJI
 b/Fg==
X-Gm-Message-State: AC+VfDwH9IipfLd8bn0oJWu4UYP9E//9CYs2vUXzkoZfAr1H0bK73AmF
 LvyHy8ZvOjF3V9JzrfYFNKHrNgWX7tojrpgL1njK5+Zj5LL5e9cs3NnX2WL057ELJhL3ivIREeX
 fSMeGl9eYGNnGAZf6LWJxQi94CuqwRzC+FrbSxEkj
X-Received: by 2002:a81:7bc6:0:b0:56d:3372:71c7 with SMTP id
 w189-20020a817bc6000000b0056d337271c7mr2596021ywc.23.1686602575040; 
 Mon, 12 Jun 2023 13:42:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xUUOwVWCsyVOTXZeMW6GB/UM/A5jZuRMVvmYBzle/O+VHgBsWxsSIEBgDZ0wTd7/cMwI9Mg==
X-Received: by 2002:a81:7bc6:0:b0:56d:3372:71c7 with SMTP id
 w189-20020a817bc6000000b0056d337271c7mr2596001ywc.23.1686602574825; 
 Mon, 12 Jun 2023 13:42:54 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 x186-20020a817cc3000000b00568cbb028c6sm2769484ywc.85.2023.06.12.13.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 13:42:54 -0700 (PDT)
Date: Mon, 12 Jun 2023 15:42:52 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612204252.kb57m72ehazt4bco@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-15-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-15-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 14/26] net: stmmac: dwmac-qcom-ethqos: add
 optional phyaux clock
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

On Mon, Jun 12, 2023 at 11:23:43AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> On sa8775p we don't use the RGMII clock but have an additional PHYAUX
> clock so add support for it to the driver.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 252dca400071..2f6b9b419601 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -94,6 +94,7 @@ struct qcom_ethqos {
>  
>  	unsigned int rgmii_clk_rate;
>  	struct clk *rgmii_clk;
> +	struct clk *phyaux_clk;
>  	struct phy *serdes_phy;
>  	unsigned int speed;
>  
> @@ -604,6 +605,13 @@ static int ethqos_clks_config(void *priv, bool enabled)
>  			return ret;
>  		}
>  
> +		ret = clk_prepare_enable(ethqos->phyaux_clk);
> +		if (ret) {
> +			clk_disable_unprepare(ethqos->rgmii_clk);
> +			dev_err(&ethqos->pdev->dev, "phyaux enable failed\n");
> +			return ret;
> +		}
> +
>  		/* Enable functional clock to prevent DMA reset to timeout due
>  		 * to lacking PHY clock after the hardware block has been power
>  		 * cycled. The actual configuration will be adjusted once
> @@ -611,6 +619,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
>  		 */
>  		ethqos_set_func_clk_en(ethqos);
>  	} else {
> +		clk_disable_unprepare(ethqos->phyaux_clk);
>  		clk_disable_unprepare(ethqos->rgmii_clk);
>  	}
>  
> @@ -669,6 +678,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		goto out_config_dt;
>  	}
>  
> +	ethqos->phyaux_clk = devm_clk_get_optional(dev, "phyaux");
> +	if (IS_ERR(ethqos->phyaux_clk)) {
> +		ret = PTR_ERR(ethqos->phyaux_clk);
> +		goto out_config_dt;
> +	}
> +

Similar comment to the prior patch about whether or not this should be
optional (or selected via platform compatible and required),
otherwise looks good.

>  	ret = ethqos_clks_config(ethqos, true);
>  	if (ret)
>  		goto out_config_dt;
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
