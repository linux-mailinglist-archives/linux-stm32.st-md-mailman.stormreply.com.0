Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A9DA29EB9
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 03:22:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB579C7128F;
	Thu,  6 Feb 2025 02:22:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C343C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 02:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738808544; x=1770344544;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uEkC8AyPD4Fb3fQjLKAq4+ZamiFbVbnCIjXewv18gyk=;
 b=R1x7Nc+I6oFiMZmQooPOnIAcO8HlHZx4ENvEvis/NtGlZoX8IPIwWPie
 Y49+nufeen83Lbo87VoS58MdlZOL9GhyL9y1FHp8gHdURyub4mIMQoZ1P
 44uVeBwsGbDjbMd13UFxpGzaqa4Qy1r4Xjf1r4I+vg/9331WyNDGp/fKc
 h7HO9GNaGk/eHzhBJoyvtl2fs08unB0Qnho9rv/CNedMkxuyB+O3b4hh0
 qsJRkH+NvzguBtcLq+EPkJuU9pV8xrTvgN21TjN3oIoZ8hMIfd7RPCyE5
 W8lawkMOxiScdhfo3lQJAdCJx6t5076vTKQ2GF8Gh+UU+OYW1mNRBvbwX Q==;
X-CSE-ConnectionGUID: GfP47Nj1RyGytFtVoK1cyA==
X-CSE-MsgGUID: KZeJ0mp1T1iuYpnCVeL3gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39096059"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="39096059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 18:22:16 -0800
X-CSE-ConnectionGUID: W6Q6U9DXR1edt5B9hcX8PA==
X-CSE-MsgGUID: tg8iji2aSfKqHi2AdolNjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="141957433"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.114.122])
 ([10.247.114.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 18:22:07 -0800
Message-ID: <f272cb2a-1167-4e34-9209-ffdbbb107bdd@linux.intel.com>
Date: Thu, 6 Feb 2025 10:22:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
 <Z6IDWiRF73sdVWob@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z6IDWiRF73sdVWob@shell.armlinux.org.uk>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v6 4/7] stmmac: intel: configure
 SerDes according to the interface mode
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



On 4/2/2025 8:08 pm, Russell King (Oracle) wrote:
> On Tue, Feb 04, 2025 at 02:10:17PM +0800, Choong Yong Liang wrote:
>> +	int (*config_serdes)(struct net_device *ndev,
>> +			     void *priv,
>> +			     phy_interface_t interface);
> 
> Since you call this from phylink's mac_finish() method, I would much
> rather the call down into platform code was also called the same so
> we don't end up with a proliferation of methods called from that
> function. As such, please also arrange for it to pass the AN mode as
> well.
> 
> Thanks.
> 

Hi Russell,

Thank you for your feedback on the patch. Based on your suggestion, I have 
updated the code to align with the mac_finish() method and included the AN 
mode as well. The updated function signature is as follows:

int (*mac_finish)(struct net_device *ndev,
                   void *priv,
                   unsigned int mode,
                   phy_interface_t interface);

Could you please confirm if this meets your expectations, or if there are 
any further adjustments needed?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
