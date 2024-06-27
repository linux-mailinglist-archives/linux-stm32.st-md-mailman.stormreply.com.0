Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71791AD67
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 19:07:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A087C71280;
	Thu, 27 Jun 2024 17:07:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05211C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719508048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qIxdFP2i4FT3D9Pm46UxMYOadfBkfMsZfXfJZXYueno=;
 b=U84ZcfOeyyxkWr9Wv9fq6ZJpGsjEdFDZSTwA8FGhf62c1gvjD4IkMqijDm3mnT+ITnxYUQ
 ghNUrhypc1Uzg0mHz+4mgVCAjMAkAlXRasfqjQhI2H7VnKuN8Owkf/T6Cs8uxInVCg1Ch+
 ZmOxCSWT556tciLBS4lD33WD37qqbZE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-chP15rQZOFG5R0lnpUonFg-1; Thu, 27 Jun 2024 13:07:26 -0400
X-MC-Unique: chP15rQZOFG5R0lnpUonFg-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-79d58cde65eso267655885a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 10:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719508046; x=1720112846;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIxdFP2i4FT3D9Pm46UxMYOadfBkfMsZfXfJZXYueno=;
 b=jikXHPi4l2nHICpUnhZtureRtqhzMHBi8qS2n/GIfEIy/ecVS9L+TDn2tPbNtEZ1gQ
 BEIsO0dphdWU3LiiQ89lek4z0eRPVuFn3YoBXjrE2bbgUw2aUVM8wEKyQ+CEMKRYefmI
 tRnWPKj6qKw9TWrnE/DvwFj/9ZOwmoZRAkHjA3GpIlnw/KYgSVdzcyPLc4RN/Z1D+PUe
 z3aIs9zxTyv58ad+yeee6M9MXbkKKgoEMdc6eudcH0Oo1I8wDJL/xyk+ttrM8H/RJuuq
 LUiptgriJKXBHHKCoTtOlqJ+Aurt1pQ4qPR6/ckf0R/KNmBFI6Be0h+EgekrrJjK3Ign
 fycw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5G0oi16iZd9nn8FBgBkeNOuXqhaST4T29P5v7RjVD8hblSpVsVWjoKtPZsytUvWPi4/HJdYM2Py6Wp2zCrISeRurl/PGDy+ogf1mFKHlMzN29bNr95lTu
X-Gm-Message-State: AOJu0YxkZUbVZqilFxpolLaXN/JrSu2CwwukbBEGE+JWchzJsXG74gk1
 YOewNzJD9Ii19Cm068nzOyNrV+WMofY5jo0DRSc1HXdPKO7VeY31li/O8cSSP/1pvIWxD/N02FK
 OhgjTF0Rhc3nNsRDUM8PmVrRPY3g5MprhjOLTYKExiQf2haThqlUts9XX/X4ciE+eaL2KSXz6nW
 k1dg==
X-Received: by 2002:a05:620a:394c:b0:79b:eb0f:7781 with SMTP id
 af79cd13be357-79beb0f7ec3mr1437499785a.53.1719508046048; 
 Thu, 27 Jun 2024 10:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg/oiENJqDup3/M9UZYUuyNol+/22Ovf586SY/3tWxk/8vPIZ1xZuirsW0Zy9NbkOXr7WPng==
X-Received: by 2002:a05:620a:394c:b0:79b:eb0f:7781 with SMTP id
 af79cd13be357-79beb0f7ec3mr1437493585a.53.1719508045405; 
 Thu, 27 Jun 2024 10:07:25 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::f])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d5c8117e0sm72061285a.52.2024.06.27.10.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 10:07:25 -0700 (PDT)
Date: Thu, 27 Jun 2024 12:07:22 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
References: <20240627113948.25358-1-brgl@bgdev.pl>
 <20240627113948.25358-3-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20240627113948.25358-3-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos:
 add a DMA-reset quirk for sa8775p-ride
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

On Thu, Jun 27, 2024 at 01:39:47PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
> the time of the DMA reset so we need to loop TX clocks to RX and then
> disable loopback after link-up. Use the existing callbacks to do it just
> for this board.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Sorry, not being very helpful but trying to understand these changes
and the general cleanup of stmmac... so I'll point out that I'm still
confused by this based on Russell's last response:
https://lore.kernel.org/netdev/ZnQLED%2FC3Opeim5q@shell.armlinux.org.uk/

Quote:

    If you're using true Cisco SGMII, there are _no_ clocks transferred
    between the PHY and PCS/MAC. There are two balanced pairs of data
    lines and that is all - one for transmit and one for receive. So this
    explanation doesn't make sense to me.


<snip>

> +}
> +
>  static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
>  {
> +	qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  	rgmii_updatel(ethqos, RGMII_CONFIG_FUNC_CLK_EN,
>  		      RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
>  }
<snip>
> @@ -682,6 +702,7 @@ static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mo
>  {
>  	struct qcom_ethqos *ethqos = priv;
>  
> +	qcom_ethqos_set_sgmii_loopback(ethqos, false);

I'm trying to map out when the loopback is currently enabled/disabled
due to Russell's prior concerns.

Quote:

    So you enable loopback at open time, and disable it when the link comes
    up. This breaks inband signalling (should stmmac ever use that) because
    enabling loopback prevents the PHY sending the SGMII result to the PCS
    to indicate that the link has come up... thus phylink won't call
    mac_link_up().

    So no, I really hate this proposed change.

    What I think would be better is if there were hooks at the appropriate
    places to handle the lack of clock over _just_ the period that it needs
    to be handled, rather than hacking the driver as this proposal does,
    abusing platform callbacks because there's nothing better.

looks like currently you'd:
    qcom_ethqos_probe()
	ethqos_clks_config(ethqos, true)
	    ethqos_set_func_clk_en(ethqos)
		qcom_ethqos_set_sgmii_loopback(ethqos, true) // loopback enabled
	ethqos_set_func_clk_en(ethqos)
	    qcom_ethqos_set_sgmii_loopback(ethqos, true) // no change in loopback
    devm_stmmac_pltfr_probe()
	stmmac_pltfr_probe()
	    stmmac_drv_probe()
		pm_runtime_put()
    // Eventually runtime PM will then do below
    stmmac_stmmac_runtime_suspend()
	stmmac_bus_clks_config(priv, false)
	    ethqos_clks_config(ethqos, false) // pointless branch but proving to myself
	                                      // that pm_runtime isn't getting in the way here
    __stmmac_open()
	stmmac_runtime_resume()
	    ethqos_clks_config(ethqos, true)
		ethqos_set_func_clk_en(ethqos)
		    qcom_ethqos_set_sgmii_loopback(ethqos, true) // no change in loopback
    stmmac_mac_link_up()
	ethqos_fix_mac_speed()
	    qcom_ethqos_set_sgmii_loopback(ethqos, false); // loopback disabled

Good chance I foobared tracing that... but!
That seems to still go against Russell's comment, i.e. its on at probe
and remains on until a link is up. This doesn't add anymore stmmac wide
platform callbacks at least, but I'm still concerned based on his prior
comments.

Its not clear to me though if the "2500basex" mentioned here supports
any in-band signalling from a Qualcomm SoC POV (not just the Aquantia
phy its attached to, but in general). So maybe in that case its not a
concern?

Although, this isn't tied to _just_ 2500basex here. If I boot the
sa8775p-ride (r2 version, with a marvell 88ea1512 phy attached via
sgmii, not indicating 2500basex) wouldn't all this get exercised? Right
now the devicetree doesn't indicate inband signalling, but I tried that
over here with Russell's clean up a week or two ago and things at least
came up ok (which made me think all the INTEGRATED_PCS stuff wasn't needed,
and I'm not totally positive my test proved inband signalling worked,
but I thought it did...):

    https://lore.kernel.org/netdev/zzevmhmwxrhs5yfv5srvcjxrue2d7wu7vjqmmoyd5mp6kgur54@jvmuv7bxxhqt/

based on Russell's comments, I feel if I was to use his series over
there, add 'managed = "in-band-status"' to the dts, and then apply this
series, the link would not come up anymore.

Total side note, but I'm wondering if the sa8775p-ride dts should
specify 'managed = "in-band-status"'.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
