Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB587840670
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:13:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70437C6C841;
	Mon, 29 Jan 2024 13:13:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C65F6C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706534024; x=1738070024;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1A2kwv15wQygVVOoqucjQOG6yZvrsKLSOxdqdrtflpo=;
 b=Lks3LUW5kikOTYIsZHogC66eDYYP+quAz/YTIE6ggUGSheUDKfFESczK
 f6+EcvBj0ftXVaKDQ0g5hiJ3hb5PKgvBN44CNL2NsCnwTOJDIfp4S+lJh
 ndtOJZaWVy1rLqk7m/aFTxFuzyqIniFU3SbUp8dZ5fqXZ7ufavUWpgQzg
 VsDHsWLeAMJrt59bBKBu0k+w9ufC+Qmufs2DPeHMCEHX9iH6gQxvjco7q
 6hAkVODIP2F2HxeBY8jksoHNbs3c/SBZ/e1F5YMy0IgBp9aDZRSRdqveT
 bX+oTJZI4iFWED+vOZdansj5dSjzxvRUOaPyQqrMaaBIbbkH3ZQf/tC5Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10328501"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10328501"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="878068306"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="878068306"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.122.111])
 ([10.247.122.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:13:28 -0800
Message-ID: <41f08e94-3a0b-442b-be79-d30579f3e12d@linux.intel.com>
Date: Mon, 29 Jan 2024 21:13:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <4caade36-d4be-4670-ac79-d9d00488293d@lunn.ch>
 <ZQxOgfw3LD5Bu2iD@shell.armlinux.org.uk>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZQxOgfw3LD5Bu2iD@shell.armlinux.org.uk>
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, platform-driver-x86@vger.kernel.org,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Jean Delvare <jdelvare@suse.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/5] TSN auto negotiation
	between 1G and 2.5G
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



On 21/9/2023 10:09 pm, Russell King (Oracle) wrote:
> On Thu, Sep 21, 2023 at 03:14:59PM +0200, Andrew Lunn wrote:
>>> Auto-negotiation between 10, 100, 1000Mbps will use
>>> in-band auto negotiation. Auto-negotiation between 10/100/1000Mbps and
>>> 2.5Gbps will work as the following proposed flow, the stmmac driver reads
>>> the PHY link status registers then identifies the negotiated speed.
>>
>> I don't think you replied to my comment.
>>
>> in-band is just an optimisation. It in theory allows you to avoid a
>> software path, the PHY driver talking to the MAC driver about the PHY
>> status. As an optimisation, it is optional. Linux has the software
>> path and the MAC driver you are using basically has it implemented.
> 
> Sorry Andrew, I have to disagree. It isn't always optional - there are
> PHYs out there where they won't pass data until the in-band exchange
> has completed. If you try to operate out-of-band without the PHY being
> told that is the case, and program the MAC/PCS end not to respond to
> the in-band frames from the PHY, the PHY will report link up as normal
> (since it reports the media side), but no data will flow because the
> MAC facing side of the PHY hasn't completed.
> 
> The only exception are PHYs that default to in-band but have an inband
> bypass mode also enabled to cover the case where the MAC/PCS doesn't
> respond to the inband messages.
> 
Russell is correct, we did set out-of-band for PCS and configured MAC.
Due to the PHY not being completed, there will be no data flow through.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
