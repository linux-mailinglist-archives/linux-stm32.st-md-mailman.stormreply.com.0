Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC273A89F
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 20:54:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 284B9C65E42;
	Thu, 22 Jun 2023 18:54:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DDE5C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 18:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687460076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcFPpQeDwI/GvuqShemurkup3+TWysI+P7nO7FR3o9o=;
 b=bZf+17F1jezbUyJPVTfq+BtPCfoHnq5+oYT2u2p4HYsabhNdQvTZCCbcLRUtCIGbQ47bY4
 RJZjnqL/jVRDOBohUstGm4R4G1vh5Duibei9kWXrAmI1c3xbRQBNIF3kYfJ8JuIEtBx8AE
 AtLXQSSPFb5q2OixWuEayrFMrpIEFvs=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-z-5gDM7XPOqUTUBI292qsQ-1; Thu, 22 Jun 2023 14:54:33 -0400
X-MC-Unique: z-5gDM7XPOqUTUBI292qsQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-6b29075c28eso6215720a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 11:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687460068; x=1690052068;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcFPpQeDwI/GvuqShemurkup3+TWysI+P7nO7FR3o9o=;
 b=WzzZENCzDEPb2iyHfRbruJCFXaXS32SG6pwXHrLT5XpPWQwJGyECdeaO8K4zE3I85A
 +MFUyxn6Etifr9e9Hw07hF9htuB3zkpuDCh6jlNgcylj2vyGVSBO3KgugfPbdYmQFWxq
 C0cDN25w/Z1TvHtibsx1ZzMMyX13UnZMclbVEP8x8IVtiLK2En0+OpGH482qZKUU2Mr5
 zObsSML8ZmhjEoe/Y8w18VHYd31qVRlU2BJzkNZtLyfHn6ozzcnWC51FVa5IAc0Qjb5G
 kWIBbuO6lIw7Y4U0XaE1lTd/WVVue3MhlYD1NtBzm279X2Q/3OZ1ts0uNwDdcycJ3Kcc
 QIpw==
X-Gm-Message-State: AC+VfDxjRO/2c7RhzsOPROMBOdPDQClbdVaTPjZUX4H+jkSi6LJHyHSH
 EdS8j00RxRPbCjQ5U8mtahKbzs/t1eVO1DlYLC4ncC56lwI0eLq42bNVTUrKAIfsjH1WewehQr9
 I+fd3wgBIw0X7RkGC7XW22rvS2D2DkYCdUo7TYd+H
X-Received: by 2002:a9d:7985:0:b0:6b4:27e8:fb3e with SMTP id
 h5-20020a9d7985000000b006b427e8fb3emr14096439otm.27.1687460068404; 
 Thu, 22 Jun 2023 11:54:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7uPvTcOIYG9gzSLYiwB8j1p2qMb9rwBj1K/JGUAcjwcI3+cPgyeiiPBlkDDEg+NeB7FiW5CA==
X-Received: by 2002:a9d:7985:0:b0:6b4:27e8:fb3e with SMTP id
 h5-20020a9d7985000000b006b427e8fb3emr14096429otm.27.1687460068144; 
 Thu, 22 Jun 2023 11:54:28 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::f])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a056830139300b006ac98aae2d3sm3137110otq.40.2023.06.22.11.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 11:54:27 -0700 (PDT)
Date: Thu, 22 Jun 2023 13:54:25 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230622185425.vfewm2qgxqpndfyf@halaney-x13s>
References: <20230621135537.376649-1-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230621135537.376649-1-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Junxiao Chang <junxiao.chang@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix double serdes
	powerdown
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

On Wed, Jun 21, 2023 at 03:55:37PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Commit 49725ffc15fc ("net: stmmac: power up/down serdes in
> stmmac_open/release") correctly added a call to the serdes_powerdown()
> callback to stmmac_release() but did not remove the one from
> stmmac_remove() which leads to a doubled call to serdes_powerdown().
> 
> This can lead to all kinds of problems: in the case of the qcom ethqos
> driver, it caused an unbalanced regulator disable splat.
> 
> Fixes: 49725ffc15fc ("net: stmmac: power up/down serdes in stmmac_open/release")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 10e8a5606ba6..4727f7be4f86 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7461,12 +7461,6 @@ void stmmac_dvr_remove(struct device *dev)
>  	netif_carrier_off(ndev);
>  	unregister_netdev(ndev);
>  
> -	/* Serdes power down needs to happen after VLAN filter
> -	 * is deleted that is triggered by unregister_netdev().
> -	 */
> -	if (priv->plat->serdes_powerdown)
> -		priv->plat->serdes_powerdown(ndev, priv->plat->bsp_priv);
> -
>  #ifdef CONFIG_DEBUG_FS
>  	stmmac_exit_fs(ndev);
>  #endif
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
