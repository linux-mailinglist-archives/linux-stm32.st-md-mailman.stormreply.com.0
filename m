Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E27F956D
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Nov 2023 22:11:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B62BEC6B457;
	Sun, 26 Nov 2023 21:11:02 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5825CC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Nov 2023 21:11:01 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BD72840C59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Nov 2023 21:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1701033059;
 bh=rvglDuo/fTyCEy2eZikNSrK0RCDTjL208TqZkqJiFe0=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=uxNgOXms3kTtZrV9UKovibbt5fnciZ8qdyZ4o64IQpe4AEf3FgVDO6mokn3arw580
 qFxi1lxD8QcBJ2MKaGszWdV3s7H9T0Pzd2d36/1/bfFobK4wyZ/yBY2IDMdOZz+cBj
 aN95HuWTNXmyMrq3WMzuqZ71tTp66X8JpJ9e81D1mPm0eR7mLqHOWK+5iCo/jQqJF6
 Wz2LhlmkxpMopSt/remgbiMLpWJCDzqCosdN1BZGkIFZ4HFzq27Upi3QUUD6Mtr9Xt
 6962AVK98Dm0xXrBb3CuYGkIiihffdBBZSzlb4FnvAtmFVhPOL6CjTKY3PRO+SYBnp
 SI0plRoW99sFA==
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-67a3b35f343so7189246d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Nov 2023 13:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701033058; x=1701637858;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rvglDuo/fTyCEy2eZikNSrK0RCDTjL208TqZkqJiFe0=;
 b=c2NtW4HfkgoQfU2Rr83pH7EEp1KFLaZQDcXNW/V4bNIL2/TuEtAvnLRROgk7YSQQKD
 gsVCcUQ+pZCki+QkFX5Bfzo55sqppePES+CoJG73ZuRsaTI52POYgbueIvubtAEROXv2
 wbWhQOtv2LBbx5RmIbkAnqEFUQVthk77k0PyJiCy3m8/CkxGSnA4bQzU/0OwMVhzNJsm
 CrGVr3diB5hDyAblam5ORdZhNFQ1twCGj4ptLlWTduYWLxiW3WocFC7YSgq15cejjU7Z
 id9ecbwux4yT6YbDnZEofZDRjmtqFRVo5P6qghCKb4etkQSIuvZTKfzRrmS+UEXcJcYR
 /gVw==
X-Gm-Message-State: AOJu0Yyd4BAEUYmM3BIzYp0O4bBRZZyuDrCavYkt+yoZCI35NDH1CFij
 jwCZcZrZGA4qInFWm8jfmgn+32udS/L39EgxDXydQYo9MYp5VTgJqTLJjeZDCAeTXtgz02+qljg
 oZp058XdFBrsctfDrud6TUPB5e5gKt/Mt4dDYksCJIVGHjZ+32NwzE9Iikt6Si6riurdZCmz0Pg
 ==
X-Received: by 2002:a0c:e241:0:b0:679:2f94:865c with SMTP id
 x1-20020a0ce241000000b006792f94865cmr10212335qvl.2.1701033058743; 
 Sun, 26 Nov 2023 13:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYWNxo8Vh6oRaTbtMwPUh8NeMnB/m/b1dccmMlQVlfIUn9lkEBCVo+foSjrK/Vattp6N8+q2aLZGzM4wRhZ9g=
X-Received: by 2002:a0c:e241:0:b0:679:2f94:865c with SMTP id
 x1-20020a0ce241000000b006792f94865cmr10212317qvl.2.1701033058505; Sun, 26 Nov
 2023 13:10:58 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 26 Nov 2023 22:10:57 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Sun, 26 Nov 2023 22:10:57 +0100
Message-ID: <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
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

Cristian Ciocaltea wrote:
> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> RGMII-ID.
>
> TODO: Verify if manual adjustment of the RX internal delay is needed. If
> yes, add the mdio & phy sub-nodes.

Sorry for being late here. I've tested that removing the mdio and phy nodes on
the the Starlight board works fine, but the rx-internal-delay-ps = <900>
property not needed on any of my VisionFive V1 boards either. So I wonder why
you need that on your board

Also in the driver patch you add support for phy-mode = "rgmii-txid", but here
you still set it to "rgmii-id", so which is it?

You've alse removed the phy reset gpio on the Starlight board:

  snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>

Why?

>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> index 7cda3a89020a..d3f4c99d98da 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> @@ -11,3 +11,8 @@ / {
>  	model = "BeagleV Starlight Beta";
>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
>  };
> +
> +&gmac {
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};

Lastly the phy-mode and status are the same for the VF1 and Starlight boards,
so why can't these be set in the jh7100-common.dtsi?

/Emil

> --
> 2.42.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
