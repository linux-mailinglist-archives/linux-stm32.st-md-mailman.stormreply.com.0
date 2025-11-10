Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA07C48E5D
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Nov 2025 20:09:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FC26C60460;
	Mon, 10 Nov 2025 19:09:37 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE1B5C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 19:09:35 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8a3eac7ca30so214916685a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 11:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762801774; x=1763406574;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kh/pfFXNphB5J8FM7JSKHKBWUvUQumq6jmykYXtU/Fk=;
 b=E5f7GS0Yvtl+WLdzWkReR2UNYY8aTWjvCJkxWaOahfgbgwY2x+9HjFWaz5/a9Ty9LA
 bIcbTylROFTxcjxaGxdjnz1plNAIoLgNvV0ualqcAUjlK5lvAJni0LbSzfhq9vOsIciM
 NP0xLq1aZQX4XnbYEIclrHiaGGUJgdMLZY6m+/2kIb9aAJ+iyFj4lwMnrLf1kW/6da1U
 EsxhM4a4PGctykdocPBJdeMLO7KLFUNpbZwgFFh5COtDihEOe5nKdZMxsrDXGxWAGFqc
 LVJ4v4YUtT9cEcUmwaMZtX0T3M8iivb1vdgHDAiPu+8WYsqQ9ETQRzFQlmC/fWSLsANE
 4aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762801774; x=1763406574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kh/pfFXNphB5J8FM7JSKHKBWUvUQumq6jmykYXtU/Fk=;
 b=kSdnBiEod0ErtQvbkGw79S2d37nF+vE27H9w8GgSUCWT04I27w/FQfYZaYpZlPSZbH
 7zoEpQPRm1BgIrmQmt6NzBNU6pNkbinq5qem6tsQrvJyPshc2DHLM6wPiZw90cpx9LJF
 nNSbburiG+cqtVNseDYjmitQ9GH39cuiMVGf1f07enNg6emKXSbsE69AnC4cLSQ4s7pM
 lt9oNBKeaeaapgqdSeyYHQPHDbk0GAHIvO2HOQf67sEgp1Rau4aFWQVB0YRASCpP4fXE
 FAavDLm8Sl0RX+2nrIpJSB64mkXn5xvZZny9U60SYdqpMbMsTFebN24Ey7eNfQbY/2uu
 fzGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcI2IgxgEpc1ZaWrjHR2uGPWEMAHYavZM+Xd1MQrRUmjvfEvDJroW974IeGwdLPqkFckRHHolKW77RFw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz0z5CQOnVUt1gcmJhhQ00jOLY5K4ZDfW21kczbA9XK1pYTOiHj
 u2hHsUaAIAOJ9V/RGhKjieRJpNOo1awCEWxdpYun6NCp/XGScYrGcFcd
X-Gm-Gg: ASbGncvvLCv/MMOKx4HUDSl4ukrkDw2EC7NGkpzjwaSXyokPec34kTxcj0t+XEc1tsw
 PnsB7KPi8IrAPU8t62ScVbHnQ5+SKRlHd2ZajaWtimNEK57PgaNpOBrLhkdbPl5CWOnJRfkZqX/
 mBWS/Rg87F6tHOPx91jfv+kJemS9nig10dBB4T+57tvpwf5t9K+AH9/5+eu8kKX5+gaCGvijvjq
 XmWnu6KZ6TghLx10KS6EGKoXafOfVOGMP+GFHaNsJ2zuJLw6RXS9oNhTA2Sewn7xQ4VWEypvGVc
 wdvfJqlyyRsJ2EeKeDMaasv7B31MIYUzn6mIb+tNXf3NmDcU9WD8LCPyfhnSIr/9yUaAW8+sBlJ
 eZiGtFL+tLTHRf/kh5sKlFtEY1w29wX35YYl7xVDkBE/zEjdZBGkOXFPr2kzUj+0w+HCIrJvCao
 NqvHzAZXdLwhftU+nPo1wzlCgPYiQX170=
X-Google-Smtp-Source: AGHT+IERCXMjJNRnt0BFVnvUSTvP7ZvwPBkw2ba4rSGkzoC1mJwG61sqECbRHnlBF54bJjOGFPQBbg==
X-Received: by 2002:a05:620a:c41:b0:8b2:1568:82e8 with SMTP id
 af79cd13be357-8b257f05374mr1272565485a.35.1762801774300; 
 Mon, 10 Nov 2025 11:09:34 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1145:4:3280:a85f:e61:4547?
 ([2620:10d:c091:500::5:432b]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b23582b0c9sm1066092985a.55.2025.11.10.11.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 11:09:33 -0800 (PST)
Message-ID: <61e1b43c-e8cf-491d-83b0-22ec46784a88@gmail.com>
Date: Mon, 10 Nov 2025 14:09:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiri Pirko <jiri@resnulli.us>, Saeed Mahameed <saeed@kernel.org>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com> <aQ7f1T1ZFUKRLQRh@x130>
 <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, Dave Ertman <david.m.ertman@intel.com>,
 linux-doc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jerin Jacob <jerinj@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com, Linu Cherian <lcherian@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Srujana Challa <schalla@marvell.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Bharat Bhushan <bbhushan2@marvell.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sunil Goutham <sgoutham@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 Roger Quadros <rogerq@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-omap@vger.kernel.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, linux-arm-kernel@lists.infradead.org,
 Petr Machata <petrm@nvidia.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mark Bloch <mbloch@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 hariprasad <hkelam@marvell.com>, Simon Horman <horms@kernel.org>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, Vladimir Oltean <olteanv@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Geetha sowjanya <gakula@marvell.com>,
 Vlad Dumitrescu <vdumitrescu@nvidia.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net/mlx5: implement
 swp_l4_csum_mode via devlink params
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 11/9/25 5:46 AM, Jiri Pirko wrote:
> Regardless this patch, since this is param to be reflected on fw reboot
> (permanent cmode), I think it would be nice to expose indication if
> param value passed to user currently affects the fw, or if it is going
> to be applied after fw reboot. Perhaps a simple bool attr would do?

I can add something like this. For permanent cmode params, it might make 
the most sense to expose current and next values the way mstconfig does, 
but that would be a more complicated change.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
