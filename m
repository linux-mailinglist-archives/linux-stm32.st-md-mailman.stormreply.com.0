Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6905A3CFD4
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 04:09:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76F71C78F9C;
	Thu, 20 Feb 2025 03:09:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1983FC78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 03:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740020945; x=1771556945;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6Om/YQ9BDTJoSdcjeVlNE5mx2TxHgQH+HygQWJDZxTI=;
 b=dSH0fArpdSQjxlPE19DEJPq9UIU2W12dl8Xt39ZBrRY2lI8+OWPWwhpz
 n4sw0ThFO6Fk9vpf56TeVfoje3oW79K5vv9yLOfYtv1PKPlfePVfxxHRn
 N6tI40RWJXTyMBZFXM4glbAKZTcqpT+yKKqP3LwfQG+C6oYnYcOnVxZCn
 WE8kvje45Vi5hv0u8R9NaFX5ZbHCohpxqFfWja/khkCAtsjOMIXSbQN6k
 1VRH7ASA09tgIA/ChnMQWTR1ZcBCCSH0H7F+UL5PFk+WmLwypLNOOd2hl
 HuDU6Z06NJKWuEHTXYCxVYYMY9c7ktt3jKS72TF0Tzo11yp8s/FGrDt0w g==;
X-CSE-ConnectionGUID: zH9JBpgeQk+Qr0w8vROZ6A==
X-CSE-MsgGUID: act+BDEpQ9G5Vzopj1/9HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44433460"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="44433460"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 19:09:03 -0800
X-CSE-ConnectionGUID: NtSLS7/pTki0JlkmiayN3A==
X-CSE-MsgGUID: phFnrHBBQ4u+5LiD6T/d6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="114892383"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.77.104])
 ([10.247.77.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 19:08:56 -0800
Message-ID: <72c1a698-ba1e-44f6-a52f-ef03c7acba06@linux.intel.com>
Date: Thu, 20 Feb 2025 11:08:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <SJ0PR11MB586651473E7F571ECD54B13BE5FF2@SJ0PR11MB5866.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <SJ0PR11MB586651473E7F571ECD54B13BE5FF2@SJ0PR11MB5866.namprd11.prod.outlook.com>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, "Nguyen,
 Anthony L" <anthony.l.nguyen@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>, "Gomes,
 Vinicius" <vinicius.gomes@intel.com>, "Kitszel,
 Przemyslaw" <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH iwl-next v4 0/9] igc:
 Add support for Frame Preemption feature in IGC
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



On 13/2/2025 4:59 pm, Loktionov, Aleksandr wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf Of
>> Vladimir Oltean
>> Sent: Wednesday, February 12, 2025 11:01 PM
>> To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
>> Cc: Nguyen, Anthony L <anthony.l.nguyen@intel.com>; Kitszel, Przemyslaw
>> <przemyslaw.kitszel@intel.com>; Andrew Lunn <andrew+netdev@lunn.ch>;
>> David S . Miller <davem@davemloft.net>; Eric Dumazet
>> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
>> <pabeni@redhat.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>;
>> Alexandre Torgue <alexandre.torgue@foss.st.com>; Simon Horman
>> <horms@kernel.org>; Russell King <linux@armlinux.org.uk>; Alexei
>> Starovoitov <ast@kernel.org>; Daniel Borkmann <daniel@iogearbox.net>;
>> Jesper Dangaard Brouer <hawk@kernel.org>; John Fastabend
>> <john.fastabend@gmail.com>; Furong Xu <0x1207@gmail.com>; Russell King
>> <rmk+kernel@armlinux.org.uk>; Serge Semin <fancer.lancer@gmail.com>;
>> Xiaolei Wang <xiaolei.wang@windriver.com>; Suraj Jaiswal
>> <quic_jsuraj@quicinc.com>; Kory Maincent <kory.maincent@bootlin.com>;
>> Gal Pressman <gal@nvidia.com>; Jesper Nilsson <jesper.nilsson@axis.com>;
>> Andrew Halaney <ahalaney@redhat.com>; Choong Yong Liang
>> <yong.liang.choong@linux.intel.com>; Kunihiko Hayashi
>> <hayashi.kunihiko@socionext.com>; Gomes, Vinicius
>> <vinicius.gomes@intel.com>; intel-wired-lan@lists.osuosl.org;
>> netdev@vger.kernel.org; linux-kernel@vger.kernel.org; linux-stm32@st-md-
>> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
>> bpf@vger.kernel.org
>> Subject: Re: [Intel-wired-lan] [PATCH iwl-next v4 0/9] igc: Add support for
>> Frame Preemption feature in IGC
> 
> Please start commit title from slam letters:
> Igc: add ...

Hi Aleksandr,

I haven't updated this in v5 yet. Could you share any reference or 
guideline for this?

 From what I checked, the recently accepted patches in igc seem to follow a 
similar commit title format as my patches:

$ git log --oneline | grep igc
b65969856d4f igc: Link queues to NAPI instances
1a63399c13fe igc: Link IRQs to NAPI instances
8b6237e1f4d4 igc: Fix passing 0 to ERR_PTR in igc_xdp_run_prog()
484d3675f2aa igc: Allow hot-swapping XDP program
c75889081366 igc: Remove unused igc_read/write_pcie_cap_reg
121c3c6bc661 igc: Remove unused igc_read/write_pci_cfg wrappers
b37dba891b17 igc: Remove unused igc_acquire/release_nvm


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
