Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA384662F
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 04:01:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06C82C6DD9F;
	Fri,  2 Feb 2024 03:01:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECD7AC6DD68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 03:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706842874; x=1738378874;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QphI2QaFh5i8mpq3LXJuXnOJcGXvW8OtRDIwjhj/MoM=;
 b=C2AWgCfebffdjo1AAopHwATHH54N2DnOfnJFBThxjOi4esIy0NkQeAR1
 tDZ3q4IPRTtlAF6WGOUp4xniDeKBz0zlOBMm5kobmE0/FgZhj8WFpTtsk
 YqYtdDn/XWlX74cVVKw/ia1jSnUhz6CnFSMCSMmu2mpwH/r3GEwuveoT2
 6i/6ni/N9x6oHj8rDtDoILvpGNQPNnrlERNq74ZFnyUVJn+ETnCAzuoj+
 YrIY3abiX+8PiuouYu9zHWnH37IlBKvBYNl3b3AqdnDzRGiBWPHo3vEK+
 cLVxtmWam1pbkoJXOERes3VT/BNakSM8rABoiTGs6I6AN50XU8q+v9Qkn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="401187685"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="401187685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="257260"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.22.55])
 ([10.247.22.55])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:01:00 -0800
Message-ID: <2ad1f55c-f361-4439-9174-6af1bb429d55@linux.intel.com>
Date: Fri, 2 Feb 2024 11:00:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-7-yong.liang.choong@linux.intel.com>
 <ZbjNn+C/VHegH2t7@shell.armlinux.org.uk>
 <9e23671e-788c-4191-bdb4-94915ff7da5a@linux.intel.com>
 <ZbtYaXkNf2ZF1prE@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZbtYaXkNf2ZF1prE@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 06/11] net: stmmac: resetup
 XPCS according to the new interface mode
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 1/2/2024 4:38 pm, Russell King (Oracle) wrote:
> Note the "This must not modify any state." statement. By reinitialising
> the PCS in this method, you are violating that statement.
> 
> This requirement is because this method will be called by
> phylink_validate_mac_and_pcs() at various times, potentially for each
> and every interface that stmmac supports, which will lead to you
> reinitialising the PCS, killing the link, each time we ask the MAC for
> a PCS, whether we are going to make use of it in that mode or not.
> 
> You can not do this. Sorry. Hard NAK for this approach.
> 
Thank you for taking the time to review, got your concerns, and I'll 
address the following concerns before submitting a new patch series:

1. Remove allow_switch_interface and have the PHY driver fill in 
phydev->possible_interfaces.
2. Rework on the PCS to have similar implementation with the following 
patch "net: macb: use .mac_select_pcs() interface" 
(https://lore.kernel.org/netdev/E1n568J-002SZX-Gr@rmk-PC.armlinux.org.uk/T/).

Kindly let me know if there are any additional concerns or suggestions.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
