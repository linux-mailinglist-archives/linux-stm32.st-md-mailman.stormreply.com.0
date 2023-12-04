Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2145803518
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 14:38:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A27CFC6B46B;
	Mon,  4 Dec 2023 13:38:32 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net
 (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC315C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 11:55:00 +0000 (UTC)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id
 202312041154598fee6661d2123aaf81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 12:55:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=DeAVJVh1/dmfA7n8KCr9e65gohS5SL4YYZz1yRamMmo=;
 b=ph2h0h5jvGxuWKVsNS0TMd+fNjmiTxwfMkny+Ro6YD2+HKnOLi/CClvCRs5tLNpmSk0jh2
 b2Xas1pUz9iB6dBJVNhJnkJ3JLnWbdX0OqFTVBA38AMksw93F1/n2DVd92g1cldYwMwE1iYt
 KYrV+sFm2RBFyevOjoDdSCwH2EABY=;
Message-ID: <8602c88c98fd722db8e164a1520c56aebfa64db7.camel@siemens.com>
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, Song Yoong Siang
 <yoong.siang.song@intel.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Bjorn Topel
 <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej
 Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon
 <jonathan.lemon@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Willem de Bruijn <willemb@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose
 Abreu <joabreu@synopsys.com>
Date: Mon, 04 Dec 2023 12:54:56 +0100
In-Reply-To: <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-3-yoong.siang.song@intel.com>
 <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-Mailman-Approved-At: Mon, 04 Dec 2023 13:38:31 +0000
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [xdp-hints] Re: [PATCH bpf-next v3 2/3] net:
 stmmac: add Launch Time support to XDP ZC
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

On Mon, 2023-12-04 at 11:36 +0100, Jesper Dangaard Brouer wrote:
> On 12/3/23 17:51, Song Yoong Siang wrote:
> > This patch enables Launch Time (Time-Based Scheduling) support to XDP zero
> > copy via XDP Tx metadata framework.
> > 
> > Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
> 
> As requested before, I think we need to see another driver implementing 
> this.
> 
> I propose driver igc and chip i225.

igc support would be really nice and highly appreciated. There are a
lot of tests running here with that chip (i225/i226) / driver (igc)
combination. Let me know if we can support somehow, testing included.

> 
> The interesting thing for me is to see how the LaunchTime max 1 second
> into the future[1] is handled code wise. One suggestion is to add a 
> section to Documentation/networking/xsk-tx-metadata.rst per driver that 
> mentions/documents these different hardware limitations.  It is natural 
> that different types of hardware have limitations.  This is a close-to 
> hardware-level abstraction/API, and IMHO as long as we document the 
> limitations we can expose this API without too many limitations for more 
> capable hardware.
> 
>   [1] 
> https://github.com/xdp-project/xdp-project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org#setup-code-driver-igb
> 
> This stmmac driver and Intel Tiger Lake CPU must also have some limit on 
> how long into the future it will/can schedule packets?
> 
> 
> People from xdp-hints list must make their voice hear if they want i210 
> and igb driver support, because it have even-more hardware limitations, 
> see [1] (E.g. only TX queue 0 and 1 supports LaunchTime). BUT I know 
> some have this hardware in production and might be motivated to get a 
> functioning driver with this feature?

i210 support would be nice, that would allow us to compare some test
setups with different NICs. In addition it would simplify some test
setups. For now, IMHO igc is more important.

> 
> --Jesper

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
