Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D07A129F9
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 18:35:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C3F9C78F74;
	Wed, 15 Jan 2025 17:35:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD740C78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 17:35:31 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21675fd60feso154660685ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 09:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fastly.com; s=google; t=1736962530; x=1737567330;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=drwGg6Ggv7y2iA4MXzxrkwRrSRb14xgzjKtqkAwh0hM=;
 b=kjEVl5qTxEbuUGpGaqQ9kpjGjT0pKkOjV/hF6GKcT6SUEbXGjafLS62bzyvYIEmjSA
 8mPldNK8h/y8kaRnJi6vblR8UciuF2PjGC9gf0mXPvCZoWQRCMYqBSQgukHk7JTCYPyn
 wRXhPRch9eiHq9h1KbAT9ngHfzdgXjacBYUSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736962530; x=1737567330;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=drwGg6Ggv7y2iA4MXzxrkwRrSRb14xgzjKtqkAwh0hM=;
 b=T8OEq2820vG8gtwRZz1H3/Up66jicjesSa3CiZ38h7udqL4m6EahM42p4lNzP49TGi
 Wn8V5bVIaFZJwX9Gxk37MC/prMJInM2lUQEinNgXP2uAgfSIEUuDfXy0v+SDlyLb3nDY
 Rs920x008doPqc6Rr5s8vRJpi+3y2N1QxOMFBsMUAp9kj8osROdB2aOB0kMm3L+AcW8V
 VfAeTpWdYNJIBhJBbXzM+oLJoewo6ihKT0MsM0imFp8+MJ7A0aq69CLjKcIyltaiQqCa
 Ib/qerdwgtww5Ojmx/hDw+cUBNkJr7KmtU5H1S8mDxKbl7raxir0P4qoXFzX00y2dVn8
 klDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQZ7dCfPKrQLjN648CmTwygnZBFeSiA8tuzrJ6+NVR5Vt/PvTQeqoFf9UWHXM160Ktgl/sYS3jGopzlQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwIyAcEBKMkq3FyK3iBzKLYAX/kAyP4P2KHn9Ti2jT/+Bh2ea/A
 iWTlG1ksEaXW8RK56r204hAbab7H0ZhKXh3FPIwmpspuFpdGNUnJXwZ3Ff6cKj8=
X-Gm-Gg: ASbGncvfI4DRnza1u3Sl9Zab8p+nNTrzAgECWc++Z6FMgxlHWOF/fRhf6xh9niKuqee
 BYO7zj3x6vwY9Caxakroe64oT3Hn7c8MuzqX3hguBrKAucgJWbxGJtScCFpRBXpa5UIMgu331Pg
 Nf3gqjChcpz4yj1alrR30VVn52GBlwJep6omQTP97eMSyhuSHZWK92/lcSrsBL7HVHS9vSX+Iyd
 GH1xj+Dq5aY3KosL5bfbOl7l/GnbGrAY/DINJL3Y+E4skEvCsbLE6fUo2KhbEXM+Z+qbjKuvq6w
 cutuYb4eRC57Oz/0psvL3nk=
X-Google-Smtp-Source: AGHT+IHh9H8PaJ6cgjJiGUCjtnIBHOrMsIR66gZMMMrlpxbHphZLN5joIg1CaCDzyN8qA1Kz6Fewvg==
X-Received: by 2002:a05:6a00:2406:b0:72d:8fa2:9999 with SMTP id
 d2e1a72fcca58-72d8fa29fbdmr3989071b3a.11.1736962530490; 
 Wed, 15 Jan 2025 09:35:30 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4067ede1sm9361054b3a.124.2025.01.15.09.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 09:35:30 -0800 (PST)
Date: Wed, 15 Jan 2025 09:35:27 -0800
From: Joe Damato <jdamato@fastly.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z4fx32HuqJk-0cQS@LQ3V64L9R2>
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
References: <cover.1736910454.git.0x1207@gmail.com>
 <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/4] net: stmmac: Convert
 prefetch() to net_prefetch() for received frames
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

On Wed, Jan 15, 2025 at 11:27:05AM +0800, Furong Xu wrote:
> The size of DMA descriptors is 32 bytes at most.
> net_prefetch() for received frames, and keep prefetch() for descriptors.
> 
> This patch brings ~4.8% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, 2.92 Gbits/sec increased to 3.06 Gbits/sec.
> 
> Suggested-by: Joe Damato <jdamato@fastly.com>
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Joe Damato <jdamato@fastly.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
