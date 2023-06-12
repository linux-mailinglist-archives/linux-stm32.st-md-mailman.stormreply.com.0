Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E072D0C6
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 22:40:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AC43C6A617;
	Mon, 12 Jun 2023 20:40:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4666FC6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 20:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686602447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+GICplP/MT1isAH+ok2l+9fKNc3rvvMZkj74HkVOtyg=;
 b=HZb4b7DF1KJD+PD54kOwh8oUXEN1DjN5oyTSoWWcoM6dThxgpjpqgck3J0C9KGjIjAVmWZ
 mWYjyoVs4f74U5YyY4goTjMRDrA7UGAwGy9fIuZ0xQsM1Lalgp4JHNLWo7AQWNLba/niJz
 5Pz08+6aFVkjq1SjCGYDIcltIG/dGLA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-sQiq8gwkNDCbkEjywIwILQ-1; Mon, 12 Jun 2023 16:40:45 -0400
X-MC-Unique: sQiq8gwkNDCbkEjywIwILQ-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-56cea71b98fso39094427b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 13:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686602445; x=1689194445;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GICplP/MT1isAH+ok2l+9fKNc3rvvMZkj74HkVOtyg=;
 b=CGKS21HnyBNKM3yADV178qQykiMKO4VnHzjs8s2AQAy2uWQBsiQDF6t6kwpK4AXvw5
 PfO6HrMmUFjLILQfNMmbgeQovmNmLm9CKZSxmSZU7zKHSErpu84W96radKayaI/B9DuW
 MzQUzcoGPDuvMdHWJGkRjzGnOszfYNCCqVXliV/ZyBTcuvS4Ot0TNBKYd/GFlLNrLD2b
 aB3CB41UPU2Ai6aXldz3qpioZpCK4QJeQPCTBiWITz/m/dJ9Uol4un+pQ/g8koPreP/+
 qfd1+KCBjq+ki4fuYAomsvfaq7YBwZkqE/bTsYlctq0v+9ktx2Smu5iWuA3A2DJ5B2VS
 AD9A==
X-Gm-Message-State: AC+VfDzw3eAXEgJG9shMpY4DIAkvL0ADUpflSE5MFZUF/UFmP1f0Rbg4
 J4j8HAaKKSYGis9m9jSDn/TnNKt57CPWRv5Ewbx7XrHJBxQkQUIh/XtyKxxr/VA/DPcpMYvTSk3
 Bbv836W9EZ7iKL83rFBC2QefxuqGge/nkzT6g0k8E
X-Received: by 2002:a0d:d3c5:0:b0:569:770d:c9be with SMTP id
 v188-20020a0dd3c5000000b00569770dc9bemr12009518ywd.41.1686602445482; 
 Mon, 12 Jun 2023 13:40:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5YAuKjyJv/dyosgPSnG9gP4AwJix4ti1YXmUnmzQLCn8a2Fe9vENV68IYdOSwyVmtTplKXgA==
X-Received: by 2002:a0d:d3c5:0:b0:569:770d:c9be with SMTP id
 v188-20020a0dd3c5000000b00569770dc9bemr12009500ywd.41.1686602445225; 
 Mon, 12 Jun 2023 13:40:45 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 k190-20020a0dc8c7000000b0056d51c39c1fsm208496ywd.23.2023.06.12.13.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 13:40:44 -0700 (PDT)
Date: Mon, 12 Jun 2023 15:40:42 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612204042.litbbv23zdb3u5k7@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-14-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-14-brgl@bgdev.pl>
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
Subject: Re: [Linux-stm32] [PATCH 13/26] net: stmmac: dwmac-qcom-ethqos:
 make the rgmii clock optional
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

On Mon, Jun 12, 2023 at 11:23:42AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> On sa8775p there's no RGMII clock so make it optional in the driver.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 3438b6229351..252dca400071 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -663,7 +663,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
>  	ethqos->has_emac3 = data->has_emac3;
>  
> -	ethqos->rgmii_clk = devm_clk_get(dev, "rgmii");
> +	ethqos->rgmii_clk = devm_clk_get_optional(dev, "rgmii");

This makes it optional for older platforms too, but as far as I know on
those platforms it is mandatory.

This can be enforced in dt-binding checks, but should we also enforce
that in the driver still? Honestly I feel like yes, but there's probably
some precedent maintainers follow on this front that I don't know of.


>  	if (IS_ERR(ethqos->rgmii_clk)) {
>  		ret = PTR_ERR(ethqos->rgmii_clk);
>  		goto out_config_dt;
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
