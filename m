Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B9383E057
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 18:36:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCE04C6DD6F;
	Fri, 26 Jan 2024 17:36:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 161F4C6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 17:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706290605; x=1737826605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ieTfurtfat+pVfBbfHgnr7Gb/OnUunNsdTZt3fG9fSs=;
 b=I2dbSX4MEIMI/4rQghJI0smwT1qejtLyE1atY8JD/c6Ti83As6/gviE5
 JMInPPpB1a0/Pxp5WCwdbYVkwMpG+AIqakxQzuK19u12JK2Qwy1CifTU6
 oiNn2r9Xgem6R14Vls2/3w7DqIgLBoRhqTGM2WV+33THnsIPFtQomfJDa
 Uru+9qNrAQrhr6tIPgW5EcCtN5aD/GqoCap260dTKgVAKbXPPywtowIBc
 IGkuGsTtyph28hEb6U51R3KvPUWxuNrT0EOvYPU+DijbEefJgBw7/LT0m
 M0Wlh466PwO28rbCnZtVcsjFup8pKJ9huhrUo4IjPtMKiggnjUn1MubbM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15886421"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15886421"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:36:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="930424527"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="930424527"
Received: from ppglcf2090.png.intel.com ([10.126.160.96])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2024 09:36:37 -0800
From: rohan.g.thomas@intel.com
To: esben@geanix.com
Date: Sat, 27 Jan 2024 01:36:34 +0800
Message-Id: <20240126173634.13162-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <87msss4gtj.fsf@geanix.com>
References: <87msss4gtj.fsf@geanix.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 robh@kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: snps,
	dwmac: Time Based Scheduling
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

From: Rohan G Thomas <rohan.g.thomas@intel.com>

On Fri, 26 Jan 2024 09:52:40 +0100, Esben Haabendal wrote:
Hi Esben,

Thanks for your comments. Like to get some clarification on a few
things.

> >>
> >>Seems like OS configuration and policy.
> >
> > Tx queues need to be configured for TBS during hw setup itself as
> > special enhanced descriptors are used by the hw for TBS support
> > enabled queues. Switching between enhanced and normal descriptors on
> > run is not feasible. So this flag is for enabling "Enhanced
> > Descriptors for Time Based Scheduling". This I think is a hw specific
> > requirement.
> 
> Support for enhanced descriptors is definitely hardware specific.
> Enabling the use of enhanced descriptors is a configuration choice.
> 
> The tricky part here is that the whole devicetree bindings story for the
> stmmac driver is filled with such configuration choices. As such, it is
> only natural to add the property you are suggesting here. I completely
> agree. But you can also argue that it is "wrong", because it does not
> just describe the hardware, but also a configuration choice.

Isn't this requirement of using enhanced tx desc instead of normal tx
desc to support TBS is specific to Synopsys IP? Switching from
normal desc to enhanced desc at the time of tc-etf qdisc offload
cannot be done without traffic disruption, which I don't think is
acceptable. Since this behavior is IP specific, can we consider
this as an OS configuration choice?

Agreed that this feature(use of enhanced desc) can be enabled from
glue drivers. But I added this dt property, thinking this feature is
specific and common to DWMAC core and we can enable this feature for
stmmac platform driver without a glue driver. If this is not
acceptable, I can think of doing this from the glue driver.

> >>Doesn't eh DWMAC have capability registers for supported features? Or
> >>did they forget per queue capabilities?
> >
> > Yes, capability registers are available. For DWMAC5 IP, if TBSSEL bit
> > is set, then TBS is supported by all Tx queues.
> 
> Not true. Some NXP imx8 and imx9 chips support Synopsys MAC 5.10a IP,
> and does not support TBS for queue 0. And they have TBSSEL bit set, but
> no TBS_CH support.

AFAIU from Synopsys DWMAC5 Databook, all queues support TBS. But TBS
cannot coexist with TSO. So all glue drivers enabling TBS feature
avoid queue 0 to support TSO. Please correct me if I'm wrong.

> 
> > For DWXGMAC IP, if TBSSEL bit is set, then TBS is supported by TBS_CH
> > number of Tx queues starting from the highest Tx queue. But because of
> > the hw limitations mentioned above, TBS cannot be enabled for all
> > capable queues.
> >

BR,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
