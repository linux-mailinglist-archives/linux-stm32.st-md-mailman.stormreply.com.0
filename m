Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA07A42DB3
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 21:26:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 234F4C78F60;
	Mon, 24 Feb 2025 20:26:11 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56C3AC7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 20:26:10 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-220ecbdb4c2so19241745ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 12:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1740428769; x=1741033569;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TgBgqyu4tKatdMND7+/18VtL/05cP3jlzOPJySx+wMI=;
 b=CtULbKynvK8t5yrXfxIqTGMhUQEV3wAsV4cY+5G7Vfo/ODqZ2Dz8NF1Y20y7fnkQws
 gF5xqIYqQmsjwgYgfdecoR8iMMyKR08Y9umHK/qlBcFDaEB67n5psxvgYear3kC7Oyw5
 LA/xfwnepebqEjEW+vCQgiF52JeK+zVPonwomzbRoXQnILzUj0ga68mu3k4g1MRDRZhU
 3p+cUbwdf32zr1w6r8m6HHBZb7xm38nOo1HQs4vw62CN0SEQW6cabdju8iGQyGCcRrt6
 rURQdmxIdyBBBCcmqKzbsn0Pu1ralof/8azX/+ATZUOtCHIJDVVGB+M7Vexq7r5/xvCt
 di1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740428769; x=1741033569;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgBgqyu4tKatdMND7+/18VtL/05cP3jlzOPJySx+wMI=;
 b=EbUA0BNCI92q/j319s96BojIWxexq1g5vDYB8ed2s+MNZC7rnCPASl8axfG/meTaQi
 WgIB3GoNqKqbDwrgMiBWxMdqb541PhPSKZdE82LimY/R7VCODh5q4MZJ9H/dR7XDS6DW
 G9JaN1xZ2ki+4d4WMze04JYu6OUVGfayiFwAhkl3mS3wuq7AXHNYcRl2/SFadLLkSJni
 NQ+4D3UOkXhBLRA4WB4n0mJTVCMiX7VhR2x/eHAH6xV+5K7gBT5y+fLl9BlLCS3pjJd0
 ReSsDTnkK+epUC8WSNktuwrIe1IhKrXEBG+Ak/8eByc3OgTxyw/d2E7KIk4giVlAkYId
 kzSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbgKeTBwZ5rOFLCUCsTuOAR8ubxuBqCcxnz/yCDFs8q0CefrtkKeYgBRVf4Za/NVnAiTP3ulK0j3mRlg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4OS7ircevJU4BXUDDxsNvuL1YRAFoxFaFObE6Omp61kjNFd38
 hdYihvKstT5+n6Bs25EWJuwixnLQyx8UZ+Pq/t4FDFklLqyEuTGEoJovr+rtaB8=
X-Gm-Gg: ASbGncvEzkPiCRt7S0ToNH0oz1D+ATVcORaHM25tp3fMypnuVf3hdzU9UpDojrS3eIV
 iZ1LnLTQCF/a/AOHSTL9JgMS6rZCwYFRF0Zih090/6uawPMf1xhSpxFMQfRFxtORWLiXFKEMqwq
 wIrj/9Sr8etmBiBxY68hQoRigKef4HEEAniOYouryyXKjoHbOts2Vj6ddIoY/nsJovtsl6JrCkt
 3H26a1THKh7tL0aygBWqBWRuvJruExx1PYomKA8d3A2oWaOoPp1cFscHP3AAG9bycn2OQGenZ1H
 DseODBc=
X-Google-Smtp-Source: AGHT+IGji8X4JW99D82J1gNUv4VGOe8Di1Z0iUYkFrnt5DobfIi0K1SZsszK6YCNFA/kxOX0YVJuVQ==
X-Received: by 2002:a17:902:e80d:b0:220:f069:eab4 with SMTP id
 d9443c01a7336-221a0ed87cdmr259370375ad.22.1740428768763; 
 Mon, 24 Feb 2025 12:26:08 -0800 (PST)
Received: from x1 ([97.115.231.194]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb12e4casm7009510a91.48.2025.02.24.12.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 12:26:08 -0800 (PST)
Date: Mon, 24 Feb 2025 12:26:05 -0800
From: Drew Fustini <drew@pdp7.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <Z7zV3Z8L6PQCLKnC@x1>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-riscv@lists.infradead.org,
 Fu Wei <wefu@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: thead: clean up
 clock rate setting
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

On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series cleans up the thead clock rate setting to use the
> rgmii_clock() helper function added to phylib.
> 
> The first patch switches over to using the rgmii_clock() helper,
> and the second patch cleans up the verification that the desired
> clock rate is achievable, allowing the private clock rate
> definitions to be removed.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 28 ++++++++---------------
>  1 file changed, 9 insertions(+), 19 deletions(-)

Thanks for improving the dwmac-thead driver. I've applied it on top of
next-20250221 and booted on the LPi4a board. Ethernet networking is
still working correctly.

Tested-by: Drew Fustini <drew@pdp7.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
