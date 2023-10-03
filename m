Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E611E7B67B2
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 13:18:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93BECC6B478;
	Tue,  3 Oct 2023 11:18:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 267DDC6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 11:18:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4054496bde3so7632755e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Oct 2023 04:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696331917; x=1696936717;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dRmt6j5dxjz0MCUrCJcyD2cXKQxyJFJdm8ATGNw+KGc=;
 b=UKnlJpOHhrn2mIRzLr34w1zh7lTaAReG5cDYdvk3xkPfbXFxvg4TtqZ79FU96SO49d
 liloCEKrrEjon4JLKNe8Ziu6cMKyQPaI6MzftdbRwcTt5mJ6Qb5gFmeGBwLtp6nTMLJ8
 BKn0aAe011JH0xpqnO5zOcwXDuuxns8GogfbqMmvxuYWqVRQ8fmwE4NQPMxqR1oBhV1O
 r5QytMPxIAC0/KdjZyWIv6eQKEyxknVExsBcPN2X863MMXZb4PDOJdyYPpe+yCfgmN32
 lttbeIVzmEvCdZY91dwGU6UazjKIo6Yr8/phNGfqI8XItZ8FWlluVG3BAJSAU5zYYSYZ
 Spew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696331917; x=1696936717;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRmt6j5dxjz0MCUrCJcyD2cXKQxyJFJdm8ATGNw+KGc=;
 b=CwEvfxmOvzrrTEsz/XZ8oQE9nwUecO+qebvn5/Qp4U+5/HOmkp8gmD+B0Q0JFGTJ+u
 b8Mcp1SNoFqi8sxo/+DvK02UxbxMI/5vXYLl+I2w62TpQeCca4LVoJnLLD50pChRSeyL
 k2ZFiLNGSJdFIe89EvIsEWYmYEZOH5KbwDqvDB4Od/wEtATsWGgGoGXdCNk+Bmo/OG2F
 6lt0FgLowrJ2hp54KTvEqrh2nqlTl0zdqCPdOEP/rwjfyA0do/z7otvLQkFElAvzcynE
 P9wDs+UbPcqSAvymJlzWLTQJ7CGlZZPOLvzX2mviEXuIJZg3GEXhD7keqy85wplLVi0A
 vrrA==
X-Gm-Message-State: AOJu0YwejtqZF1c0MUYbXfs3TDeCLW2I0HCxGLZVvCeTJcQzgDujxa8G
 gdqeLxSnNSLSXxyO9eMBL8g=
X-Google-Smtp-Source: AGHT+IFLbiLzMIjYq17N9d6C9xhiAG+ijgYatVYbYzZACplv9aboPtXUhqao5fQwPpvl9QyVVVJ1HA==
X-Received: by 2002:a7b:ce89:0:b0:402:f07c:4b48 with SMTP id
 q9-20020a7bce89000000b00402f07c4b48mr11269565wmj.28.1696331917146; 
 Tue, 03 Oct 2023 04:18:37 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a05600c365800b0040652e8ca13sm9195716wmq.43.2023.10.03.04.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 04:18:36 -0700 (PDT)
Message-ID: <651bf88c.050a0220.3a982.31fc@mx.google.com>
X-Google-Original-Message-ID: <ZRv4iZmOuLubYSiN@Ansuel-xps.>
Date: Tue, 3 Oct 2023 13:18:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-3-ansuelsmth@gmail.com>
 <20231003-living-seltzer-172ea6aec629-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003-living-seltzer-172ea6aec629-mkl@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>,
 Rick Lindsley <ricklind@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>,
 Dany Madden <danymadden@us.ibm.com>,
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
 linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>,
 Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bailey Forrest <bcf@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-can@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>,
 Krzysztof Halasa <khalasa@piap.pl>, Benjamin Berg <benjamin.berg@intel.com>,
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
Subject: Re: [Linux-stm32] [net-next PATCH 3/4] netdev: replace
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

On Tue, Oct 03, 2023 at 09:16:33AM +0200, Marc Kleine-Budde wrote:
> On 02.10.2023 17:10:22, Christian Marangi wrote:
> > Now that napi_schedule return a bool, we can drop napi_reschedule that
> > does the same exact function. The function comes from a very old commit
> > bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
> > net_device") and the purpose is actually deprecated in favour of
> > different logic.
> > 
> > Convert every user of napi_reschedule to napi_schedule.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
> >  drivers/net/can/dev/rx-offload.c                       |  2 +-
> 
> Acked-by: Marc Kleine-Budde # for can/dev/rx-offload.c

Just to make sure can I use the correct tag: (you didn't include the
mail)

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c

?

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
