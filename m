Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9BC46C3B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Nov 2025 14:06:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 685C8C57B72;
	Mon, 10 Nov 2025 13:06:02 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87342C030D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 13:06:01 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8b220ddc189so411921485a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 05:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762779960; x=1763384760;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4YDJ2IN0Zya8uyamUgknQHfjkE1b693NA6xUsZI23zo=;
 b=dsOFP6mTLtyPn+B/4q2ee4FtJ05JYvAH5FNft/ubLIABagCfR49xZ/FEth344n6Vsk
 Tkv1o4PO+5dN146k6k0F+n0Dl5KJ/+U9vR7mBENwbH4wMcdt6TtpLOFzKnb7B1d07SDR
 uDPkUe7FX9G2Ll16OcT2L5XtLUD+WRy9ZpIulv5k8C7FjE5HrFhWIYrRI2f2TcBohFmU
 ScpEhVtV/XNtL678ZVaCqMqu8dGos4E9dtZtL2zLZdkJpQvV1a6d6I0MDtQ9IOEgHuB+
 DIfuL/yi6GMGN/B2fKPK5cxnS2ap0oMgjJmEFducEY7p8NyMBWdWQojnfOF9rfTNLTuD
 1aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762779960; x=1763384760;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4YDJ2IN0Zya8uyamUgknQHfjkE1b693NA6xUsZI23zo=;
 b=Pl39NVkc6dYUUOdpwaTbbvfMnrjkmo5np5DPaoI0q2+Fu9555jBxFH8qogPp/jDvio
 ayUw1DGK2AQOrovj7geB+6/DrHQgANKMeLwklV2Z183UunvcnqwDgWUdw0pGcyxk7C3y
 hteudYf3ILj9nJCclSpCTy59BcxnK1HFoDGOkM2wk/R/hM0BOKegeUwHEi79KWD+8KUZ
 89ckPKz1li2CI1blfEv7xMuScJoBccuO/ofakYwu/loSxtmnAHlxStPhLyIU9Ve5GWGZ
 tj8cKJOZlZxJxyUNAx3jUcOst10Hd3F2q3RO5CTqqx3jSm99/9IrB2KwIx3DZ1kBobi+
 xC3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1BeKq/x1zGiK63U8o1LWiI5xbd+Hc2JMYKejpGAym1aqhfXFh4cPVYUsCcoSQSEa0SPejKyUOhVDD2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxAftx3XRlD2+LQKU/V8DA+o6yuQj/VJciTbGMR2hFFTr/DQ+7l
 Gm2gRfXJ86CWH5Y/+K85YyiGVtIekBQphhvCU77lAx3M6INv98niwgs9
X-Gm-Gg: ASbGncve9t4MoWe8PxM2kQl1c46Fl5yu7nSICy3W4RawDRTSJtTecXXGLpYz+/qWyhU
 dopBG+48QwCZafXCa1vh34rwm9YOZ6VKU3m8nWTKa+NCufcpEoacAaouXHqICsekdxJ3lavu28P
 tPoxXXv6zn3nTjDCX1h7sMO9n2Lov7g2WEhkJkW9tVEQMcn8xELZNQmW5T2wFaMXv+tfUjmhUpr
 Pe6DUnFPpVTPZwfXzq1Mh1pXR/oIi/GAL7ylD2HrCQPoyD4Bwh3orubLGQdQwispa41pTJp6j66
 QuzaG8TLPhQU9To73FjUjhnrYzb2Qb09iRQrwaQbfkQnEmz5BaQ6JS8+GKRZqhtt6OupmLtX1mD
 aemEwbRdpFuZIQitkN0LhYxi3/nImfX9ea9zUMZRw5/HZq4dbGj9ZxwS2So6BrEQ6CRosyx+8+0
 RqdZvzUTxy8XmTJwZQyLOlSdCFrVD85g==
X-Google-Smtp-Source: AGHT+IHItn4s7icuGrWLzo0GYDNZ1tLgQrToLgg9q7HDTX1ld16PDLwn6BncR/yAsJAAE+zCLju5jQ==
X-Received: by 2002:a05:620a:31a5:b0:88d:125f:8b5c with SMTP id
 af79cd13be357-8b257f76fd0mr1053956585a.88.1762779960211; 
 Mon, 10 Nov 2025 05:06:00 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1145:4:d8fa:5eb:c3a1:9f16?
 ([2620:10d:c091:500::4:ad9]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b2355c20cfsm1010519285a.3.2025.11.10.05.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 05:05:59 -0800 (PST)
Message-ID: <25ebaf18-f009-45de-a3e4-fe440c42ef19@gmail.com>
Date: Mon, 10 Nov 2025 08:05:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiri Pirko <jiri@resnulli.us>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
 <mfuluoi4nebyc4avj52gkfs4nqikn6uwhqnkf4o6xfswtpceuq@zhpokcx6bb6l>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <mfuluoi4nebyc4avj52gkfs4nqikn6uwhqnkf4o6xfswtpceuq@zhpokcx6bb6l>
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



On 11/9/25 5:39 AM, Jiri Pirko wrote:
> Daniel, I asked twice if this could be a non-driver param. Jakub asked
> for clearer definition of this know in that context.
>
> Not sure why you are ignoring this :/
>

My apologies. I think there was a miscommunication. I assumed Jakub's 
question was directed towards you. I have no objection to making it a 
generic param; I will do so in v4. It sounded to me like Jakub was 
wanting more information on what exactly this setting does beyond what I 
was able to provide in the commit message and mlx5 devlink 
documentation. My understanding is that this setting pertains to tx 
csums and how the device expects the driver to prepare partial csums 
when doing tx cso. I don't really know more than that. Especially not 
something like what the FW's role in implementing this is.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
