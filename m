Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCF0A11750
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 03:34:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F65FC78F65;
	Wed, 15 Jan 2025 02:34:16 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D474C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 02:34:12 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2eed82ca5b4so10252950a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 18:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736908451; x=1737513251;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mRcnAFzvXdlWc4UHhAzH7Qrj8PlVITjNIxD+h/EtYRI=;
 b=Dk7v9YkKgZcZaDAMJP2vT6a8lMfzbm6pxRzA6rvNAcdwHXyzHPp1yn/QC0XxbqwGwK
 +6wwo3GmRhq0wtn8bJmxagyWkxV8CfH3LkFzU3F8hdEkbp7n314I7p4ZShgmI82BXIRf
 Ip9Q5jm9EKsRK44+RqhFKmB6MSc2D+zXCZRfXZfhx7KfXtEbDOfQMcELm5FDnSnJUPlV
 3m989h2/wm8lJHWXpsG4IZLaFFMHo9V4B++5M5e4a07WHIb1ZtWyWGvqhCemv91JVZ+C
 fRNQmBd4FYEyycTUjg1bxhAc5xyLwV9YuqsyjGrKAU/no3VWIolOhXwcfoZQM8M2sHv2
 6r5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736908451; x=1737513251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mRcnAFzvXdlWc4UHhAzH7Qrj8PlVITjNIxD+h/EtYRI=;
 b=ZJihHpMw5CAfXWCEF7n5yf+F0zvEYg352wokF1YyG6nfeDjhEsSwqY2+LqHwUa9AmD
 l0LhvsuT6MgCNt8XUT0huyO1DWEXYoqlUHujCiyuFzwdiBD5qw51AHKhp0vGDx24qvYa
 yr475giq81cWMoUkGCT8iyArnfrfBkSvHwmFeZ24LmTBieoGqS3maIpQrBTcCfTNPFxg
 6yK2gnF4/gPlrNdXrivRugawh65H9Fxq0vpzZ01nHF7YOwETGTQnUH1HKvy/6B2b8F0Q
 E8swW7ccBe8uwC3zaSE4TcTtQYjwqTEG5lRGSdtts1RreaIapY5+Il/km7zSXS4EWY43
 19ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9DuNsWaOmYa2K4oKLWOAFmJAgJrJruMVX0IhZO8rMBtJyNzWHXnC10U1Hnpg/HaKsImlygdeHcRdezQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwwO0SYfeaFOF7MKT4tN9kkeifby9vbGnOuTLqZIggvJOHfRG+e
 F+VSzbcynJMaFaOXDY8i40hHaptZ0pa7MMjFWoQ5UZganIF9kZjW
X-Gm-Gg: ASbGncuXiXYzmfOQtd5hlghzobiu2tFXV4VzEOyJRZLElRyRtRgfSd6tFkNCORXPLym
 mUgOWq6Cxg7klDc3LVHCMYyNj4v3+DDTikHcgmbR4ev36tKogMytHtpjpCchNRTWDxe0mOSE31Z
 My5NeX5PkHbcOk6KRnc+1HmKMzthePhvfpmKEtgN+mNvAa61dktaj4riw5ncTbPdi6WeezWX7s8
 fP3wYjOwDwIeSShyo5opYAft+Vt9k/oCLzKRPTIlP+o0ENKD3vsGg==
X-Google-Smtp-Source: AGHT+IFb183ByNSb0J0nzR81UMTSxQR60wvthDYKiKHQfrnq8srKLOSDrRHT8CLMHYY7rlkQn7gsPA==
X-Received: by 2002:a17:90b:3cd0:b0:2ee:5bc9:75c3 with SMTP id
 98e67ed59e1d1-2f548f09e88mr36058871a91.5.1736908450551; 
 Tue, 14 Jan 2025 18:34:10 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f72c151cbfsm247347a91.6.2025.01.14.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 18:34:10 -0800 (PST)
Date: Wed, 15 Jan 2025 10:33:58 +0800
From: Furong Xu <0x1207@gmail.com>
To: Joe Damato <jdamato@fastly.com>
Message-ID: <20250115103358.00005b57@gmail.com>
In-Reply-To: <Z4bzuToquRAMfvvu@LQ3V64L9R2>
References: <cover.1736777576.git.0x1207@gmail.com>
 <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
 <Z4bzuToquRAMfvvu@LQ3V64L9R2>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
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

On Tue, 14 Jan 2025 15:31:05 -0800, Joe Damato <jdamato@fastly.com> wrote:

> On Mon, Jan 13, 2025 at 10:20:31PM +0800, Furong Xu wrote:
> > Current code prefetches cache lines for the received frame first, and
> > then dma_sync_single_for_cpu() against this frame, this is wrong.
> > Cache prefetch should be triggered after dma_sync_single_for_cpu().
> > 
> > This patch brings ~2.8% driver performance improvement in a TCP RX
> > throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> > core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.
> > 
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index ca340fd8c937..b60f2f27140c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5500,10 +5500,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> >  
> >  		/* Buffer is good. Go on. */
> >  
> > -		prefetch(page_address(buf->page) + buf->page_offset);
> > -		if (buf->sec_page)
> > -			prefetch(page_address(buf->sec_page));
> > -
> >  		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
> >  		len += buf1_len;
> >  		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
> > @@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> >  
> >  			dma_sync_single_for_cpu(priv->device, buf->addr,
> >  						buf1_len, dma_dir);
> > +			prefetch(page_address(buf->page) + buf->page_offset);  
> 
> Minor nit: I've seen in other drivers authors using net_prefetch.
> Probably not worth a re-roll just for something this minor.

After switch to net_prefetch(), I get another 4.5% throughput improvement :)
Thanks! This definitely worth a v3 of this series.

pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
