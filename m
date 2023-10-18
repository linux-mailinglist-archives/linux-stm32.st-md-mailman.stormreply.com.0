Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2123A7CE5D2
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 20:04:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDBA9C6C838;
	Wed, 18 Oct 2023 18:04:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 147EAC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 18:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697652268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dNX9ozbgtkYe/902nvplA8K4eAYG6mgmEEowb1wlWxM=;
 b=ccn/f5GYzHK3l3plpy8J7oRAqQEM5Vx4IrKEcYDliacufV7OGcV8rWu7swIqnbaj4gO594
 Z7whkrQMJxgPJH9plqpPhP5wwv6VNaVXQULU/G0oM6/32uksg0rL0yBRNt1ttrsA2PY2rZ
 HBBfHkOjt2/3vn4r+jEyqH0aMub6+tc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-SGpcOUW4NKGBb7_sBws1-A-1; Wed, 18 Oct 2023 14:04:26 -0400
X-MC-Unique: SGpcOUW4NKGBb7_sBws1-A-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-66d1e755077so77554666d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 11:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697652266; x=1698257066;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNX9ozbgtkYe/902nvplA8K4eAYG6mgmEEowb1wlWxM=;
 b=IFU7V+sKYw5qxCY2rHNvYJJNBkZlK68OWpts+pAez+yWFezWaZ0fbVZO0i5F5c2K/E
 mPU8032WlMK8FKy66Ke+sXFwPtb+yEaY+g3qk6wdqc9PCb7Do8Yeot9gRh/Rzx+mhH0t
 TBtPiIs1upRUyZUA3uEtyGi1siL64P5KnAzBwMwQ0qPIfiHEb8/mgrdCaNuDFkTA6OPJ
 r9D1Iz813n4+X025Vg61tqOmpCF6lgc3e0Mi4Wxzi6NqL1tyh5+0cq+pTi7cnkoik4BU
 lZBY3X2A63APMmHjtNwEIGw81kagGRa4gsWURZMaMIoiwerqRVAZXmmKfML0zD3AijUz
 Z/Sg==
X-Gm-Message-State: AOJu0YzxWx6P0VhZyPZG5or10GOPG43BakxNxfRJdmpaxSmD4BCHAt1c
 BF+zh+adz2/Qzti1OE/oJsvcwrzP2YZvO462leLWJpvcDj55ueJrZhPyDdi/2GMqR/xaHqrPN8o
 JgYtomAvwHidtdOAXekvjqNnT7pJPIYr5mBPk4bd8
X-Received: by 2002:a05:6214:d6f:b0:66d:2eb6:f3f6 with SMTP id
 15-20020a0562140d6f00b0066d2eb6f3f6mr6947755qvs.32.1697652266304; 
 Wed, 18 Oct 2023 11:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7r9g/qf8M8D2pt4ix0jigNXIfJ7i7p7JdUBou8gXLcKPUUtGgDEa3SJxF8BWKbyqCqnVUHw==
X-Received: by 2002:a05:6214:d6f:b0:66d:2eb6:f3f6 with SMTP id
 15-20020a0562140d6f00b0066d2eb6f3f6mr6947734qvs.32.1697652266044; 
 Wed, 18 Oct 2023 11:04:26 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a0cfd85000000b0065b2f4dd300sm127154qvr.90.2023.10.18.11.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 11:04:25 -0700 (PDT)
Date: Wed, 18 Oct 2023 13:04:23 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <vkf6xerp5o7owkvvlbxvd6hkzaj7mml6yutrpaxyowcryh3nlu@qeourmcxk5x3>
References: <20231010-stmmac_fix_auxiliary_event_capture-v2-0-51d5f56542d7@pengutronix.de>
 <20231010-stmmac_fix_auxiliary_event_capture-v2-1-51d5f56542d7@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231010-stmmac_fix_auxiliary_event_capture-v2-1-51d5f56542d7@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: vee.khee.wong@linux.intel.com, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 horms@kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 tee.min.tan@intel.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, rmk+kernel@armlinux.org.uk,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/5] net: stmmac: simplify
 debug message on stmmac_enable()
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

On Wed, Oct 18, 2023 at 09:09:53AM +0200, Johannes Zink wrote:
> Simplify the netdev_dbg() call in stmmac_enable() in order to reduce code
> duplication. No functional change.
> 
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> 
> ---
> 
> Changelog:
> 
> v1 -> v2: no changes
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index 1be06b96c35f..f110b91af9bd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -203,14 +203,10 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
>  			/* Enable External snapshot trigger */
>  			acr_value |= priv->plat->ext_snapshot_num;
>  			acr_value |= PTP_ACR_ATSFC;
> -			netdev_dbg(priv->dev, "Auxiliary Snapshot %d enabled.\n",
> -				   priv->plat->ext_snapshot_num >>
> -				   PTP_ACR_ATSEN_SHIFT);
> -		} else {
> -			netdev_dbg(priv->dev, "Auxiliary Snapshot %d disabled.\n",
> -				   priv->plat->ext_snapshot_num >>
> -				   PTP_ACR_ATSEN_SHIFT);
>  		}
> +		netdev_dbg(priv->dev, "Auxiliary Snapshot %d %s.\n",
> +			   priv->plat->ext_snapshot_num >> PTP_ACR_ATSEN_SHIFT,
> +			   on ? "enabled" : "disabled");
>  		writel(acr_value, ptpaddr + PTP_ACR);
>  		mutex_unlock(&priv->aux_ts_lock);
>  		/* wait for auxts fifo clear to finish */
> 
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
