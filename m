Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 841AA6D5374
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 23:25:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39D60C6A610;
	Mon,  3 Apr 2023 21:25:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13966C6A60B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 21:25:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id s13so17852654wmr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1680557123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIR23tVTvNCqVdOLn9EZ+Au8EAUJ7AiO6u6/9Nuexhc=;
 b=NfT05tNQvxCUfD2aerk9b1zGCfDZSUJHGA9DhvC76SDQcKo2ztcfkMJODvLFwdcGIe
 k37WdPTfn6c1QciK7LFx/Dy9hAEB1Hcu0phVqroV6ZMfpSgDwsCzG9J+vDq3azM6AuGy
 0F2QOD13dz7f4fJwZ9f7CWYiVca8IIYoxec8s2/BoeLNR2sTeI69/Cs+NHv0MGOMTDFd
 wrwEbAIi50OyV1xv1vugxyvWi/Y4RCJxf5p/sm8o5swl+7jvkE41H9i+yzXijUbBZDXF
 9y4Gq45/uIadFK2X/J4Jvjs77il7Z2jrJLkbnkM8kmcWYE1QMifxN81cK4o79m1MtVbH
 H2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680557123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VIR23tVTvNCqVdOLn9EZ+Au8EAUJ7AiO6u6/9Nuexhc=;
 b=wDxEqVzUIeEiAf308EoihCEZsJTy+odNiShSoUYrtOL8r686y4HoWzpsTLUZJHPqzu
 RuG6ix9FlUsMVBseekqsK7jvUEIqQSn3vA/LURn91XOzYUfYGZ0arNnWfRc7HLxuczcj
 G+sHijQ8xu20bAlLRqDv/WXbKvgLdabPCOpkDFi63ogsmvaWa70a+f5EIXWyTtDXW3Xv
 2vPMraQOUGhzaYmWdBRviamTc54W0Eo9eWU52XHr8McsqghSdoHiEjnwxwGj6XO57Uf7
 dYfuBAnb+D1hoxkTNPdtrg6C3tfDZjwqV+KQ+7QWbjT2X5ckGSJezvIJPmt0W8jl/hTW
 d+JA==
X-Gm-Message-State: AAQBX9cQr99iQBNFkrHcRxpAb8AL3vFVOt2WGT8EBSMdypS4OQTJMCYN
 lNthEp2ZFanGLWA3vH9vU2I=
X-Google-Smtp-Source: AKy350bZY6EtR7wvHBKIrt7OS1qjTi8Wveiqtqxq+rdf48JdfURnCCSj2CHGoO8P92DrFcHB1L9uPw==
X-Received: by 2002:a7b:c5cd:0:b0:3ea:d611:f8 with SMTP id
 n13-20020a7bc5cd000000b003ead61100f8mr531737wmk.38.1680557122734; 
 Mon, 03 Apr 2023 14:25:22 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7651-4500-0000-0000-0000-0e63.c22.pool.telefonica.de.
 [2a01:c22:7651:4500::e63]) by smtp.googlemail.com with ESMTPSA id
 g19-20020a05600c311300b003ee74c25f12sm20405564wmo.35.2023.04.03.14.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 14:25:22 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: michael.wei.hong.sit@intel.com
Date: Mon,  3 Apr 2023 23:24:34 +0200
Message-Id: <20230403212434.296975-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330091404.3293431-3-michael.wei.hong.sit@intel.com>
References: <20230330091404.3293431-3-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, weifeng.voon@intel.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, peter.jun.ann.lai@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, hong.aun.looi@intel.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, boon.leong.ong@intel.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: [Linux-stm32] RE [PATCH net v5 2/3] net: stmmac: check if MAC needs
	to attach to a PHY
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

Hello,

[...]
> @@ -1144,10 +1145,11 @@ static int stmmac_init_phy(struct net_device *dev)
>  	if (fwnode)
>  		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
>  
> +	phy_needed = phylink_expects_phy(priv->phylink);
>  	/* Some DT bindings do not set-up the PHY handle. Let's try to
>  	 * manually parse it
>  	 */
> -	if (!fwnode || ret) {
> +	if (!fwnode || phy_needed || ret) {
Unfortunately this breaks Ethernet on my X96 Air board (the .dts file
can be found upstream in:
arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts)

Working boot-log:
# dmesg | grep dwmac
[    3.699961] meson8b-dwmac ff3f0000.ethernet: IRQ eth_wake_irq not found
[    3.700944] meson8b-dwmac ff3f0000.ethernet: IRQ eth_lpi not found
[    3.707196] meson8b-dwmac ff3f0000.ethernet: PTP uses main clock
[    3.713688] meson8b-dwmac ff3f0000.ethernet: User ID: 0x11, Synopsys ID: 0x37
[    3.720201] meson8b-dwmac ff3f0000.ethernet:         DWMAC1000
[    3.725387] meson8b-dwmac ff3f0000.ethernet: DMA HW capability register supported
[    3.732832] meson8b-dwmac ff3f0000.ethernet: RX Checksum Offload Engine supported
[    3.740301] meson8b-dwmac ff3f0000.ethernet: COE Type 2
[    3.745491] meson8b-dwmac ff3f0000.ethernet: TX Checksum insertion supported
[    3.752504] meson8b-dwmac ff3f0000.ethernet: Wake-Up On Lan supported
[    3.758993] meson8b-dwmac ff3f0000.ethernet: Normal descriptors
[    3.764813] meson8b-dwmac ff3f0000.ethernet: Ring mode enabled
[    3.770629] meson8b-dwmac ff3f0000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[   13.565781] meson8b-dwmac ff3f0000.ethernet end0: renamed from eth0
[   14.036061] meson8b-dwmac ff3f0000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   14.255617] meson8b-dwmac ff3f0000.ethernet end0: PHY [mdio_mux-0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=33)
[   14.265404] meson8b-dwmac ff3f0000.ethernet end0: No Safety Features support found
[   14.267977] meson8b-dwmac ff3f0000.ethernet end0: PTP not supported by HW
[   14.275723] meson8b-dwmac ff3f0000.ethernet end0: configuring for phy/rgmii-txid link mode
[   17.394262] meson8b-dwmac ff3f0000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx

Non-working boot-log:
# dmesg | grep dwmac
[    3.730072] meson8b-dwmac ff3f0000.ethernet: IRQ eth_wake_irq not found
[    3.731053] meson8b-dwmac ff3f0000.ethernet: IRQ eth_lpi not found
[    3.737303] meson8b-dwmac ff3f0000.ethernet: PTP uses main clock
[    3.743795] meson8b-dwmac ff3f0000.ethernet: User ID: 0x11, Synopsys ID: 0x37
[    3.750311] meson8b-dwmac ff3f0000.ethernet:         DWMAC1000
[    3.755498] meson8b-dwmac ff3f0000.ethernet: DMA HW capability register supported
[    3.762944] meson8b-dwmac ff3f0000.ethernet: RX Checksum Offload Engine supported
[    3.770412] meson8b-dwmac ff3f0000.ethernet: COE Type 2
[    3.775603] meson8b-dwmac ff3f0000.ethernet: TX Checksum insertion supported
[    3.782615] meson8b-dwmac ff3f0000.ethernet: Wake-Up On Lan supported
[    3.789106] meson8b-dwmac ff3f0000.ethernet: Normal descriptors
[    3.794924] meson8b-dwmac ff3f0000.ethernet: Ring mode enabled
[    3.800738] meson8b-dwmac ff3f0000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[   13.052942] meson8b-dwmac ff3f0000.ethernet end0: renamed from eth0
[   13.594285] meson8b-dwmac ff3f0000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   13.825578] meson8b-dwmac ff3f0000.ethernet end0: PHY [mdio_mux-0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=33)
[   13.831358] meson8b-dwmac ff3f0000.ethernet end0: no phy found
[   13.836229] meson8b-dwmac ff3f0000.ethernet end0: __stmmac_open: Cannot attach to PHY (error: -19)

Reverting this patch fixes that problem.

I think the reason is a logic error in the patch:
As you can see the PHY is found and attached (my understanding is
that this happens through phylink_fwnode_phy_connect()). But we now
also go to that if block below even fwnode != NULL && ret == 0 (which
indicates that phylink_fwnode_phy_connect() was successful). Inside
that if block priv->plat->phy_addr then has the default value (-1)
that was set in stmmac_probe_config_dt().

I am running out of time for today. Could you please look into this
and follow up with a patch (on top of this one, as this one has
already been applied) that considers your original issues as well as
the case of my board (I suspect that all Amlogic boards that are
supported upstream are affected)? Please keep me Cc'ed so I can test
your additional patch and then add my Tested-by.


Thank you!
Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
