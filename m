Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 016597BF6E7
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 11:12:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 975CBC6B442;
	Tue, 10 Oct 2023 09:12:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AAB8C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 07:54:36 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so49573495e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 00:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696924476; x=1697529276;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iwwM7auPgZJMU7dH/X5o56/hwua6iH2A1QFl6/0EOd0=;
 b=A90b+MubePGGt/bGqnc/89VR7/HiFNO0CPBMHmg4k22rQGjMEC75B+gRvDhUVJM/f7
 U7Y0beBF5nW5TIF2rhLUikTMbJWk4giWdkPft9tfRR6A7MEXt6NSj4YIT7gOEM4s77Cx
 QScheQg2O5DAPB4cfinQhy5R4FJs7qBnbf0eEKv1s4Q9EykX/LUD+jfVi53x5NQjcyIO
 EpBrZcEYwSMJ1FIIJPfC/7wpv5UuV8j4E/M9D1PDZjSOVQwdEzFX0lSbNp6nMvvn2XlC
 FHLZk2cYVubu6aYRUkYdzOtMKa+gnhwf4NSay9osOCGty5Q8Wj7+ao0W4yWYf3FVLo0u
 c2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696924476; x=1697529276;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iwwM7auPgZJMU7dH/X5o56/hwua6iH2A1QFl6/0EOd0=;
 b=rc5PEQArG74osWGIB5JvyU/7VRuefSrHinSE8pWz8kVvHludMRNf0N2SP1tc3bmbWV
 9+OrtjVAdpoISgv/K11AXpAPCKIibDWevNh2z+gRDsts7EEMBNUuiYk8uBGtsHySloo+
 7Q7Jy36GHoktywdHs887eE+krgiPMBXzeJZCExNh7apgEankFCiJ53tn/rro+24h8J9B
 6J9pa4JPJ34TnSetrLdZHIDKmIaKjvfTZVN5gSJZSHLF9EGr8XC3rYOTM3mGnWeHzLEu
 5I2u+WPh/3oA+R0NW/j8xo6m1NFesqf8ot6gc4FMKVyg4IwF1pKqDAXd/uXqRR9lO9B6
 gavA==
X-Gm-Message-State: AOJu0YzQUBPm8wm1pWulPGUJlrkzPvHqU6PTAhN5lg2a8cssgVUvmlob
 xh/PGDwDDFXWSC7++NWx15I=
X-Google-Smtp-Source: AGHT+IFoXHF3xhB1R1QbXfa6gtatnLXym3Q5nnEunh6zFeATAVA0tqJjWKSQ447yVOYMirHfwQlOJg==
X-Received: by 2002:a5d:500b:0:b0:319:8a66:f695 with SMTP id
 e11-20020a5d500b000000b003198a66f695mr13345455wrt.55.1696924475419; 
 Tue, 10 Oct 2023 00:54:35 -0700 (PDT)
Received: from [192.168.0.101] ([77.126.80.27])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a056000110300b0031c6581d55esm11802488wrw.91.2023.10.10.00.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 00:54:35 -0700 (PDT)
Message-ID: <f288a1cd-0e15-4301-8522-d46840dd2d93@gmail.com>
Date: Tue, 10 Oct 2023 10:54:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Leon Romanovsky <leon@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chris Snook <chris.snook@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Douglas Miller
 <dougmill@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Haren Myneni <haren@linux.ibm.com>, Rick Lindsley <ricklind@linux.ibm.com>,
 Dany Madden <danymadden@us.ibm.com>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Intel Corporation <linuxwwan@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Liu Haijun <haijun.liu@mediatek.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Alex Elder <elder@linaro.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Bailey Forrest <bcf@google.com>,
 Junfeng Guo <junfeng.guo@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ziwei Xiao <ziweixiao@google.com>, Rushil Gupta <rushilg@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yuri Karpov <YKarpov@ispras.ru>, Andrew Lunn <andrew@lunn.ch>,
 Zheng Zengkai <zhengzengkai@huawei.com>, Dawei Li <set_pte_at@outlook.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
 <20231009133754.9834-3-ansuelsmth@gmail.com>
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20231009133754.9834-3-ansuelsmth@gmail.com>
X-Mailman-Approved-At: Tue, 10 Oct 2023 09:12:04 +0000
Subject: Re: [Linux-stm32] [net-next v3 3/5] netdev: replace napi_reschedule
 with napi_schedule
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



On 09/10/2023 16:37, Christian Marangi wrote:
> Now that napi_schedule return a bool, we can drop napi_reschedule that
> does the same exact function. The function comes from a very old commit
> bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
> net_device") and the purpose is actually deprecated in favour of
> different logic.
> 
> Convert every user of napi_reschedule to napi_schedule.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com> # ath10k
> Acked-by: Nick Child <nnac123@linux.ibm.com> # ibm
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c
> Reviewed-by: Eric Dumazet <edumazet@google.com>
> ---
> Changes v3:
> - Add Reviewed-by tag
> Changes v2:
> - Add ack tag
> ---
>   drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
>   drivers/net/can/dev/rx-offload.c                       |  2 +-
>   drivers/net/ethernet/chelsio/cxgb4/sge.c               |  2 +-
>   drivers/net/ethernet/chelsio/cxgb4vf/sge.c             |  2 +-
>   drivers/net/ethernet/ezchip/nps_enet.c                 |  2 +-
>   drivers/net/ethernet/google/gve/gve_main.c             |  2 +-
>   drivers/net/ethernet/ibm/ehea/ehea_main.c              |  2 +-
>   drivers/net/ethernet/ibm/emac/mal.c                    |  2 +-
>   drivers/net/ethernet/ibm/ibmveth.c                     |  2 +-
>   drivers/net/ethernet/ibm/ibmvnic.c                     |  2 +-
>   drivers/net/ethernet/mellanox/mlx4/en_rx.c             |  2 +-
>   drivers/net/ethernet/ni/nixge.c                        |  2 +-
>   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
>   drivers/net/ethernet/xscale/ixp4xx_eth.c               |  4 ++--
>   drivers/net/fjes/fjes_main.c                           |  2 +-
>   drivers/net/wan/ixp4xx_hss.c                           |  4 ++--
>   drivers/net/wireless/ath/ath10k/pci.c                  |  2 +-
>   drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c             |  2 +-
>   include/linux/netdevice.h                              | 10 ----------
>   19 files changed, 21 insertions(+), 31 deletions(-)
> 

...

> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_rx.c b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
> index 332472fe4990..a09b6e05337d 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
> @@ -400,7 +400,7 @@ void mlx4_en_recover_from_oom(struct mlx4_en_priv *priv)
>   	for (ring = 0; ring < priv->rx_ring_num; ring++) {
>   		if (mlx4_en_is_ring_empty(priv->rx_ring[ring])) {
>   			local_bh_disable();
> -			napi_reschedule(&priv->rx_cq[ring]->napi);
> +			napi_schedule(&priv->rx_cq[ring]->napi);
>   			local_bh_enable();
>   		}
>   	}

For mlx4 part:
Acked-by: Tariq Toukan <tariqt@nvidia.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
