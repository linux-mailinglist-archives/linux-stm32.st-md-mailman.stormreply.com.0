Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5052A72CC43
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 19:20:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 003AAC6A615;
	Mon, 12 Jun 2023 17:20:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C01A8C6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686590442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7qlKft7mE4b2kNS3x9A8djvNWYAtiYtMSSZe9V4o7Ek=;
 b=fdEYm5ePBJz8/sLLgUVBm+R801+8LnD8NjUGHFbjdaf27oyWXenG6Z3ZUtVNGn5uvySK78
 B+Osf9UhBiADVQH0iH08VioSP5Jl7ZV/lF6l1B9+FAMENolBKIZoRjRAKHGcmqluj2us/r
 IAZNz1smwBpSZ6pB4EzfEgUQEJJRgDs=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-fcrV3AgNNF-qJaUArLIE_g-1; Mon, 12 Jun 2023 13:20:41 -0400
X-MC-Unique: fcrV3AgNNF-qJaUArLIE_g-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-565ba5667d5so65743307b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 10:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686590440; x=1689182440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7qlKft7mE4b2kNS3x9A8djvNWYAtiYtMSSZe9V4o7Ek=;
 b=ge6fQk8zXctIxvySPUmBWMU2F8biSFSAZl+F943TxqOrnqw3A5X7j94ytSZ3AD14AT
 oHPTuZq7AssIqIag0+sYt/YylyRcK4OxQyImlz16+4jAes6MGoDSkUCDSGy2fSPwY3CU
 33BT+7aqx5Q/7Gw6/J9gbtPy0lhd9f9McLzVl2o/v1Y4K8WdtrdCl9NFX6lrVV9jrj0t
 uKMmfSkZjQJ4DmBqIIVjWnZlSVJgjw9RNdiloHo0dS6ZCb4fQtKMCIK2Y9e+86cSyeco
 IUO0LU3EAM0lfSrvqk5gJK7uz4MEUlk14bbSku/P4IbC3i33hpIzY5B5X0KdyKxvJy6y
 qOng==
X-Gm-Message-State: AC+VfDxCAwZlo4v3kdcwaRIEsIikrdtxbWJXKrqN/HqBsjQjBNlBj7Su
 qirMb+uEz6SiS673ojZOvhq4GEEB/6DETN25NM4uKDGN1bjejkv611SjBxKdiuwMx9//5SyFBf9
 a2JaS+ahGLt2OnqHJTeQsUL7GhkwHH11N37tIp5Nh
X-Received: by 2002:a81:8047:0:b0:565:c888:1d09 with SMTP id
 q68-20020a818047000000b00565c8881d09mr11436045ywf.30.1686590440570; 
 Mon, 12 Jun 2023 10:20:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pK0EspHiEwXLJwZSnTgF0PmnWrSSsx5/e6T7JNdTcNpiEDXWG/J7snMtSub/jvW4XBEs/gg==
X-Received: by 2002:a81:8047:0:b0:565:c888:1d09 with SMTP id
 q68-20020a818047000000b00565c8881d09mr11436028ywf.30.1686590440315; 
 Mon, 12 Jun 2023 10:20:40 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a815f07000000b0054f9e7fed7asm2622065ywb.137.2023.06.12.10.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 10:20:39 -0700 (PDT)
Date: Mon, 12 Jun 2023 12:20:36 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612172036.ztvjdzblh6bvmxp2@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-2-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-2-brgl@bgdev.pl>
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
Subject: Re: [Linux-stm32] [PATCH 01/26] phy: qualcomm: fix indentation in
	Makefile
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

On Mon, Jun 12, 2023 at 11:23:30AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Align all entries in Makefile.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/phy/qualcomm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index de3dc9ccf067..5fb33628566b 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -20,4 +20,4 @@ obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
>  obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)	+= phy-qcom-usb-hs-28nm.o
>  obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
>  obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
> -obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)		+= phy-qcom-ipq806x-usb.o
> +obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
