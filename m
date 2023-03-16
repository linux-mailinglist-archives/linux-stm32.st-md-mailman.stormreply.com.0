Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4B06BDC8F
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 00:02:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B988DC69067;
	Thu, 16 Mar 2023 23:02:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FEE5C6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 23:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=biRMyrU+XuL95zR8LqJLaB3BbRBCfLHWBcOSEHaHpBw=; b=pIgAMqYbbabotPI+N4zy8hC0i1
 3oVn0WhjzKXndze3t8usxuVfsyHha5Xt53ZFvYyY1K67zU/D4T849rurl3vJ0gi2NDr5tZNPkzZ8a
 QYPNEBvRE8WHjciK9NmtyeRABG0o5tlvdUDnrcItxBuFVtTiCYz+xyp+LI5Ndfv+acE30cpOuGWwD
 caHfTPq0Fdv+Yojsf+5o3ZzTLzAITOAs/J4wUjiPdqPijRGpFrlRsskRkxT6fxfkvM7nhBdL3F1cw
 91GKiv2REcLX6YkKjOjyDZ5yPKAXsKMIxLdgeNw0vF/ry8R++1k7uTWmwAdp3FPUIIN61W4AjpYYx
 J7tapbJw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58674)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pcwb4-0001Qe-65; Thu, 16 Mar 2023 23:01:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pcwav-0002pC-9n; Thu, 16 Mar 2023 23:01:13 +0000
Date: Thu, 16 Mar 2023 23:01:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <ZBOfuSBifFO7O/xQ@shell.armlinux.org.uk>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-9-ahalaney@redhat.com>
 <20230313173904.3d611e83@kernel.org>
 <20230316183609.a3ymuku2cmhpyrpc@halaney-x13s>
 <20230316115234.393bca5d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230316115234.393bca5d@kernel.org>
X-Topics: 
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, veekhee@apple.com,
 hisunil@quicinc.com, joabreu@synopsys.com, agross@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: Add EMAC3
	variant of dwmac4
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

On Thu, Mar 16, 2023 at 11:52:34AM -0700, Jakub Kicinski wrote:
> On Thu, 16 Mar 2023 13:36:09 -0500 Andrew Halaney wrote:
> > static void emac3_config_cbs(struct mac_device_info *hw, u32 send_slope,
> > 				    u32 idle_slope, u32 high_credit,
> > 				    u32 low_credit, u32 queue)
> > 
> > I agree, that's quite gnarly to read. the emac3_config_cbs is the
> > callback, so it's already at 6 arguments, so there's nothing I can
> > trim there. I could create some struct for readability, populate that,
> > then call the do_config_cbs() func with it from emac3_config_cbs.
> > Is that the sort of thing you want to see?
> 
> Yes, a structure is much better, because it can be initialized member
> by member,
> 
> struct bla my_bla = { .this = 1, .that = 2, .and = 3, another = 4, };
> 
> That's much easier to read. A poor man's version of Python's keyword
> arguments, if you will.

What I would say is be careful with that - make sure "struct bla" is
specific to the interface being called and not generic.

I had that mistake with struct phylink_state... and there is an
endless stream of people who don't seem to bother reading the
documentation, who blindly access whatever members of that they
damn well please because it suits them, even when either they
shouldn't be writing to them, or when phylink doesn't guarantee
their contents, they read them.

As a result, I'm now of the opinion that using a struct to pass
arguments is in principle a bad idea.

There's other reasons why it's a bad idea. Many ABIs are capable of
passing arguments to functions via processor registers. As soon as
one uses a struct, they typically end up being written to memory.
Not only does that potentially cause cache line churn, it also
means that there could be more slow memory accesses that have to be
made at some point, potentially making other accesses slow.

So, all in all, I'm really not a fan of the struct approach for
all the reasons above.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
