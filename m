Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B45F782A70
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Aug 2023 15:25:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1BD3C6B44B;
	Mon, 21 Aug 2023 13:25:47 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECC61C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:25:46 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4ff91f2d7e2so4547513e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692624346; x=1693229146;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YBRY+GcFPhlqGwO6CgJ2oymAOz5seMAN2xGmhl4bwNQ=;
 b=ZbHqJ9vCzUSl+PYAHM9x54MlmK1QzC5l0kUOFeI5GiYReXTQhs6DJIw/zV7G9vntu7
 H9RrQfYHXDdhFvzBpHKfIjAUBVqzxkMoCriClkEpCh6i8ixe0FoSmi84fsrhDpjvyxC+
 6pRkCl1tacxtqyWpyaZB1FnRRt+Rr0zges+YsPFRnCNt9qjanLpvx6FnpCYg5WNnNACr
 0ZYgJ15fOvzz6AJjyCLPZBZzJffcWMDGVzuihPpiUhuR+ExcKMM5E39nDEMUk2/V22vK
 1VdYa30nw6gnAAbvTmanvScEXw9LIQoKqyzyDzQjKBBmDGaz3p3COrxmYf73OZdjVzme
 whiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692624346; x=1693229146;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YBRY+GcFPhlqGwO6CgJ2oymAOz5seMAN2xGmhl4bwNQ=;
 b=X5uUJsqFnFokKaW0EDonXEEGdLXPFsiILVaMs2l7IfdlLlTM5gTB2qG+rOE/19XULT
 LSVyXzERKDWWd2G+RjlAz1rnvY8NQQ7F0x0XUHpItJNPH1iAlKditDO1sIkBvdC8wK67
 x1a5D7UGI/hYjxZ9mXY8G4ZkkZfR49I+LY3tQkcfSowb9Rzf66FGQIvxgc13yWTQuw2s
 njcAO75UDAoKK79s3pXjTX6wQzHrhK8YdGthT66ubuftIuXACFy1x/an7AYopGwsk7W1
 K8MaNADxG6K+uoU07gb0HL4QHWpbIcvlUNvL8zGDiHl32qnBr3ToqqrKWUCL+37YlQNV
 bTDg==
X-Gm-Message-State: AOJu0YykdxPiu00kIrUkEGiNsLKVgBl41uVyovZRWoJKX2p3qo0+IH8M
 VWhLGv9x/rh/kh8kjJ+xhEc=
X-Google-Smtp-Source: AGHT+IGOCvr+NEWAEaUuNqO1TOUaJ/9vWejULa88v0M7ivbYQD2P6Yltb0IrzK2DMKo8ORRHePvbLQ==
X-Received: by 2002:a05:6512:2524:b0:4f8:766f:8dc3 with SMTP id
 be36-20020a056512252400b004f8766f8dc3mr4777276lfb.32.1692624345767; 
 Mon, 21 Aug 2023 06:25:45 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 w5-20020ac254a5000000b004fe142afd1esm1775798lfk.152.2023.08.21.06.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:25:45 -0700 (PDT)
Date: Mon, 21 Aug 2023 16:25:42 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <dmfhl4ptoytmconczdkccli5qlkct33tgfqaoigygrzak52g63@qw7pwoa5m2x3>
References: <20230816152926.4093-1-jszhang@kernel.org>
 <20230816152926.4093-3-jszhang@kernel.org>
 <9e55fd03-6b05-46de-874e-01d9cdbf4524@lunn.ch>
 <ZOJuzakni1youMtX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOJuzakni1youMtX@shell.armlinux.org.uk>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/9] net: stmmac: xgmac: add
 more feature parsing from hw cap
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

Hi Russel, Andrew

On Sun, Aug 20, 2023 at 08:51:41PM +0100, Russell King (Oracle) wrote:
> On Sun, Aug 20, 2023 at 09:15:06PM +0200, Andrew Lunn wrote:
> > On Wed, Aug 16, 2023 at 11:29:19PM +0800, Jisheng Zhang wrote:

> > > The XGMAC_HWFEAT_GMIISEL bit also indicates whether support 10/100Mbps
> > > or not.

> > 
> > The commit message fails to explain the 'Why?' question. GMII does
> > normally imply 10/100/1000, so i would expect dma_cap->mbps_1000 also
> > implies 10/100/1000? So why also set dma_cap->mbps_10_100?

Regarding DW XGMAC. I can't say for sure. Based on DW XGMAC v2.10
IP-core HW manual it has MAC_HW_Feature0.GMIISEL(1) flag indicating
whether there is GMII interface besides of the XGMII interface. But in
my databook MAC_HW_Feature0.BIT(0) is marked as reserved and
MAC_Tx_Configuration.SS field doesn't have 10/100Mbps modes despite of
what is defined in dwxgmac2.h by means of the XGMAC_CONFIG_SS_10_MII
and XGMAC_CONFIG_SS_1000_GMII macros.

But DW GMAC or DW Eth QoS can be synthesized with the 1000-only
mode enabled. GMIISEL and MIISEL flags reflect the OP_MODE IP-core
synthesize parameter state. It can have three different values:

Mode of Operation	Description: Configures the MAC to work in
			10/100/1000 Mbps mode. Select 10/100/1000
			Mbps for enabling both Fast Ethernet and Gigabit
			operations, 10/100 Mbps for Fast Ethernet-only
			operations, and 1000 Mbps for Gigabit-only operations.
!!!			Value Range: 10/100/1000 Mbps, 10/100 Mbps, or 1000 Mbps
			Default Value:
				10/100/1000 Mbps with Gigabit License
				10/100 with Fast Ethernet license
HDL Parameter Name: OP_MODE

> > 
> > Maybe a better change would be to modify:
> > 
> >         seq_printf(seq, "\t1000 Mbps: %s\n",
> >                    (priv->dma_cap.mbps_1000) ? "Y" : "N");
> > 
> > to actually say 10/100/1000 Mbps? It does not appear this is used for
> > anything other than debugfs?
> 

> Indeed, it also looks to me like mbps_1000 and mbps_10_100 are only
> used to print things in the debugfs file, and do not have any effect
> on the driver.

They should have been utilized somehow in the stmmac_mac_link_up() and
in the dwmac1000_setup(), dwmac4_setup(), etc methods in order to
select the proper speed. But yeah, currently they are used to print the
DebugFS node data only.

> 
> Moreover:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac4.h:#define GMAC_HW_FEAT_GMIISEL      BIT(1)
> drivers/net/ethernet/stmicro/stmmac/common.h:#define DMA_HW_FEAT_GMIISEL       0x00000002       /* 1000 Mbps Support */
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h:#define XGMAC_HWFEAT_GMIISEL    BIT(1)
> 
> Seems to be all the same bit, and:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac4.h:#define GMAC_HW_FEAT_MIISEL       BIT(0)
> drivers/net/ethernet/stmicro/stmmac/common.h:#define DMA_HW_FEAT_MIISEL 0x00000001      /* 10/100 Mbps Support */
> 
> So, if everyone defines the first few bits of the hw_cap identically,
> is there any point to decoding this separately in each driver? Couldn't
> the debugfs "show" function just parse the hw_cap directly? 

The rest of the data in the HW-feature registers is almost completely
different. DW GMAC (common.h) has a single HW-Feature register which
has very little in common with the DW XGMAC (dwxgmac2.h) and DW Eth
QoS (dwmac4.h) MAC_HW_Feature0 register. The later two IP-cores have
the HW-feature registers looking very similar but still differing in
some flags. So in order not to have a partly measured change I would
suggest to preserve the separate HW-features macros space for each
type of the devices for now. If somebody cares to have them indicating
common and separate flags one could provide a comprehensive patch
fixing the entire HW-feature macros definitions. Although I don't see
this being that much necessary.

> Wouldn't it
> make more sense to print MII / GMII rather than 10/100 and 1000 ?
> 

Based on the GMIISEL and MIISEL flags description they are
speed-related, not the interface type:
GMIISEL		1000 Mbps Support
MIISEL		10 or 100 Mbps support

> It does bring up one last question though: if the driver makes no use
> of these hw_cap bits, then is there any point in printing them in the
> debugfs file?

This question can be applied to almost the half of the dma_feature
structure fields.) One more patch extends it with even more mainly
unused fields:
https://lore.kernel.org/netdev/20230819105440.226892-1-0x1207@gmail.com/

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
