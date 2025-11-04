Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D5AC31914
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 15:40:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E6E5C62ED4;
	Tue,  4 Nov 2025 14:40:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E89E1C62ECF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 14:40:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47754e9cc7fso6372655e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 06:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762267203; x=1762872003;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rEkFVWT5NBv3AWUofiDX8hOm3L/6oD6jZrSiQV9+dPY=;
 b=MJkh07DchgIyD8pQxJsKRJ8QId99dgzfD/qqt4TZtMaCGBBxRiwiZdP0kDHptpIjQ9
 1jRsu46wizemaVmnHqIka5alYD8NNCuCoxb4EqQnN05XXyQPPK3VQgVFrmliQVgKrpaJ
 SPn/716nbzQWifIQ0059LsYFUsurnI2+FbdihJzUE5ThuNhA9h4lQL8AbiuyqAmTR1w1
 1IVVZshfaNFOMiN/oa9uYqMC6EuLxyZrgGh+yhB9wRsocc4deG71EEqHOxJulXkfV6dC
 zAR5n1lS1pk5aELjZcK4WkqrmLaijOYFgTv/5SBddpZ8J2JnUgyc7KaY6nWVmJa/4j9y
 HQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762267203; x=1762872003;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rEkFVWT5NBv3AWUofiDX8hOm3L/6oD6jZrSiQV9+dPY=;
 b=sQqNi6utdS0d0lSv2zUPrrsw47d/JyTLsXgSxgVQ8c6jUybH8Th0JVzmLNd8nhhLfB
 1hCUuGmPh/6jtvl3NOjL6mnCQPTg7Nmp5EWe+zYlX4AB2TNKNx3VA77N9ApuSxQKpGDL
 Xyv9r+94ESaReABZ7mdwDzLeYVF9/MUDXYktUt8BhI5DG8Fsw35xhQqZVDR/r+YK4Ez7
 IE3B+fnhhnZHMCTY3/XEXI9pnUM3/rhJIzDce+NCUoRNSNxJGPNISGFuVxw4LGZh1tNS
 /jJVYlMR74f1bbyGZDkyNWJExYAAMDmFvv0FvI35mqhuNSv40YqYMfc9SX8KpWD9BHky
 u8kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbUAa5tJOnBAzgbFeSyB3Yb65BS17M0VZChhVSxWYmEBFPduzCMH/HeM+kT1HQhRgP0FnDPa8yjoltkQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBrjIREOhVfMH6HiwXEA9HVF/N+YddVOi5vyauSwlFPFstU1tf
 EVLOtJayhkuiMmIYwBI0rnfBY58qnvZGvwFGDFU9aKVKtmbe1/4m9gy6grW63M7Q1jA=
X-Gm-Gg: ASbGncuP4L9RjRIW2LKq9GFXMxWcJIqhfGfrIzlBSonHl137qjecf9KAAFDrK7hJcVc
 pCMopEpJjpAN8o+fDbE6Oqsr7MSOz0O/Z1hN0puDTw30j7gxf/vUwV5/g6igtjtUb5ckk+ccsId
 bzxy+sQ/WRCPRnD+hxusRY5G6bgN9DaWBKbEXQWwnPoL0BMpM8CHPOxtsDc9EyxgUpMvF4AjUCR
 RCxxMcdhJqQTjH/aR3GgWPI8mN9s82xpjMShgqdl80Fh2K1VGMxTovNxhXh5ZWsMXqG2wFuDBgu
 f0HLkUMVqy9Ut5J21E3VqmV7Jq78N9zF1mRw2RZItZvuHWQEPC+mSucTyC/MtAWMqu+rQThara/
 bD9xrSfZ707jGYLmuFb3p16BPuqrGM6QoybS6l1nkpfVALFhtafx83i17DsFJAgkb0MIwrDcTd3
 8+zozd3jg7
X-Google-Smtp-Source: AGHT+IH+wSpO7CA7uoT1EyqMsmESkKjEBIh7MZyEYgnZ6s42MxUO4LQk7aoyZId0Y8Jc8HF2ped2Fw==
X-Received: by 2002:a05:600c:1f8f:b0:477:58:7cfe with SMTP id
 5b1f17b1804b1-477307e4885mr128649795e9.18.1762267202870; 
 Tue, 04 Nov 2025 06:40:02 -0800 (PST)
Received: from jiri-mlt ([140.209.217.211]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47755932134sm18947015e9.14.2025.11.04.06.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 06:40:01 -0800 (PST)
Date: Tue, 4 Nov 2025 15:39:54 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Daniel Zahka <daniel.zahka@gmail.com>
Message-ID: <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
 <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
 <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net/mlx5: implement
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Tue, Nov 04, 2025 at 01:51:16PM +0100, daniel.zahka@gmail.com wrote:
>
>
>On 11/4/25 6:38 AM, Daniel Zahka wrote:
>> =

>> =

>> On 11/4/25 5:14 AM, Jiri Pirko wrote:
>> > I did some research. 0/DEVICE_DEFAULT should not be ever reported back
>> > from FW. It's purpose is for user to reset to default FW configuration.
>> > What's the usecase for that? I think you could just avoid
>> > 0/DEVICE_DEFAULT entirely, for both get and set.
>> =

>> I find that 0/DEVICE_DEFAULT is reported back on my device. I have
>> observed this same behavior when using the mstconfig tool for setting the
>> parameter too.
>
>e.g.
>$ dmesg | grep -i mlx | grep -i firmware
>[=A0 =A010.165767] mlx5_core 0000:01:00.0: firmware version: 28.46.1006
>
>$ ./mstconfig -d 01:00.0 -b ./mlxconfig_host.db query SWP_L4_CHECKSUM_MODE
>
>Device #1:
>----------
>
>Device type:=A0 =A0 =A0 =A0 ConnectX7
>Name:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CX71143DMC-CDAE_FB_Ax
>Description:=A0 =A0 =A0 =A0 ConnectX-7 Ethernet adapter card; 100 GbE OCP3=
.0;
>Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure Boot
>Device:=A0 =A0 =A0 =A0 =A0 =A0 =A001:00.0
>
>Configurations:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 Next Boot
>=A0 =A0 =A0 =A0 SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0)

This is next-boot value. You should query current (--enable_verbosity)
to show in param get.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
