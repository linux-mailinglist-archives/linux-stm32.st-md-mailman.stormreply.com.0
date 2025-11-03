Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7117C2AFE2
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 11:19:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99928C62EC9;
	Mon,  3 Nov 2025 10:19:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D37C8C62EC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 10:19:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A38vxAV1644781
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 3 Nov 2025 10:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8knuqx5dfDYzPF2+hLSNPS/P
 qg1EONZiI3O9dCKDeTE=; b=djPP1mm0aJ7VX4dcT/d0PQnmWqEhFzz/mtXA+/bF
 tE3R4rFCxO5vLEl0X0ByIA8soOO2KYMl1pVAGGYziZby90gF+VuQNnJbsDAQ1yvc
 OzjNVOJ/ad1Z2/x+q5+f2v0d2f/bftzI4kJgQ1tUkuhZ2iQn245y+9trM9A4ARWK
 QQ0ieuxVb4TbQ+PhT9bID8haq2OHOjUlX2gP36/YshVts+l0OQcnYAQJMFTjlNo4
 VW7WpkPWnB7bGfA5c0bH+bQTqRz1DUGulUm+Px194iwn4iPsQePgC7Q+iR39MWw/
 hjwYC5ygeh5w1w20dFELH8dHpaSN6xwek3dS7peM00v0aQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8m8t6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 10:19:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2958a134514so13640415ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 02:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762165142; x=1762769942;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8knuqx5dfDYzPF2+hLSNPS/Pqg1EONZiI3O9dCKDeTE=;
 b=EgEAqSK0w/sANG2s4AZmRuWgnFRBUR1aTNQSvHQYR1T3c2rxkUqVlwCgLI7NYjKK15
 kn6f3qmPocScJV/OIkvz2vjGYPTs7KWJLT0ZYlHL8Ii8JbOsBIbm7u1XB+IoGXnTS20o
 n+tDfEQeg/LxYvL082oIG5FbBZfWTG4edNM8zSF3AUbxdjF6PbhmXghv9noHfYAaoSXS
 Ci+lAsTk1Ljin/X+Lbf5hjDRNM7PcIPcWXbLr6qdW+KjgPp1olyPUXPdh8+UtkBy3OBL
 jqaqbFt6f+JeXfdNmQPDv8aSgUbXOSElOjKD3dnVxVcBox6G7HFDHfD3+QQ4s77g+W+M
 wwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165142; x=1762769942;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8knuqx5dfDYzPF2+hLSNPS/Pqg1EONZiI3O9dCKDeTE=;
 b=cDPqrS6f0dorjxLlUfzQkICPOLs1crt86bzOcFpqyrVyPW5olqE7rfZFcTSlhZuCFN
 TdrVp5/39nqXPPIjdRZ487OtG1B88OAPGlgXa5dvb20UB6j5QzYXA4i/YBGORcBd38ev
 +ii6z0T418CmMpcbTDfDd5fFz/oo7EISYXMKw1g19wFt7Dl2tG+dOpbfQ2Ee+exaCSgS
 U28fQxxdm6Hb+T2AGNB4+1ll6+MdegCuy8K+d+1RkJqiRWDCilnyDOGmCHU3oyK7lt5L
 7s6HsBvD1NVe8debFKdejrUBwjVvMqkjh/LC30rpoourizOPRNkpjeqa91EL5AhfecJi
 RWFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF0ZpG41fDcJ+ZrQUthGnoQnqrmxhSbwSv3DdxNY3l26uOU4nCQlv5UO5DqvVR8rimZcJQBs9CZO8NTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyrar5t71NtZ9AZUhNLhhMTuy9mdVbLGXmXltp0q3zQw3+ROVgb
 ezo7hIioC3E8vBOiQDLXd2QjB1vLypVf+kdQS6Rdnm1IuUvZJp0ribcer+ltohbDhPaPVi5pxtZ
 l+iUV1Te8yw4JL4JAtpRV3qvRa0etO1vmUIkJIRac+EtEANQsJtlJ3cvW9PZdh+Mw2q3RBKzbi+
 OgvCKLyCw=
X-Gm-Gg: ASbGnct1VApAIrfdSM4a5J8bizf2TrxczCCTyQJ0tRnKJQri1zhsXzVFRybpfqu4ite
 7EuAkMhyQOGoHj3gKxp3CBswCSuiFOvL/oYsE7WrysyjbJ5vbsqGmXgmZPqWZjT1i26bSHfbCms
 3N9fCXXn1ZeErqk89anxuDH3TTWr700zhGk8F9wvfT2PjD3n1JpDJwUHlSEfQRGiXPmYJs+Dzik
 xkQ32NU1cpVbKiW4Ii0z0e56v3yO7B4VT2Ih95Zj972snqm/oY6J1sR0SLMeoXFtnca6f5y4wZy
 OnsNOuZ5RrWWJ9Ij+yufT9+dLnTE0IJbtCaDDC+cGJmFV+BzymSSNYigzrE8oxAb3RFY35Rrpff
 nEcQaLZTfyxbS
X-Received: by 2002:a17:902:c947:b0:295:223b:cdee with SMTP id
 d9443c01a7336-295223bd149mr141656905ad.14.1762165142277; 
 Mon, 03 Nov 2025 02:19:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgdcfwBp3HqfGTGr6bQPq69wlWi0qcKLftcjaOWW4Q7ozE69g6Y2EISLsaJgc9EFYI4f2kwA==
X-Received: by 2002:a17:902:c947:b0:295:223b:cdee with SMTP id
 d9443c01a7336-295223bd149mr141656545ad.14.1762165141713; 
 Mon, 03 Nov 2025 02:19:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-295268cc48fsm114249025ad.49.2025.11.03.02.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 02:19:01 -0800 (PST)
Date: Mon, 3 Nov 2025 15:48:53 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aQiBjYNtJks2/mrw@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: _zEtHPbp_2HupYZlmm4rm41Moq5QBCCD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5NCBTYWx0ZWRfXyV0rSzcvVvCz
 YXTcj4JW3gt1k/Bitno8yBUGCQXmbnZYQP2UhGTgRbMDwou0jIkAkYBcktLa994axdxwvPTSHkg
 NLWMArYK3wtqhvpYtA91IMrtGcAykbO9QMGW216B1p0CI29XifCd/M50Avdcs96q+3Z+vWhS+fa
 Q9wbY2PLBJ5k05OWNK7v6/nto9U24WB5pIDFXfURo+9jvjiF0pB6mXoPYWYQ9NEwPZkmECz9yGg
 UWiKko58zzzVDW78t0wog7qHcogzXpt8GMC18uYpaMWOz8x411BWqoAhhKyjZU8VCDOA1PdDDL3
 BOXJmqABuO3hkm8N6mUBFhqauPxNTac+uQ5idZf4SZrPxoVbZDdExV8ZuDgWV6maWyIpdM5ZpuV
 MjVVssbdK9o8shPcMrQfFuxo/73hlA==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=69088197 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=UWWzG2wtzVmZz2Rg0KUA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: _zEtHPbp_2HupYZlmm4rm41Moq5QBCCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030094
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Furong Xu <0x1207@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Yu-Chun Lin <eleanor15x@gmail.com>
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

On Mon, Nov 03, 2025 at 09:52:38AM +0000, Russell King (Oracle) wrote:
> On Mon, Nov 03, 2025 at 02:28:24PM +0530, Mohd Ayaan Anwar wrote:
> > On Thu, Oct 30, 2025 at 03:22:12PM +0000, Russell King (Oracle) wrote:
> > > On Thu, Oct 30, 2025 at 03:19:27PM +0000, Russell King (Oracle) wrote:
> > > > > 
> > > > > This is probably fine since Bit(9) is self-clearing and its value just
> > > > > after this is 0x00041000.
> > > > 
> > > > Yes, and bit 9 doesn't need to be set at all. SGMII isn't "negotiation"
> > > > but the PHY says to the MAC "this is how I'm operating" and the MAC says
> > > > "okay". Nothing more.
> > > > 
> > > > I'm afraid the presence of snps,ps-speed, this disrupts the test.
> > > 
> > > Note also that testing a 10M link, 100M, 1G and finally 100M again in
> > > that order would also be interesting given my question about the RGMII
> > > register changes that configure_sgmii does.
> > > 
> > 
> > Despite several attempts, I couldn't get 10M to work. There is a link-up
> > but the data path is broken. I checked the net-next tip and it's broken
> > there as well.
> > 
> > Oddly enough, configure_sgmii is called with its speed argument set to
> > 1000:
> > [   12.305488] qcom-ethqos 23040000.ethernet eth0: phy link up sgmii/10Mbps/Half/pause/off/nolpi
> > [   12.315233] qcom-ethqos 23040000.ethernet eth0: major config, requested phy/sgmii
> > [   12.322965] qcom-ethqos 23040000.ethernet eth0: interface sgmii inband modes: pcs=00 phy=03
> > [   12.331586] qcom-ethqos 23040000.ethernet eth0: major config, active phy/outband/sgmii
> > [   12.339738] qcom-ethqos 23040000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/pause adv=0000000,00000000,00000000,00000000 pause=00
> > [   12.355113] qcom-ethqos 23040000.ethernet eth0: ethqos_configure_sgmii : Speed = 1000
> > [   12.363196] qcom-ethqos 23040000.ethernet eth0: Link is Up - 10Mbps/Half - flow control off
> 
> If you have "rate matching" enabled (signified by "pause" in the mode=
> part of phylink_mac_config), then the MAC gets told the maximum speed for
> the PHY interface, which for Cisco SGMII is 1G. This is intentional to
> support PHYs that _really_ do use rate matching. Your PHY isn't using it,
> and rate matching for SGMII is pointless.
> 
> Please re-run testing with phy-mode = "sgmii" which you've tested
> before without your rate-matching patch to the PHY driver, so the
> system knows the _correct_ parameters for these speeds.
> 
Sorry, I forgot to mention that all the recent testing is being done on
QCS9100 Ride R3 which has the AQR115C PHY.

My rate-matching patch was for IQ8 which has the QCA808X PHY. I am
putting its testing on hold until we sort everything out on QCS9100
first.

So, for AQR115C, what should be the way forward? It has support for rate
matching. For 10M should I remove its .get_rate_matching callback?

	Ayaan

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
