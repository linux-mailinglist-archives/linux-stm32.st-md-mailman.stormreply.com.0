Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FB9800E88
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 16:26:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CBB0C6B47D;
	Fri,  1 Dec 2023 15:26:54 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A773EC6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 15:26:53 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-41c157bbd30so13861171cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Dec 2023 07:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701444412; x=1702049212;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Y5uUpKThH5AlPxwZK/+8ce/JS/o6enGufFaGhxrFrA=;
 b=kfP+XFX0dUAhJv/GBc3TmkBcCKNlknINcxhWuiVNNyurcV04+eeYYXpZ+V8a32k5MN
 31e5FoIlG1GvvLuSfiGPZDHgVmPDem1fkoOjiMYY+ie/Ftz9OIwmRwlzkU6UQ2f5EAd4
 Qb+DX+FRyFGZ8ht3FJCQsNKvPFnnOx23soYzHqp6jUnOrbIfC2wzO3cHqoFy2qDbdBeN
 wGj9QWbhw2TYZqGagRMlA0J3clBKRPWMKRJAwDiz4Z2wkMrj2yndPNJQJqdHiJIoGaQX
 z1BJkbXxScUnKZKU6axAWi1JOKeqPcoJrFv5AAUdETG2PYDaw/jWMiBjx+2aA8GjGRMA
 RQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701444412; x=1702049212;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+Y5uUpKThH5AlPxwZK/+8ce/JS/o6enGufFaGhxrFrA=;
 b=PWrAyMBv9dOfLLpYjIfDnX/3/IKUboLVEE0eJR/ZQ9W3E/TLNMIPk03yQ68SSrR8VR
 w3hD6xnC/PHRkofooOXOFiwvqGx/vyyH+pJut1aAj1198s6Kj9osNvtn2S6LRiigiQHZ
 cA6FDeNKsHOvEHH6cniFtBIG1r1i/313GmwAzDmim8YW171WNU/XU8rYWtDhGlMPcxbT
 Yk8cPm3PjDt2K3lW3Ny4DBTRkmbrisp3LKZ83nxLRF8BZsu70ehIpSrKaIaKMAJb51Ia
 zjbEPO4jZXfncVAwzbpBbIiX94NjODFUXcp67+X9Ocf1TuHjQPeBIPftLozO7h+mWVml
 6+Mw==
X-Gm-Message-State: AOJu0YwjzA+a+7QSxd0rN7Ey9sbL7z/Iv48RHlumenSV7dqD+FWuQIQm
 jbIdWO9ltS8oaW6PqdV2xQo=
X-Google-Smtp-Source: AGHT+IE7pPHWo5O6L0cGSE4Vt8ZBvbgF4ZpSTi5qSKV/OfAW0SLGDPjTMnoWDJPMCufOEPTxcgQJbA==
X-Received: by 2002:a05:622a:1a89:b0:423:6e29:c149 with SMTP id
 s9-20020a05622a1a8900b004236e29c149mr30091182qtc.1.1701444412484; 
 Fri, 01 Dec 2023 07:26:52 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 w2-20020ac87182000000b00423de58d3d8sm1567519qto.40.2023.12.01.07.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 07:26:51 -0800 (PST)
Date: Fri, 01 Dec 2023 10:26:51 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Bjorn Topel <bjorn@kernel.org>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@google.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Message-ID: <6569fb3b31fb6_1396ec2948@willemb.c.googlers.com.notmuch>
In-Reply-To: <5a660c0f-d3ed-47a2-b9be-098a224b8a12@kernel.org>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <20231201062421.1074768-3-yoong.siang.song@intel.com>
 <5a660c0f-d3ed-47a2-b9be-098a224b8a12@kernel.org>
Mime-Version: 1.0
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 2/3] net: stmmac: Add txtime
	support to XDP ZC
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

Jesper Dangaard Brouer wrote:
> 
> 
> On 12/1/23 07:24, Song Yoong Siang wrote:
> > This patch enables txtime support to XDP zero copy via XDP Tx
> > metadata framework.
> > 
> > Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
> >   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
> >   2 files changed, 15 insertions(+)
> 
> I think we need to see other drivers using this new feature to evaluate
> if API is sane.
> 
> I suggest implementing this for igc driver (chip i225) and also for igb
> (i210 chip) that both support this kind of LaunchTime feature in HW.
> 
> The API and stmmac driver takes a u64 as time.
> I'm wondering how this applies to i210 that[1] have 25-bit for
> LaunchTime (with 32 nanosec granularity) limiting LaunchTime max 0.5
> second into the future.
> And i225 that [1] have 30-bit max 1 second into the future.
> 
> 
> [1] 
> https://github.com/xdp-project/xdp-project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org

Good point Jesper.

Can we also explicitly document what the type of the field is?
Nanoseconds against the NIC hardware clock, it sounds like.

We have some experience with this, too. Something needs to do the
conversion from host clock to NIC clock. It is not sufficent to just
assume that the host clock is synced against the NIC clock by PTP.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
