Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0096C9AA
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2019 09:02:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B6C9C07D81
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2019 07:02:57 +0000 (UTC)
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D786C60B8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2019 18:59:05 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d2f6ff80000>; Wed, 17 Jul 2019 11:59:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 17 Jul 2019 11:59:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 17 Jul 2019 11:59:02 -0700
Received: from [10.26.11.185] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jul
 2019 18:58:55 +0000
To: Jose Abreu <Jose.Abreu@synopsys.com>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
Date: Wed, 17 Jul 2019 19:58:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1563389948; bh=z75CQwjX2xRi5gGhwHjg8Pb0vqIzhGv/Pngd7H+0mq4=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=kOui65LlUHDKPSoenvOQqNo6CMaBFq9txXXL4myoyRD7rw0ct2r+IZeTekYGEXl4a
 Swjz4fIrhSaKyYdejDvhZN0XvC1ZIFzxHgoigM4nZUbo6G1MBlfhSqrLI+42Yss3hP
 MdzKnB3tWewVJLVhq654EIg0FdmU6BYz1dirOoQSemuh6mI/5fSnEsTDmzTsSYf2dU
 lNIieLby+qlnTCt4wV6VVgT93iR1qszonlhNTmUEPRSgxFZW+PR01+St079CSK+U7u
 ltRfKYaBMjeF6H0+A8vk1f/D+qDsZZpMP8cW6N48RpqcI+pw+XJD/WWOK+z4EeGVEY
 KEcbpDQQj+KvA==
X-Mailman-Approved-At: Thu, 18 Jul 2019 07:02:56 +0000
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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


On 03/07/2019 11:37, Jose Abreu wrote:
> Mapping and unmapping DMA region is an high bottleneck in stmmac driver,
> specially in the RX path.
> 
> This commit introduces support for Page Pool API and uses it in all RX
> queues. With this change, we get more stable troughput and some increase
> of banwidth with iperf:
> 	- MAC1000 - 950 Mbps
> 	- XGMAC: 9.22 Gbps
I am seeing a boot regression on one of our Tegra boards with both
mainline and -next. Bisecting is pointing to this commit and reverting
this commit on top of mainline fixes the problem. Unfortunately, there
is not much of a backtrace but what I have captured is below. 

Please note that this is seen on a system that is using NFS to mount
the rootfs and the crash occurs right around the point the rootfs is
mounted.

Let me know if you have any thoughts.

Cheers
Jon 

[   12.221843] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[   12.229485] CPU: 5 PID: 1 Comm: init Tainted: G S                5.2.0-11500-g916f562fb28a #18
[   12.238076] Hardware name: NVIDIA Tegra186 P2771-0000 Development Board (DT)
[   12.245105] Call trace:
[   12.247548]  dump_backtrace+0x0/0x150
[   12.251199]  show_stack+0x14/0x20
[   12.254505]  dump_stack+0x9c/0xc4
[   12.257809]  panic+0x13c/0x32c
[   12.260853]  complete_and_exit+0x0/0x20
[   12.264676]  do_group_exit+0x34/0x98
[   12.268241]  get_signal+0x104/0x668
[   12.271718]  do_notify_resume+0x2ac/0x380
[   12.275716]  work_pending+0x8/0x10
[   12.279109] SMP: stopping secondary CPUs
[   12.283025] Kernel Offset: disabled
[   12.286502] CPU features: 0x0002,20806000
[   12.290499] Memory Limit: none
[   12.293548] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

-- 
nvpublic
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
