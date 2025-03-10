Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A5A58A72
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 03:24:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31178C78F85;
	Mon, 10 Mar 2025 02:24:50 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59DB1C78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 02:24:48 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2fecba90cc3so7249446a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 09 Mar 2025 19:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741573487; x=1742178287;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UgdkfR5ZJpIqw3CxaKBXneuVyU1q32SHQHrzDgtsJo=;
 b=d2Nzc6VI+gD8UGtj3OGR0tgtn5P1kGZVLHIPMtAAQXnrZfvDe3xKkmw0uMbZpaosuj
 a933eYRM0XViZsNmYH7zhx4DDDXY0jTo//hhCxEUOQ0MgD3SPLXdTHR006dtphn95mhP
 1XhRCV3n3xpP2pxj3kgphgJLt/FMd26rypmLR56k4wz5nPJuoWB7y9Qhn4z0Ha5XoRgy
 rVqwSK3O183dVRnNXRjRF3kD7rBLTLH4Hd5M0sp9kwXqbD14KQTewY8xKa7fP+/sovBi
 Z2VtAnIFcksXcJUiRvjd+ZbGcWfl/Tv+i6UPWqksMEAf75bujpVJQ2hYIk38MPFy0i6m
 YqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741573487; x=1742178287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UgdkfR5ZJpIqw3CxaKBXneuVyU1q32SHQHrzDgtsJo=;
 b=fyXgtJD3X2e4FC+xXnjX4ANQGFehAyGiDLIKyKLpPkTiHRvnYW6NXUK6InbLwRhSvs
 2uL8FzRwCuCLiP77HyYQiehteeiRaeZ6pYBL12hecBlBlxFL4bmgFc8m6fqZ9OmnluGu
 tQNdtOEHKKhh5G2d0mbe+ASWfeuYwF1/Ikt6zVLvNxUDDN+N147geQ7+mtHxS4+J3YSX
 iDbR3tuGc4eUrQSaGlA2qqslQvG12eSX1vo6tEz7hgkNA4g9fx9VaoS/AlR2/QXE5xOV
 ZgNl7Ms2DvVDcPvQvVP+wAGvEWT0inC0Q+wkQEWalzYGQ/bx5zorNvg7fGztJuFx/QpT
 XZYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp+yYL4BkuId3TFV7o+D9q8HLKjJZo0Ihn8HlEfo/8zjIGzOlKiItUELrS0f/9m6YdrAgsdGUWfqpG0w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyMMOnaSoahVfF2Zo8XBMqBH/Lde2LZGqrzmY0lzmMgjNQqpWMt
 PcwEudej57+9Q1I7Ts9jYYK1XwC4LSU6NFPjEgwQqv+bysKtD4vY
X-Gm-Gg: ASbGncvRgiHTbr5xFDca2D1/ZsxlFopj6+5QRSc60jnJtAwdi9g66OKQ9ffv0RDd7DJ
 9N2rAI5I4s04FholSB5CsImdpwzgW5zUrZiYG012s5GIEG9Q4YJ+BA7XEodcUB1megeSevjyHuK
 LjfkXk2nQiB43RfGMTi5Q9qNc7weu9ccHBHQ+sLIWQrp75xLAEypNar0qzT/Pul4qzv020JTJHV
 nI/zBNR80rwILwBx+nLcBCui7fEqrGub3hRjQ3yxnxZ4zeuRyH6f7WZzYrQyy7ASJjyxQikOWjM
 nyqs9AqK7SQFgYWe0JqM3RkNlAh2OG1vGcekIg==
X-Google-Smtp-Source: AGHT+IEu8uuETGfMoaM3EPE2WfaTTndfm3F2AV9+L8B8fVo7WT9YAUCmxKGewCLzkt/NfrR5yWSoUw==
X-Received: by 2002:a17:90b:4cca:b0:2ff:72f8:3708 with SMTP id
 98e67ed59e1d1-2ff7ce837c9mr21980902a91.17.1741573486614; 
 Sun, 09 Mar 2025 19:24:46 -0700 (PDT)
Received: from localhost ([144.24.43.60]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff4e7ffdd3sm8645058a91.39.2025.03.09.19.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 19:24:46 -0700 (PDT)
Date: Mon, 10 Mar 2025 10:24:32 +0800
From: Furong Xu <0x1207@gmail.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250310102432.000032ad@gmail.com>
In-Reply-To: <20250309104648.3895551-4-faizal.abdul.rahim@linux.intel.com>
References: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-4-faizal.abdul.rahim@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, intel-wired-lan@lists.osuosl.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v9 03/14] net: ethtool: mm: reset
 verification status when link is down
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

On Sun,  9 Mar 2025 06:46:37 -0400
Faizal Rahim <faizal.abdul.rahim@linux.intel.com> wrote:

> When the link partner goes down, "ethtool --show-mm" still displays
> "Verification status: SUCCEEDED," reflecting a previous state that is
> no longer valid.
> 
> Reset the verification status to ensure it reflects the current state.
> 
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> ---
>  net/ethtool/mm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/net/ethtool/mm.c b/net/ethtool/mm.c
> index bfd988464d7d..ad9b40034003 100644
> --- a/net/ethtool/mm.c
> +++ b/net/ethtool/mm.c
> @@ -415,6 +415,10 @@ void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
>  		/* New link => maybe new partner => new verification process */
>  		ethtool_mmsv_apply(mmsv);
>  	} else {
> +		/* Reset the reported verification state while the link is down */
> +		if (mmsv->verify_enabled)
> +			mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
> +
>  		/* No link or pMAC not enabled */
>  		ethtool_mmsv_configure_pmac(mmsv, false);
>  		ethtool_mmsv_configure_tx(mmsv, false);

Reviewed-by: Furong Xu <0x1207@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
