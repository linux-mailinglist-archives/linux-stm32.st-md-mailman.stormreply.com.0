Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183638760F
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 12:07:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7AE1C59788;
	Tue, 18 May 2021 10:06:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C344C57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XcUE59BbQI5VCk62NQ98jAv25zo//emUHUedcxxcgyA=; b=B+1u6ZG4uJf1OSsB0tVOyeq0N
 H+f35qC+o3JQhJf0dqEAUIURiaEown3+hepXFL/kFsdRe5AnAXhCIr6odFUcrSryaajMcfXd7lHSV
 oERv2lMclyCkH88TtgEHbvmIjNuiaaskphGn/68qNsJVObsFzkALdGKWJnX2FP1mqe6ytC45X9SUH
 JOZlL7c8SLi92/bJOPHxXqYy/CdA1jei51V5eRNuZvzT7bn/n+6/NXPoPu+KSzaxpEWV+9shIdC8z
 pzsC2s8JthkHOanWWYH+W3ao8o0rzYPudZqRQqUkWQJea5CTgYcaXde0QKP4Qyg7/QjPw/chMtbu+
 FgWLQSc9Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44126)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1liwcR-00042a-B7; Tue, 18 May 2021 11:06:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1liwcN-0007nP-Tc; Tue, 18 May 2021 11:06:27 +0100
Date: Tue, 18 May 2021 11:06:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Message-ID: <20210518100627.GT12395@shell.armlinux.org.uk>
References: <20210517094332.24976-1-michael.wei.hong.sit@intel.com>
 <20210517094332.24976-3-michael.wei.hong.sit@intel.com>
 <20210517105424.GP12395@shell.armlinux.org.uk>
 <CO1PR11MB50447EDBEB4835C3EB5B3C7A9D2D9@CO1PR11MB5044.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CO1PR11MB50447EDBEB4835C3EB5B3C7A9D2D9@CO1PR11MB5044.namprd11.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "vee.khee.wong@linux.intel.com" <vee.khee.wong@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Voon,
 Weifeng" <weifeng.voon@intel.com>, "Wong, Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: Add callbacks
 for DWC xpcs Energy Efficient Ethernet
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

On Mon, May 17, 2021 at 11:37:12AM +0000, Sit, Michael Wei Hong wrote:
> > From: Russell King <linux@armlinux.org.uk>
> > 
> > On Mon, May 17, 2021 at 05:43:32PM +0800, Michael Sit Wei Hong
> > wrote:
> > > Link xpcs callback functions for MAC to configure the xpcs EEE
> > feature.
> > >
> > > The clk_eee frequency is used to calculate the
> > MULT_FACT_100NS. This
> > > is to adjust the clock tic closer to 100ns.
> > >
> > > Signed-off-by: Michael Sit Wei Hong
> > <michael.wei.hong.sit@intel.com>
> > 
> > What is the initial state of the EEE configuration before the first
> > call to stmmac_ethtool_op_set_eee()? Does it reflect the default
> > EEE settings?
> 
> The register values before the first call are the default reset values in
> the registers. The reset values assumes the clk_eee_i time period is 10ns,
> Hence, the reset value is set to 9.
> According to the register description,
> This value should be programmed such that the
> clk_eee_i_time_period * (MULT_FACT_100NS + 1) should be
> within 80 ns to 120 ns.
> 
> Since we are using a fixed 19.2MHz clk_eee, which is 52ns,
> we are setting the value to 1.

Does that hardware default configuration match what is returned by
ethtool --show-eee ?
 
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
