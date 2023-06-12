Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4B072D187
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 23:06:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D01C0C6A617;
	Mon, 12 Jun 2023 21:06:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 885AAC6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686604013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UVvZ3v/vxKNyCI7w7GwLJIJ0X+T6wDAbj+0uoM6y2a8=;
 b=YD+8krc54rdn46lHqG4VtayjsMbMcXCGWvN21Ahmqgz3qA0siBgzkgrJeryhDdlUf56uFK
 Mv0Hmd4rs+a4PZHp7wslVZo7iTLTxcjTX9svq3BM58lDIYfqF6FCHeRcoWEml6Lok3x8S+
 sbMg5VWr+LyHXtgKjuW90WDzGHsXWUg=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-U87MwG8FNb6WbP8E8IwPBw-1; Mon, 12 Jun 2023 17:06:52 -0400
X-MC-Unique: U87MwG8FNb6WbP8E8IwPBw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1a670594351so1640962fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 14:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686603996; x=1689195996;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVvZ3v/vxKNyCI7w7GwLJIJ0X+T6wDAbj+0uoM6y2a8=;
 b=lk6Bensbbti6+NeTH2BWhvQZ6k01uQPmG+lfy6ytvBgd2lgJLHb1J32bdizx6m8tsG
 QmWiteGZNXKpmmkCHhmqqIGyLkEClMZIBzfzltZxMr7Yatbtge//OVavcSr5oaMnM+Dr
 cmYsMuN65wxjsjWhB34QAhymaqrjPCkjAIU5gH2yanJxbwub9FBmuaqNggT6igp0BAYn
 JPJDWVe8R6v2CUAPkQC3OLDY0RdA3DEIAezrDEUTCzxySbF46td6FxU0IpIb9HmRaBeh
 kBWwzp5yLo8xC6SSl8ECqU2xr3J5qeI64XO51SB03PQzELRAx8NhUQjPLJ5qIYLpiOMz
 fhtw==
X-Gm-Message-State: AC+VfDxwBAvIA0Za4Cd9pavlzMGFpKe1RmrYDcyvY78w/XUTB2LjFWaY
 HFlcP/FjQeouahoqqgUDqa+p2rETJ4adT4NaFCtJi9rMuncwEjqsitf6jrrp9XW3ddXScSh/dIJ
 qrZYxV1oTTsxgudyQB2MNDCh2S1OinuiTjCbhR3KB
X-Received: by 2002:a05:6870:770d:b0:1a6:7ae5:8e31 with SMTP id
 dw13-20020a056870770d00b001a67ae58e31mr2707699oab.15.1686603996098; 
 Mon, 12 Jun 2023 14:06:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5l8CIOc/fjbn/4dLBsqStqDJVa3ICb/fLC7IjnpwzGvy8FQcOZ753YVKUTI3PaLVSqB/0bAw==
X-Received: by 2002:a05:6870:770d:b0:1a6:7ae5:8e31 with SMTP id
 dw13-20020a056870770d00b001a67ae58e31mr2707670oab.15.1686603995860; 
 Mon, 12 Jun 2023 14:06:35 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 nw27-20020a056870bb1b00b001a6825ed5cfsm2251974oab.4.2023.06.12.14.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:06:35 -0700 (PDT)
Date: Mon, 12 Jun 2023 16:06:32 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612210632.agp4ybeseujblao2@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-16-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-16-brgl@bgdev.pl>
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
Subject: Re: [Linux-stm32] [PATCH 15/26] net: stmmac: dwmac-qcom-ethqos: add
 support for the optional phy-supply
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

On Mon, Jun 12, 2023 at 11:23:44AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> On sa8775p-ride we need to enable the power supply for the external PHY.

Is this for the external phy? It doesn't seem like it from the board
schematic I have... the regulator never makes it out of the black box that
is the SIP/SOM if I'm reading right.

My (poor) understanding was this was for the serdes phy that's doing the
conversion to SGMII before hitting the board... good chance I'm wrong
though.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 2f6b9b419601..21f329d2f7eb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -8,6 +8,7 @@
>  #include <linux/phy.h>
>  #include <linux/phy/phy.h>
>  #include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "stmmac.h"
>  #include "stmmac_platform.h"
> @@ -692,6 +693,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_config_dt;
>  
> +	ret = devm_regulator_get_enable_optional(dev, "phy");
> +	if (ret < 0 && ret != -ENODEV)
> +		goto out_config_dt;
> +
>  	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
>  	if (IS_ERR(ethqos->serdes_phy)) {
>  		ret = PTR_ERR(ethqos->serdes_phy);
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
