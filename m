Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1F7C30F04
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 13:16:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E09EAC62EDB;
	Tue,  4 Nov 2025 12:16:37 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9762FC030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 11:38:27 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-81efcad9c90so63291226d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 03:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762256306; x=1762861106;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ty8EjZTIjoYFxQNfFxbRC87ROx45/mTNFipe8IcdbeE=;
 b=aGS4vLAS+UkBzaQzHmqZQT21B5d/yIe+vAaGs7L/9DQQpLY9WUPDl5DQK4Eilrm5yQ
 wQ24HraLu/N3/dnyNKG3F5F6L/ikx8FWEI4OIv44XwmDEQlPPS0PvaLHbJmIbtxvrmPO
 ZFTSyKEG4SP4pjryl+FAX+2P6yasM/gaValFNGVwFLJRhDgak6SHUrsVZbIsbfUQP1To
 fvSnbZI5f6HAir8PrCFap387LpFQNEmSIbxH2dllTKd6mgeit1NPKFLTK4meIRqSeLLV
 Ik/m7ojHA/3K6DFAQY+ZvE3RdDxfFAxrmaQXRwvM0ow34a1ZE4ptQHyCC+eraMBeIoye
 0D3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762256306; x=1762861106;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ty8EjZTIjoYFxQNfFxbRC87ROx45/mTNFipe8IcdbeE=;
 b=nU4ryLJXMegfs/iyN7m4azU5eexMETavX9vtA3O+2Z5OTDMdMi/8rDjmNXUlrAPSMN
 PoC5SSfwNpvthznxpQ/5SruUIfpiI2yI9z7f3uyXSxXis8Ht7i5qPh5sQuMBgq32IvQu
 v36wWqfweVRfX6WdjLI93d004wdnqFE60BeTsXZ1lD+2WJrrRycTc9ePBD6RZ1ayzMWz
 e6Zt8IeBQiCkvul7VPReQW+DPAvOIaH0/YV9UPum0gzeyC7Nw7bd9XDfkO/JzIPM1Scc
 IAfFI/w2CWPFYU/79iGg2Eemt2qUgDCc4gXQwDAAY5Tgoo8dn8dnYzgHAdq4wIpq3Bw8
 hHDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlzAKLbrLYhUGhJjBHAq3tDayEI5jSg5hJXGnEkPSUfaZ1K68nN30RyhoxdkHxLlg+/5XkS3RrakwbOg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0gwsTRzo750rlvoPmXamororEmwPiR7/cdNNwGQWh4t6RnWLq
 P5mWLjuW4R5eIM1JcSxVNPHki2I6DwnN/bn9OZEf75EBngehSmR79zT7
X-Gm-Gg: ASbGncv36NjTy1O3WfLHM+ue6UBTuuDOzNXLDrthBtBVWSQH9amVIE5vSol6+LjhUTg
 qp5vHcJcRnPwy6JL3w8MHanYmpKXQOJPTvpV6GX5SqkrHC9PrTD9p7+Y/LeZ209lcqwS8GYC5Rp
 inCNX7/FHH7a4JLEHu5CL0ZDQGe80cVUt1moltFnp9IVbB8GmJ8Uk3daXCnuP7Fhe+8MVPYspop
 QB6P/clrnDe2xSAIof6h/0Xj6dgaOIkC6A3RBNzXcgxJqh+TltaqeOhZWOzpgy2L8VeQ0Lt8KXX
 vDEbghc+PRT7kYhel+CcqtWtvI9rHPcLfxJnISSpFtR77FSyoeyRrlFYvgdzHddv95iPQCaQj5b
 pt3wxERh3vH9UiQQEaL8E6mWrS2f+/Io29rWEmFHOjCPT3OstHVwdIlCd8EvAd0deE3/OudVEC3
 HX+zuRVmz0vjhebj5k5p/162Lf+iCIbvxhVzJFjLF6YmkZG8q8fH/C9n0=
X-Google-Smtp-Source: AGHT+IHUdWJka00diDOSm3gEz5fAX+m1eynGGsYAsxJbIC9pNdUYm3UTMBl+lsslEkQP9lwiDDKGSg==
X-Received: by 2002:ad4:5d4d:0:b0:880:54eb:f65f with SMTP id
 6a1803df08f44-88054ebf940mr96218996d6.53.1762256306128; 
 Tue, 04 Nov 2025 03:38:26 -0800 (PST)
Received: from ?IPV6:2600:4040:93b8:5f00:52dd:c164:4581:b7eb?
 ([2600:4040:93b8:5f00:52dd:c164:4581:b7eb])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88060e9566dsm19023796d6.47.2025.11.04.03.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 03:38:25 -0800 (PST)
Message-ID: <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
Date: Tue, 4 Nov 2025 06:38:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiri Pirko <jiri@resnulli.us>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
X-Mailman-Approved-At: Tue, 04 Nov 2025 12:16:35 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 11/4/25 5:14 AM, Jiri Pirko wrote:
> I did some research. 0/DEVICE_DEFAULT should not be ever reported back
> from FW. It's purpose is for user to reset to default FW configuration.
> What's the usecase for that? I think you could just avoid
> 0/DEVICE_DEFAULT entirely, for both get and set.

I find that 0/DEVICE_DEFAULT is reported back on my device. I have 
observed this same behavior when using the mstconfig tool for setting 
the parameter too.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
