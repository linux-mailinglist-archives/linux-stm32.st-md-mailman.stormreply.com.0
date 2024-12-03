Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A14989E11A3
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 04:16:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41CF1C6C83D;
	Tue,  3 Dec 2024 03:16:56 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BB56C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 03:16:49 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20cf3e36a76so46879085ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Dec 2024 19:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733195808; x=1733800608;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pIOFihO5lZulDGiIo9cjka3yr/GB/wNq1xFLe4/g6UQ=;
 b=Mc5ff655LZX57Q42COoqVNS+FN/9+lzaQcpE+5fniNi6FCBg66zIVSWLOJArZIm7un
 LPd3U6xFtwVvUzcIi+IOLNjdXb1+7UEkg4QAaoRQ/NHUObW5oxyX/CG8IT/DxmPenWmy
 SqNl0q9LAEzzr11kz5zsrcxaU5fJJuxcpglA7/dgch9+ZnkvuPsJ8BE197l/zQtUHT0T
 PMsGeaU1yWspRclWFSLSBNRvCqfeC2tWHXwYJHcA83VoIgDEquDuS7WAChJWKQmXkN0A
 b8d0nLGXQGokroTSkxv4s4u7acELlZzzCq1Wl9JviAnA5fGu4kz7iVSA6V//rDTEfg37
 MJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733195808; x=1733800608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIOFihO5lZulDGiIo9cjka3yr/GB/wNq1xFLe4/g6UQ=;
 b=EtA0OZb2Tnf2DOA4ktF1Z69sqP/xVuZOY5s5Y8vBPImTUE/nXGx5pvjaZ/0jMov5iN
 eZJKfanWGdFYx3lEV8+/4y8hA8gojjdn+cRtFVG8utrxzLFXoIg0bY2AtulQjYF3k5YC
 KClmq/r/TgWAoak7z04qs/gptXLqD59Hom1M3Nek/ZfudAnNqFAdIlCFBYS0UMRkM1G2
 gjdVjdIU0CKC71Z9gqTVbKAGX4xbOgh4ltNgWFQK7OHsgYUK90DmnevGMzxCeFj7hZGN
 qHv8zzeX3uYIOHAiDG4rGp4uUenczljZMt/grVSNbXXkLjvxDVviUsm/xmHWacv1xWDL
 stUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe00SWzyYWVpKYLyVui5oDlOgr7TDtuTnr1zBMMm0Fby/i7/lZrOnjU87vTKWI7WB3XtEHsyhDx3oMEA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywwn/yzLY0Mfp/xXdJrYOow4FIGUCERgZTmstdXy4btMFzNb/l4
 oYnutdBF9rcwooOvNaKlnXMLPM/eIh+vbaLUQMsYrBYR87yB2fWh
X-Gm-Gg: ASbGncvvj1WmPagzi1SA913aFV5af0OPXChcnq+BpwLY9FuKR2Z+aPqvfp3w2fQOXp8
 mYXI/nbTxMP4Ycg1kYF+93FA3ZNkZ5ug6FO1+vU+SoUxr78xqmRcrZicOVx7TVUT+Z33Gvi7Auk
 FY56rjS85F1SMxc8F4miPa8c5Pp2Ra+g+j4YWerVIiT2s2sSzSpUfCXBYZQ6/QbEQ/WHc5cdwFh
 I+Mw91iOpK9+/DTIQX3GdznxM2r3Z6yK3PMdiad33WgY+k=
X-Google-Smtp-Source: AGHT+IGkajd+wXbub1dVhniWHfN5HNxSkBjvscahKPLZ0y3K4evPJwTrTBCiH7ySlVKJBh8wV2JAqw==
X-Received: by 2002:a17:903:228a:b0:211:8404:a957 with SMTP id
 d9443c01a7336-215bd11c778mr13695595ad.41.1733195807686; 
 Mon, 02 Dec 2024 19:16:47 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21597c5baacsm24105215ad.96.2024.12.02.19.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 19:16:47 -0800 (PST)
Date: Tue, 3 Dec 2024 11:16:37 +0800
From: Furong Xu <0x1207@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20241203111637.000023fe@gmail.com>
In-Reply-To: <20241202183425.4021d14c@kernel.org>
References: <20241021061023.2162701-1-0x1207@gmail.com>
 <d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
 <20241128144501.0000619b@gmail.com>
 <20241202163309.05603e96@kernel.org>
 <20241203100331.00007580@gmail.com>
 <20241202183425.4021d14c@kernel.org>
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

On Mon, 2 Dec 2024 18:34:25 -0800, Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue, 3 Dec 2024 10:03:31 +0800 Furong Xu wrote:
> > I requested Jon to provide more info about "Tx DMA map failed" in previous
> > reply, and he does not respond yet.  
> 
> What does it mean to provide "more info" about a print statement from
> the driver? Is there a Kconfig which he needs to set to get more info?
> Perhaps you should provide a debug patch he can apply on his tree, that
> will print info about (1) which buffer mapping failed (head or frags);
> (2) what the physical address was of the buffer that couldn't be mapped.

A debug patch to print info about buffer makes no sense here.
Both Tegra186 Jetson TX2(tegra186-p2771-0000) and Tegra194 Jetson AGX Xavier
(tegra194-p2972-0000) enable IOMMU/SMMU for stmmac in its device-tree node,
buffer info should be investigated with detailed IOMMU/SMMU debug info from
drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c together.

I am not an expert in IOMMU, so I cannot help more.

Without the help from Jon, our only choice is revert as you said.

Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
