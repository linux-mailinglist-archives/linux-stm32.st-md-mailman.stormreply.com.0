Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2187C2B97B
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 13:17:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A12DC62D2D;
	Mon,  3 Nov 2025 12:17:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E5D7C628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 12:17:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A3Ah7WG1940616
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 3 Nov 2025 12:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZWLtXDn6y7nGmkcEsraLlFmo
 QbxgqaYx7SxZvmnC95k=; b=Pqb0b5m0HDGsitHhufbYsYt3yvsRLDBHc+EANvD2
 9F9FnEMheGDP9pUHAIpYFHoQug11F45f9QUWvc7Zjwnun1UaYI4yaoI/3yLsAHd1
 YCtvKolV9jShUjXCl8iKNL9JZjjZvoK3MH5IH4f/tdidFQ5PL4XODYnhb0Gs79uQ
 IoJi8v82gOW0CIVPR73hVKnhsKs4CAKW/osObsPOa2g75tNfQYrVo8iFP7GEj6Pm
 XxalGZB6cAHXcY0s9nUhmIOTukFh3vjc2NOcG4QWQPN7G32jWZIBQWh9I6I6dJEt
 QwxKQC6O88MZM8mrhXhGGfkJuMblPH7Xt9HD3CXZthdwyQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9w9e6n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 12:17:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7a675fbd6c7so3160134b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762172265; x=1762777065;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWLtXDn6y7nGmkcEsraLlFmoQbxgqaYx7SxZvmnC95k=;
 b=BGmcyiVnh0lX1I2oLuv6nclCKy+9K4l3gU0WBFaD7BxAWuUC8AXQSFRjwNBY+m6kQ6
 sEoz2ZCP7Eki4cBBqCZC24E5GAPJXNF6B1yEnxMDuPGJgg87pNQwsnK68aD7BeV9jQXx
 BAjHsAJvf8+a7H6xgYLVXSnOwTNqmflY7DZwRMAtby4jUAg0SjaAg13CKlHp2aCyZznA
 ltKhAbofaLK6vNP9PCi4cGZ+X7rPMo+GUgZ4IhdbTn1w5CWYX9t70Ps8cWDKDC2aXw1p
 IJipIuz2ft14DtVPRglVbuutReNNVoWz5Dqiwq9iYhZBokboHTDj6pbT91CyQ3BKTaYV
 dBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762172265; x=1762777065;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWLtXDn6y7nGmkcEsraLlFmoQbxgqaYx7SxZvmnC95k=;
 b=qxaMG43beJC0qYTsNisJz1PfxO5BZMNf8kAt+K+eb7+vd7n2nyR5aO38kVvPWTpEHf
 hPShRCiWvgrIsKX+2NVQyMAohHd6xoT3Ye0HWu5/I+BolAS9d/fcVJaTBr8p+M0tSI8n
 OC77y7CMyqYuYxav+frMipiJCM86/HaHMd9/UzPo6EAqFxH/7NYb/eNNdTwLoED8c2RD
 eICUoytKAqyB8+/t6rXMWCGrwyy3+7wPmy1BjnBANL6qfr0OCHJRcX6423XCI6S5LRI6
 gUf16gHmWbIUvaXakQaGI4wVQt+hzsJAL4NvPx+MPhO1nab8F4sVamUqA82xJ0/jtOFy
 Xg+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhG+X3g/tiybf2uekZ1Wx9l9RNzOl8v7SxEAYzugPZbjMAT9GIqMhavZ+NrN1VnrF5sNMsagzaCqVyHQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyjT8XtaSMxM3AWfo9s2Yn13DpePvZmAUfmHh1PySqgPoS0hjTV
 PsLEYUNmJsyM6XxSR7Q/qIObrHrmQtEzspl7Jw2hwfJ455Mcs1Domwfep4rag4xNAdrtoRlJvqF
 580SpfEbV6//akn2U/COOBqHWf0jpp1mjYJ1+RGm7USdVeWyzC9XP0w6kNP83b59uMUwLF6LcE6
 tpZoyUE68=
X-Gm-Gg: ASbGnctj9tHURY4FLf0g3MYsyIB1xbm0uwIX/rpOHRm/ks846L/Zua83eVSKhzFCJ9/
 JNgzNyrk8qQAfmhc4LD6lNt3R8qVwpp9uYgw/Y+DU9CJrltRFSPI3imuYQMCJEAVHzyn9+s2zWX
 XnTesfwNSIsMMyt5oqifhfIOcxcSD/fhotCGTPBoFtoKEyrNhbY37NO44NeQEuo6MloP0gEQum/
 8saYeM2jUvwcy6bjoqdlEijLYfVaRXLQ6hl27wUnI/F5CaD+gO7t+p+oPh249GCJHLuaIoj6kEQ
 YW4g4nnFbf8TFh9mBgvHmWG0DfIY3k/gfzLgX8QQetnnSoQ46/0GCUZDHrPBkfG94GcRqYTjsvE
 hZVUxRadXWoT1
X-Received: by 2002:a05:6a20:7f96:b0:334:89c6:cdeb with SMTP id
 adf61e73a8af0-348cca003c8mr15764653637.56.1762172264645; 
 Mon, 03 Nov 2025 04:17:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE684E5CNdnLqZ8LrjHHapbK4k//kPutpzHfK5KHya4nfTR8e77rbPAda3wA4b8obXBE8KQPw==
X-Received: by 2002:a05:6a20:7f96:b0:334:89c6:cdeb with SMTP id
 adf61e73a8af0-348cca003c8mr15764617637.56.1762172264108; 
 Mon, 03 Nov 2025 04:17:44 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7db197335sm11262090b3a.47.2025.11.03.04.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 04:17:43 -0800 (PST)
Date: Mon, 3 Nov 2025 17:47:35 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aQidX6SPDbOQ5WKU@oss.qualcomm.com>
References: <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
 <20251103104820.3fcksk27j34zu6cg@skbuf>
 <aQiP46tKUHGwmiTo@oss.qualcomm.com>
 <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=69089d69 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=XsfPzZo74fLR1ronddIA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: ncMKwVLcjCEnAD152cMsCir_OH_1YVlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExMiBTYWx0ZWRfX1jCIei4hupmp
 Cn0CVlPf4CPxmlHXI6Ai1clSR1OKJI89X32/33xYWkT1DIyeLWbyRBSBxA5G7OtS6ETmVYTzU9r
 R4JiC9ld7o6Bfe1VgMMGvGva2RDJtHGs1la5MeUMmUZFMFy2ChL2IS96b/QeyHJh4YuSXX1W9HI
 O3Lgfahy1U0M8smvWVMOuIUXeWO+wMQm6ML2EYRbwI0LwScAAUS5oFod4w5cSpcYtsKKln+ldLT
 YWXKpPaNSBnyQD1LnIN7//By6JNn9Df0is7cOZ2NE9BvKRHEWUYnlVKqOSd1KA1PBI1sLsZ5qiz
 sE9otid3n9FCUh//ngDyi4ZZ26NFVc1LhDOuzjufEpY/0e83nCO8/EyiOaQCQwIyTIgphUYbeUk
 Xzygl5b+z70dOx+AsRJNZBD4Lr/xnQ==
X-Proofpoint-ORIG-GUID: ncMKwVLcjCEnAD152cMsCir_OH_1YVlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030112
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

On Mon, Nov 03, 2025 at 11:43:23AM +0000, Russell King (Oracle) wrote:
> On Mon, Nov 03, 2025 at 04:50:03PM +0530, Mohd Ayaan Anwar wrote:
> > On Mon, Nov 03, 2025 at 12:48:20PM +0200, Vladimir Oltean wrote:
> > > 
> > > As Russell partially pointed out, there are several assumptions in the
> > > Aquantia PHY driver and in phylink, three of them being that:
> > > - rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
> > >   PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
> > > - if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
> > >   pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
> > >   that interface
> > > - if rate matching is used, the PHY is configured to use it for all
> > >   media speeds <= phylink_interface_max_speed(link_state.interface)
> > > 
> > > Those assumptions are not validated very well against the ground truth
> > > from the PHY provisioning, so the next step would be for us to see that
> > > directly.
> > > 
> > > Please turn this print from aqr_gen2_read_global_syscfg() into something
> > > visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():
> > > 
> > > 		phydev_dbg(phydev,
> > > 			   "Media speed %d uses host interface %s with %s\n",
> > > 			   syscfg->speed, phy_modes(syscfg->interface),
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
> > > 			   "unrecognized rate adaptation type");
> > 
> > Thanks. Looks like rate adaptation is only provisioned for 10M, which
> > matches my observation where phylink passes the exact speeds for
> > 100/1000/2500 but 1000 for 10M.
> 
> Hmm, I wonder what the PHY is doing for that then. stmmac will be
> programmed to read the Cisco SGMII in-band control word, and use
> that to determine whether symbol replication for slower speeds is
> being used.
> 
> If AQR115C is indicating 10M in the in-band control word, but is
> actually operating the link at 1G speed, things are not going to
> work, and I would say the PHY is broken to be doing that. The point
> of the SGMII in-band control word is to tell the MAC about the
> required symbol replication on the link for transmitting the slower
> data rates over the link.
> 
> stmmac unfortunately doesn't give access to the raw Cisco SGMII
> in-band control word. However, reading register 0xf8 bits 31:16 for
> dwmac4, or register 0xd8 bits 15:0 for dwmac1000 will give this
> information. In that bitfield, bits 2:1 give the speed. 2 = 1G,
> 1 = 100M, 0 = 10M.
> 

This is dwmac4 and I got the following values with devmem at different
link speeds:
1. 10M:		0x00080000  => Bit 2:1 = 0
2. 100M:	0x000A0000  => Bit 2:1 = 1
3. 1G: 		0x000D0000  => Bit 2:1 = 2

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
