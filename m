Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D01A1C3CC
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jan 2025 15:44:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFC8CC78011;
	Sat, 25 Jan 2025 14:44:11 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62323C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 14:44:04 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2163b0c09afso57422375ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 06:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737816243; x=1738421043;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgdWUzewQLGutGWm0yU3b4mLrNsMLQvksBxEqgoq+88=;
 b=gcTbyK5gUvfDcfuPBoy8tVUw7cpvzMW8HfdHh39/1BRB1qaRbiTbJZ4X2rbMYWJ0+S
 eXZaGaxAcPXNp4smtM9/mdyg0pDlnBGzVYgBn+9dmNygJklWiQbJu1Ns14iEDTMpoenr
 8/ZQlVJ9TJ7igdEEHd+UCX/KYcjIkjAr1pVq8LSkcj6rAxfKSUS+KSzQ/9w0pwN+4MdL
 vBGuFTWiIxP6tDZ8YlGncwge5HLiPW6zo0y5ijKzWuAruEkSiVsb/PfPSHLA8IfQ1OTL
 UOBFxH9Qzdq/8tXjUk9YDHoYRVYXBB8h4KEbhxpRJXqy6bNvCjEoZXQKHLu6YxmgAg3j
 KOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737816243; x=1738421043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgdWUzewQLGutGWm0yU3b4mLrNsMLQvksBxEqgoq+88=;
 b=lAnfFMvDXux+JVODEwlQP9+gHyS6FX+P+4bxJP7i5mKIP9C6FnT/GUd6N+MstwHc9e
 eYCltOySTSTwaLkzBobOBiC3k91HqCbfZP9KmkahI7SPPATA/ZtfMh3WTYyXHEetwF3h
 w8iNMNYMxBibPaTit6jWTvduOYRmUkEHxkbfhnqaypRRWspQk0WYcGbDzru/SLRae3NX
 nJKrgzYo2yPnmYZNo6/mJj3Iwu7JQ3K5U/TfuQnAZFjD9+TSrqjVYRpGB1SqbaDGSN1b
 qbBEFS0iFrJ/S2sWyK7xnpapiWkLo25fznpqXwFpKn9aADxxUdFT4mPKtAL9NJezanXf
 CCeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7RpSlM29NLoXO5ftw2BDwgYCTRfGGAmKvDr3yAJzZ2yaLmVR3lrzq+0ASR/3h/Tt5nV50Nf6QgQv6hw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywq4n/745ngxZLzjetjBvfpxVb8PimzCOB4Ao8kwYolWuPnKyKM
 SO6Gn26w86fuq1yjjES7eb8CtiBqB2klnPLgM7eUKE03AvIiYRs8
X-Gm-Gg: ASbGncvFwHtrmIPqyWjsKL0E7jMfcvud+Y3csyTe35nYlwTGPlJp9BQ48MYDZl07b6s
 b8dNCgbQnurdAN5BrtcnBY+V30dX28kMenNdkpOYAC2kok3MN4/k7asjVbtT62CucosK0M/DH1u
 usHwIxMn1R+VJjGGLsiYxNwkPuV+aX+SSfPRFthPJMjndBAzklDgPY0SotN/d3F6M1PYvsCGcYY
 mzIz56h7LxBZQ2275sDapuwvv8EswQsJerR3n/NpMGPX/pCAThBysDPckMzmnJkSxlwTWHZFAGW
 +w==
X-Google-Smtp-Source: AGHT+IHA+4rV48inAhpZB8n1PkLhWTEJWQ25mbCFZqNsfRh6vVjT5iQKXj9RhiGTNIQSvXLlnOGvHQ==
X-Received: by 2002:a17:902:c943:b0:215:5bd8:9f92 with SMTP id
 d9443c01a7336-21c351d328amr566604515ad.5.1737816242783; 
 Sat, 25 Jan 2025 06:44:02 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3ea332esm33441735ad.87.2025.01.25.06.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 06:44:02 -0800 (PST)
Date: Sat, 25 Jan 2025 22:43:42 +0800
From: Furong Xu <0x1207@gmail.com>
To: Ido Schimmel <idosch@idosch.org>
Message-ID: <20250125224342.00006ced@gmail.com>
In-Reply-To: <Z5S69kb7Qz_QZqOh@shredder>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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

Hi Ido

On Sat, 25 Jan 2025 12:20:38 +0200, Ido Schimmel wrote:

> On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> > On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch>
> > wrote: 
> > > > Just to clarify, the patch that you had us try was not intended
> > > > as an actual fix, correct? It was only for diagnostic purposes,
> > > > i.e. to see if there is some kind of cache coherence issue,
> > > > which seems to be the case?  So perhaps the only fix needed is
> > > > to add dma-coherent to our device tree?    
> > > 
> > > That sounds quite error prone. How many other DT blobs are
> > > missing the property? If the memory should be coherent, i would
> > > expect the driver to allocate coherent memory. Or the driver
> > > needs to handle non-coherent memory and add the necessary
> > > flush/invalidates etc.  
> > 
> > stmmac driver does the necessary cache flush/invalidates to
> > maintain cache lines explicitly.  
> 
> Given the problem happens when the kernel performs syncing, is it
> possible that there is a problem with how the syncing is performed?
> 
> I am not familiar with this driver, but it seems to allocate multiple
> buffers per packet when split header is enabled and these buffers are
> allocated from the same page pool (see stmmac_init_rx_buffers()).
> Despite that, the driver is creating the page pool with a non-zero
> offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
> headroom, which is only present in the head buffer.
> 
> I asked Thierry to test the following patch [1] and initial testing
> seems OK. He also confirmed that "SPH feature enabled" shows up in the
> kernel log.
> BTW, the commit that added split header support (67afd6d1cfdf0) says
> that it "reduces CPU usage because without the feature all the entire
> packet is memcpy'ed, while that with the feature only the header is".
> This is no longer correct after your patch, so is there still value in
> the split header feature? With two large buffers being allocated from

Thanks for these great insights!

Yes, when "SPH feature enabled", it is not correct after my patch,
pp_params.offset should be updated to match the offset of split payload.

But I would like to let pp_params.max_len remains to
dma_conf->dma_buf_sz since the sizes of both header and payload are
limited to dma_conf->dma_buf_sz by DMA engine, no more than
dma_conf->dma_buf_sz bytes will be written into a page buffer.
So my patch would be like [2]:

BTW, the split header feature will be very useful on some certain
cases, stmmac driver should support this feature always.

[2]
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index edbf8994455d..def0d893efbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2091,7 +2091,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
        pp_params.nid = dev_to_node(priv->device);
        pp_params.dev = priv->device;
        pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
-       pp_params.offset = stmmac_rx_offset(priv);
+       pp_params.offset = priv->sph ? 0 : stmmac_rx_offset(priv);
        pp_params.max_len = dma_conf->dma_buf_sz;

        rx_q->page_pool = page_pool_create(&pp_params);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
