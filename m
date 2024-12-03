Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB979E1108
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 03:03:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1E0DC6C83D;
	Tue,  3 Dec 2024 02:03:50 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 683ABCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 02:03:43 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2155157c31fso24895435ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Dec 2024 18:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733191422; x=1733796222;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtsxUMh+XFIIoRCLBTewSQ7foIeXplcGO4qMt8g9uHM=;
 b=bA/mNTmDhMNiIBHfIDRP4qherLNGdKqR5cd3BWTrpDrwRXTLkYtP1epIsM1ia30FgO
 mZELUWLfHda2IeX4E0gs/vgN2o3wS1Bw+enSweDQ/NIAqxRru26fQJZZSUDmuu/ede2m
 bOMkK9X1ptF/DtLqZ9eQ/ApNUZZ1iz0r6JjvOLN1aK/56xl3Ug7GPvbkku7mvrFIk1DV
 3wvsgIbcSm1rK13AGBvvDeuluOOj3wYXLoYgG+RKlWY2jFM32ZO0FBaand7j+fLhD7FV
 1mXU6wjhZXecnPNdWHimoEOlsbP+/7RgNupn6E49i1JouT0iLjhRNtGuq7tYfzYqsQp1
 27nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733191422; x=1733796222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtsxUMh+XFIIoRCLBTewSQ7foIeXplcGO4qMt8g9uHM=;
 b=fusCqquZVU6BZK4dueELTp0LM9XRpaWP1ch6CMDr5M6sUbdqbWxxD48a/i0crcKIbx
 IEETM5WvlylN7cRPccLN5NJtNmZzPCHvj5G03VYNzaCwK7tptQH0OM90TjRA/RvLNlPg
 GXv/Q3FRt8SS+7iz5StEPGnMgUZsh+sME5AO2zs7arAU0ohTS8Bv8E3GKVYY32wWRUYE
 e+BuMpHIghlQGCphmSQXjpSMtMpDFbioW0ErPs7xrDdShfJLptEo+ViQfx8G3sOebqD3
 gZwtVJLx5BLaclf83ZptifN/8dfhhnFJHq9jm3kaT4pMJMTT3n589Go7P5L59v45Jwk1
 NTNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDQu7utQB48AyzjiXdrw1Hlhevzij5VCKdrB1YuIjFrD0PhJn72jgiNR8ShAGUMCHePDBcPb5Zem8F+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTyIHovQpqt+6XAhmkJo7+AqkjP3YTU4NlRhYCGLU3u0nrvuSz
 la3pP3XcH+F2X5vBq0nJK/ZIGpRh4CqE0SPayJHIZR0tWGICa4Dw
X-Gm-Gg: ASbGncuk7gPLFfgbBTLsz3lVHKr854gLS1e6++Vkg2Ue2wmoaB0ietKoUmEcc7scJg5
 nJ+Hqo8kegMgZbLOov1woYWBytOkhsEBoGCF66jRULm9qRDmfrXY0WftWlqREj+Un9kv/gldevs
 AdHA/qmuqetek9UDpSsgSghjPhMeK2e403nBHkaMBgjupLT7daIYPaScNOnRANbgsmbCrWlloa0
 xwlCDZTYlEWDsPp3q4OPU56Igw+SSxdAsZXyWJ2n3nhtXs=
X-Google-Smtp-Source: AGHT+IGntlHzteD8zmiU7Ily9CXIelHYFGfjQVFqN0cuB4JWz37qzC5Ex1Ovks7LVjLzw+N8Yz3xAw==
X-Received: by 2002:a17:903:186:b0:215:9eac:1857 with SMTP id
 d9443c01a7336-2159eac1b3fmr83999545ad.5.1733191421771; 
 Mon, 02 Dec 2024 18:03:41 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2154764f312sm63036215ad.102.2024.12.02.18.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 18:03:41 -0800 (PST)
Date: Tue, 3 Dec 2024 10:03:31 +0800
From: Furong Xu <0x1207@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20241203100331.00007580@gmail.com>
In-Reply-To: <20241202163309.05603e96@kernel.org>
References: <20241021061023.2162701-1-0x1207@gmail.com>
 <d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
 <20241128144501.0000619b@gmail.com>
 <20241202163309.05603e96@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Thierry Reding <treding@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced
 DMA map/unmap for non-paged SKB data
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

Hi Jakub,

On Mon, 2 Dec 2024 16:33:09 -0800, Jakub Kicinski <kuba@kernel.org> wrote:
> On Thu, 28 Nov 2024 14:45:01 +0800 Furong Xu wrote:
> > > Let me know if you need any more information.  
> > 
> > [  149.986210] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> > and
> > [  245.571688] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> > [  245.575349] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> > are reported by stmmac_xmit() obviously, but not stmmac_tso_xmit().
> > 
> > And these crashes are caused by "Tx DMA map failed", as you can see that
> > current driver code does not handle this kind of failure so well. It is clear
> > that we need to figure out why Tx DMA map failed.
> > 
> > This patch corrects the sequence and timing of DMA unmap by waiting all
> > DMA transmit descriptors to be closed by DMA engine for one DMA map in
> > stmmac_tso_xmit(), it never leaks DMA addresses and never introduces
> > other side effect.
> > 
> > "Tx DMA map failed" is a weird failure, and I cannot reproduce this failure
> > on my device with DWMAC CORE 5.10a(Synopsys ID: 0x51) and DWXGMAC CORE 3.20a.  
> 
> Let me repeat Jon's question - is there any info or test you need from
> Jon to make progress with a fix?
> 
> If Jon's board worked before and doesn't work with this patch we will
> need *a* fix, if no fix is provided our only choice is revert.

Thanks for your attention to this issue.

I requested Jon to provide more info about "Tx DMA map failed" in previous
reply, and he does not respond yet.
This seems to be a device-specific issue, no fix can be provided without
his reply :(
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
