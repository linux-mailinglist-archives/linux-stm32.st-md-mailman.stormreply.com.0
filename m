Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0547DA3E752
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 23:17:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD592C7A830;
	Thu, 20 Feb 2025 22:17:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3481FC7A82E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 22:17:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09F275C61DB;
 Thu, 20 Feb 2025 22:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD62C4CED1;
 Thu, 20 Feb 2025 22:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740089842;
 bh=fwRMLQoTvvslio/qHTjWfmSIblsDq9Yevo6OmjlR7Us=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gsWDEYRAyTvAs1kE0egmdOtU3gAB6eRj6jBN+O2VX+hwhO9GJDHJEXMI1Ib3ykatk
 Y94KbJctHpMvGeTaR5Bn4Lg06ml7c/7Tx3nicxgy1rzpyronflc4vaJ4nQPbxVUTb3
 34hxJ64z4fyxfFaO2/2NzLQruNO3ZRIyf4T2fnjwHFx2ne/mNBWeU1RH1DVtrfBCCm
 OHRuAMdxAO3dtt8n9vHkM3QSnARODfnsEvU/xgSfHq2Ps/XjkNgv2+z8tAgz/7zNwO
 3tNQwDzo2HJi2H115hXMhbWE0qzve7DLI2VyPgnmKO5mMSOJZNbyNksBWgpsHSKPta
 Avkq0n61gq+Pw==
Date: Thu, 20 Feb 2025 14:17:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Message-ID: <20250220141719.524a8ac6@kernel.org>
In-Reply-To: <20250216093430.957880-2-yoong.siang.song@intel.com>
References: <20250216093430.957880-1-yoong.siang.song@intel.com>
 <20250216093430.957880-2-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>, linux-kselftest@vger.kernel.org,
 Florian Bezdeka <florian.bezdeka@siemens.com>, Joe Damato <jdamato@fastly.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Daniel Jurgens <danielj@nvidia.com>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Mykola Lysenko <mykolal@fb.com>, xdp-hints@xdp-project.net,
 Donald Hunter <donald.hunter@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Stanislav Fomichev <sdf@fomichev.me>,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, KP Singh <kpsingh@kernel.org>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bouska Zdenek <zdenek.bouska@siemens.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Bjorn Topel <bjorn@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next v12 1/5] xsk: Add launch time
 hardware offload support to XDP Tx metadata
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

On Sun, 16 Feb 2025 17:34:26 +0800 Song Yoong Siang wrote:
> Extend the XDP Tx metadata framework so that user can requests launch time
> hardware offload, where the Ethernet device will schedule the packet for
> transmission at a pre-determined time called launch time. The value of
> launch time is communicated from user space to Ethernet driver via
> launch_time field of struct xsk_tx_metadata.
> 
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>

Acked-by: Jakub Kicinski <kuba@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
