Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B18008CD
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 11:46:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9EF1C6B479;
	Fri,  1 Dec 2023 10:46:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70B65C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 10:46:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 96CBECE268A;
 Fri,  1 Dec 2023 10:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6A3C433C7;
 Fri,  1 Dec 2023 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701427589;
 bh=5zjayL88soz+UgJbryPsfFfFuCruLUpe7CIqCl/SLV8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SWPKPFHsSk8v67r+wzTQi1CO6hcbjUUpZE3vnilfgHHfZwu4IJFOQ5+rwbUdgPmLc
 yWtMqvr0cxc2sdZrbCSHK568MaEExBRSfpDet74hIw2pKTCMegAO8qkO+wBD57U//9
 730HNIMRIxuWCCJFQNjzcbx58JHzDGYi6owXtMvfOhgcSIwgOpoBgzUhFTnyt4XCDN
 e7Syzbndkz/v/VLblq4L9o8kSEXECELQ08REb4v+RuY+aRar9yp//iKZVGMv256t73
 o71Zp0tFHEerRmrytXpPlbRTZhyt+4VDNMgczQDGar2JHc9H5WbBlArbEMH4DACuda
 pFCJdIzQ48ioA==
Message-ID: <d4f99931-442c-4cd7-b3cf-80d8681a2986@kernel.org>
Date: Fri, 1 Dec 2023 11:46:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Song Yoong Siang <yoong.siang.song@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Topel <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Willem de Bruijn <willemb@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20231201062421.1074768-1-yoong.siang.song@intel.com>
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 0/3] xsk: TX metadata txtime
	support
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



On 12/1/23 07:24, Song Yoong Siang wrote:
> This series expands XDP TX metadata framework to include ETF HW offload.
> 
> Changes since v1:
> - rename Time-Based Scheduling (TBS) to Earliest TxTime First (ETF)
> - rename launch-time to txtime
> 

I strongly disagree with this renaming (sorry to disagree with Willem).

The i210 and i225 chips call this LaunchTime in their programmers 
datasheets, and even in the driver code[1].

Using this "txtime" name in the code is also confusing, because how can 
people reading the code know the difference between:
  - tmo_request_timestamp and tmo_request_txtime


[1] 
https://github.com/xdp-project/xdp-project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org

> v1: https://patchwork.kernel.org/project/netdevbpf/cover/20231130162028.852006-1-yoong.siang.song@intel.com/
> 
> Song Yoong Siang (3):
>    xsk: add ETF support to XDP Tx metadata
>    net: stmmac: Add txtime support to XDP ZC
>    selftests/bpf: Add txtime to xdp_hw_metadata
> 
>   Documentation/netlink/specs/netdev.yaml        |  4 ++++
>   Documentation/networking/xsk-tx-metadata.rst   |  5 +++++
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 13 +++++++++++++
>   include/net/xdp_sock.h                         |  9 +++++++++
>   include/net/xdp_sock_drv.h                     |  1 +
>   include/uapi/linux/if_xdp.h                    |  9 +++++++++
>   include/uapi/linux/netdev.h                    |  3 +++
>   net/core/netdev-genl.c                         |  2 ++
>   net/xdp/xsk.c                                  |  3 +++
>   tools/include/uapi/linux/if_xdp.h              |  9 +++++++++
>   tools/include/uapi/linux/netdev.h              |  3 +++
>   tools/net/ynl/generated/netdev-user.c          |  1 +
>   tools/testing/selftests/bpf/xdp_hw_metadata.c  | 18 +++++++++++++++++-
>   14 files changed, 81 insertions(+), 1 deletion(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
