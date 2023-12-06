Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46623807C99
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Dec 2023 00:58:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2D1AC6C85F;
	Wed,  6 Dec 2023 23:58:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FC1AC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 23:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701907127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iMfMtI/O0jIiZbunMjgS2xYQfG8mFWEFBfbJJAbpGQ8=;
 b=Rdt5MnCPjegxLf7Y9qOYIrlaVxVl6gC2mPdesUyWZlMjCrfJaD5G3mPWCkFExQDYpFeJDg
 lwbLT7H06NWemMyg8SecrOAIOKba7uWYCG3u9a68ZuLPqEUKCicRBJAM+xqb7NM99Se53c
 qsQUXnXKGRFZZkxIdGmzT6ttVdTEzQA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-3J0-Cif1MpmHTTizK_62Ug-1; Wed, 06 Dec 2023 18:58:43 -0500
X-MC-Unique: 3J0-Cif1MpmHTTizK_62Ug-1
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-6d9aafe6575so428595a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Dec 2023 15:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701907123; x=1702511923;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMfMtI/O0jIiZbunMjgS2xYQfG8mFWEFBfbJJAbpGQ8=;
 b=lzEi8fN1llHiwTsWwXK+tpdChzJ/+IRLscDlIPl89VWweT7/OcwrxTAMsUxhZwxp/s
 xlCw96OxJkDK+dV14KOtOqHx2WLnYCd798MF33sPzXIrta+SBhkYAalUkDrTevPAxOVk
 dk6fSzJngbcwTjFOLhHuYXP4VZg5edSEytlMKIbnDdgf4fLmC9rzNbxIA2XM4UkQ1bCR
 egZmhFU3vwAVZBvHNlR3qDj0Lo+0dG5TI/xcOv1z2LK0slRiYoldZyfZCMebKvzyOit8
 gMdH6uu/rnFEY64yKxrc93JIIP0d7n4O3kWF6WwWeRHAy4eGhoWuHNBUf7A5F+QNTm9s
 xtww==
X-Gm-Message-State: AOJu0Yw1z+kAh7dMr/EGwyrod0SAuKjpNB/VZ+AatSbHFzW+H5IFOf+U
 +1WwVOcSAsdsEow48N1yGLK6SCdm44LsIxQHju6uktNDuakv46OBbPCv9Fuvu2xSp4K6722MCXJ
 10vFd2hU95/oKeFzBQ98QHxsyZOAhVKSCg69S1uYZ
X-Received: by 2002:a05:6830:7181:b0:6d8:20b3:b1db with SMTP id
 el1-20020a056830718100b006d820b3b1dbmr1816323otb.38.1701907123219; 
 Wed, 06 Dec 2023 15:58:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmQIfsUa078g71FcFgEGySz43PAmZThnQyujRyHJ+s5jQA3gXSH1Xxl5XAcJeDcLqpXjZ6nQ==
X-Received: by 2002:a05:6830:7181:b0:6d8:20b3:b1db with SMTP id
 el1-20020a056830718100b006d820b3b1dbmr1816307otb.38.1701907122992; 
 Wed, 06 Dec 2023 15:58:42 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 v7-20020ac87487000000b004255638e8b9sm37725qtq.79.2023.12.06.15.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 15:58:42 -0800 (PST)
Date: Wed, 6 Dec 2023 17:58:40 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Message-ID: <nmkpcss5pymkjitcf2o3pwu3r2rbu3kfy2ubtkpmktw6worj5p@rk5aljx6slwi>
References: <20231206-stmmac-no-mdio-node-v2-1-333cae49b1ca@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231206-stmmac-no-mdio-node-v2-1-333cae49b1ca@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: don't create a
 MDIO bus if unnecessary
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

On Wed, Dec 06, 2023 at 05:46:09PM -0600, Andrew Halaney wrote:
> The stmmac_dt_phy() function, which parses the devicetree node of the
> MAC and ultimately causes MDIO bus allocation, misinterprets what
> fixed-link means in relation to the MAC's MDIO bus. This results in
> a MDIO bus being created in situations it need not be.
> 
> Currently a MDIO bus is created if the description is either:
> 
>     1. Not fixed-link
>     2. fixed-link but contains a MDIO bus as well
> 
> The "1" case above isn't always accurate. If there's a phy-handle,
> it could be referencing a phy on another MDIO controller's bus[1]. In
> this case currently the MAC will make a MDIO bus and scan it all
> anyways unnecessarily.
> 
> There's also a lot of upstream devicetrees[2] that expect a MDIO bus to
> be created and scanned for a phy. This case can also be inferred from
> the platform description by not having a phy-handle && not being
> fixed-link. This hits case "1" in the current driver's logic.
> 
> Let's improve the logic to create a MDIO bus if either:
> 
>     - Devicetree contains a MDIO bus
>     - !fixed-link && !phy-handle (legacy handling)
> 
> Below upstream devicetree snippets can be found that explain some of
> the cases above more concretely.
> 
> Here's[0] a devicetree example where the MAC is both fixed-link and
> driving a switch on MDIO (case "2" above). This needs a MDIO bus to
> be created:
> 
>     &fec1 {
>             phy-mode = "rmii";
> 
>             fixed-link {
>                     speed = <100>;
>                     full-duplex;
>             };
> 
>             mdio1: mdio {
>                     switch0: switch0@0 {
>                             compatible = "marvell,mv88e6190";
>                             pinctrl-0 = <&pinctrl_gpio_switch0>;
>                     };
>             };
>     };
> 
> Here's[1] an example where there is no MDIO bus or fixed-link for
> the ethernet1 MAC, so no MDIO bus should be created since ethernet0
> is the MDIO master for ethernet1's phy:
> 
>     &ethernet0 {
>             phy-mode = "sgmii";
>             phy-handle = <&sgmii_phy0>;
> 
>             mdio {
>                     compatible = "snps,dwmac-mdio";
>                     sgmii_phy0: phy@8 {
>                             compatible = "ethernet-phy-id0141.0dd4";
>                             reg = <0x8>;
>                             device_type = "ethernet-phy";
>                     };
> 
>                     sgmii_phy1: phy@a {
>                             compatible = "ethernet-phy-id0141.0dd4";
>                             reg = <0xa>;
>                             device_type = "ethernet-phy";
>                     };
>             };
>     };
> 
>     &ethernet1 {
>             phy-mode = "sgmii";
>             phy-handle = <&sgmii_phy1>;
>     };
> 
> Finally there's descriptions like this[2] which don't describe the
> MDIO bus but expect it to be created and the whole address space
> scanned for a phy since there's no phy-handle or fixed-link described:
> 
>     &gmac {
>             phy-supply = <&vcc_lan>;
>             phy-mode = "rmii";
>             snps,reset-gpio = <&gpio3 RK_PB4 GPIO_ACTIVE_HIGH>;
>             snps,reset-active-low;
>             snps,reset-delays-us = <0 10000 1000000>;
>     };
> 
> [0] https://elixir.bootlin.com/linux/v6.5-rc5/source/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts
> [1] https://elixir.bootlin.com/linux/v6.6-rc5/source/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> [2] https://elixir.bootlin.com/linux/v6.6-rc5/source/arch/arm64/boot/dts/rockchip/rk3368-r88.dts#L164
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---

Gah, I failed to describe my changes since Bart's v1 when picking this
up with b4 to make v2. Whoops!

Changes since v1:
    - Handle the fixed-link + mdio case (Andrew Lunn)
    - Reworded commit message
    - Handle the "legacy" case still mentioned in the commit
    - Bit further refactoring of the function

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
