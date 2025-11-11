Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D922C4E859
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 15:39:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F337C597BF;
	Tue, 11 Nov 2025 14:39:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 500EEC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 14:39:11 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47721743fd0so21351275e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 06:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762871950; x=1763476750;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BbZiM31j3hF7yHeWrzWbDvWSfA60EWmb9ONaywmv4Bg=;
 b=WKVLMQZap4z2XMHJQMW03Q7ux8BMpDqA8GapqqkyGciJdhOkyRFL2tphyRxDwFz/NL
 xYc4j4HLG/U5ydvRCgPtorMFYV1Ej9rOkKWJ7vPqYcbvxlwiurExxI4w7rosf26X75Wn
 LyaItZI2BJ9U1ITBCtcZ/mY1OzWEgXc3Kb6z8x53c+KR+72fBXRtaSXXvtjddvb6fm1V
 v2ilQrQBHvUn7Ie+jxtQq5wwBciMtvcPl/HpwZ85DvHiFwb6SPFVCS2MSCTAdMYXeTNR
 SbtuIW/aRJp+p0vPP/5EwRKFStsoxfhXiUOC9eU/uM7DKw3wXZieFdv1tuzG2EktJICD
 sSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762871950; x=1763476750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbZiM31j3hF7yHeWrzWbDvWSfA60EWmb9ONaywmv4Bg=;
 b=F0BlWVpE/LN7HbX5GPRv8LCBcBabanbZD/+Gu3cwmw/TAmx1i+qoi5vpSaQdhvIo6Y
 dm1I+0MOyxA2UzmonczXb5o/I5/cejyCBC88Af36W2M5rJo7LrYseQn2MtEMGvEc7cwb
 PTF8/kJ1wzh4uA6whGNadtzm8hePesxpce9Wa5m1mPdE4lg2Db6YigiKS4oPYuD6Rhxs
 70B7esRseGASglW+nUXajtz2NqeBpRKyb0cj0tOE1xY0dMAxZIDR6cli4fw8vM93epSV
 Tnri3McvpdlvPloMbWR4KyefOnyStLkfLlg8Rt0cU3C6X63/27xa6P2CcGTMBAOUK3LU
 X3MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ2Nr1QP8noAwhqq9QjVkJjFY6+RAba2B8Dl4a6En3fXbg2wNwdRH9Dw5qtF7t0OUhokz6LqcafeCnhA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyMErm425qGJsji3gg/PHPgr1XCM51dEwGXQW2z/GnHEMeTlZSJ
 hSfixW3xiYlKFaRrjnD7YkNK7ksvr9swCuej0VUKX0IpS92mCngJwhCf4c8zXiHI9wY=
X-Gm-Gg: ASbGncsmz7D3Z+XYkGBkdlubYoAp5RypvDXAPEEYKjrMSMPqGgWTp0yUw/320T000sW
 URr8T7IdXMMM4c7PjjH+llw287gomj5Wqg0wAIiNDq5Ewbu4RglU/eBFwG1DCFZboO3miUNfQS7
 Yi9b/dJiVZRf9YXbDFey0WGtsLetxUrFhMiXocfAhi6SvqZqdEzLFDSLk31YC/1zh60t6RQ/FTc
 PODENkH1pg2vlbQXEoysAV/eJyiVUOEF2r9Zqt7DbTrf6cAk/kcBl3jHONPP3SSYa3WKshM4Ueo
 kQScWWY4cZ2eRGebLZMqvd6Pc8fQfN2AkOh9x1h4wTxc0O/KaND1W7KLTYtpnnRe+VKC3T+4+ZL
 O9Cy/vU/vHHz+lK+D1TMDM/XVhRUYX8WDBUSmerzuUZAowtqV+9J9SjOuVI0AnDb1iCVrdpJLKz
 mkdxcbwGdK
X-Google-Smtp-Source: AGHT+IEWdT0uV5uWHBTGFPHzbW80DutwkV0QHsEFy4zvFBG9BlThbgSAanJ2aRukrqMaWzzZN+v30Q==
X-Received: by 2002:a05:600c:350b:b0:46e:5100:326e with SMTP id
 5b1f17b1804b1-4777327e71bmr107922525e9.23.1762871950232; 
 Tue, 11 Nov 2025 06:39:10 -0800 (PST)
Received: from jiri-mlt ([140.209.217.211]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477815faadesm21513965e9.0.2025.11.11.06.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 06:39:08 -0800 (PST)
Date: Tue, 11 Nov 2025 15:39:03 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Saeed Mahameed <saeed@kernel.org>
Message-ID: <cgg6fxjjf6zq6yyzx4njhjmetrlhjgor4lzktwe6nls6rgqd6s@c3abd3ehlzvr>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
 <aQ7f1T1ZFUKRLQRh@x130>
 <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
 <20251110154643.66d15800@kernel.org> <aRKs6jXqSvC3G_R0@x130>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRKs6jXqSvC3G_R0@x130>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, Dave Ertman <david.m.ertman@intel.com>,
 linux-doc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jerin Jacob <jerinj@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com, Linu Cherian <lcherian@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 Daniel Zahka <daniel.zahka@gmail.com>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Srujana Challa <schalla@marvell.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Bharat Bhushan <bbhushan2@marvell.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sunil Goutham <sgoutham@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 Roger Quadros <rogerq@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-omap@vger.kernel.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, linux-arm-kernel@lists.infradead.org,
 Petr Machata <petrm@nvidia.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Tue, Nov 11, 2025 at 04:26:34AM +0100, saeed@kernel.org wrote:
>On 10 Nov 15:46, Jakub Kicinski wrote:
>> On Sun, 9 Nov 2025 11:46:37 +0100 Jiri Pirko wrote:
>> > >So, I checked a couple of flows internally, and it seems this allows
>> > >some flexibility in the FW to decide later on which mode to pick,
>> > >based on other parameters, which practically means
>> > >"user has no preference on this param". Driver can only find out
>> > >after boot, when it reads the runtime capabilities, but still
>> > >this is a bug, by the time the driver reads this (in devlink), the
>> > >default value should've already been determined by FW, so FW must
>> > >return the actual runtime value. Which can only be one of the following
>> > 
>> > I don't think it is correct to expose the "default" as a value.
>> > 
>> > On read, user should see the configured value, either "full_csum" or
>> > "l4_only". Reporting "default" to the user does not make any sense.
>> > On write, user should pass either "full_csum" or "l4_only". Why we would
>> > ever want to pass "default"?
>> 
>> FWIW I agree that this feels a bit odd. Should the default be a flag
>> attr? On get flag being present means the value is the FW default (no
>> override present). On set passing the flag means user wants to reset
>> to FW default (remove override)?
>> 
>> > Regardless this patch, since this is param to be reflected on fw reboot
>> > (permanent cmode), I think it would be nice to expose indication if
>> > param value passed to user currently affects the fw, or if it is going
>> > to be applied after fw reboot. Perhaps a simple bool attr would do?
>> 
>> IIUC we're basically talking about user having no information that
>> the update is pending? Could this be done by the core? Core can do
>> a ->get prior to calling ->set and if the ->set succeeds and
>> cmode != runtime record that the update is pending?
>> 
>
>Could work if on GET driver reads 'current' value from FW, then it should
>be simpler if GET != SET then 'pending', one problem though is if SET was
>done by external tool or value wasn't applied after reboot, then we loose
>that information, but do we care? I think we shouldn't.
>
>> That feels very separate from the series tho, there are 3 permanent
>> params in mlx5, already. Is there something that makes this one special?

Agreed. That is why I wrote "regardless this patch". But I think the
pending indication is definitelly nice to have.


>
>In mlx5 they all have the same behavior, devlink sets 'next' value, devlink
>reads 'next' value. The only special thing about the new param
>is that it has a 'device_default' value and when you read that from 'next' it
>will always show 'device_default' as the actual value is only
>known at run time ,e.g. 'next boot'.
>
>I think the only valid solution for permanent and drv_init params is to
>have 'next' and 'current' values reported by driver on read. Or maybe go just
>with  'set' != 'get' then 'pending' as discussed above ?

Hmm, is it possible to rebind the driver without fw going through
next-boot phase? I'm wondering if it wouldn't be safer to have this
pending flag set to be responsibility of the driver...


>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
