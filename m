Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A0A1AECA
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2025 03:43:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD780C78F89;
	Fri, 24 Jan 2025 02:43:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD2A0C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 02:43:09 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-21bc1512a63so31223925ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 18:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737686588; x=1738291388;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUr8glPor4PY9LWUaf6Hy93FwZ+OFlyI/oBmRms57JE=;
 b=mmf1iFulz2eOrYgXMBQZ3O9VHY+tRXcTcPJsVuwpBFRY9jxVZZZRd+BVDece0L7Zlf
 aB+QGA2Ff1Jvy6dLjmRvBf7LdpHu8X4T3yiYAPCfX0w+lXEQ3IssV6anO5hhyApGTvZz
 HsXKTsINoLokYD1M5f/wzpW0fYLPsby+b/V1wI65g8jxefo/3M6j5XeZPvU26hlI3fqW
 jX5B4bnsZW+uHlxS4e6KYuSsV+ySZ+U2c4AwuAcDjg3+VH/En5XVINrrm4dh4RWhBpMR
 cza5J8nh9Xx0cMwLniHbIHkuVW2u6y1EcbHU0QL8zzcW3Mc1Ouc8Q/XPlhxST2ER0uf5
 +xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737686588; x=1738291388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUr8glPor4PY9LWUaf6Hy93FwZ+OFlyI/oBmRms57JE=;
 b=U1V7Q6R2gyJ2+siMgtdzKOJGEH/jMIkvwy70W09FjZoAwMWLJXo68uQ8eDabzskyp9
 004XZyq2f69nWabG3KHnje1YR+/vFhx8YoqiDYx/wch6OORdHeEeQVIhZMrMpfFZW7HD
 2vi41a3UtA2NxFU8meXcF0Cx34sg8I7Wtkk/rfhL7GcvaClFrGnfKj55E3owcDkWypGY
 YYJ020mibEQW8OiMjHzaV4OBh/lYDdmysb45Jb7cGJKwRQchecHsnh7dxTF0xtCaBbfm
 8nlpuGzeokYKEVzb0mViyq0b+r+kxNnt4IbvwMcNKWhpVF4p7QD4OXKFycrU8zFzZP9H
 7y9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQHDn604pJVAW/hzXAAsZv2ZlTQToXSFsc8ji23CcowrAJtZOe1Ytzcd5IleQaX9ZQ4/0MdGieYpRPkA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx8b2sOoGQF6NAat9FN8LiQnHFb0+GbuFXuCdVskLWs0DrqAhhD
 Pv2OJ9jx7Hn/mPIwY0MBYP0+tIxy+amXyq+/eGnwx4ZDxzX9f0GK
X-Gm-Gg: ASbGncsK7PRwm5gSSapDjNoCB0gu3f1c1ttiKaQhThRcaO+5SGvRpaF7YQ8i3D/Visi
 /P/eRrOOzbll4bV7lu/C4cMtkZ3zWHD76Ypsrxb1FxAT0qNqi8RLYiuWpEUnw51XfIWTUCS33hc
 zgzttwDB/i4hBx7i9pfwjcOXnaLDEEyWOiS9iBZKokDOimfE8iNJyK6WpGdt/Py89LUtLZt7emy
 rvPIveYeJgYxhtLZ3KsHSK8FWQVlUPSlndb+JzL/V0rDTAN+qb9MTC8dKz2gq5K4LQjk8VM6mGE
 WtE7clfHJEca
X-Google-Smtp-Source: AGHT+IE1TjZAhue2BOZibYjg2nefwmslQC24rfaOQvrKIXArpghvt/uN1d+O/NDrEY+ImyktqYYP7g==
X-Received: by 2002:a17:902:c951:b0:215:b058:28a5 with SMTP id
 d9443c01a7336-21c355c65a3mr359067945ad.18.1737686588269; 
 Thu, 23 Jan 2025 18:43:08 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da41413e4sm5866175ad.158.2025.01.23.18.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 18:43:07 -0800 (PST)
Date: Fri, 24 Jan 2025 10:42:56 +0800
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20250124104256.00007d23@gmail.com>
In-Reply-To: <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 netdev@vger.kernel.org, Joe Damato <jdamato@fastly.com>,
 linux-kernel@vger.kernel.org, Brad Griffis <bgriffis@nvidia.com>,
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

On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch> wrote:

> > Just to clarify, the patch that you had us try was not intended as an actual
> > fix, correct? It was only for diagnostic purposes, i.e. to see if there is
> > some kind of cache coherence issue, which seems to be the case?  So perhaps
> > the only fix needed is to add dma-coherent to our device tree?  
> 
> That sounds quite error prone. How many other DT blobs are missing the
> property? If the memory should be coherent, i would expect the driver
> to allocate coherent memory. Or the driver needs to handle
> non-coherent memory and add the necessary flush/invalidates etc.

stmmac driver does the necessary cache flush/invalidates to maintain cache lines
explicitly.

See dma_sync_single_for_cpu():
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/include/linux/dma-mapping.h#n297

dma_dev_need_sync() is supposed to return false for Tegra234, since the ethernet
controller on Tegra234 is dma coherent by SoC design as Brad said their
downstream device tree has dma-coherent turned on by default, and after add
dma-coherent to mainline ethernet node, stmmac driver works fine.
But dma-coherent property is missing in mainline Tegra234 ethernet device tree
node, dma_dev_need_sync() returns true and this is not the expected behavior.

The dma-coherent property in device tree node is SoC specific, so only the
vendors know if their stmmac ethernet controller is dma coherent and
whether their device tree are missing the critical dma-coherent property.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
