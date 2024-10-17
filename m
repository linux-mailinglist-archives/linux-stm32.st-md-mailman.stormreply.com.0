Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F79A2A98
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 19:19:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1139BC78032;
	Thu, 17 Oct 2024 17:19:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8AD3C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 17:18:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4314e64eba4so1468045e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729185535; x=1729790335;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ruAjioQ9k7jbFZfBIq4ftH/WHh/CcrYyuu9X+EyIj3A=;
 b=Op+SEuXIwIiTB3vrXpPr0/XmZyqAliFMl3z5T+Nxyq+T9z1/FKs+4lJ6pnahF3zSZu
 bMIZuk7EJ2IKMR9PUgKtRBW7nv3Y8QFgj8KU461rpK2NrpiZcdzev++hBvAFqHJbWaNB
 Pw7Ux4yTci5PZPb94xiFyLYFU27m9b06mZapsUY24dwDivoo78Exdaww65r0+UNpP9dk
 OXFem3P8guBljgGT6Leva8nImj/8o3mFPykpk/yucO9+VG1ffMz1+LsH4KIV7DVZNrKC
 egPtaZp8GOZr8cA5NjJhLUTAKbh1uD/pg+y3kNNHQhhxR7NN+0J7+Av0ldeiI0++Jx8R
 C5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729185535; x=1729790335;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ruAjioQ9k7jbFZfBIq4ftH/WHh/CcrYyuu9X+EyIj3A=;
 b=ipPDI6eqteHRwb206jx+oWxnxitQFoUJ3YG9qRDyV9doQ5mgnnq07/+h/YpPO1sc2E
 mmOIYOH5Q1crwt7Pr0ndYEnbwR5vOOK3rqIIbwnbggOqbUE4Ki7696viGlUDCCeLbw38
 uH/wD7AEYC77ysX6S34ZEen7XSiemH+0x52P0mTjRJ2mM2zpH3EYsBE6zH6z4pHY6cTR
 pzoGbpQcNFzRIqsvLjmT5m8xwKHFg0wkuKQ/EgMdKQJ5KBfEnXfTZ1tB/0+zlxFA7zRH
 Jm3gIGI2TmMmz2uu/RxmD808o0VJtLRrkZKfUrDXaQkAdJT1SVhNb1q5laqFg78qpMWE
 3FUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkfXGb3Bv1fOwIGnIkW6TgcdTvqYrOe/xJQ+UXWFEWDBDt//OAw6z2KqFOR84wlBNpfKVP9SPQ38W/kA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJJ1GwqpMZFoLPu2iUiJTBPnE/wE77GiFwQ85LWRMO70O8b0B5
 h93yJIz8OAbn+U+DUIRC5z6cruf4+pltYPQpmJdgvvHSu51x5tCB
X-Google-Smtp-Source: AGHT+IE9Eb/5bNteKLsSum3xN8R6ddBqz1cPduAZYwClja5hPYbrIk6zbmBICf6aIECSo0fli7nLvQ==
X-Received: by 2002:a05:600c:4e8d:b0:42c:aeee:80b with SMTP id
 5b1f17b1804b1-43160ac6141mr11155e9.8.1729185535159; 
 Thu, 17 Oct 2024 10:18:55 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43160682d0dsm1694105e9.8.2024.10.17.10.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 10:18:54 -0700 (PDT)
Date: Thu, 17 Oct 2024 20:18:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241017171852.fwomny3wedypybhx@skbuf>
References: <cover.1728980110.git.0x1207@gmail.com>
 <cover.1728980110.git.0x1207@gmail.com>
 <4557515b4df0ebe7fb8c1fd8b3725386bf77d1a4.1728980110.git.0x1207@gmail.com>
 <4557515b4df0ebe7fb8c1fd8b3725386bf77d1a4.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4557515b4df0ebe7fb8c1fd8b3725386bf77d1a4.1728980110.git.0x1207@gmail.com>
 <4557515b4df0ebe7fb8c1fd8b3725386bf77d1a4.1728980110.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/5] net: stmmac: xgmac:
 Rename XGMAC_RQ to XGMAC_FPRQ
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

On Tue, Oct 15, 2024 at 05:09:25PM +0800, Furong Xu wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 917796293c26..c66fa6040672 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -84,8 +84,8 @@
>  #define XGMAC_MCBCQEN			BIT(15)
>  #define XGMAC_MCBCQ			GENMASK(11, 8)
>  #define XGMAC_MCBCQ_SHIFT		8
> -#define XGMAC_RQ			GENMASK(7, 4)
> -#define XGMAC_RQ_SHIFT			4
> +#define XGMAC_FPRQ			GENMASK(7, 4)
> +#define XGMAC_FPRQ_SHIFT		4

If you made use of FIELD_PREP(), you would not need the _SHIFT variant at all
(though that would be a separate logical change).

>  #define XGMAC_UPQ			GENMASK(3, 0)
>  #define XGMAC_UPQ_SHIFT			0
>  #define XGMAC_RXQ_CTRL2			0x000000a8
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
