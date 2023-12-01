Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F2800DDA
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 16:02:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8142C6B47D;
	Fri,  1 Dec 2023 15:02:32 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15697C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 15:02:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 85B6EB81BE7;
 Fri,  1 Dec 2023 15:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DD3C433C9;
 Fri,  1 Dec 2023 15:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701442950;
 bh=HCKgkvZM3p9a1PhMU+0ZdI63NNj7rU/pKhx/Px4fVKY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZnzIEJkgcQPJ9EhwbA+QMxmLvo7Vb5mFoKAoNXH6yHgW+nms/wyXGXewhlB2+aaMv
 ggRc0WCfAnmF4J1gGXJNsVm00we+Ush4nAHaDY6/aboqP1YpJAeXkD97yaQm8LF8DA
 kcLJiTetD9+tqyUXfvHMuhZjY2ZJFxqDcxvpvNstZflcgXy8ZgkfwU667pQAlZks+n
 JLx/dRpoe81S7cz16xFnm3ay1eGU674lCQdb1zXCGrUTHqAKRJwjbY6ZS9z8d7fK1o
 4iwBWtKKzMnCl2rC99z3RVqUB/XbA4ZBM/7CWSyEJ5gV7SbzjnjMTZ4SljJxZUkoLX
 rN/ROb0OGkmhg==
Message-ID: <5a660c0f-d3ed-47a2-b9be-098a224b8a12@kernel.org>
Date: Fri, 1 Dec 2023 16:02:22 +0100
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
 <20231201062421.1074768-3-yoong.siang.song@intel.com>
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20231201062421.1074768-3-yoong.siang.song@intel.com>
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 2/3] net: stmmac: Add txtime
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



On 12/1/23 07:24, Song Yoong Siang wrote:
> This patch enables txtime support to XDP zero copy via XDP Tx
> metadata framework.
> 
> Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
>   2 files changed, 15 insertions(+)

I think we need to see other drivers using this new feature to evaluate
if API is sane.

I suggest implementing this for igc driver (chip i225) and also for igb
(i210 chip) that both support this kind of LaunchTime feature in HW.

The API and stmmac driver takes a u64 as time.
I'm wondering how this applies to i210 that[1] have 25-bit for
LaunchTime (with 32 nanosec granularity) limiting LaunchTime max 0.5
second into the future.
And i225 that [1] have 30-bit max 1 second into the future.


[1] 
https://github.com/xdp-project/xdp-project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
