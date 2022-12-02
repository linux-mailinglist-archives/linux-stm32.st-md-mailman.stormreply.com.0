Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C68C640C18
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Dec 2022 18:24:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECCA7C65E62;
	Fri,  2 Dec 2022 17:24:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65DC0C6506E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Dec 2022 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zUXVGsGMh+J8NDrj8u+PCst2Y4XAJpMNDS89Vq82I14=; b=uT02KzrxkLym6ZdxehkGwU99ce
 FTzqPsyzeLJUnwoA9pTh0pmGXBhSgZxkMdOt9P+9QtUiHcI7qf/8GNWYBtzXvlC9C/PCTed8n7Cch
 qFVIouY6JD+QqX75RcFHcvw/1XkYYQcKL2Nclt5slBZPKBAcgMUjv8i9isSUxpFZ0REgB5SiMURvA
 9bOCE6lhuq9aAtis/mFn5ZjzGkAw0H/DBSgtbkcwlo+6lzGLp9BBswUmHUOuDQjKZg6TiI9RhpXId
 zIE6hfzdrvPWI2hb1XlfO027jq+3b8WNCNnG2MvPdtqh2qn3Anw037zMQ9goTvFuhOfd0I+2ZWGGy
 t+NKcXsw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35532)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1p19lv-0004O3-JT; Fri, 02 Dec 2022 17:24:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1p19lq-0004ZQ-L6; Fri, 02 Dec 2022 17:24:18 +0000
Date: Fri, 2 Dec 2022 17:24:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
Message-ID: <Y4o0wglBDaP5+w49@shell.armlinux.org.uk>
References: <20221123105110.23617-1-wei.sheng.goh@intel.com>
 <20221125160135.83994-1-alexandr.lobakin@intel.com>
 <DM8PR11MB55909F0270753517565B12A9A3139@DM8PR11MB5590.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB55909F0270753517565B12A9A3139@DM8PR11MB5590.namprd11.prod.outlook.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, "Lobakin,
 Alexandr" <alexandr.lobakin@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "Ong, Boon Leong" <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Looi,
 Hong Aun" <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Ahmad Tarmizi, Noor Azura" <noor.azura.ahmad.tarmizi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net v4] net: stmmac: Set MAC's flow
 control register to reflect current settings
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

On Mon, Nov 28, 2022 at 06:06:11AM +0000, Goh, Wei Sheng wrote:
> Hi,
> 
> > -----Original Message-----
> > From: Lobakin, Alexandr <alexandr.lobakin@intel.com>
> > Any particular reason why you completely ignored by review comments to the
> > v3[0]? I'd like to see them fixed or at least replied.
> > 
> > [0] https://lore.kernel.org/netdev/20221123180947.488302-1-
> > alexandr.lobakin@intel.com
> > 
> > Thanks,
> > Olek
> 
> Due to v4 is being accepted. Therefore I will submit a new patch to address your review comments.
> Thanks and appreciate your effort for reviewing my patch.

And on that very same subject, why did you ignore my review comments on
v2?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
