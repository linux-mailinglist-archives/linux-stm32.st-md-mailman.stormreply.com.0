Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6D72D026
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 22:07:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E30F6C6A617;
	Mon, 12 Jun 2023 20:07:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9314C6A60F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 20:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686600425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X+0noFHcj2yLtNYh9uCwW0uaG8SfjbhqsP5is69vjY8=;
 b=Jm8YCnDmibfMsbOK7JvBJv2QYVb2HfbL1RpcueQUKK23BYiN9grTXiO08U9gLSR6FYlhlP
 MFG4pnbywqng/UUK9108BwJywkTLfN7RzjQUzconl0mZE+Aw7epnxCRjfE4RjZLWdKyxr7
 BmNy7fMphSv25qp3LNKrHru1i5A0eUI=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-rygsKHtYNoekuQmbGNgPBA-1; Mon, 12 Jun 2023 16:07:01 -0400
X-MC-Unique: rygsKHtYNoekuQmbGNgPBA-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-561ceb5b584so77217687b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 13:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686600420; x=1689192420;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+0noFHcj2yLtNYh9uCwW0uaG8SfjbhqsP5is69vjY8=;
 b=l4xqlZIThMBCmbueEEeu0uuLn66aNEbRqRQHgTNCmDCHpNhGagV3n1HcxGy6tE1jx+
 dKxr+7hotKpI6tM58bBxoJXUQoqyUXusoXb0TTB43Wr3SQL1rOn+p1FmS5U56YPNuWXn
 YEzmKnjsh5ebBRvUheVTc5fRFjSdUbTQp+fnYEywGBr/ioBI3YfNf5+tQWmPYmJ50kYu
 o10qO2odw3UKRc258o8EmIFtF0+NiFbUNI9lHFSSVIl2YXr/Z2Nub55DccAYeDoSgRuO
 dgaMPjW0zJPdkcAbjgefx67vgiTE74s3HL9qbuZlt2EZlOHKh10JcCWZ4hMulHpo7ESW
 mTAw==
X-Gm-Message-State: AC+VfDxL1pyyOcqjGkFzAM1KKA1CWVPyxv0tzLVXDEFvlBcXsXgT1Qti
 HWfJp0tpeJWzEzYBlW3GskhdZmEgU1hXKDYUbkdIOWsAxEw2Va8UDdVpNMpmaVrLB9CHHF0E2Q1
 t2XbabdukZelh2BRvASyR9uNfx8rBmnCjbPOfHNLx
X-Received: by 2002:a0d:d142:0:b0:569:feee:3950 with SMTP id
 t63-20020a0dd142000000b00569feee3950mr12226035ywd.2.1686600419884; 
 Mon, 12 Jun 2023 13:06:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7PzolWatF3tOgmfa9XBAGwXjOlATUx5vSje4PclwYgketu3avPNRnBzek6n0LaOUY30qXC9g==
X-Received: by 2002:a0d:d142:0:b0:569:feee:3950 with SMTP id
 t63-20020a0dd142000000b00569feee3950mr12225997ywd.2.1686600419621; 
 Mon, 12 Jun 2023 13:06:59 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a819e0e000000b00568e7e21db7sm2713928ywj.96.2023.06.12.13.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 13:06:59 -0700 (PDT)
Date: Mon, 12 Jun 2023 15:06:56 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612200656.ndt5pwhi3gqj42a5@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-11-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-11-brgl@bgdev.pl>
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
Subject: Re: [Linux-stm32] [PATCH 10/26] net: stmmac: dwmac-qcom-ethqos: add
 a newline between headers
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

On Mon, Jun 12, 2023 at 11:23:39AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Typically we use a newline between global and local headers so add it
> here as well.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ecb94e5388c7..5b56abacbf6b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -7,6 +7,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
>  #include <linux/property.h>
> +
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
