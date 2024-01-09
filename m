Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F238E828E68
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 21:15:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D3D4C6DD73;
	Tue,  9 Jan 2024 20:15:10 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08249C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 20:15:09 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33770772136so1334266f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jan 2024 12:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704831309; x=1705436109;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+B0yD7FjBgqTqLo7b2/IVuy2rnma81MvruhVPGvifo=;
 b=YVrYro7QMRv6muosfHU5i+Ub7ktii7m3/EuVfcNNdt9oN15jYtML58lDgjmOzItNzF
 qgbjSdgIXg3lizTuo/j51iHrAJZWwaaaGtlcW7iKwCH8slqliKMdd/GbEV2ZfywmXAEI
 wvS1JjLRTbA3PiXr0uJIPJmWgRNBmFaiSk8Ws7GoldKYndKaj31uIxG6/+dVR4LRJ1x0
 0XXs8WyB3O7o+H1wWCyk45CQYg/FsR++JqNj6q9voMkpKpbneslQ1XLQIXOHE6LIhwd7
 pvZF4wYP4BFItjTv+kP1DafVLCPL7QEOiqwXKE8TbiXmWFv4YaX03MlRlWkBuXInLu1K
 HsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704831309; x=1705436109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+B0yD7FjBgqTqLo7b2/IVuy2rnma81MvruhVPGvifo=;
 b=YLkDHUCbjvzKK/CklPPsu5CaVKFrxPH2PngKe4Pe6Yx3EfYVSoPxPWc9PVKnBx5AAR
 9x9WidwqbuybxNbZ+VCHQPzSoDgwLHsAxa4sfmJgSV6PuKkyfwfbIG3T5akw8dyCzzy4
 f/3ziKYVVXx5AfSYMb1JE5jNkX2Io4YpQ4CvllEJxT3IeEmlEk636HNVtuzG+0+HsT+e
 57S4lEfCnvaxolo/YTkpaXgYwaM0BgqM9mzI+dE5SDd2jjztS4s7XXPlKxYt4oeZXrCS
 0wKfvlkQwrVVRx7ulJJDDTE1niafQpTASGLciM1K4Yum3+o3UvwUZrV6ZfpfgtEy1SOR
 RhTg==
X-Gm-Message-State: AOJu0Yxg8IPbly4IPkON4T9cAdWdQoMo0qPT3wmZ2C6UG3F/9812KKB6
 MQ1LbT8TUbku2vFvn+afkH0=
X-Google-Smtp-Source: AGHT+IHCUv6AIBjSaTr/8HPaqeDyMqGvcLyT6MaYhYhF7PYV0/3Jv2044yKOg30ZXyxDXKOcj8h8FQ==
X-Received: by 2002:a5d:5406:0:b0:336:5b14:525f with SMTP id
 g6-20020a5d5406000000b003365b14525fmr1021417wrv.132.1704831309212; 
 Tue, 09 Jan 2024 12:15:09 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-3-116.dynamic.telemach.net.
 [213.161.3.116]) by smtp.gmail.com with ESMTPSA id
 cg4-20020a5d5cc4000000b003377c5b8a43sm45539wrb.93.2024.01.09.12.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 12:15:08 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: fuyao <fuyao@sjterm.com>, Jakub Kicinski <kuba@kernel.org>
Date: Tue, 09 Jan 2024 21:15:07 +0100
Message-ID: <22143664.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20240102075807.1a4cac92@kernel.org>
References: <ZYKvCQBD-SY9uVLF@debian.cyg> <ZYPmZj8l01eQsDS5@debian.cyg>
 <20240102075807.1a4cac92@kernel.org>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] gmac: sun8i: r40: add gmac tx_delay
	support
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

Dne torek, 02. januar 2024 ob 16:58:07 CET je Jakub Kicinski napisal(a):
> On Thu, 21 Dec 2023 15:16:54 +0800 fuyao wrote:
> > I don't see it in the user manual also.
> > 
> > it works fine in 100M, but it doesn't work good in 1G without tx_delay
> > in my board.
> > 
> > Read the sdk from allwinner I found in:
> > 
> > https://sourcegraph.com/github.com/tinalinux/linux-3.10/-/blob/arch/arm/boot/dts/sun8iw11p1.dtsi?L1826
> > https://sourcegraph.com/github.com/tinalinux/linux-3.10@r40-v1.y/-/blob/drivers/net/ethernet/allwinner/sunxi-gmac.c?L877
> > 
> > And I add it to my board, it works fine.
> > 
> > So, I think it may be exist register but not documented.
> 
> Unless Allwinner can chime in we should at least document the situation
> clearly in the commit message (incl. what HW+config was tested, exactly)
> and add a comment in the code?
> 

I agree. Fuyao, please do that.

Best regards,
Jernej



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
