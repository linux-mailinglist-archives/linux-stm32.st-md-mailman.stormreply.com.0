Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E230C4E86E
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 15:40:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30980C597BF;
	Tue, 11 Nov 2025 14:40:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DA1DC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 14:40:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so31987835e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 06:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762872019; x=1763476819;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qp5l9CleBH+90IDb02IwKlf8FOy6cwp5KCYKsO335Ps=;
 b=Dwyk0dUDZC4yhsDHG+z18ZaYQhh9hFO+vU4hSvcHJl1wcR7w/66YtNt1Zrc6WR9yIN
 a93cNArchUBdgmM1a0BHGGkRJZdM3YqwrLGdDr416YoXjT8Zf7toM8jdTqQ/572qaAqN
 hiz4LsdpLupoMSVgONWJLeKGaxGJcXuJHshBI8FM1avLM39mfMERE1I3khD1mcj/idFb
 HxuxnfbXQaqeAitnOTpLz9/8NwlnFvKNUab0fZcBSoNzRzHSHrPRg+A2qglD2KBTuUAO
 kYMyozDjeimy/GN31h+3GZOGKJv9Zdytd6kIDy4ZXWM1ALU8TqAiDn441Mdy6difJfp8
 eCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762872019; x=1763476819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qp5l9CleBH+90IDb02IwKlf8FOy6cwp5KCYKsO335Ps=;
 b=nWbJDrRFDtiiuMfpFHSKTvXKwkxmM4HHZww/I85YwI3utnG5UusQWy2vikaSvjBFWy
 dn36JeExE0edpv0gOwMfAlw94W96wZFsudzzYRjBYS6xVM7F1c2YcNj3Llhodx+9vKDI
 MnSOZ6S5OnGPw68uF4dBEB21pkBtFyUMYr4g9pqU0CO3vOou0DY/iTeZtYpNGcNt6OWM
 9NJDOxvxTR0F8bJ0+S9Fi4jS/RME21f3wgwje0qvOcgdY0D9+jtVYIvnu/PxZmi6NHjD
 d3Kzqi7KhEtOs4oHo4If1ZgryOzKrClxCJNKyP+ogNlN1+h4EBf8BZvkoJPR4xVUWo7d
 Qf3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDK3FGVzVKZX16v1taq1/nVdejKkFNTAmBLTqDWyob0GJoCY+RC8UfKLP1+YZT1vZdMQhH0gB/DPk5Sw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxMdG6AOaslfL7CWrKx0uxIhG4xompUhGKcsX4izUcwS6qLsV3m
 PQKZntc/ysN+VwigglIyWzUDD2smZvnnunepqIA76vQcl/VDDJJdFLVHd5Ee6b95e2g=
X-Gm-Gg: ASbGncsBxRvCGT/wcnEOXSpRa46xOjCedZRTJMK41AUmvJbhzTRAFwEXor+ysTIvYCA
 565GpYeOGrNQcf3hWbWI4iGVt62QqEDz4xi1NkwX8ulOwLoI9f4hvHg1qhMhbizNC0iwMhq86kw
 DnHmNldmPr1iflsiQgxkkUkLvchD6qszA8oEhivkTE3RkwBvUQZqJBdok+ZhmCUD9mHl0KlzvMG
 b3TwwXQ8jbPq0bGFfZPB1NLhOQNHOiN9Q1cY4O7RmqeX2MjEvmv6enojBCCnJmS1QT6drNYUDrc
 lgvHRyiQPKCfnXW1D2Rhhbb0ene3f6hOZg2p1s5m5xiFM7iMv6BlhTzRKJD6DpifLEp329mWGsf
 DDX1IFiCc4WrmaCF9Hc4p2UeSdC26mo8v13u/HI/2vq41NH4OLjZlHpfK0q+vbPUMKIU7wNV1fN
 UyW7YZhtCGwLbrPt8Ylq8=
X-Google-Smtp-Source: AGHT+IHiizBIJOZcrq74AaefcmPGJqcFfS/u1VH/cPNz5auadvSnqgCV70GeJMtA2paFsPgExMwhBQ==
X-Received: by 2002:a05:600c:4508:b0:477:7bd2:693f with SMTP id
 5b1f17b1804b1-4777bd28628mr69798945e9.6.1762872019298; 
 Tue, 11 Nov 2025 06:40:19 -0800 (PST)
Received: from jiri-mlt ([140.209.217.211]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce211d8sm392840305e9.11.2025.11.11.06.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 06:40:18 -0800 (PST)
Date: Tue, 11 Nov 2025 15:40:15 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <xmqe3svfethqm3sqnu2ay27k65gx4njptvs7firsfqn57cwjat@ho3cox3ip2fq>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
 <mfuluoi4nebyc4avj52gkfs4nqikn6uwhqnkf4o6xfswtpceuq@zhpokcx6bb6l>
 <25ebaf18-f009-45de-a3e4-fe440c42ef19@gmail.com>
 <20251110145831.15872b86@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251110145831.15872b86@kernel.org>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, linux-doc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com, Linu Cherian <lcherian@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Srujana Challa <schalla@marvell.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, Dave Ertman <david.m.ertman@intel.com>,
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
 netdev@vger.kernel.org, Daniel Zahka <daniel.zahka@gmail.com>,
 Mark Bloch <mbloch@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 hariprasad <hkelam@marvell.com>, Simon Horman <horms@kernel.org>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Jerin Jacob <jerinj@marvell.com>,
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

Mon, Nov 10, 2025 at 11:58:31PM +0100, kuba@kernel.org wrote:
>On Mon, 10 Nov 2025 08:05:57 -0500 Daniel Zahka wrote:
>> On 11/9/25 5:39 AM, Jiri Pirko wrote:
>> > Daniel, I asked twice if this could be a non-driver param. Jakub asked
>> > for clearer definition of this know in that context.
>> >
>> > Not sure why you are ignoring this :/
>> >  
>> 
>> My apologies. I think there was a miscommunication. I assumed Jakub's 
>> question was directed towards you. I have no objection to making it a 
>> generic param; I will do so in v4. It sounded to me like Jakub was 
>> wanting more information on what exactly this setting does beyond what I 
>> was able to provide in the commit message and mlx5 devlink 
>> documentation. My understanding is that this setting pertains to tx 
>> csums and how the device expects the driver to prepare partial csums 
>> when doing tx cso. I don't really know more than that. Especially not 
>> something like what the FW's role in implementing this is.
>
>Right, per To: field of my email I as asking Jiri for clarifications.
>
>Since we struggle to understand the semantics nack on making this
>generic. Chances are whoever reuses the "generic" param will have a
>different interpretation of its meaning, so what's the point of making
>it generic.

Okay, I don't mind that much.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
