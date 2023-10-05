Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357D7BA639
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 18:32:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08152C6C835;
	Thu,  5 Oct 2023 16:32:58 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A78AC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 16:32:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AE557B825BD;
 Thu,  5 Oct 2023 16:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6E2C433C7;
 Thu,  5 Oct 2023 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696523576;
 bh=DwGgZF4pD8dMdjurYEUQSJd03FIsbJFkpL4uiIiTuZI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=no9ws3a7X4UxOs3t1ZnClQiQoxdBhGZlGNfhrbp5JYwIpj/luaWE1/qY2mSml/Kfv
 zKudrb4eO3/FEIzOZYMQJKll4e2+nISBj2e5Rvu5vuQs/ZUa8I1Zn5+VpnT9OcLx2W
 fvuvLuyWkgJ83aCEIvKvuGL1eIVFeTN24MUbRgt45QNq7GpmY3n38lq0MOtmUlI8QQ
 iWoap0bfmYLCa2VFhE0e48qsh+nGdajFa+QB6GMzZwbrY6JBAYCgo9AWa3hcqOkaJQ
 Qt19l3uNvUWIvQuiq1darSKlP0coe5ZIZFZXLNlx2kT97+BBmOlMO823CbI3XoIvg3
 SR+zm46cxSuGQ==
Date: Thu, 5 Oct 2023 09:32:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Message-ID: <20231005093253.2e25533a@kernel.org>
In-Reply-To: <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
 <20231003145150.2498-3-ansuelsmth@gmail.com>
 <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>,
 Rick Lindsley <ricklind@linux.ibm.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Yuri Karpov <YKarpov@ispras.ru>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, Dany Madden <danymadden@us.ibm.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Zhengchao Shao <shaozhengchao@huawei.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>,
 Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Lee Jones <lee@kernel.org>,
 Haren Myneni <haren@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 linux-wireless@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Wei Fang <wei.fang@nxp.com>, Christian Marangi <ansuelsmth@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>,
 Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Benjamin Berg <benjamin.berg@intel.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Coco Li <lixiaoyan@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Zheng Zengkai <zhengzengkai@huawei.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, Douglas Miller <dougmill@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Junfeng Guo <junfeng.guo@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, "David S.
 Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next PATCH v2 3/4] netdev: replace
 napi_reschedule with napi_schedule
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

On Thu, 5 Oct 2023 18:11:56 +0200 Eric Dumazet wrote:
> OK, but I suspect some users of napi_reschedule() might not be race-free...

What's the race you're thinking of?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
