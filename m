Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD02C43BE1
	for <lists+linux-stm32@lfdr.de>; Sun, 09 Nov 2025 11:39:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92D41C1A97B;
	Sun,  9 Nov 2025 10:39:56 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1CA1C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Nov 2025 10:39:55 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b714b1290aeso339900866b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 09 Nov 2025 02:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762684795; x=1763289595;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M9k5NU9CvPXHOQFjRFf4cyiGap0OxcUU7zGSG67KNV0=;
 b=LodUCHaLdFqABoybwFgbqElYoo5RMykvhbc6saRoIJo2gacK8oXQ5l31o/VdyYsIKh
 7cJKXcCuAxCWcBPqzXW5asqR3laKbAnXRqN+i+ZCvDHY1Fiuy8wL0MtnFviN8zrtui3O
 l8psVUSlyOvKnddKJHpAuT0EaZebAeAnZ3boVCkrBpCkoTSpfZuulJ8aUBFnC5YIxxhZ
 iJZDz1ic/Zic3nP4vDbdVD0tr2yLgcoXE+7s1fu3jZd6t3Ka4KO/updq2R07zctnVNQo
 Oya7YZRgu+hefcbFeJB0zc6nCasDH63Dq0Wcc/jR6v8FPO3ANfi5w0JaRC1r9l/tCsIU
 OBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762684795; x=1763289595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9k5NU9CvPXHOQFjRFf4cyiGap0OxcUU7zGSG67KNV0=;
 b=Rf1+YM4HS4E/+7dEWqJMcHWZiPWZjGToHfRPMqehM91UXUp7N0A9H6l0tYyIGccr4k
 RKJE39wIqoFW0fBQl9gxEeBT6sMeoJe+eTyzfMNduipRdsooW29qh9962lGGefCgCLVR
 QrV2geLYBUVNdwWW7d7yllanfN9RYmGY7ObQLto6VY4/FMaDfqT9WZX18Yx+DvtNNuva
 Rry6beoDsIDcPFz/EIuyH+w+q/3nIvmWs5YaPJWPVGgGm7t8Vl9inQU+k0vCg3R9lasS
 KH1rCiydoasRnPJr+w+dbVzzfasExmJk58VvwVnsXJafQc02V5JoWEWB92AXaSgtAxPi
 pFhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+97pL2xOTKnvRFR/7gU2/Nsu/1xJLg8Yy9nOAvYo5xNqWJB/58x8qn9b4/fn5DoUS95RkhaxliEkJ1g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzaBcyUiaEPU4g7IXQr68lrZPHamtxBnwaMowSBdV0pPZ9Pg5G7
 2DMzU/dIXxzDCwwqtJRVd3B61l23dsZ+L/f7dth5OOCSCzeV+x3Kw+3mPJIFMpvKL3s=
X-Gm-Gg: ASbGncsxfIR0VPBkjOsp/lYrSBovBdvCMoZKXjmKE+vCmccey8deYgOR0mANNKVrhS8
 wkahmIuYYEJSe8qip/eP5GQo2P8h90YluIklarWgq7xiuYXXa74gWJkngtlxurbNKvFryoV2088
 wQF9pIx0gXQ8vzAl9ebrGvTxir60qEQNdhzIz44o1D5WVg6rmPGHrmr6FNWzxFok2XDW9euAX33
 tfef5D2jb4eUYTwuokk1qtjjLsUeiSChWz0h1L/OUk3Y36buB8uLgIIOEVP2A3DWm+kS3eXgj2g
 pSMs3NrCxSEO+MnYU5HlEeBY40XTmIbAxLESFt/VM34B3fgqEiekKicMP3WnWHz+3uHKWjL/wJX
 ikWFLPs/JhBwko+KcS5Hy9vBsvYthIuq60hzTdLx+OZSwyOpjvA5V4/GI2iOa21hPY7ey7jtCVa
 32RMXP9jhQg474bn4e
X-Google-Smtp-Source: AGHT+IGiAUMWo+QvSERmjIIMyP89hGQRiOZTK4ZUYS5n6Hi8A+5UCIsgg27hL+sayFE1WTxmR9XApA==
X-Received: by 2002:a17:906:6a08:b0:b70:b83a:73d5 with SMTP id
 a640c23a62f3a-b72e0591f8dmr463037266b.46.1762684795103; 
 Sun, 09 Nov 2025 02:39:55 -0800 (PST)
Received: from jiri-mlt ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d0f3sm813415066b.48.2025.11.09.02.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 02:39:54 -0800 (PST)
Date: Sun, 9 Nov 2025 11:39:52 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Daniel Zahka <daniel.zahka@gmail.com>
Message-ID: <mfuluoi4nebyc4avj52gkfs4nqikn6uwhqnkf4o6xfswtpceuq@zhpokcx6bb6l>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251107204347.4060542-3-daniel.zahka@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Fri, Nov 07, 2025 at 09:43:46PM +0100, daniel.zahka@gmail.com wrote:
>swp_l4_csum_mode controls how L4 transmit checksums are computed when
>using Software Parser (SWP) hints for header locations.
>
>Supported values:
>  1. device_default: use device default setting.
>  2. full_csum: calculate L4 checksum with the pseudo-header.
>  3. l4_only: calculate L4 checksum without the pseudo-header. Only
>     available when swp_l4_csum_mode_l4_only is set in
>     mlx5_ifc_nv_sw_offload_cap_bits.
>
>The l4_only setting is a dependency for PSP initialization in
>mlx5e_psp_init().
>
>Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Daniel, I asked twice if this could be a non-driver param. Jakub asked
for clearer definition of this know in that context.

Not sure why you are ignoring this :/

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
