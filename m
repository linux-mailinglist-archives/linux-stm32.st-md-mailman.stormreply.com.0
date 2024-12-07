Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C759E7E72
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Dec 2024 06:52:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0759AC7802D;
	Sat,  7 Dec 2024 05:52:47 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08401C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Dec 2024 05:52:39 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7ee51d9ae30so1956429a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2024 21:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733550753; x=1734155553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+IwYaynpcQ+9RTCAJedrXXepYT48CIPEoJXkJRmDR8=;
 b=TyhFayJEnlwPilIpcBTjmQSH+K7R6VWvptdF50A08B1CG67AJclUW7vEh0KKev4rds
 yDcIgkyE7ldqj8qoism2GYJVq9tICQbJvBY9rXbZEvsKv0d2dH0pOMN+BYOWJrsd/yod
 NghIOemhuCkiNUgxmCftH7lUvLqYpzQT1d2LOIEijzDX4Ia38aRxReuNw6VSL01Q9IHK
 V2B1MB/t2HcR5Vq9v6LbWNEUnYg3yLiAN6Y5Ifv/bO4jcXFB3mLxMnGLmdNPQqC0i2kI
 5tsg8rYTu9e0rEFjKJXGDpSl3E9QJxc0BWw6dfFegXhGTPHXYLma0nJUqA94e6LK+Icw
 LAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733550753; x=1734155553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+IwYaynpcQ+9RTCAJedrXXepYT48CIPEoJXkJRmDR8=;
 b=HTAJNK+IqpQIckWhCnhL9mOdMnsEyu8M+4fl6+r/4v6H6L+7nJvyEWahpguh5g6Q5b
 rLh6AO/7dpr/wuW4Rt3af4Vw29mRgGssybCtIW7uXHANe9flOUyac9wBr2ZPRHH0vFv/
 qM7q6d1I64PXvQ6yftkdUOA6ffLVsajUqpAerXvbOntU7KcqzNdj8P8BLbMIB8MCx0OI
 Iez/g1WkoHkf2cwM+KZjieE4rOSUj39wGZjyEEvjzEwIpizm4o1ECodEOE1YvwqD8SK7
 4rouxFXc9aGUXHnqOi5di8H0n64+eeK8tbaBqqRixZ1sEN4Jk6ftSsRcX0Hmds9mi9cL
 rHbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW3q3tlqZVSu9xuOtXT1rIJEoRG7LWnQNLnM/07gakJL4ovPa+Mq5W2J578EYxdS9Eejl+LYN3RfBjrw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzzwEzeUuO/Od/hzVvTGxLqkNmer9wvOg0hlKjcTWUFgvu8IZ2W
 0zIfOMkhqnpqJBf+rgLw8X/6o6Z0PcFsHMdiBbQ+3FUp0gsbpsJ6
X-Gm-Gg: ASbGnctf4+Bk+SYTJkMlvfCe1pacnQRjlnD+izvcc7jYozB7z4wDm97MWGVjgLwkRgF
 ufuQdzPpXciCf7E6+tKAah2l4O6wOvssU1WJTZ4rUzv8hMfWz1sZq4nbl917DWUDtbFv9U+wWvL
 RtRC0wYLyQUMVjn1NqKD8v0W9eO2VdIRbVKXu+2XXQ32FbVxS1xYp7XpWAjzjqYRfis9Hr66Tkl
 XCNiXg72HXZSiQvYpyBeLlz0WZJ+Ex2KWXevunG3w0dDMc=
X-Google-Smtp-Source: AGHT+IFd+wuygMRSPeO8wa52NvVHAGLuFfQ5jfbHspHxQMyW7jzkp1weeY7rmM4U0gg8Uv3suuUZQA==
X-Received: by 2002:a05:6a21:3e04:b0:1e0:c3bf:7909 with SMTP id
 adf61e73a8af0-1e187132cf7mr8429490637.41.1733550752776; 
 Fri, 06 Dec 2024 21:52:32 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a2a903a3sm3811288b3a.116.2024.12.06.21.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 21:52:32 -0800 (PST)
Date: Sat, 7 Dec 2024 13:52:17 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20241207135217.00000f0f@gmail.com>
In-Reply-To: <E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk>
References: <E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Jon Hunter <jonathanh@nvidia.com>, Simon Horman <horms@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Hariprasad Kelam <hkelam@marvell.com>, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Thierry Reding <thierry.reding@gmail.com>,
 MaximeCoquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix TSO DMA API usage
	causing oops
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

On Fri, 06 Dec 2024 12:40:11 +0000, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Commit 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap
> for non-paged SKB data") moved the assignment of tx_skbuff_dma[]'s
> members to be later in stmmac_tso_xmit().
> 
> The buf (dma cookie) and len stored in this structure are passed to
> dma_unmap_single() by stmmac_tx_clean(). The DMA API requires that
> the dma cookie passed to dma_unmap_single() is the same as the value
> returned from dma_map_single(). However, by moving the assignment
> later, this is not the case when priv->dma_cap.addr64 > 32 as "des"
> is offset by proto_hdr_len.
> 
> This causes problems such as:
> 
>   dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> 
> and with DMA_API_DEBUG enabled:
> 
>   DMA-API: dwc-eth-dwmac 2490000.ethernet: device driver tries to +free DMA memory it has not allocated [device address=0x000000ffffcf65c0] [size=66 bytes]
> 
> Fix this by maintaining "des" as the original DMA cookie, and use
> tso_des to pass the offset DMA cookie to stmmac_tso_allocator().
> 
> Full details of the crashes can be found at:
> https://lore.kernel.org/all/d8112193-0386-4e14-b516-37c2d838171a@nvidia.com/
> https://lore.kernel.org/all/klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw/
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reported-by: Thierry Reding <thierry.reding@gmail.com>
> Fixes: 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap for non-paged SKB data")

Much appreciated for this fix.

Reviewed-by: Furong Xu <0x1207@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
