Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB339F65F
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 14:21:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE12BC57B79;
	Tue,  8 Jun 2021 12:21:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 728CBC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Q358deKO0MihPyIqvyu38upjUiXQjkj1FqyY/WxW6nI=; b=cMloeQTcBpRPBKzrnmZVTDQgaH
 qWorJTk3VV5bV/smsCzdneITpX/oUu3Lrmf5xWVj+UG4DrIjj/F9Iaw+shEkiSCS7pluGQTlWfjdt
 DVKK4F8l6ywjDuvgY+nThwjkf66cBITrlSi/skyy0Hhkaq/KDFIwGOBeu/f1P2pfW/tw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lqaj9-008KzF-3J; Tue, 08 Jun 2021 14:21:03 +0200
Date: Tue, 8 Jun 2021 14:21:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <YL9gr2QQ/YEXNUmP@lunn.ch>
References: <1623086867-119039-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623086867-119039-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YL6zYgGdqxqL9c0j@lunn.ch>
 <6532a195-65db-afb3-37a2-f68bfed9d908@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6532a195-65db-afb3-37a2-f68bfed9d908@wanyeetech.com>
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
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

> > > +	case PHY_INTERFACE_MODE_RGMII:
> > > +		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_DELAY) |
> > > +			  FIELD_PREP(MACPHYC_TX_DELAY_MASK, MACPHYC_TX_DELAY_63_UNIT) |
> > > +			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN) |
> > > +			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, MACPHYC_PHY_INFT_RGMII);
> > What exactly does MACPHYC_TX_DELAY_63_UNIT mean here? Ideally, the MAC
> > should not be adding any RGMII delays. It should however pass mode
> > through to the PHY, so it can add the delays, if the mode indicates it
> > should, e.g. PHY_INTERFACE_MODE_RGMII_ID. This is also why you should
> > be handling all 4 RGMII modes here, not just one.
> 
> 
> MACPHYC_TX_DELAY_63_UNIT means set MAC TX clk delay to 63 units (similar to the "tx-delay" in dwmac-rk.c). However, the manual does not clearly describe the time span of one unit, after consulting engineer of Ingenic, I learned that the value is recommended to be set to 63.
> I will change it to be similar to the way done in dwmac-rk.c.

Please wrap your text to around 75 characters per line.

I suspect you don't understand RGMII delays. As i said, normally, the
MAC does not add delays, the PHY does. Please take a closer look at
this.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
