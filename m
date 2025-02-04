Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A86C8A269DE
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2025 02:34:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5735CC78F7C;
	Tue,  4 Feb 2025 01:34:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 946BDC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2025 01:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738632882; x=1770168882;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cTqZc7KMQfir834dyF7dto20NWb+pLw52qL9bC6G4tA=;
 b=a2d1LR3EfIjk0NHlQp96CaYXIiemcFr7jJbLUlIqwLN4F29xDIdypcZc
 72NZsdl2VV2oopEwbZEUF6ZkkhtMWI8DawMv5It6Y1Q3P/QC8Z2aiUxmE
 SBALtzqMRBXTrvnaAaFXNR1tYvs+bIjvCnz2TeBA+jr/D1E24HPUSvJHG
 PJahQcKQ7fjTUWF1o394M1eyEb48FvglF/u4bVyjfB3IjFU/ZbhSfqBca
 D/28KadJ6txylzHmcv3T0Eg15b2dq7kgEAbxWZepkVKvZz5tkje6FyDdf
 8VDufSkgTDW4YDFb4L8KxK3m4uu4eJcuGP8O6/MRi35UKRmrJfgoUvqDV g==;
X-CSE-ConnectionGUID: fouCHehEQk6KvSQyKePclw==
X-CSE-MsgGUID: lke3Pzu/SyONYGE1G8KtNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49795745"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="49795745"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 17:34:18 -0800
X-CSE-ConnectionGUID: 4tSta66CTFq8So3/FmHf2g==
X-CSE-MsgGUID: 907kdKGuTAyI/dVJbUURBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115441422"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.124.71])
 ([10.247.124.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 17:34:06 -0800
Message-ID: <e0d34c88-dd8d-402d-bc67-6b9c4f8effaf@linux.intel.com>
Date: Tue, 4 Feb 2025 09:34:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Song Yoong Siang <yoong.siang.song@intel.com>,
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
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Bouska Zdenek <zdenek.bouska@siemens.com>
References: <20250204004907.789330-1-yoong.siang.song@intel.com>
 <20250204004907.789330-4-yoong.siang.song@intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <20250204004907.789330-4-yoong.siang.song@intel.com>
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v7 3/5] net: stmmac: Add launch
 time support to XDP ZC
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



On 4/2/2025 8:49 am, Song Yoong Siang wrote:
> Enable launch time (Time-Based Scheduling) support for XDP zero copy via
> the XDP Tx metadata framework.
> 
> This patch has been tested with tools/testing/selftests/bpf/xdp_hw_metadata
> on Intel Tiger Lake platform. Below are the test steps and result.
> 
> Test 1: Send a single packet with the launch time set to 1 s in the future.
> 
> Test steps:
> 1. On the DUT, start the xdp_hw_metadata selftest application:
>     $ sudo ./xdp_hw_metadata enp0s30f4 -l 1000000000 -L 1
> 
> 2. On the Link Partner, send a UDP packet with VLAN priority 1 to port 9091
>     of the DUT.
> 
> Result:
> When the launch time is set to 1 s in the future, the delta between the
> launch time and the transmit hardware timestamp is 16.963 us, as shown in
> printout of the xdp_hw_metadata application below.
>    0x55b5864717a8: rx_desc[4]->addr=88100 addr=88100 comp_addr=88100 EoP
>    No rx_hash, err=-95
>    HW RX-time:   1734579065767717328 (sec:1734579065.7677)
>                  delta to User RX-time sec:0.0004 (375.624 usec)
>    XDP RX-time:   1734579065768004454 (sec:1734579065.7680)
>                   delta to User RX-time sec:0.0001 (88.498 usec)
>    No rx_vlan_tci or rx_vlan_proto, err=-95
>    0x55b5864717a8: ping-pong with csum=5619 (want 0000)
>                    csum_start=34 csum_offset=6
>    HW RX-time:   1734579065767717328 (sec:1734579065.7677)
>                  delta to HW Launch-time sec:1.0000 (1000000.000 usec)
>    0x55b5864717a8: complete tx idx=4 addr=4018
>    HW Launch-time:   1734579066767717328 (sec:1734579066.7677)
>                      delta to HW TX-complete-time sec:0.0000 (16.963 usec)
>    HW TX-complete-time:   1734579066767734291 (sec:1734579066.7677)
>                           delta to User TX-complete-time sec:0.0001
>                           (130.408 usec)
>    XDP RX-time:   1734579065768004454 (sec:1734579065.7680)
>                   delta to User TX-complete-time sec:0.9999
>                  (999860.245 usec)
>    HW RX-time:   1734579065767717328 (sec:1734579065.7677)
>                  delta to HW TX-complete-time sec:1.0000 (1000016.963 usec)
>    0x55b5864717a8: complete rx idx=132 addr=88100
> 
> Test 2: Send 1000 packets with a 10 ms interval and the launch time set to
>          500 us in the future.
> 
> Test steps:
> 1. On the DUT, start the xdp_hw_metadata selftest application:
>     $ sudo chrt -f 99 ./xdp_hw_metadata enp0s30f4 -l 500000 -L 1 > \
>       /dev/shm/result.log
> 
> 2. On the Link Partner, send 1000 UDP packets with a 10 ms interval and
>     VLAN priority 1 to port 9091 of the DUT.
> 
> Result:
> When the launch time is set to 500 us in the future, the average delta
> between the launch time and the transmit hardware timestamp is 13.854 us,
> as shown in the analysis of /dev/shm/result.log below. The XDP launch time
> works correctly in sending 1000 packets continuously.
>    Min delta: 08.410 us
>    Avr delta: 13.854 us
>    Max delta: 17.076 us
>    Total packets forwarded: 1000
> 
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>

Reviewed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
