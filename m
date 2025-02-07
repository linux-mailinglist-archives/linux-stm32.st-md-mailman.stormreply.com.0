Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D36A2C990
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 17:59:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44840C78F8B;
	Fri,  7 Feb 2025 16:59:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 567F2C78025
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 16:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738947573; x=1770483573;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h75b+TdsJ58/EyAZzGusAGULFypKzhj4oZJY0fm1wu8=;
 b=cWafJR6PTLjhK6AA5hCE0imnjjxm/Tw9Q0W0IxKewIFrzDb3ufDp8W9t
 MWvsS9P8/byP/eB2LlK+ARp68HBbs++ZeOEilQ/Z1n3mD1NaYBXlxmUhM
 CpZvDatNBCYdJdUEF3wKAoYvNChEQ38sOCUILohvdz9GVHEajhEGDPNMl
 OGpqaSq4gNhg+pgC5ES7OVaWWY3Mk095KX5+tTpJKSiA6znp1/e1CSpfd
 UarUE4B3UmkeU8BYPlTpzonxOAE/ALD3Ae7s9+YguVHrKa5wfjHI5wWsJ
 f3N4kATpvPInX5+cqw3Do5v3GZub7ve9DcSmAk+66voC7K88QOMnGX5Ue w==;
X-CSE-ConnectionGUID: Vw0uuTDiST+CRXNLkgakRw==
X-CSE-MsgGUID: yKP8uRorQUKah0SSeo0x4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42436018"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="42436018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 08:59:25 -0800
X-CSE-ConnectionGUID: xh97f0y8TjGtJI3gx/8V4A==
X-CSE-MsgGUID: uTOuguuVSR6n8OMUQ6ULHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116777275"
Received: from wkuan-mobl1.gar.corp.intel.com (HELO [10.247.64.179])
 ([10.247.64.179])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 08:59:15 -0800
Message-ID: <65c82c04-6c71-4120-aaa0-5d20e7eca0fe@linux.intel.com>
Date: Sat, 8 Feb 2025 00:59:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250205100524.1138523-1-faizal.abdul.rahim@linux.intel.com>
 <20250205100524.1138523-6-faizal.abdul.rahim@linux.intel.com>
 <20250205171234.cuscjpzdyc34ofbn@skbuf>
 <6bf3f4b2-efee-41fe-97b3-cb53eca4dfed@linux.intel.com>
 <20250206150410.u4rehwxnnuhtcfxr@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250206150410.u4rehwxnnuhtcfxr@skbuf>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Petr Tesarik <petr@tesarici.cz>, Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v2 5/9] igc: Add support for
 frame preemption verification
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



On 6/2/2025 11:04 pm, Vladimir Oltean wrote:
> On Thu, Feb 06, 2025 at 10:40:11PM +0800, Abdul Rahim, Faizal wrote:
>>
>> Hi Vladimir,
>>
>> Thanks for the quick review, appreciate your help.
>>
>> On 6/2/2025 1:12 am, Vladimir Oltean wrote:
>>> On Wed, Feb 05, 2025 at 05:05:20AM -0500, Faizal Rahim wrote:
>>>> This patch implements the "ethtool --set-mm" callback to trigger the
>>>> frame preemption verification handshake.
>>>>
>>>> Uses the MAC Merge Software Verification (mmsv) mechanism in ethtool
>>>> to perform the verification handshake for igc.
>>>> The structure fpe.mmsv is set by mmsv in ethtool and should remain
>>>> read-only for the driver.
>>>>
>>>> igc does not use two mmsv callbacks:
>>>> a) configure_tx()
>>>>      - igc lacks registers to configure FPE in the transmit direction.
>>>
>>> Yes, maybe, but it's still important to handle this. It tells you when
>>> the preemptible traffic classes should be sent as preemptible on the wire
>>> (i.e. when the verification is either disabled, or it succeeded).
>>>
>>> There is a selftest called manual_failed_verification() which supposedly
>>> tests this exact condition: if verification fails, then packets sent to
>>> TC0 are supposed to bump the eMAC's TX counters, even though TC0 is
>>> configured as preemptible. Otherwise stated: even if the tc program says
>>> that a certain traffic class is preemptible, you don't want to actually
>>> send preemptible packets if you haven't verified the link partner can
>>> handle them, since it will likely drop them on RX otherwise.
>>
>> Even though fpe in tx direction isn't set in igc, it still checks
>> ethtool_mmsv_is_tx_active() before setting a queue as preemptible.
>>
>> This is done in :
>> igc_tsn_enable_offload(struct igc_adapter *adapter) {
>> {
>> 	....
>> 	if (ethtool_mmsv_is_tx_active(&adapter->fpe.mmsv) &&
>>              ring->preemptible)
>> 	    txqctl |= IGC_TXQCTL_PREEMPTIBLE;
>>
>>
>> Wouldn't this handle the situation mentioned ?
>> Sorry if I miss something here.
> 
> And what if tx_active becomes true after you had already configured the
> queues with tc (and the above check caused IGC_TXQCTL_PREEMPTIBLE to not
> be set)? Shouldn't you set IGC_TXQCTL_PREEMPTIBLE now? Isn't
> ethtool_mmsv_configure_tx() exactly the function that notifies you of
> changes to tx_active, and hence, aren't you interested in setting up a
> callback for it?
> 

Ahh okay, got it. I sent v3 that also included this update. Thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
