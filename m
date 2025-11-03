Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB373C2AA8F
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 09:58:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72213C62D38;
	Mon,  3 Nov 2025 08:58:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB8B1C62D37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 08:58:36 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A36BL7Q2267907
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 3 Nov 2025 08:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=24U/P21yAhIHR6ao9I05xoum
 vaOn7aHOYNLWI3fMklM=; b=gIsyvSkZy/hNlt+P/kBl3JMlADcBnVq11LYn4j5N
 RRVwFToKaveyEEMs4oLH9PaNOdMFc9UT2jq/mycTed3n1ptKGZAwBU2lXQP2qlAi
 yymIGDiz8HXnpEQ+HNwytqKIHZHqba6X48u/roUkFvsJRBMXkbCOZTiW6iMEc6Ez
 thjF3/YJuw3u1kMPkFiOmTv+goNISxeQHYZD7TbXFHXxuLPeIlPDAQK04uGrivhF
 XSPMj3TuURiBaIUpa2ZNFK7lPMt8gJkmw/IcVuz/05abz7D8af6Mm7LnRLmp59My
 0ugUHaerL0xVy041N4OB4OVJUquadIZLPg89IlZ0q8+Ohg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pwaggnk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 08:58:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2956510d04cso16304845ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 00:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762160314; x=1762765114;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=24U/P21yAhIHR6ao9I05xoumvaOn7aHOYNLWI3fMklM=;
 b=eonRBKNoVj2aXVsdl8CwbpKxqL4Lz2UfSQ1xWXBrJUNAhAD0EbsflNq557Dgv3p0iU
 OpR+1M06d3oC555g3d+XRDsp2aGtsCY8roucriLma+j0QQYKfbEp+qosV82rwF4dn6Ky
 S4ZhpVcKE/tXU7Qt99hsB9S3G5qDILb7v0crEH0xN/BDQxnQ8oiiK22uFh2VulcS6vI/
 7IJQ2A/PvI/ZebHQOmj0FV4TyBEao2GE+pFf2b9sWRrUzg5tilm4qXG1qVfNzF2wWouk
 85MzZ/jBK0lYPti5iLxLCSTy33HIGV/0fpQZC3qgdVJ1+ytM8Xf9OVhMlmABXLVO3Lm/
 Y/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762160314; x=1762765114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24U/P21yAhIHR6ao9I05xoumvaOn7aHOYNLWI3fMklM=;
 b=d5UstUq3TGTmjk2EjM4kBzgbHN3IMxliGNwTzEYFCo09Fp9bbfw+YcNopGfY4LGMPi
 ks/llHdncT74eH7Bc0z5vL9Ii1DCIOwlrhu/ZCDsnxcTneORHSNbJIKCVtg5BmCtXCZB
 CirSnJjVSkZlsEUvZHQr63aDdC8lzsAlniijt05GtRy7MksiJU1uDHVti8Dk0vQu3huJ
 ZIR12LPB9rsO1OSVh9sRGAol9w6MAZPgJXA66u7dluctAjE+dPjg8pR/IpIx9SsTx6iS
 CWUA9uyVIUzj6ax1EJliGzDwTr2jAnqRAVrGKqeHMWtyvnKSuDv3ekXVDPVqca+zEQ51
 2P1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvfASz8wYMXlGCQ9zuMjmvROl5kw/v0ulcTuMLTD/KOt+j67ZEimcm2Vrb7AaQRuRN4mbe7Xu3bQKzPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXJgiYpcbjcO7B1nVxhS2y27Wh73Cks2vVHttU7ESYLQS5Gb3Y
 Ch7xFp/ysStESRqtfj36rzYYxZA9C9ki4Z+zSyadETcqyQV8M6Dz/f6MLrqGtqMpeq2FRIu2j+3
 aAX33OIwkPjEKon00HBPfy3XNkut+eYyT/vIfBBwPmZtmxsHNilF5uOVSthl5EVVGRqolehgaFm
 fEkQrXtUY=
X-Gm-Gg: ASbGncs4KHmz0hzdwPhn2i72GN60H6RSnQyihfEn7zJLhVqCRCqCSkq8jVLB5Vf+Fof
 fbLtn+9Q2BMw1QvaSDRN1MSAeftLkKkAFgLyFn8nGwTZ/a4y9by+5ZRFvqwKBPERoJ+rcihnG8v
 0JwZ+eB20KU4mnIQKUA9PXuzqdJeDdjXBJ187YLVXK926ZhkilB0Ih/BIJKBHjLMK0tLgeiyAKk
 rXFbXxqOsex8G82uznqznaUTWIJoPutCnATDlJ8Z33Q06ciHgAbec0aREDNNEEnDmMA1yrZ9ZbT
 rdpi/uPgPgIaxjxajADsFqK1jT4ccHkv3rJJ/A6ZwG3ANkCf+GErPjL6ttxMuH14B0WgZYBSRTP
 5NOyA9SwAq9Ay
X-Received: by 2002:a17:902:c405:b0:295:426a:77a6 with SMTP id
 d9443c01a7336-295426a786amr114541615ad.32.1762160314044; 
 Mon, 03 Nov 2025 00:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCIJI3R8udQvqnXnErxlmj0951sOi8WiW5KGVY7kXreBHT9GpCTkmGTuANv6IuF/RSmhXY+Q==
X-Received: by 2002:a17:902:c405:b0:295:426a:77a6 with SMTP id
 d9443c01a7336-295426a786amr114541215ad.32.1762160313415; 
 Mon, 03 Nov 2025 00:58:33 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29531a1965esm105434655ad.6.2025.11.03.00.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 00:58:33 -0800 (PST)
Date: Mon, 3 Nov 2025 14:28:24 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=OrdCCi/t c=1 sm=1 tr=0 ts=69086ebb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=RUCXIr6eBFmux7r5iq0A:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: nlaajqVNKq2FfWyrg1HW8oHN96tJWSVd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA4MiBTYWx0ZWRfX2wYpLM5Tm0bA
 d904qrzFUxtoGgq6mIq46FJIkMWxe8wxI3d9btJiYUhtrVvIc0LzNY7c3tdpxA7PfXUbJYPcc6O
 0cYalHIbKZoJPI5/zHAz7fYziLO4bmn6nKME9ktcm77e3xwp38MYazLfZFBoiBHMbFUnSIgI+yW
 aMYw3tS8AHlXIvtfVqHCE2bIIkt/f4pgwnP5oOZiqQ/rhAbQ6xc+KE6Vkk4gPvP3ZGx5m0hQqU8
 FHSvDEw0AYnRZuK73FApcz/PDm+YtMP2ED2Vv404aEHEWcP1Labn19Pgf+q+fAChV42A1J9tESa
 l0JP/0fNHS5v7+3bZ2uF1/70ke1r6obsWopdu7Z0VTMlTm1kh3j08H9kAvT2AfCscCwrEJkqxvY
 qhw+pesk+vTIBP9bwq2qdLGEbTTCow==
X-Proofpoint-GUID: nlaajqVNKq2FfWyrg1HW8oHN96tJWSVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030082
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

On Thu, Oct 30, 2025 at 03:22:12PM +0000, Russell King (Oracle) wrote:
> On Thu, Oct 30, 2025 at 03:19:27PM +0000, Russell King (Oracle) wrote:
> > > 
> > > This is probably fine since Bit(9) is self-clearing and its value just
> > > after this is 0x00041000.
> > 
> > Yes, and bit 9 doesn't need to be set at all. SGMII isn't "negotiation"
> > but the PHY says to the MAC "this is how I'm operating" and the MAC says
> > "okay". Nothing more.
> > 
> > I'm afraid the presence of snps,ps-speed, this disrupts the test.
> 
> Note also that testing a 10M link, 100M, 1G and finally 100M again in
> that order would also be interesting given my question about the RGMII
> register changes that configure_sgmii does.
> 

Despite several attempts, I couldn't get 10M to work. There is a link-up
but the data path is broken. I checked the net-next tip and it's broken
there as well.

Oddly enough, configure_sgmii is called with its speed argument set to
1000:
[   12.305488] qcom-ethqos 23040000.ethernet eth0: phy link up sgmii/10Mbps/Half/pause/off/nolpi
[   12.315233] qcom-ethqos 23040000.ethernet eth0: major config, requested phy/sgmii
[   12.322965] qcom-ethqos 23040000.ethernet eth0: interface sgmii inband modes: pcs=00 phy=03
[   12.331586] qcom-ethqos 23040000.ethernet eth0: major config, active phy/outband/sgmii
[   12.339738] qcom-ethqos 23040000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/pause adv=0000000,00000000,00000000,00000000 pause=00
[   12.355113] qcom-ethqos 23040000.ethernet eth0: ethqos_configure_sgmii : Speed = 1000
[   12.363196] qcom-ethqos 23040000.ethernet eth0: Link is Up - 10Mbps/Half - flow control off

Nevertheless, I manually updated RGMII_CONFIG_SGMII_CLK_DVDR to 0x31 and
did not observe any issues with 100M and 1G (and 10M was still broken).

I tried to dig around for information about the particular register
update and found basically the same thing as Konrad.
1. B(18:10) - RGMII_CONFIG_SGMII_CLK_DVDR - It defines programming value
for Divider 20. This field is used for 10Mbs mode operation in RMII and
set value of 9'd 19.
2. The programming guide for this IOMACRO core mentions that the field
needs to be set to 0x31 for 10M link.

I am inclined to believe that the register description is a typo (as the
reset value of this field is anyways 0x13). The 0x31 value is
recommended for only 10M. For other speeds, it mentions the default
value of 0x13.

However, that does raise the question of why setting the field to 0x31
is not impacting 100M/1G. I will try to investigate more on this. But
right now I am trying to prioritize on verifying 100M/1G/2.5G links as
those should be more common. After that, there's still the issue of IQ8
only advertising support for 2.5G.

	Ayaan

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
