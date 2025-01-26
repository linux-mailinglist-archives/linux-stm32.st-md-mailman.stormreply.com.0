Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D273DA1C7C7
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Jan 2025 13:56:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83474C78032;
	Sun, 26 Jan 2025 12:56:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38085C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jan 2025 12:56:45 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21c2f1b610dso82428525ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jan 2025 04:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737896204; x=1738501004;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9KGHfLuP3yfCvrd6niU02daJ3MN3GQPttYCq64ynsaU=;
 b=KPWn62e9+L4tyEAFnl+bW6H74je6RHAtlzKGUiI3A6n+VpVwmdK1Nx7fla1e8ZNkY5
 IF6JzHVCzXyeUXJV1cIQUCwng4GflsZwuPapO+U54rvZ/75PKxA1nsCGNsJGai8NL/69
 vYuGFM719IUWMOgvzVq/7n3yqUJLy10BJS8p8Udxv68hHWPSDciLgtGgjtF/6g/vePYb
 yL7KTrHwlbiaQiqMvBkv3OVL8jbGJ6GH67mwPdcf2WSDajU/RHLghkQcW2svKsBySkEq
 FliDkeidu8YkjH5BETs5ARqrcb91RE9lpiIzWPEz+6bjh5YDVRaccO/H6NSeOVcdVS79
 E2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737896204; x=1738501004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9KGHfLuP3yfCvrd6niU02daJ3MN3GQPttYCq64ynsaU=;
 b=t6xfyGejWpsSEFZWaFXMldDNe5mT/D/Y/tpniERrWb1TWuVwz7sSul6Bdvrn/4R4/M
 a/hnGcGl/nUd+a2gYKWo+VXFUXetVG0juMcn23phnfHhUF9E85L5gCLevXMaF21pbbho
 C292OT+JckxYV27umKuYiAg1nxDkwkgd4qOV2nyUJzPu7Issdzzfp+Ll2QQZ87iIPvkS
 3ObmHq/XFmCbpNI9ug8XydQbOVw79DyPEDBtCIlJV15JY6s2GkrKHPcSH19LjECRDLng
 UVnIImcQ28dwF9sOZvvbQk/h35cE6juOpqKDqaKzmOoK3Rru774lX4BBdoLrau6inohl
 jQSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSWgbDqn9WLF7j6bsyZdpzZOsSmCUqIJXa5RPsBIBG4bRAcFPpC9m3AkKV11ifKPQaxwFL7cds5+dZCQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yys3fB5MSNOONPOrhJyH7fzj6R+2+K9nWMSJtHEloOEeiZaPHBT
 XKY9eU74uuxzJkMi7kcWVDTfH+H1KnUiTa6ZUzOIf+BqPABQYx4w
X-Gm-Gg: ASbGncsbztNBzRZAql2Gtk6iDJd3xRad1m+lr9MsWFdWs1Oe0Cj/yDITuVR+H2GZa5b
 JRKCgSAem4jVOku9DNEz/xgfbflarLeGmbXoG9SCBjruXQSmKDB1+GPyiQnEk+O9HallN/WMZ9A
 Za62KU6WR2Uuvsf77zh7DBISILMGZRshxaGF8UvXiLQaRVbf2QvMsb+qkeik3hr3/C6xwLl7YlE
 x+z32vap6oLwNno3rWlHslacu15UOhjuoRs36FIWdgUOcCVW9tPlwDN2/03O9lwfkbBFU6qUpMB
 WQ==
X-Google-Smtp-Source: AGHT+IGYKczzJcB4xAPfGWm8estAlez/srV9f9KVlzRCuc8f9pkMAG6+IqGmDY3HU1400WQhVY/Cuw==
X-Received: by 2002:a05:6a00:330b:b0:724:59e0:5d22 with SMTP id
 d2e1a72fcca58-72dafba2625mr53847801b3a.20.1737896203562; 
 Sun, 26 Jan 2025 04:56:43 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a77c7casm5263334b3a.139.2025.01.26.04.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 04:56:43 -0800 (PST)
Date: Sun, 26 Jan 2025 20:56:25 +0800
From: Furong Xu <0x1207@gmail.com>
To: Ido Schimmel <idosch@idosch.org>
Message-ID: <20250126205625.00006d64@gmail.com>
In-Reply-To: <Z5YeEVrI3zx4VOtF@shredder>
References: <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
 <20250125224342.00006ced@gmail.com> <Z5X1M0Fs-K6FkSAl@shredder>
 <20250126183714.00005068@gmail.com> <Z5YeEVrI3zx4VOtF@shredder>
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

On Sun, 26 Jan 2025 13:35:45 +0200, Ido Schimmel wrote:

> On Sun, Jan 26, 2025 at 06:37:14PM +0800, Furong Xu wrote:
> > The "SPH feature" splits header into buf->page (non-zero offset) and
> > splits payload into buf->sec_page (zero offset).
> > 
> > For buf->page, pp_params.max_len should be the size of L3/L4 header,
> > and with a offset of NET_SKB_PAD.
> > 
> > For buf->sec_page, pp_params.max_len should be dma_conf->dma_buf_sz,
> > and with a offset of 0.
> > 
> > This is always true:
> > sizeof(L3/L4 header) + NET_SKB_PAD < dma_conf->dma_buf_sz + 0  
> 
> Thanks, understood, but are there situations where the device is
> unable to split a packet? For example, a large L2 packet. I am trying
> to understand if there are situations where the device will write
> more than "dma_conf->dma_buf_sz - NET_SKB_PAD" to the head buffer.

Nice catch!
When receiving a large L2/non-IP packet, more than "dma_conf->dma_buf_sz
- NET_SKB_PAD" will be written.

So we should:
pp_params.max_len = dma_conf->dma_buf_sz + stmmac_rx_offset(priv);

Thanks a lot, Ido
Have a nice weekend :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
