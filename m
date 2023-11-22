Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C2C7F4FDA
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 19:45:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CF31C6B479;
	Wed, 22 Nov 2023 18:45:24 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03B4BC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=y1fBGTaRbSsoTo5doogPTMVmvkDbZKH9bppQF/sgZqE=; b=p702r9emhkbRvBPO7sN3lEkiso
 /rQFsZ6XCANykAc95fAd27zoV5bytiHkSvzmB691lItmkNeldjgv/Ra/V+XaDFG1s0YVy8iLLUJBy
 2/8q9JbfiTYx3FuHTMgNAHpa18lX4BM8lLM6QbpZS6V7U2hFtWIq2TTc2wDZPtvkhJbU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1r5sDs-000uBk-Dl; Wed, 22 Nov 2023 19:45:16 +0100
Date: Wed, 22 Nov 2023 19:45:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Tomer Maimon <tmaimon77@gmail.com>
Message-ID: <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjaminfair@google.com, davem@davemloft.net, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 tali.perry1@gmail.com, mcoquelin.stm32@gmail.com, edumazet@google.com,
 joabreu@synopsys.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, j.neuschaefer@gmx.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: Add NPCM support
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

On Wed, Nov 22, 2023 at 07:50:57PM +0200, Tomer Maimon wrote:
> Hi Andrew,
> 
> Thanks for your comments
> 
> On Tue, 21 Nov 2023 at 18:42, Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > > +                      struct plat_stmmacenet_data *plat_dat)
> > > +{
> > > +     u16 val;
> > > +
> > > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > +     val |= PCS_RST;
> > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > +
> > > +     while (val & PCS_RST)
> > > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > +
> > > +     val &= ~(PCS_AN_ENABLE);
> > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > +}
> >
> > Is this a licensed PCS implementation? Or home grown? If its been
> > licensed from somebody, it maybe should live in driver/net/pcs, so
> > others can reuse it when they license the same core.

> we are using DWC PCS, I don't see support for DWC PCS and I am not
> sure it is supposed to be supported at /drivers/net/pcs

I've not followed the naming used by Synopsys. Is DWC PCS the same as
XPCS? Does Synopsys have multiple PCS implementations?

> I do see a patch set to support DWC PCS but I don't think it answers my needs
> https://patchwork.ozlabs.org/project/netdev/patch/1559674736-2190-3-git-send-email-weifeng.voon@intel.com/

I _think_ this patch eventually got turned into
driver/net/pcs/pcs-xpcs.c

What exactly does it not do for you?

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
