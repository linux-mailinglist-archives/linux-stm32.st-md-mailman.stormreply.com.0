Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F723C2B483
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:20:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2110C62D2D;
	Mon,  3 Nov 2025 11:20:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E70B6C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:20:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A38olJ52730309
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 3 Nov 2025 11:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dHVugL8aSPKzCU8GFFCuHSlg
 nb9t3MlUUbbP82kGwiM=; b=gfau043SgNLJpPKFQ/8FjvY/pqkLoAJsDXMQW3ve
 q9oTkE3DMJFi60QprWcGOGUztiHmNFlmTN5eC8oTItSmEAKjlDVLEssPwrrRT+7N
 yP+IAsydN42JOqHOMNx/gkqwyjm+Rz3d+uq+ltsuSYwrNG2WM8/1+ho0aOWzzMK5
 jI5lafmYJOpjKngVhqZNUtdVfovmDWvrI1s36Ih/zJ4xq8I667SABsu9E3dMvlwJ
 NTHT8ZhdZ4bFWWYIpR4cxyGNTtte/6jA9yxc45OISrjSYUM3pRWtbwh1Nhwo0XAT
 9Awx9Nosw4uJ/iO8wxbrZm69yxhB6KzC69qXvbvXV5oNNA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6s86gdv6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 11:20:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-294df925293so43751895ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 03:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762168812; x=1762773612;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dHVugL8aSPKzCU8GFFCuHSlgnb9t3MlUUbbP82kGwiM=;
 b=Lm4KNiFF4O/P9zsyGJKdKQW+nMYNYjm+foJfxMWPfEf2TfKe1tN4Q2dw+8fXA4F6jJ
 hwZ09NuMpETgj141xU0pIKH5Is3NyPOg4O8xqd5uP1+53aFj+8QZLFOyW4+6OW6x0ntY
 eE9oRwQumG8o6hBM4AS7wmKz6H3Tr2PxsC3KG+mviKeFr6EVD4BBVfFkvdKAlj/zxISM
 QPlmw9Wzn9p0qecm+4UyEGhN6NwdSm8dIA3OVTyXtBQfMFWTpSAABpPwiColcsOGwfOa
 IcokCcCRNgT98TGfzMecv2/LUU6KeQiKyzE9T88b7gLfL+OSk8/DL1RMa8/sae5WAomg
 p8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762168812; x=1762773612;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHVugL8aSPKzCU8GFFCuHSlgnb9t3MlUUbbP82kGwiM=;
 b=ME+XN/tM3OJYCd+BKseWb4rj5cGpO2/G+ptP/Xsbgt/A3Kva40dSsbW6MZc0e7+ywM
 Wru0cPwlsOgqB2/0sa37seh+wQAYeItUdMuujnb5uV2lfUGNPIrSBsCBOJbqq9YpP+qA
 2ty8rnNagqT9VvceHgmVB6DO2Bgn3ZrDDMaUw2NRr9pITkoAQhbJlF+nUhZqqvUt+GjS
 c1gEoD/jd/Pf/w7NqcISdS+fcUfVaeDkRj6TcxS7vUWBo9QfbJCP6vnjnCDu0f2jVxKR
 F0Xf0YfmjkxQTmXXKv650KX1DbU8FMk/S6+QN8LNdv2/oSav0qGk6uj43L7rL7f/eQdz
 jKQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK6x0ohJxdRArEHr0Q0OF1lDYcJXy/LTxenz+jzmx1O3ds6ubKnVGMJ37VC7b7/oAcaM7pEaiUZyERSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzvrpcnY9RsBUy9vOFaydLP8uFKSDNc+ChtesfBY1tvfPTzdIw7
 cS7ZgskOwKkLgDIJd4phxOb/Kp8A05ArFzHKOfDZpRXig5Islq64bxstID60tuhMP1R0h1KOtNs
 bCUgDq7FfnIOjcCSRsfLcopy8SCZk2xdJEN9647kNtO45qrjDrKs2HhlGGz1P8cyrxINL9u4dNr
 wQcql1dQ0=
X-Gm-Gg: ASbGncu/JzLiB/g9e4J0fdiRZiED1EkEbkcVZLVsfqFUbQUR1lGQDfIMr7saAGdQc7Q
 QRvnLdE6coijJAH1AN+uoOvWpIklc/wyp8u9HK1JWfMbzSFg2Sq4EVo5XaJZFaoaFocTO3WtFgO
 w1bwDKABA14BG0mrmO8wHvp+cWEk0U7MKCV0C2VT/5fo3YWaE9ekL7pw4timR/okV5UZCNTje+A
 8t2sq9RGAvqH0YTPb0s+1ZG0ZGX5nu/2A6mZycOXjZiXifVT9pQnKAlfTFhZFMJpHtdoT/l2vwb
 HB2W8mIW4NIb5A40dat9Rbvad0VdWdbzUKXej0iI65xZAWOnX8t0ozrpklkFBneJVqGRv7cCRL5
 WGjGBz/uHlCzt
X-Received: by 2002:a17:903:185:b0:290:9a31:26da with SMTP id
 d9443c01a7336-2951a37a3d6mr173856365ad.16.1762168812243; 
 Mon, 03 Nov 2025 03:20:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe/vgQq95tfGXYSn5QnZdARvafr4txtYxIUyWM1lnugCZTq324N2F2wV30wl4f3X69FiCxcA==
X-Received: by 2002:a17:903:185:b0:290:9a31:26da with SMTP id
 d9443c01a7336-2951a37a3d6mr173855855ad.16.1762168811492; 
 Mon, 03 Nov 2025 03:20:11 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29526871023sm115581605ad.13.2025.11.03.03.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 03:20:11 -0800 (PST)
Date: Mon, 3 Nov 2025 16:50:03 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <aQiP46tKUHGwmiTo@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
 <20251103104820.3fcksk27j34zu6cg@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251103104820.3fcksk27j34zu6cg@skbuf>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwMyBTYWx0ZWRfX4BRDbDklaNjX
 jJ0sAJ1VbPvDMlE8Yoor8PohrRSBvpzCMovdmgn5o6VX0q0bcsk07OiiNlY75b0eU1Qx1zXAEYk
 vqhm4BwVCkzOoOhNfYUiGJ7seBWzb7t2zxnvqYJFjZjmM0c/HUSwvhNWvaxzDKZwk8v/L5tFWvU
 Jm+CVMEZ2kteZWpDxjuIcsj+K6nDs2k5QpG1BUnvxjjvbcrkEeWZuhOfKOT7VwzmBCzl40TakAK
 GwXMH2x5t1UotPZQ5lcGD0m87FS739Ucm/LkotLdq5uBc8G6wN2cEpz6Srn5gr8XbGGkgfM2VKo
 UgIWHoFJgmyBYhHU+I976hYddg5fz7ZIIbDfZsWPgg/ATu556tBkc/GENS/WeNp9GeH5761Cm8t
 TWddl5N8FLC4AlpT2K6CM1WnpZtFJg==
X-Authority-Analysis: v=2.4 cv=Tq/rRTXh c=1 sm=1 tr=0 ts=69088fed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eNbwivC5fTM5P8bRvx8A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: SMHP_kjDcrUdCUz4d-e55tcBkeKFcWDq
X-Proofpoint-ORIG-GUID: SMHP_kjDcrUdCUz4d-e55tcBkeKFcWDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030103
Cc: Andrew Lunn <andrew@lunn.ch>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: phylink PCS
 conversion part 3 (dodgy stuff)
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

On Mon, Nov 03, 2025 at 12:48:20PM +0200, Vladimir Oltean wrote:
> 
> As Russell partially pointed out, there are several assumptions in the
> Aquantia PHY driver and in phylink, three of them being that:
> - rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
>   PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
> - if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
>   pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
>   that interface
> - if rate matching is used, the PHY is configured to use it for all
>   media speeds <= phylink_interface_max_speed(link_state.interface)
> 
> Those assumptions are not validated very well against the ground truth
> from the PHY provisioning, so the next step would be for us to see that
> directly.
> 
> Please turn this print from aqr_gen2_read_global_syscfg() into something
> visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():
> 
> 		phydev_dbg(phydev,
> 			   "Media speed %d uses host interface %s with %s\n",
> 			   syscfg->speed, phy_modes(syscfg->interface),
> 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
> 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
> 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
> 			   "unrecognized rate adaptation type");

Thanks. Looks like rate adaptation is only provisioned for 10M, which
matches my observation where phylink passes the exact speeds for
100/1000/2500 but 1000 for 10M.

[    9.449107] Aquantia AQR115C stmmac-0:08: Media speed 10 uses host interface sgmii with rate adaptation through flow control
[    9.462025] Aquantia AQR115C stmmac-0:08: Media speed 100 uses host interface sgmii with no rate adaptation
[    9.479897] Aquantia AQR115C stmmac-0:08: Media speed 1000 uses host interface sgmii with no rate adaptation
[    9.499634] Aquantia AQR115C stmmac-0:08: Media speed 2500 uses host interface 2500base-x with no rate adaptation
[    9.516342] Aquantia AQR115C stmmac-0:08: Media speed 5000 uses host interface 10gbase-r with rate adaptation through flow control
[    9.534045] Aquantia AQR115C stmmac-0:08: Media speed 10000 uses host interface 10gbase-r with no rate adaptation
[    9.587889] qcom-ethqos 23040000.ethernet eth0: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=304)

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
