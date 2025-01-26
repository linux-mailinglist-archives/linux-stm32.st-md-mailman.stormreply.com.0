Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C05A1C766
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Jan 2025 11:37:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9BBFC78032;
	Sun, 26 Jan 2025 10:37:34 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74A19C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jan 2025 10:37:33 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2166f1e589cso90684875ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jan 2025 02:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737887852; x=1738492652;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ecirtyp08OWG3CnMrgQHnomqjmrMG04Uo5mPDcC4TFM=;
 b=H4i/uJZSUeyYwEoCIzAhVXX+Kzdp4/4L82xlUrb3SC5U05tK/TVD0DqPxCc4UK6Kax
 6Ed1VmSr7SQXYPdua/6JLmePR1JUw40uPmryL+3GM56SVgsblWhR49GQgDObQXhEVV83
 dl9oeS22wVDPC7lt+gqFo7Go/9OEcvvabdMUSVSmW7KxHg65t28fbPse2tnKDNd7L7kS
 YQh2ZHEETlyXDOsFF6RJMiKg6FAGdDe9aWRGWcSOGGhLVLj03kKytrhLRh4j9UKqYFnr
 1pkpP/5OFFi40f3oXGCw1dvDBUzapl2IIX71sXlJPIsCwtIyZqD0Bu3HRbfKaeykGO5b
 oIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737887852; x=1738492652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ecirtyp08OWG3CnMrgQHnomqjmrMG04Uo5mPDcC4TFM=;
 b=c5wxbSnvNvEkETpka6XHtJiFrQSqYqsatJM75r6xnQO9y0s5mo0rueRa5OfTmSZz9k
 v60eKJqmp8lks07wv+SF9qkAUv4iCnKOYZVN9EUlfeIPRCnXM4E27CvG7yGuYVsXl2OX
 0RQuB4555eiJQAYIpoPgXVnTT/eYADdpfCxECYXeVZEjGDDLj+6LWVpcOVN1chzYRAz5
 cCSmrgg0YCZU1qMNc16l/wby6KeEa5ivWuxTaRsOl/o43qm8r6C7jrXS4tL/oEn1pT5c
 vhtv5K5/zlMgr2JnjG2+Bytp+h2Fiqg9a8EINxWdNrz0ytsNFhcuxhA4uy2Te5Vs9lcV
 W9NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzGO4OsuyE+pdKw4IzqC8iWe8Yorj1nGPayUTyNcgQgh6mZm5urZJIr1g3gF/Da0tnlPiDwlR6x/Dpmg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjngDdxUlCnJHY+ghssNjuxI/+sr2aLQ006j53y6B1TBTYGpXQ
 DUkWDd7rlzxfvL0kOtTq90eqBLDgHBcsbMBy9SHrsonGQViu651i
X-Gm-Gg: ASbGncvwAi7TPV241RhVqRe6Rlab972n+6ehkRQqD5kMKCe/kogZUuqDd2mMZL9jtM7
 QNipMwonpopNwc/UEzw+s07HsZH1JMeawKT9gSBRF9NefISWWTRVw0LaVpQxZzRPgn8JoVaMWNk
 /n9t3M8zSk0PczyGTEffeXQiHVldhy0Yb2uaJmtw7slLBGOqdwpU+IP1g8LIhZMEPlGFNCGDkMP
 Rn1fyJou0ibftq3xJmjtiPVhjIhC1oPqVnwMKAshR0LXPURwoKiciefUS/mSGSSWiXKFjObQZMg
 ow==
X-Google-Smtp-Source: AGHT+IFgaTg1pL07xIfW9KbW3VjCnfQqBoPnEBRDQmsyx+On2i68wqvPnp3VcevKh/0hXbChCB3geg==
X-Received: by 2002:a17:903:32cf:b0:216:5af7:5a8e with SMTP id
 d9443c01a7336-21c355ec9c0mr536393545ad.26.1737887851920; 
 Sun, 26 Jan 2025 02:37:31 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da4141175sm44375105ad.117.2025.01.26.02.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 02:37:31 -0800 (PST)
Date: Sun, 26 Jan 2025 18:37:14 +0800
From: Furong Xu <0x1207@gmail.com>
To: Ido Schimmel <idosch@idosch.org>
Message-ID: <20250126183714.00005068@gmail.com>
In-Reply-To: <Z5X1M0Fs-K6FkSAl@shredder>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
 <20250125224342.00006ced@gmail.com> <Z5X1M0Fs-K6FkSAl@shredder>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, "David S.
 Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

On Sun, 26 Jan 2025 10:41:23 +0200, Ido Schimmel wrote:
 
> SPH is the only scenario in which the driver uses multiple buffers per
> packet?

Yes.

Jumbo mode may use multiple buffers per packet too, but they are
high order pages, just like a single page in a page pool when using
a standard MTU.

> >         pp_params.max_len = dma_conf->dma_buf_sz;  
> 
> Are you sure this is correct? Page pool documentation says that "For
> pages recycled on the XDP xmit and skb paths the page pool will use
> the max_len member of struct page_pool_params to decide how much of
> the page needs to be synced (starting at offset)" [1].

Page pool must sync an area of the buffer because both DMA and CPU may
touch this area, other areas are CPU exclusive, so no sync for them
seems better.

> While "no more than dma_conf->dma_buf_sz bytes will be written into a
> page buffer", for the head buffer they will be written starting at a
> non-zero offset unlike buffers used for the data, no?

Correct, they have different offsets.

The "SPH feature" splits header into buf->page (non-zero offset) and
splits payload into buf->sec_page (zero offset).

For buf->page, pp_params.max_len should be the size of L3/L4 header,
and with a offset of NET_SKB_PAD.

For buf->sec_page, pp_params.max_len should be dma_conf->dma_buf_sz,
and with a offset of 0.

This is always true:
sizeof(L3/L4 header) + NET_SKB_PAD < dma_conf->dma_buf_sz + 0

pp_params.max_len = dma_conf->dma_buf_sz;
make things simpler :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
