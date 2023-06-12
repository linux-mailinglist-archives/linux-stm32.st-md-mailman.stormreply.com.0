Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5799B72D022
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 22:06:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA1A6C6A617;
	Mon, 12 Jun 2023 20:06:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3815AC6A60F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686600390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0M/d98x762H4zuN8FNzgVtnMfzxWhlymbFLqT2RC6Mg=;
 b=eQUIbk58nF8WmByk2PK17J9lOhQ3AHXM/yJ6US5jXEpENIBwhDxqFszRJR9dFNQQpUw1YW
 P1vu2iZzB21uD6XpyfY6RabGN1Tm58jq+NDbVeDLnemQ3qPeg7og/Ill3u83njjoKGwi3+
 yubwi9NkloclG4HnAbJjQaWDtMVUSn0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-9ayJHtvVPga9KAFxlbQA-w-1; Mon, 12 Jun 2023 16:06:29 -0400
X-MC-Unique: 9ayJHtvVPga9KAFxlbQA-w-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-56d4daabd37so11538697b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 13:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686600388; x=1689192388;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0M/d98x762H4zuN8FNzgVtnMfzxWhlymbFLqT2RC6Mg=;
 b=DF4nBnsiU3SxV+C0b6MjNNP1fHNMRB3DRzYV17cu65jTZppXGu8C6JQYRZnAu2PGv3
 JHCW1oZIdFZdcTCT3THJgLtrOnuFMp+9aZECGZl0PurYiyur8XpbXUoE/ldSiz7k1iEo
 wKP/86DOlMOluZ7Gz0KNkQ5X1MoQQfuIK/oc9Ky2HAvIeYiKRj+HeZlvnX3iqrNLpZvk
 r537WMICAMnTFO9CQwtxmmFfIe3dKlCklPAWJgR7tIUpetKir2qfGGzvVSEbFowH+LVf
 voorYw1in0CZE4c7OO4fF/LSWGDK0/5TmV9vRZXdT6ZAboR82y6RXqpFUTXQT+YKpc8F
 B3NA==
X-Gm-Message-State: AC+VfDzmTdMHocZrSqGc3pIXhLaH/ym8J9xIK4QKOXP6CsWGYW4W+qUn
 TTOVHoaAfKSYktL210Vt9iTjQCLK7ckB0csG9A1MBKPBmWN/qJEQc5ZlLsmAyOaZNpdeLb2GZhm
 Kni5uytcN1LlpilcXwUI62hLypn7tQbDX5FbujdVC
X-Received: by 2002:a0d:d914:0:b0:56d:3cb6:8a85 with SMTP id
 b20-20020a0dd914000000b0056d3cb68a85mr3028339ywe.13.1686600388571; 
 Mon, 12 Jun 2023 13:06:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76nT4fsOumxEmo+PTpkq6Cy2kw7r9EpHd6856hkyTJvZHjyfWwkpG7DXRuh3pkEkAcTXM4cw==
X-Received: by 2002:a0d:d914:0:b0:56d:3cb6:8a85 with SMTP id
 b20-20020a0dd914000000b0056d3cb68a85mr3028315ywe.13.1686600388330; 
 Mon, 12 Jun 2023 13:06:28 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 q67-20020a818046000000b0054f83731ad2sm2736173ywf.0.2023.06.12.13.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 13:06:27 -0700 (PDT)
Date: Mon, 12 Jun 2023 15:06:24 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612200624.jvlyemz7g5aoen62@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-10-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-10-brgl@bgdev.pl>
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
Subject: Re: [Linux-stm32] [PATCH 09/26] net: stmmac: dwmac-qcom-ethqos: add
	missing include
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

On Mon, Jun 12, 2023 at 11:23:38AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> device_get_phy_mode() is declared in linux/property.h but this header
> is not included.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e19d142630d3..ecb94e5388c7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
> +#include <linux/property.h>
>  #include "stmmac.h"
>  #include "stmmac_platform.h"
>  
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
