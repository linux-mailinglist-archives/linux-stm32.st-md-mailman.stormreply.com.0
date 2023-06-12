Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7572D02B
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 22:07:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09603C6A617;
	Mon, 12 Jun 2023 20:07:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C586BC6A60F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 20:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686600460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IuHNa6WZpYveQJr9GnIkLeDKCuARWHsJdm0re5kGQrg=;
 b=RL4ZSsiFEmr0RuV+jEChVLUd394vcByJ5YhBt119it5rFfGtMrXhRkizaZqXOXT53xwWzx
 gei/geo0eeFFVWAt3IeOFND2Tn6C53r7wjO7i8Jx4Xo4wGEV8NR646rAnDG7918QMEzG9p
 VA7U4ctSlni0bnInqbFvKlqwlDpE1/o=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-0ZrREkYQNLqjgktCltjyWw-1; Mon, 12 Jun 2023 16:07:37 -0400
X-MC-Unique: 0ZrREkYQNLqjgktCltjyWw-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-55b2dda8657so3900133eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 13:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686600457; x=1689192457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuHNa6WZpYveQJr9GnIkLeDKCuARWHsJdm0re5kGQrg=;
 b=TfoGBmvOhejGYUAM20zlJpogbnJOAlZcWWTJDMEcADomjsGAvw7ceTtmITwzhJUi8A
 q9Rkn/IJ0mYz9Oki8dpkwSKjXAFNey39NwhYESUHYYENXvIP9E5TW7v7eh55l6fXGRxB
 ylTtX1kY+K0wxqGWvdCb0RXVKddEnVVUADWMRfdC7gew3ZxYFMlkch6CA7IzWdy1Fqxc
 c1RZcW+vAxOxqH31/H3RRm2xovdZ7F86kbLdRYsunLGJ+XH+f4H/E6f5GCFSKdWs7/HC
 I0Qw6eFbTbWGUIk37Z8wEYc1ZPjW+DZhFltKp0XwrqvxsIYmXAIa2RdOg0SUrpphB9Yq
 Efpg==
X-Gm-Message-State: AC+VfDy2WWt4iwB06BfNPZyn6TBp8uByWVxAfnEIskhYcWX8TdP0WkMv
 eIQBV67BtJeTIvXaT+RUtjC3A2HGxmzKtXgZHoHbEzXfnQHQAAGUbKBCrWundiszrkqIHoEPhD8
 KEDsJ/Z624IjBRV9gwrEvYsJd1UXXFLRR5Xiadnsb
X-Received: by 2002:a4a:bd92:0:b0:556:c580:eba6 with SMTP id
 k18-20020a4abd92000000b00556c580eba6mr5832113oop.4.1686600457018; 
 Mon, 12 Jun 2023 13:07:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Sjt0Fg2Ll+XfHA2BponpBIQ9aDoC0AyoTvbdiarG2SXbdj01ZqgXciHHSmeIvp1v/ALCRsQ==
X-Received: by 2002:a4a:bd92:0:b0:556:c580:eba6 with SMTP id
 k18-20020a4abd92000000b00556c580eba6mr5832088oop.4.1686600456761; 
 Mon, 12 Jun 2023 13:07:36 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a4ad0ae000000b0054fd0b7af2bsm3509727oor.31.2023.06.12.13.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 13:07:36 -0700 (PDT)
Date: Mon, 12 Jun 2023 15:07:33 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612200733.h3323ktcggbeil3q@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-12-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-12-brgl@bgdev.pl>
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
Subject: Re: [Linux-stm32] [PATCH 11/26] net: stmmac: dwmac-qcom-ethqos:
	remove stray space
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

On Mon, Jun 12, 2023 at 11:23:40AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There's an unnecessary space in the rgmii_updatel() function, remove it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 5b56abacbf6b..8ed05f29fe8b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -117,7 +117,7 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos,
>  {
>  	unsigned int temp;
>  
> -	temp =  rgmii_readl(ethqos, offset);
> +	temp = rgmii_readl(ethqos, offset);
>  	temp = (temp & ~(mask)) | val;
>  	rgmii_writel(ethqos, temp, offset);
>  }
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
