Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B15A1674A
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2025 08:25:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EA44C78018;
	Mon, 20 Jan 2025 07:25:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B099FC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 07:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737357921; x=1768893921;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k4ykqooUPTL/roXw/fFpliH2XGWlf7OfDPK35rRh9HA=;
 b=lPD11AI2e809UPZ5rEvvTxJQMXDot00SLle7PuJ5lSQIEHE/TjgsKQAO
 OANVelHyc3+SANcnJkTc8DkJ35f28V/PRm9FaQKv2zvPbBAEUwxgo2QOn
 F+p8M7p3n0i/YszbtrucQ2dlLXwYlCkD7kQQ8jEVYLH/OeY7bstWp6tqI
 Dv4TlrqubSwE4v5ss8nvKInsbA/RrlmNWnf36vaKuwY3GdtXDJkrbmsP0
 iCPxWHxe6B3VHAxHkvWgyI0DR34PA+kt9uLA6/k8bbzfuiZbvbM5us0M7
 zjYsbak5ULD9q481u/QfVyRMFIQA119tv6LOr4QDg9t3Orexd3MeB/3D+ A==;
X-CSE-ConnectionGUID: kWVYGMS2Q9S2Qc+w/MxYYA==
X-CSE-MsgGUID: ShJDFyfxRzSqrQaquz8Oeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37601871"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="37601871"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 23:25:12 -0800
X-CSE-ConnectionGUID: vyQrnkD1RKuZNocxarZucg==
X-CSE-MsgGUID: 4NfaGBcnSKmXfEo/7NNF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="106224522"
Received: from unknown (HELO [10.107.2.109]) ([10.107.2.109])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 23:25:02 -0800
Message-ID: <20fa0b55-405c-4b7c-8c10-1f8d71c956b9@linux.intel.com>
Date: Mon, 20 Jan 2025 15:24:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemb@google.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Topel <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Joe Damato <jdamato@fastly.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Mina Almasry <almasrymina@google.com>,
 Daniel Jurgens <danielj@nvidia.com>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Mykola Lysenko <mykolal@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <84770113-2546-4035-8bd4-bf9cedcfb00f@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <84770113-2546-4035-8bd4-bf9cedcfb00f@linux.intel.com>
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v6 4/4] igc: Add launch time
	support to XDP ZC
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



On 20/1/2025 2:25 pm, Abdul Rahim, Faizal wrote:
> 
> To be cautious, could we perform a stress test by sending a higher number 
> of packets with launch time? For example, we could send 200 packets, each 
> configured with a launch time, and verify that the driver continues to 
> function correctly afterward.
> 
I agree on this point. Could you perform the same stress test on the STMMAC 
driver as well?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
