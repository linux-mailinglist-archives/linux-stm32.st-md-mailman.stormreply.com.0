Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A6A17865
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2025 08:10:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13D93C78F74;
	Tue, 21 Jan 2025 07:10:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33A8BC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737354391; x=1768890391;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tnsWXzYfmvn62Lbs810i3rTWmbN0EXhNDxrDhCk8CD8=;
 b=Eknj5QGLXI5iwjL8OvqSBjikamPvldZYO/dZU0qvAlJJAxeh55TMzpGL
 0C4v5xYF5gXX0T9WA2adEuVv5f2PuCOMg3DFG8AZ5qiM7G0GcNi9SMeZP
 WbA27dn2+LdgGquDRmg3RqPoXNNoH8t3I0+vnvjdfkZzVgvdujnFT8ZEo
 9aQoJ+RR9t9fJI7XnKR7RTEF3q731qtNImPPu3p485mkBgDc9StvL/XDJ
 l4AV/ybx5KEWfYq/f2qbvsMRE4rpMN7Rf3XN8i2oE6A3DQ1OoyJ8SYx0I
 58gSAvSc6savlnq0RuzIC4kxkuNJP7Ps0IRy06IR4lFyw8CU2yEEG7xff A==;
X-CSE-ConnectionGUID: WNMFK1hhQ9WmBeE9YlL8tg==
X-CSE-MsgGUID: ojkAVE1kRhq6s5kiEUszSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37622984"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="37622984"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:26:15 -0800
X-CSE-ConnectionGUID: 2o19Sr1rR0+02sq9LFLQ2g==
X-CSE-MsgGUID: X0kZiFOHTdmNQOkx3eVPsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106227294"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.64.131])
 ([10.247.64.131])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:26:01 -0800
Message-ID: <84770113-2546-4035-8bd4-bf9cedcfb00f@linux.intel.com>
Date: Mon, 20 Jan 2025 14:25:45 +0800
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
 Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250116155350.555374-5-yoong.siang.song@intel.com>
X-Mailman-Approved-At: Tue, 21 Jan 2025 07:10:30 +0000
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


Hi Siang.

On 16/1/2025 11:53 pm, Song Yoong Siang wrote:
> Enable Launch Time Control (LTC) support to XDP zero copy via XDP Tx
> metadata framework.
> 
> This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
> Intel I225-LM Ethernet controller. Below are the test steps and result.
> 
> Test Steps:
> 1. At DUT, start xdp_hw_metadata selftest application:
>     $ sudo ./xdp_hw_metadata enp2s0 -l 1000000000 -L 1
> 
> 2. At Link Partner, send an UDP packet with VLAN priority 1 to port 9091 of
>     DUT.
> 
> When launch time is set to 1s in the future, the delta between launch time
> and transmit hardware timestamp is equal to 0.016us, as shown in result
> below:
>    0x562ff5dc8880: rx_desc[4]->addr=84110 addr=84110 comp_addr=84110 EoP
>    rx_hash: 0xE343384 with RSS type:0x1
>    HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to User RX-time sec:0.0002 (183.103 usec)
>    XDP RX-time:   1734578015467651698 (sec:1734578015.4677) delta to User RX-time sec:0.0001 (80.309 usec)
>    No rx_vlan_tci or rx_vlan_proto, err=-95
>    0x562ff5dc8880: ping-pong with csum=561c (want c7dd) csum_start=34 csum_offset=6
>    HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to HW Launch-time sec:1.0000 (1000000.000 usec)
>    0x562ff5dc8880: complete tx idx=4 addr=4018
>    HW Launch-time:   1734578016467548904 (sec:1734578016.4675) delta to HW TX-complete-time sec:0.0000 (0.016 usec)
>    HW TX-complete-time:   1734578016467548920 (sec:1734578016.4675) delta to User TX-complete-time sec:0.0000 (32.546 usec)
>    XDP RX-time:   1734578015467651698 (sec:1734578015.4677) delta to User TX-complete-time sec:0.9999 (999929.768 usec)
>    HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to HW TX-complete-time sec:1.0000 (1000000.016 usec)
>    0x562ff5dc8880: complete rx idx=132 addr=84110

To be cautious, could we perform a stress test by sending a higher number 
of packets with launch time? For example, we could send 200 packets, each 
configured with a launch time, and verify that the driver continues to 
function correctly afterward.

> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>   drivers/net/ethernet/intel/igc/igc_main.c | 78 ++++++++++++++++-------
>   1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
> index 27872bdea9bd..6857f5f5b4b2 100644
> --- a/drivers/net/ethernet/intel/igc/igc_main.c
> +++ b/drivers/net/ethernet/intel/igc/igc_main.c
> @@ -1566,6 +1566,26 @@ static bool igc_request_tx_tstamp(struct igc_adapter *adapter, struct sk_buff *s
>   	return false;
>   }
>   
> +static void igc_insert_empty_packet(struct igc_ring *tx_ring)
> +{
> +	struct igc_tx_buffer *empty_info;
> +	struct sk_buff *empty;
> +	void *data;
> +
> +	empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
> +	empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
> +	if (!empty)
> +		return;
> +
> +	data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
> +	memset(data, 0, IGC_EMPTY_FRAME_SIZE);
> +
> +	igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
> +
> +	if (igc_init_tx_empty_descriptor(tx_ring, empty, empty_info) < 0)
> +		dev_kfree_skb_any(empty);
> +}
> +

The function igc_insert_empty_packet() appears to wrap existing code to 
enhance reusability, with no new changes related to enabling launch-time 
XDP ZC functionality. If so, could we split this into a separate commit? 
This would make it clearer for the reader to distinguish between the 
refactoring changes and the new changes related to enabling launch-time XDP 
ZC support.

>   static netdev_tx_t igc_xmit_frame_ring(struct sk_buff *skb,
>   				       struct igc_ring *tx_ring)
>   {
> @@ -1603,26 +1623,8 @@ static netdev_tx_t igc_xmit_frame_ring(struct sk_buff *skb,
>   	skb->tstamp = ktime_set(0, 0);
>   	launch_time = igc_tx_launchtime(tx_ring, txtime, &first_flag, &insert_empty);
>   
> -	if (insert_empty) {
> -		struct igc_tx_buffer *empty_info;
> -		struct sk_buff *empty;
> -		void *data;
> -
> -		empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
> -		empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
> -		if (!empty)
> -			goto done;
> -
> -		data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
> -		memset(data, 0, IGC_EMPTY_FRAME_SIZE);
> -
> -		igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
> -
> -		if (igc_init_tx_empty_descriptor(tx_ring,
> -						 empty,
> -						 empty_info) < 0)
> -			dev_kfree_skb_any(empty);
> -	}
> +	if (insert_empty)
> +		igc_insert_empty_packet(tx_ring);
>   
>   done:
>   	/* record the location of the first descriptor for this packet */
> @@ -2955,9 +2957,33 @@ static u64 igc_xsk_fill_timestamp(void *_priv)
>   	return *(u64 *)_priv;
>   }
>   
> +static void igc_xsk_request_launch_time(u64 launch_time, void *_priv)
> +{
> +	struct igc_metadata_request *meta_req = _priv;
> +	struct igc_ring *tx_ring = meta_req->tx_ring;
> +	__le32 launch_time_offset;
> +	bool insert_empty = false;
> +	bool first_flag = false;
> +
> +	if (!tx_ring->launchtime_enable)
> +		return;
> +
> +	launch_time_offset = igc_tx_launchtime(tx_ring,
> +					       ns_to_ktime(launch_time),
> +					       &first_flag, &insert_empty);
> +	if (insert_empty) {
> +		igc_insert_empty_packet(tx_ring);
> +		meta_req->tx_buffer =
> +			&tx_ring->tx_buffer_info[tx_ring->next_to_use];
> +	}
> +
> +	igc_tx_ctxtdesc(tx_ring, launch_time_offset, first_flag, 0, 0, 0);
> +}
> +
>   const struct xsk_tx_metadata_ops igc_xsk_tx_metadata_ops = {
>   	.tmo_request_timestamp		= igc_xsk_request_timestamp,
>   	.tmo_fill_timestamp		= igc_xsk_fill_timestamp,
> +	.tmo_request_launch_time	= igc_xsk_request_launch_time,
>   };
>   
>   static void igc_xdp_xmit_zc(struct igc_ring *ring)
> @@ -2980,7 +3006,7 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
>   	ntu = ring->next_to_use;
>   	budget = igc_desc_unused(ring);
>   
> -	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget--) {
> +	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget >= 4) {

Could we add some explanation on what & why the value "4" is used ?

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
