Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73014A11A13
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 07:49:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C7D0C78F8F;
	Wed, 15 Jan 2025 06:49:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2E7CC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 23:31:09 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2161eb94cceso74952765ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 15:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fastly.com; s=google; t=1736897468; x=1737502268;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QB7Gju0RIgr9jLJ+t5Q7M0pre/bo/tmwE6J1WO4l68M=;
 b=igNOpmwCxfo60oBS0rXPTCALuje5idODln5BhZ7A/ymkdsRhiteynQJNFI8PTBdTHO
 p3ta5qVRSs2r17dFNxY/El8shfwVC4R+ePVQhsjZ7R70yXqgFNQplk62T2q9SWLNrNXZ
 O+DHUf0Nk009cGAQD62OWy/+fLfOU01cprJfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736897468; x=1737502268;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QB7Gju0RIgr9jLJ+t5Q7M0pre/bo/tmwE6J1WO4l68M=;
 b=SJVzc+wwhDt7xWevcMsYb9wZkcXY1OOQQwonnbrtcjf9DjdHfiAg4hZ4dxSppZmpiE
 1ZTOl0Ux0exVG25qI40HW4EtmBU2dRH+MBLbZZN2MqXX9vVyzyep+0kvHwZghUyosWrb
 MN7i0F7x9L/Dsok8K7xkjV0/IMtTXAMkuhSLlfhQkQWMdMglZvBBcKFd7aF3gGusqa5n
 yOhQuFhe7CSuFYqXkyccfE3c6EcrTrqRm1RWqp5ANKHHbSmth1i0LfMr8dAhaZgiD26J
 9zemwYyCKbqNH6bwCYWlI0hjrANehYS+x3fVGOC0l7bfJjIGLL/G/SzNkSV5v/IK+8ya
 jzHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGi8Lp/3k1x/ThDeSM2fhjhd8vFEbdGOWxU+tOiTeq3nf5S5Nn1b5Av0eLhZW8DtnNVbqejU9QQD9b/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzYCVphYMK8iBREezHEoadYMZEhOTq3ErJFsAgoyxlf6mLfzP57
 FPA6gMjWP4nB2iHidSCH1jtvHPxLEwS1mnNe3zFi47aWMe3xakYYm9v7pyVEwn8=
X-Gm-Gg: ASbGnculZbUDIPatFLqLdwawsmr9IxS6lweAOlXQ5JjyXkncdA5TNuB0UeOvG+TcDwc
 C7XJCAUFu7Yn+C0dqtQOp0ML/QQ5Eo246UqUFTs+HA4SDAQZSPfpLTbVBbRvvvrH/G1ODgiUhpE
 5He9Eve0Sk5aPAHmOHcgLlcbbfveP+34Rn+XUezIIQDEDA2lwwUlI4KnqUFAq5aPO9TICw+P7lA
 ZwsIg3YROdhvLhWgkwzko/O4p3B4TaEE++aEm3c5x5m+dvJ4OLaz+yY5xYCx/vb74n4DGyiIzY2
 kkjv6EBBrnwhAYAzWz3L/TY=
X-Google-Smtp-Source: AGHT+IHovqEE/ZGS2FK/ULFvVF1bTBtDYpXgDWtKvoluSSVf7ExMHwXGJ8cq8SZ8vVf7DFdkQBZM8A==
X-Received: by 2002:a05:6a00:4f88:b0:729:a31:892d with SMTP id
 d2e1a72fcca58-72d21fa5cecmr42495186b3a.8.1736897468403; 
 Tue, 14 Jan 2025 15:31:08 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d405943fcsm7955165b3a.78.2025.01.14.15.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 15:31:07 -0800 (PST)
Date: Tue, 14 Jan 2025 15:31:05 -0800
From: Joe Damato <jdamato@fastly.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z4bzuToquRAMfvvu@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
 Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <cover.1736777576.git.0x1207@gmail.com>
 <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
X-Mailman-Approved-At: Wed, 15 Jan 2025 06:49:15 +0000
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Optimize
 cache prefetch in RX path
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

On Mon, Jan 13, 2025 at 10:20:31PM +0800, Furong Xu wrote:
> Current code prefetches cache lines for the received frame first, and
> then dma_sync_single_for_cpu() against this frame, this is wrong.
> Cache prefetch should be triggered after dma_sync_single_for_cpu().
> 
> This patch brings ~2.8% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca340fd8c937..b60f2f27140c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5500,10 +5500,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  		/* Buffer is good. Go on. */
>  
> -		prefetch(page_address(buf->page) + buf->page_offset);
> -		if (buf->sec_page)
> -			prefetch(page_address(buf->sec_page));
> -
>  		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
>  		len += buf1_len;
>  		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
> @@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  			dma_sync_single_for_cpu(priv->device, buf->addr,
>  						buf1_len, dma_dir);
> +			prefetch(page_address(buf->page) + buf->page_offset);

Minor nit: I've seen in other drivers authors using net_prefetch.
Probably not worth a re-roll just for something this minor.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
