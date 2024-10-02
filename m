Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B398E233
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2024 20:21:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AB69C78022;
	Wed,  2 Oct 2024 18:21:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB5C8C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 18:21:07 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-37cd3419937so80103f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Oct 2024 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727893267; x=1728498067;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DcHxLYnLTIbgSNaqFbGV229B42GhTMbV7RRVChU65pQ=;
 b=X9f8fqsAVqEEUYvBdO76L1NcVOyKqunEk73kHsV2wVQFQ7hdero0zG3MivpwaXRmbP
 T2sQbYzdDW9qVWUHxaBfIULfc3tV3FNusm8I1KQSpyR+QUwzk3Eb4iSKC4tL01pgQeIS
 Y1CxYR+SspTgqfDniTb9Zd4cTnYrphmxxJpakkw4tWyc+ZkDbV0Z46s5Sy29VWvThonW
 MYjF1aDzK2ny7oputqp/bz/tShBbX1dNIs6eFTBYPyOEmtqMjPHZsbGJI0JAnxer8UES
 pe39mk1KXkeKPyWr15qv0T8zdB0ooXmQsGvaHfPOKnnshtegDBumaubLqvHsfT5x34W7
 mx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727893267; x=1728498067;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcHxLYnLTIbgSNaqFbGV229B42GhTMbV7RRVChU65pQ=;
 b=n9tHNCAgqc22t+6j9ZQHf2hXKRpPaNkDR5DVsUdJWRLTJOkLh2YUL7TswenJRVSYUh
 Z4TYjHpI5ogZEbQhWjWNnZOL4j3qlT1Mbs2z9X9jANglbVCLtNbwl3IeBcLz05K0h3bY
 rELtRpFaR8V80syqO8yyge/qNHlsXHPZVIx6uMM8ZSrZa/leW8XFPDTwixcPkshTr5AK
 ESHfxffCOkcnz2fnIA7gsn+s25218nxGT2YooWVqKJPdhYMJlWA0aMBGgJ187TXkqCa8
 yQafb63qMSi+CPqfv4aConN3XrpugYKu2X/ufDWYMwVgIRREksKCQkA+blQ/F4YyWPjJ
 4PZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQdvGhp+s0VLsIgP5xhPjEtiVlNK+Y9TIvqq6Hl03TGmjpl7BZ1d1RFIjqu7tckLw0s6WO1nnu+EO4tw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz8vfRsdBRFA4SX+XeRyTril7z9F3mUYDkd/YUy/mUVbsVJQ41c
 amT+T8Ev113EiwRWx33LQ8hyz2XH2PSCf0ZHsWLOtGQoegAMtae0
X-Google-Smtp-Source: AGHT+IESxt1FuolPgZUDq2iAri400mySBOJw/9ODZjUKojpeyviUhp2hg3+MAS+yVKUPdDGcJw1uZA==
X-Received: by 2002:a05:6000:50f:b0:374:bd48:fae9 with SMTP id
 ffacd0b85a97d-37cfb8d066cmr2778922f8f.20.1727893266694; 
 Wed, 02 Oct 2024 11:21:06 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f7a01f514sm25748765e9.32.2024.10.02.11.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 11:21:06 -0700 (PDT)
Date: Wed, 2 Oct 2024 21:21:03 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <lebai2y7xgrf72tbhwcxklhs5u3y6uz24vyrew2fjssspwn35d@pnxj5t6trnm4>
References: <20240930110205.44278-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930110205.44278-1-minda.chen@starfivetech.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: dwmac4: Add ip
 payload error statistics
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

Hi Minda

On Mon, Sep 30, 2024 at 07:02:05PM GMT, Minda Chen wrote:

Since v3 is going to be required anyway, here are several nitpicks:

> Add dwmac4 ip payload error statistics, and rename discripter bit macro
> because latest version descriptor IPCE bit claims ip checksum error or
> l4 segment length error.

s/dwmac4/DW QoS Eth v4/v5
s/ip/IP

L4-segment is a too broad definition in this case. The doc says about
just three protocols: TCP, UDP, or ICMP, so

s/l4/TCP, UDP, or ICMP

Other than that the change looks good.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 2 ++
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index e99401bcc1f8..a5fb31eb0192 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -118,6 +118,8 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
>  		x->ipv4_pkt_rcvd++;
>  	if (rdes1 & RDES1_IPV6_HEADER)
>  		x->ipv6_pkt_rcvd++;
> +	if (rdes1 & RDES1_IP_PAYLOAD_ERROR)
> +		x->ip_payload_err++;
>  
>  	if (message_type == RDES_EXT_NO_PTP)
>  		x->no_ptp_rx_msg_type_ext++;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
> index 6da070ccd737..1ce6f43d545a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
> @@ -95,7 +95,7 @@
>  #define RDES1_IPV4_HEADER		BIT(4)
>  #define RDES1_IPV6_HEADER		BIT(5)
>  #define RDES1_IP_CSUM_BYPASSED		BIT(6)
> -#define RDES1_IP_CSUM_ERROR		BIT(7)
> +#define RDES1_IP_PAYLOAD_ERROR		BIT(7)
>  #define RDES1_PTP_MSG_TYPE_MASK		GENMASK(11, 8)
>  #define RDES1_PTP_PACKET_TYPE		BIT(12)
>  #define RDES1_PTP_VER			BIT(13)
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
