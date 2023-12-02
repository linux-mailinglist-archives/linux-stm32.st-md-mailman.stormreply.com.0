Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0FF801A38
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Dec 2023 04:28:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B108C6B479;
	Sat,  2 Dec 2023 03:28:51 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36999C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Dec 2023 03:28:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 89B80B84A10;
 Sat,  2 Dec 2023 03:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30426C433C8;
 Sat,  2 Dec 2023 03:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701487728;
 bh=5Iznkl7Y/UaOI16u1p9z9TNAVqCqy4L/LgDnEnmoT0c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IyOxrWYMs6Tj+TmW+3JjcrBCpnsAtOryyhNLFggtzwjzTTFSihe51dj8JMLpA0CEs
 vNbukE02lwU+Ozm3SWICClspjaDDjvSFN/AN1z2sPL6CZ3L0UI8EBf8EbHewUl718f
 8+3F63d8ipmvFP8hnwnv+f2T3VGHF1Bk0FKzm0YWnNx0uTyJ5k4GxWtXg42a0JPoYo
 M9J1J803EXwuwH8LBrpmYO9gXvyQCA9DEl+lA+8u9dquFdXWh9c18EXDlMlgm2ynfX
 3LPjdLfYgaQqvobwJ+Qsa+q3Vl3fGmx1gNtzF8r035Wjd1vTDwfE2YMir+p8t1fFvE
 yOQpikEFSl2NA==
Date: Fri, 1 Dec 2023 19:28:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Message-ID: <20231201192846.15c9e64e@kernel.org>
In-Reply-To: <20231130162028.852006-2-yoong.siang.song@intel.com>
References: <20231130162028.852006-1-yoong.siang.song@intel.com>
 <20231130162028.852006-2-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 xdp-hints@xdp-project.net, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, KP Singh <kpsingh@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 Bjorn Topel <bjorn@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next 1/3] xsk: add launch time support
 to XDP Tx metadata
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri,  1 Dec 2023 00:20:26 +0800 Song Yoong Siang wrote:
> +        name: launch-time
> +        doc:
> +          HW Time-Based Scheduling (TBS) is supported by the driver.

Does this mean fifo "gating" or HW can do reordering?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
