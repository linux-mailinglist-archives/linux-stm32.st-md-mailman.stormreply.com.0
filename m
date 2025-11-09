Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BC1C43BC3
	for <lists+linux-stm32@lfdr.de>; Sun, 09 Nov 2025 11:37:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A259C1A97B;
	Sun,  9 Nov 2025 10:37:09 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0157C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Nov 2025 10:37:07 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b72cbc24637so384018666b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 09 Nov 2025 02:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762684627; x=1763289427;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wLEi3FY3R8yLDeWkcJs5QaKXb4kMtZGvr5BAdfLs/b8=;
 b=3Nl2MA+micfloH5FgvfSgKwT3fImYlUcvIbMPdC9nQUwy8zC/1Pnnkj0TxENDWaZ88
 /arNBEbAyDz0q70FaQxaoxJnSxE5NrDV6tPgnZtylsl6SB8+aMEJx4h7g9VIcyZKtriO
 SOEFYY11vHyXnDtsLqVz3AYXvl6+DHteAlBmWWal/OXp3trmIlq1uXJyFiIOA+u4P9lG
 euHE/uSpgujJQslFe2ZP9dZFn18NplNOlVORtd0ArCMwJ7/flW+xM+pKrdIf8F4KNPuy
 hsQzAyHnD1O/9GY2eOWYzBWJ+YLn+dcPrNI3LGF0qW/96gUdFqfmrKRI4HlUGqQFK2Xd
 cZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762684627; x=1763289427;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wLEi3FY3R8yLDeWkcJs5QaKXb4kMtZGvr5BAdfLs/b8=;
 b=nBueoXLNmGKyKti7Xyo5kWU4cYwzQ6HVebELTBBljmO1mL8OuPQvvb2NPznr1lwqcB
 gJsRhvNOpg1n2E4e4YM6bYltL4OtEb1i3cDNJm2nu8zpfO5lCLZJfYucXviJF8Wa/7Ft
 5WG7SDmsmuRmoXs9RdhKla6rw0RE2T/nk8yQ7DO+wwwIST0hjkmFSFtCgiYJFsaz6fA5
 8wGWHpnPbpmZmIkbWOQ7gC6MMboWDWh3vGm4fp9371Ukzsk9KBcE6y53RTLysZejBzhF
 lw1tz//JvvX5TlJUpjGbIQ5/1/Vni94AyzO9u+J2+AAtYH2qwZKOaJp6koI+kyVd3XzR
 bOlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrCSY1/NJAAfs1LxHc98druMg6Mo4y9zpHPXwvDwYdcbGEeZtBX9iNKtyRcoi9FMtjX8NoWeD8CHPKQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YywHMgA865SWj7DtdWbQDyLNUxV3ciKVnwyi+oJOudma+6hl2Bm
 SC8Kohs5M0ov7OOZ3msZZUW66KMRQd+A6Gsn67k/XPdR8Q4HYrBvi0JO7WObwBadG1g=
X-Gm-Gg: ASbGncv+NCGuSuexpcaVy/mScrajllG3ytMOZ6IINobnwKRGeHnHLe8wJA2Yh3ewgR8
 TUy7uBHUR9Gb35JwDF+FPA7Py9B2CJg3hq6A4jDK9x8k3XsLV323Otj1GpQt/QfYe9lhVZE6Anb
 SvH5UrBSOL3rFQmLC+U7q+T+7QUs7RlNTEEMSIUXiq2l1xxF04XjqqptrwSvKbn+uSjV1HiPd0q
 LXSxcyocDl92J45WIX3yEzHs2OlUc1D3DmnbslPeiPbnD8h8aio8wb3Aw6YsPLK4V8aqJz4ls/2
 wyoSU85zOWfOmdYz0xBlw5sdEXC4Nsc9sMGg+tBROsiKJGl1GozvbA0pnucwGZhsMRq1aF/6y67
 dlJ/+CoZOn6XLzeLoFRTvgrksNZHoiCmfqv2TjY2PO5mnl+Hnjea4W7Ki/jYeqWSeaivRITu8x0
 ffS6L2H9VAC3a0Muuz
X-Google-Smtp-Source: AGHT+IHaHIj6pMYgrtnGgyPEbnoCPcv9+h0U8aTlvRy8s+b5dWYGafxzPV9vjN/4tKYk16VfiLaOFA==
X-Received: by 2002:a17:907:2d8d:b0:b40:b54d:e687 with SMTP id
 a640c23a62f3a-b72e055e508mr471128366b.47.1762684626905; 
 Sun, 09 Nov 2025 02:37:06 -0800 (PST)
Received: from jiri-mlt ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa0f1bbsm758571366b.65.2025.11.09.02.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 02:37:06 -0800 (PST)
Date: Sun, 9 Nov 2025 11:37:03 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Saeed Mahameed <saeed@kernel.org>
Message-ID: <utjcgietdlf3jva5deqt5a6qtv7clkysth473hfa3szlwmll7l@6i6fqhem64mf>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
 <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
 <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
 <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
 <78db1fab-e482-4ebc-82ce-ba84b3f561e2@gmail.com>
 <aQ7XWOI68rVDRewR@x130>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQ7XWOI68rVDRewR@x130>
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

Sat, Nov 08, 2025 at 06:38:32AM +0100, saeed@kernel.org wrote:
>On 04 Nov 09:48, Daniel Zahka wrote:
>> =

>> =

>> On 11/4/25 9:39 AM, Jiri Pirko wrote:
>> > Tue, Nov 04, 2025 at 01:51:16PM +0100, daniel.zahka@gmail.com wrote:
>> > > =

>> > > On 11/4/25 6:38 AM, Daniel Zahka wrote:
>> > > > =

>> > > > On 11/4/25 5:14 AM, Jiri Pirko wrote:
>> > > > > I did some research. 0/DEVICE_DEFAULT should not be ever reporte=
d back
>> > > > > from FW. It's purpose is for user to reset to default FW configu=
ration.
>> > > > > What's the usecase for that? I think you could just avoid
>> > > > > 0/DEVICE_DEFAULT entirely, for both get and set.
>> > > > I find that 0/DEVICE_DEFAULT is reported back on my device. I have
>> > > > observed this same behavior when using the mstconfig tool for sett=
ing the
>> > > > parameter too.
>> > > e.g.
>> > > $ dmesg | grep -i mlx | grep -i firmware
>> > > [=A0 =A010.165767] mlx5_core 0000:01:00.0: firmware version: 28.46.1=
006
>> > > =

>> > > $ ./mstconfig -d 01:00.0 -b ./mlxconfig_host.db query SWP_L4_CHECKSU=
M_MODE
>> > > =

>> > > Device #1:
>> > > ----------
>> > > =

>> > > Device type:=A0 =A0 =A0 =A0 ConnectX7
>> > > Name:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CX71143DMC-CDAE_FB_Ax
>> > > Description:=A0 =A0 =A0 =A0 ConnectX-7 Ethernet adapter card; 100 Gb=
E OCP3.0;
>> > > Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secur=
e Boot
>> > > Device:=A0 =A0 =A0 =A0 =A0 =A0 =A001:00.0
>> > > =

>> > > Configurations:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Next Boot
>> > > =A0 =A0 =A0 =A0 SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0)
>> > This is next-boot value. You should query current (--enable_verbosity)
>> > to show in param get.
>> =

>> I am still seeing that DEVICE_DEFAULT(0) is read back:
>> =

>> $ ./mstconfig --enable_verbosity -d 01:00.0 -b ./mlxconfig_host.db query
>> SWP_L4_CHECKSUM_MODE
>> =

>> Device #1:
>> ----------
>> =

>> Device type:=A0 =A0 =A0 =A0 ConnectX7
>> Name:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CX71143DMC-CDAE_FB_Ax
>> Description:=A0 =A0 =A0 =A0 ConnectX-7 Ethernet adapter card; 100 GbE OC=
P3.0;
>> Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure
>> Boot
>> Device:=A0 =A0 =A0 =A0 =A0 =A0 =A001:00.0
>> =

>> Configurations:=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Default=A0 =A0 =A0 =
=A0 =A0 =A0 =A0Current =A0 =A0 =A0 Next Boot
>> =A0 =A0 =A0 =A0 SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0) DEVICE_DEFAULT(0)=
=A0 =A0
>> DEVICE_DEFAULT(0)
>> =

>
>When default value of nvconfig is managed by FW, 0 will always mean
>DEVICE_DEFAULT, and it is a way for the driver to reset back to default on
>write, but on read FW should never return it, so this is a FW bug.

What I understand is that 0 is still okay to be read back after writing
it. I don't think it is a fw bug. Also, I don't think we should expose
"default" as devlink param value.

>
>But this shouldn't block this series so just return 'default', from the
>driver perspective we should return 'default' when we know 0 means that.
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
