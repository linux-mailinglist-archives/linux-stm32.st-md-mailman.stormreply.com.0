Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FFBJtcLe2k6AwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 08:27:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD68AC947
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 08:27:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A6F6C5663A;
	Thu, 29 Jan 2026 07:27:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94965C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 07:27:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60T2ojYt2663817
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 29 Jan 2026 07:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ySOUOkIINh0fLQ8YNyshi4af
 ZbpfENdrNzzg6IBH0jw=; b=XQZpLCMlWMKYiSGGuigMRDbLlRF0eNdStZr7ltiv
 gFqnqnzIVXMcJpfmQXcT9igO9cgoFpKrpW1Ciy6YYpHIiInuZPpxK2hO1FAwo14n
 shAFYbqkzCoanUMiAwMDcChR6p0K300HUyOPjmLEAqLTUhUNQugKAVdruml6UeTS
 yxErv16vuxLJy9cQ8m2lkHZxIbkvD5TTpPi1ypj7IVaS/y3xcUzFNZ8hpFoFSEUf
 URLd7hVa2JUkOxIT7w9KzfWerTbTpDMCe7pFzbvUFY2vRdUYvu3PRS9YNHL9lgVf
 w+JcU/9v7mIOaO6sg1NFh8Zmxv+rX7KauhHIOQq/00UGZg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphgj9a5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 07:27:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c3dfa080662so517276a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 23:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769671635; x=1770276435;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ySOUOkIINh0fLQ8YNyshi4afZbpfENdrNzzg6IBH0jw=;
 b=e5zoEQaBUU9J4sFc83G1qXDJOFZYzQEw3+7zbOGrtyZwiGlG7i49dRQAsixjdjAtA0
 5uSxC5nKAFmNCtgD0VlckpiMshC1u6N2mLoHA8FvK8FCqOvOWN6pKN4cBFVsUbboIXai
 fAp+xZ9bE91OvHoJ9MxkyJqhTNzjyKKImb5JXg6BOe8snMpZmHS3+ixCxulxY64FXHkh
 AU6gArmZOGmUwvAT596bUGk3WVMAPAZ6b8PdxWBOO/2L81TFGnG3/PJhiZWFsRNcUffS
 NF1A1y/Og54YGDdxYDTRhoGqStklHnxALWqaggcAeduyGMQ7KaoaykOsQRM+ONX5x9yu
 06LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671635; x=1770276435;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySOUOkIINh0fLQ8YNyshi4afZbpfENdrNzzg6IBH0jw=;
 b=HdUbxOgRgdjOrtWvO5SnyRaBhilq5ILMELQDd6zyHvR+7YkX97Z6dJwBPJHnqT7QjO
 eL9OuoAixj6FddOLOJ2AZw1WtrUlQVg7o/yRCYZWXB99ilkuiO1EnutHhcdlVrrx6bEY
 pKj2jkPp42IaOElCwjOG1jb68YrVRSnN4637vRN4Jmx1A0jkoHVBSjqej/MGFQPgp0Pd
 rkCXqxZEiG2j7NU51j8Iha8PIROyaBOkCJPWW2vZ6jF8IMbnCkRApAUqMqY4JYg33sUh
 5x+HZQV99RMW6QhCWsnQAR9OtXV3z7fwG4fYe5tWNJvdBeTtRbmoF4IlLk/EEcgWUOvy
 jGLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpSr91wwMI7edXZxuuzU+ntEJPgwvS6cTWfW3u1AfUg9xu4c3HDCeGrspj9+Qahu8UU8eWm5OGiqLU3Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwcYRanthor2peJtQtRyGncOIlUTefR1qiyt7CA/UgdGE2RAYaK
 AtJXPBv07fly3FBxUHFtzrvwG0s3/rVJ1XImmtZIHFkma+68R/cWe+fmzfhruBFOpaIdFX7DTxb
 wXvmXY8siGHX5L79JT5V1UHf5ru46V8VH1i5lMSm/FX6cPDtlvxQXm9QhYXd5ccClITdYtFZUhW
 ZGCnbhi/s=
X-Gm-Gg: AZuq6aK1jf14G7txZl2efb6K1xR9Em6C3Y6gtfkVrzrMhBeRSPFHhDHtQVWZtCR8t8q
 71/jLVHUQYke2tGJi15fjLR4uL9Jzl/O+KRz7R9XG8uPmwXVa6bd2aK4lVg4JBDPZBWD8JAN8GC
 FEtEg8QZbvuPcebuTwQBkwnSd5kW+FQdwBl+uar3bps2A/WATToqok8+ueejXfN58jLP/YUT8RE
 8rjiIWGTz5XUtkb4kgx8WO/b2B9sgSoSWltgDAXK+neSWZORmTWHD9T4VxACovuxawtPkiEtpEI
 GelWT7IJ6/6ZM5FppJ7d9ZMxn5evon9aQOdv2lWDKJlV9TbUsj1/zTRQIHTJ2Aaq4JxDdHjlTRK
 OUEicWKjOtmI3mLlUQMLZSts=
X-Received: by 2002:a05:6a00:94ee:b0:823:5745:cfd8 with SMTP id
 d2e1a72fcca58-823920ddbd2mr2231133b3a.32.1769671634922; 
 Wed, 28 Jan 2026 23:27:14 -0800 (PST)
X-Received: by 2002:a05:6a00:94ee:b0:823:5745:cfd8 with SMTP id
 d2e1a72fcca58-823920ddbd2mr2231101b3a.32.1769671634411; 
 Wed, 28 Jan 2026 23:27:14 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379b2305fsm5035336b3a.10.2026.01.28.23.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:27:13 -0800 (PST)
Date: Thu, 29 Jan 2026 12:57:05 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aXsLyb+x76/WaXcs@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
 <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
 <aXjdAZeUl2Dsu4mE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXjdAZeUl2Dsu4mE@shell.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: lVPvt_eQf6_6965aDnX-jYip0gcKGBi2
X-Proofpoint-GUID: lVPvt_eQf6_6965aDnX-jYip0gcKGBi2
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697b0bd4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u3xWUgpTUxrHMWPZussA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0MiBTYWx0ZWRfX0ucRqWnVEVPA
 jVme4Eut7r+VdQii0ShcEGTksSEZItxCzQ5db4gq8LqVpWRVnYna7Qrd+8D/WeQC9KyrmuRPYsa
 03dOOPMBFSpi569Tg51bQoHDx3ceOnOP06eYP5xf/4ksO73/1n7H2KqnI+gi7WGb+GYgkWQrg0S
 Slc7dxumaz0UzHkGwF3pgOaIJcrQFWy0DpeLa4iWjKscU2BsIDp1zoRLJwSF35azidFpVFKZyzR
 emI3Nosn1t4RnwvES20dPOohfXxL/qPP1VT4FSZE3RL3ULxsExPf6EujpPCh8OXUwgCVI7yj/MR
 elMmLJQIe6fphyVGiNcAKb90cGWgc/z1oVHAg6NYN8Cb1dFvlcA28D2+1fKVL3+fXjRZWFxS0Fr
 nJaVkfiDrLDPkrzKl91sjd2fB9M4sahfPVH01Z5CpN+SBoRcIP2xhXokvBSXUcj5yvsp+PqEB6s
 FM17bTYPGkG6rc99PIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290042
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS,
 BASE-X, and inband goodies
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lunn.ch,linaro.org,vger.kernel.org,st-md-mailman.stormreply.com,google.com,kernel.org,gmail.com,lists.infradead.org,redhat.com,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 2FD68AC947
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 03:42:57PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 27, 2026 at 08:27:50PM +0530, Mohd Ayaan Anwar wrote:
> > During pcs_init, BIT(8) of GMAC_AN_STATUS is 0:
> > [    7.985913] [DBG] GMAC_AN_STATUS = 8
> 
> Hmm. This means that your hardware doesn't support TBI or RTBI modes
> (which is what the dwmac core uses for BASE-X) and what it's actually
> offering is an up-clocked Cisco SGMII implementation.
> 
> With AN disabled, this is compatible with 2500BASE-X implementations
> that do not require AN.

Yes, this hardware implements what some vendors call OCSGMII (i.e.
2500BASE-X without in-band signalling).

> > I also tried enabling comma detect during dwmac_integrated_pcs_config,
> > but I am still seeing the Tx timeouts. I remember that when I had
> > tested the patches in October (without the SerDes driver changes),
> > the link state used to flap, but the data path became functional
> > after the link stabilized.
> 
> I wonder whether the SerDes needs to be calibrated after the link has
> come up and the clocks configured. phy_calibdate() will re-invoke the
> programming of the SerDes, so you could try adding that at the bottom
> of ethqos_configure_sgmii():
> 
> 	return phy_calibrate(priv->plat->serdes);
> 
> which will do the calibration after the clocks have been set, and see
> whether that stabilises the link.

Somehow booting up with a 2.5G link is more unstable after adding this.
Behaviour at 1G is pretty similar. I kept comma detection disabled
during these tests.

I was thinking about the "good" sequence (i.e., the current net-next
tree):
	-> phylink_up
	  -> mac_link_up
	    -> fix_mac_speed
	      -> SerDes configured via phy_set_speed
	      -> stmmac_pcs_ctrl_ane(priv, enable/disable, 0)

Please let me know if you want me to try any other experiments.
Maybe I need to do some more testing after playing around with the
sequence followed by this series?

	Ayaan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
