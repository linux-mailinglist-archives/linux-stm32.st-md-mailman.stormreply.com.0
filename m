Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C402B845099
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Feb 2024 06:10:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 768C1C6DD93;
	Thu,  1 Feb 2024 05:10:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA38CC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Feb 2024 05:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706764228; x=1738300228;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TZ4WdxaS6sBzLI6TTeW0UbEUGPpFWeuJx+KfLwa7rnQ=;
 b=PIdY2OcSZg6thMhSpNW3LshpWJNKn1uZbk6kmLE0SJM9WlCMrkkMBYrq
 qnSMEF7AtAzfrG+fLOXDdxLNUyMkZmDbwriVm2+Ln1HRFf1ApkZp5oDEG
 gYgMV2dia/8T/SJuXemnJBCSVtLqmC/INvZdzp7SbXZWce9gYfb1kgmTT
 LtolwGGddMnDAwm6YlR7zDDsXevias3nHt89bSd2UgqOl/0Yl64S9xWkD
 oc+3SReO9Z4TkgoFybd0t0SDTeJtsBKLKt+ZbsXQRdnkfcv2rL4Zr1W/g
 xpwK7rD1QARyVxxMiQBt1fzJrizUFY1hmagtpD0uBz/X5ZnHYgEUgT6D+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17196083"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="17196083"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 21:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="908132348"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="908132348"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.5.230])
 ([10.247.5.230])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 21:10:17 -0800
Message-ID: <9e23671e-788c-4191-bdb4-94915ff7da5a@linux.intel.com>
Date: Thu, 1 Feb 2024 13:10:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-7-yong.liang.choong@linux.intel.com>
 <ZbjNn+C/VHegH2t7@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZbjNn+C/VHegH2t7@shell.armlinux.org.uk>
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



On 30/1/2024 6:21 pm, Russell King (Oracle) wrote:
> NAK. Absolutely not. You haven't read the phylink documentation, nor
> understood how phylink works.
> 
> Since you haven't read the phylink documentation, I'm not going to
> waste any more time reviewing this series since you haven't done your
> side of the bargin here.
> 
Hi Russell,

Sorry that previously I only studied the phylink based on the `phylink.h` 
itself. I think it might not be sufficient. I did search through the 
internet and found the phylink document from kernel.org 
(https://docs.kernel.org/networking/sfp-phylink.html). Kindly let me know 
if there are any other phylink documents I might have overlooked.

According to the phylink document from kernel.org, it does mention that 
"phylink is a mechanism to support hot-pluggable networking modules 
directly connected to a MAC without needing to re-initialise the adapter on 
hot-plug events." I realize I should not destroy and reinitialize the PCS.
Instead, I plan to follow the implementation in "net: macb: use 
.mac_select_pcs() interface" 
(https://lore.kernel.org/netdev/E1n568J-002SZX-Gr@rmk-PC.armlinux.org.uk/T/). 
This involves initializing the required PCS during the MAC probe and 
querying the PCS based on the interface.

Kindly let me know if I've overlooked anything in this proposed solution.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
