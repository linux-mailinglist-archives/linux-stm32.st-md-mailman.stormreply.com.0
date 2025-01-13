Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C393A0B70A
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 13:37:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31C4AC78012;
	Mon, 13 Jan 2025 12:37:37 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 729D4C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 12:37:29 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2f43d17b0e3so7415737a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 04:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736771848; x=1737376648;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYspswNAJVbjIJeGSav8oevdZS2Al30TlAOrfrWoHgI=;
 b=KGvxlvVc6MT1tnLfGytAHLLjviajtGOpvCyi8rHMTNCBUVSjnj7pbEOcLqkgn9wKgz
 KmekSJv1soVRNfcZ5cx1s2ghZLYi5p7xghBR84uf5kPS4iSTTC20Ryb6/j0AXM7bZXo3
 AoBa579e57ENNrSgDpLMkctdpYL8oJUU2eORN83W0MbVrVpoB+QJjfpVh066m8hN5zws
 xzwVHBVXar7FI9Il/1cri9i6FL7/olgz9lOXJshujeUVeIWRTDMwQgA+KNXaQwQA12Hj
 C4KESaqf8xyQJY4ua48NwRH0FvbeJcEOQjdLiabLV6tYnV0BsCIZ7hPbIBfPO+v3rolN
 EP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736771848; x=1737376648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYspswNAJVbjIJeGSav8oevdZS2Al30TlAOrfrWoHgI=;
 b=vfQqJjiXOJIULaiRUzOjuYY+r6ShXxbyyRIHJ2dgyRBxkT3I3kiR5Z4MoaoO4WsqGJ
 rHsZJ5sUU4z9HtF33srTPDL5kzlHQwZ4bmZmf2cDrRUp6YYNpRWIFnQ3mfKVshk7iFSq
 DfsrHqvh1CtzJadLOIJCjJUQEjtvupkYQzDNqWFq6+hI6TYwN2hoxvzOeYAfehzAhJ0N
 qXl6ZDpn+XdKiDTGgo374M5T8OwTz/WS962XccTCDTVgFlHOtxDi9ULp0dEXjSPw2sCg
 FrTLBQsDjx1iQn5FQPA5W0JSrAHCY9R0UbumFrBheaoVRJELUO0/OBcTC3UK3W85xvRG
 Qxpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ91Q57mfSlNliKLvOhP9ytenqXNwbjUsAj9T+aWGXjY/0Fzk2Td8IDMZzrQY2FFN9tNu9FK7tlQ4s0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw//nLUlJYIkPG56DSZc5x3dyVSJxofpTkPHjXcuLNih4ijxm4V
 EErzDoFjcXwgo3G8oLHzIb3+xF7CE1zVqfjGLeXPa1k/wP9Gh6JB
X-Gm-Gg: ASbGnct74c+ws1Wa9NfFcBOXHxWZKa/N+NDrGSgwv6FQqWGHR3Hj+dcZP+/kLg0M6vC
 Aszx6e+4iC56yhHdVZ4YC0ExstqC9AVjG01jWzeSUrjginJzsPVmyWoSBNJvtWirkSlgkf5p7SM
 irwW7l+MAsHVPUKxBieubLxXuq05XnZlqir7hpoFudpzzSRwHUdl5+kFFneFVEsgNmJX+Ct9rjn
 x9YuoRFIKGQ748JUMkyk+pCbygbYp/j8AEqpF1bqy2D1BSWZJr9vQ==
X-Google-Smtp-Source: AGHT+IHe1pVSKvtAf8tEME92BvPU8bFiXiKYwUp2o19enb2ske+ljaAhyVZKHCMtZv5/6JQqhbrv8A==
X-Received: by 2002:a17:90b:53c5:b0:2f2:f6e0:3f6a with SMTP id
 98e67ed59e1d1-2f548f3979bmr32049199a91.14.1736771847927; 
 Mon, 13 Jan 2025 04:37:27 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f5593d07cbsm8624004a91.3.2025.01.13.04.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 04:37:27 -0800 (PST)
Date: Mon, 13 Jan 2025 20:37:10 +0800
From: Furong Xu <0x1207@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Message-ID: <20250113203710.000033dc@gmail.com>
In-Reply-To: <f20c339f-5286-477c-9255-e2e1fbeba57c@intel.com>
References: <cover.1736500685.git.0x1207@gmail.com>
 <b992690bf7197e4b967ed9f7a0422edae50129f2.1736500685.git.0x1207@gmail.com>
 <f20c339f-5286-477c-9255-e2e1fbeba57c@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 3/3] net: stmmac: Optimize
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

On Mon, 13 Jan 2025 13:10:46 +0100, Alexander Lobakin <aleksander.lobakin@intel.com> wrote:

> > @@ -5596,6 +5593,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> >  		} else if (buf1_len) {
> >  			dma_sync_single_for_cpu(priv->device, buf->addr,
> >  						buf1_len, dma_dir);
> > +			prefetch(page_address(buf->page) + buf->page_offset);
> >  			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
> >  					buf->page, buf->page_offset, buf1_len,
> >  					priv->dma_conf.dma_buf_sz);  
> 
> Are you sure you need to prefetch frags as well? I'd say this is a waste
> of cycles, as the kernel core stack barely looks at payload...
> Probably prefetching only header buffers would be enough.
> 

Yes, do not prefetch for frags is more reasonable.
Thanks!

pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
