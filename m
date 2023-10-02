Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC217B5D10
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 00:21:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C54E2C6B473;
	Mon,  2 Oct 2023 22:21:57 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4708C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 22:21:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 59ADBB81691;
 Mon,  2 Oct 2023 22:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC12C433C8;
 Mon,  2 Oct 2023 22:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696285314;
 bh=CGV3l4m1Fsxjo5KVleucQ9ACIj7qp3IjWnhkCyY4rZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YPx5MEwF/HCg5A6rfAedz2iYizSQOXr/9gtMzV+E2dlwiqJvuiHqVp6YRtAwC9ZlS
 iOAwE9rZIHCPbdG0ZKTqccGsZvdmJOo/00bYzDZF8QdQBQe94QFgEyvtBE9hUE1ZhX
 FPhADmeOCjSVgRUmxviHjBL7ROHTUtdiWaeb4uQfNFQMva2lL3M61UoF3ATuxEMgMo
 Uj/iFCrNIKmeNh9SROF1KxJx/VsHoXbgWm43eAwiShXr57QIf5n+H60C5Q59nRGkQM
 Fnuq18MhzNA8vdaj3zP3dQsTNCYa/h7xuzPe+Ktf6dcjXsvZ3NikpBFsjOaB3zpmQy
 FO3A4oVVbVVRw==
Date: Mon, 2 Oct 2023 15:21:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <20231002152142.4e8e2cfb@kernel.org>
In-Reply-To: <20231002151023.4054-1-ansuelsmth@gmail.com>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>,
 Rick Lindsley <ricklind@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Krzysztof Halasa <khalasa@piap.pl>, Eric Dumazet <edumazet@google.com>,
 Lee Jones <lee@kernel.org>, Dany Madden <danymadden@us.ibm.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Zhengchao Shao <shaozhengchao@huawei.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>,
 Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Haren Myneni <haren@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Jose Abreu <joabreu@synopsys.com>, Alex Elder <elder@linaro.org>,
 linux-wireless@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Wei Fang <wei.fang@nxp.com>, Wolfgang Grandegger <wg@grandegger.com>,
 Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>,
 Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Bailey Forrest <bcf@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-can@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Benjamin Berg <benjamin.berg@intel.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yuri Karpov <YKarpov@ispras.ru>,
 linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Zheng Zengkai <zhengzengkai@huawei.com>, netdev@vger.kernel.org,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Douglas Miller <dougmill@linux.ibm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Junfeng Guo <junfeng.guo@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next PATCH 1/4] netdev: replace simple
 napi_schedule_prep/__napi_schedule to napi_schedule
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

On Mon,  2 Oct 2023 17:10:20 +0200 Christian Marangi wrote:
>  			queue_work(priv->xfer_wq, &priv->rx_work);
> -		else if (napi_schedule_prep(&priv->napi))
> -			__napi_schedule(&priv->napi);
> +		else
> +			napi_schedule(&priv->napi)

Missing semi-colon, please make sure each patch builds cleanly 
with allmodconfig.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
