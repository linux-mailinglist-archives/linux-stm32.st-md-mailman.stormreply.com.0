Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CCC2033C
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 14:21:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DC75C62D8F;
	Thu, 30 Oct 2025 13:21:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A4ADC62D8A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 13:21:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UB8fC53808875
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 30 Oct 2025 13:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=N8JSx8eXmT6reNBlGsFi2hWH
 mKSJP+1vYMEJYEvPQSo=; b=RsaL9m8EKgArn3MqplxuH0kWpyBDOCA1/ooGEia7
 vlKlHYEJvgwgKxwsTH/3nskh3+qjcq461oKmQskbm7beCOyxQiysSJyC+2Isvd/6
 PMBrg5TCIP7B+i3GpYhZV7DGKwOACHLK+uDkn8v7ClZoJ/M+hvTVH4+OxDdfZSn+
 Cv71HfhIWrl4pDoMQc5CHRp/0/0mmzUpyYGii99tJWvxcWmeja8S1CTvUtnw3QK3
 QuodHPln77+fDn/+mr/fQpyXTLdcpvtU6s54Q8cqHlIOSEOIq5GoKHhp9t0Su9+e
 ASHu6dKTZ0muonz9ubVmCoAA9p+SdNa7G9CuJlSytfSYuQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vv8anh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 13:21:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2ea9366aso1005799b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761830461; x=1762435261;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N8JSx8eXmT6reNBlGsFi2hWHmKSJP+1vYMEJYEvPQSo=;
 b=QC5h1KgBJ6Zmye3Og3EO5QuSSpxRg93ChKST0b4WDaQxS6OLGka/aqrULZwzX2uf91
 wSKEdxwYqhi0KVgZaPQtAw7KL9NZhtjyS/L9xYnJL6x0rCKQ9YhI6hUuzU/6F1wCojSc
 u6lwstmlLuIIqX8C5Fteq6RB9SnrcbQXO3wALSaYQK13yMg0k10/I1oDW79z2Cpib41l
 oTt6kZRX0lU9mwdsxdqTQlrxTITzLUpgYPZO7WXm0IGcflRH0fb4FxY7o5fawoDxt18Y
 100+Vmomk2+tCw7L+m2JsECr2RXWGqw96+/GkiJ4j/y9UA/id2ntX6ZyFTjeuOxlog9e
 lpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761830461; x=1762435261;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N8JSx8eXmT6reNBlGsFi2hWHmKSJP+1vYMEJYEvPQSo=;
 b=SiQsajRWtvIxXHZxAOCTGhsp6XK7uv/ONBZ3d49Iyn2NnMZQGmCiwMHmWSCt14ZnbE
 MhJllnpaOaqIs/ID7we9xCkLcGNt6tEomL48TPcKmpNUNhBaLVd58Xyo0g6PeZojOVYz
 HhT9zUliK6s0U15OEZhhs30Y5ObU31mj1kNxo7OrdBmQ3lUIDJuWWc+SPyqs1/hwYu44
 TxowTGgxQ2C2KG2mKdKjNCjOO6j5rIUrHzxNVTXQH0giRNFSqff5iGDoWG8ZwVPx5m0t
 0iYnlt6/FWiUJGLypeAT/pXD68lMsTaKnhpoZaqLL3VHTEf4jHsplGO2L1PFAvCqViE1
 Dp3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhjEXhHoWq9g1MP9Hr4mX1XrS3i6eyUU3rbteI9jPniCkIku9qlSfTZnYwjfy9vbHs79uLWxIWa8dhkw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzsqQAdCfHgyYGHxf4OPWdmw8a9H8KrowY0CO+ll99JKiWM+81h
 uSCPnz90A3TfBiw64GEVc/mysiezK0dH6t9j0ixXIS9kfRgxLnbbxDY8at3zDxvpk705F4+W0PF
 w1cf3PDk1CQkrKEKHvnR7C6mpx1IWM/a+4XBaLFXIeD7p03rx+WTPFEBPxpNH8HB+1dNXm5Ugd+
 eWgjiIKDY=
X-Gm-Gg: ASbGncv9jbKbFy3ktSnZsbxNMHyQ/uu3DxQBaruoSg+CEh+QJuYhheJXm4ErNZVw3l9
 PH08IPBYS4GBizJO0Bk5jbwXZS0WoJNJbO4HFhRKufjE11u03OPqjFUlu2ft2vBSNMQ2Gh0BBL3
 GWa4I7zpAwp7GXxh1S8Q3XqDYjZ53YJyAae651qh8yzbRbjId+uBk6YTItChj7t7V78GZqgJZMO
 63ZZEhRP21wm1XXpg/+PqVnSBupgcgSAt7tdCJb6O0VwH31me/hkgNBFrEePSfwsCuE/m3nXcpb
 FOm87WchKarc5jiisnN9rs4d7YzSOVBCzY3oTmgXOMiWkLP7DfuZGOpC/riQ4D4LG0efHoZmeJl
 Bt4lsvOwFa7oV
X-Received: by 2002:a05:6a20:2448:b0:340:e2dc:95b3 with SMTP id
 adf61e73a8af0-347876911d2mr4494885637.55.1761830460394; 
 Thu, 30 Oct 2025 06:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi/DCs49lmkfOKByJGfWQqDwDeolNz2XBvEbRU2iz1p4Vspe9DF/BjXzv/hEwWwborxHL8OA==
X-Received: by 2002:a05:6a20:2448:b0:340:e2dc:95b3 with SMTP id
 adf61e73a8af0-347876911d2mr4494822637.55.1761830459746; 
 Thu, 30 Oct 2025 06:20:59 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b712d4f12f2sm17508780a12.30.2025.10.30.06.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 06:20:59 -0700 (PDT)
Date: Thu, 30 Oct 2025 18:50:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aQNmM5+cptKllTS8@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
X-Proofpoint-GUID: X03HWo3OMJ0owgQiOLienqXqT2LC_pI9
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6903663d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ld7dpV6llueYRqIT5ogA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: X03HWo3OMJ0owgQiOLienqXqT2LC_pI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwOCBTYWx0ZWRfX6H6xxS3lVqvd
 JyUK5pwZWI6j3AvcPwwGQx/TVpZ+ctfK8u9SnEuKuda8TNqE/Tdk1PkYrLQO4nnUvJVJcQ6FYue
 QSufh07k/6Jo2ahAa8yKhdBFfV3rk9oqtYdvyBmMV1Me1xqHpbbrujq+UusacgcA1fTysUyAPGe
 oIlyxIC7GNSqT0/KHFB4+UMicVxFLhc3s2ySpQTd/rzIdwZe0dYIBZktR5fd0cz8zb7MakYjm6s
 UQQzJ4/m2N6XuPBFD2fCtYb4hmyCZAWu/2kwAZdqxLhteuL6vXrglB5VQJ1BGLML94tLBRlodu6
 TQ41yoh11mbYotF/2/Kgam2hSzsSWBIglD7JMp/SGOF6mMRkNu4H+Tnub5YyWtUE2jQEJo7drNI
 D+Y9794Li8tw4z9BERhM7s1IN74ItA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300108
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

Hi Russell,
On Wed, Oct 29, 2025 at 09:22:49AM +0000, Russell King (Oracle) wrote:
> > # Patch Series (current): net: stmmac: phylink PCS conversion part 3
> > (dodgy stuff)
> >   - QCS9100 Ride R3 - functionality seems to be fine (again, probably
> >     due to the changes only affecting SGMII mode). However, the warning
> >     added in patch 2 comes up whenever there's a speed change (I added
> >     an additional WARN_ON to check the sequence):
> >   	[   61.663685] qcom-ethqos 23000000.ethernet eth0: Link is Down
> > 	[   66.235461] dwmac: PCS configuration changed from phylink by glue, please report: 0x00001000 -> 0x00000000
> 
> That's clearing ANE, turning off AN. This will be because we're not
> using the PCS code for 2500base-X.
> 
> Can you try:
> 
> 1. in stmmac_check_pcs_mode(), as a hack, add:
> 
> 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_2500BASEX)
> 		priv->hw->pcs = STMMAC_PCS_SGMII;
> 
> 2. with part 3 added, please change dwmac4_pcs_init() to:
> 
> 	phy_interface_t modes[] = {
> 		PHY_INTERFACE_MODE_SGMII,
> 		PHY_INTERFACE_MODE_2500BASEX,
> 	};
> 	...
> 	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
> 					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
> 					  modes, ARRAY_SIZE(modes));
> 
> This will cause the integrated PCS to also be used for 2500BASE-X.
> 
> 3. modify dwmac_integrated_pcs_inband_caps() to return
>    LINK_INBAND_DISABLE for PHY_INTERFACE_MODE_2500BASEX.
> 
> This should result in the warning going away for you.
> 
> I'm not suggesting that this is a final solution.

Here are my observations (with phylink logs if it helps):

1. Link up at 2.5G
[    8.429331] qcom-ethqos 23000000.ethernet: User ID: 0x20, Synopsys ID: 0x52
[    8.436610] qcom-ethqos 23000000.ethernet:   DWMAC4/5
[   10.395163] qcom-ethqos 23000000.ethernet eth0: PHY stmmac-0:00 uses interfaces 4,23,27, validating 23
[   10.407759] qcom-ethqos 23000000.ethernet eth0:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[   10.418507] qcom-ethqos 23000000.ethernet eth0: PHY [stmmac-0:00] driver [Aquantia AQR115C] (irq=343)
[   10.428003] qcom-ethqos 23000000.ethernet eth0: phy: 2500base-x setting supported 0000000,00000000,00008000,000062ff advertising 0000000,00000000,00008000,000062ff
[   10.461072] qcom-ethqos 23000000.ethernet eth0: Enabling Safety Features
[   10.478201] qcom-ethqos 23000000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
[   10.487449] qcom-ethqos 23000000.ethernet eth0: registered PTP clock
[   10.494010] qcom-ethqos 23000000.ethernet eth0: configuring for phy/2500base-x link mode
[   10.494014] qcom-ethqos 23000000.ethernet eth0: major config, requested phy/2500base-x
[   10.494018] qcom-ethqos 23000000.ethernet eth0: interface 2500base-x inband modes: pcs=01 phy=00
[   10.494021] qcom-ethqos 23000000.ethernet eth0: major config, active phy/outband/2500base-x
[   10.494024] qcom-ethqos 23000000.ethernet eth0: phylink_mac_config: mode=phy/2500base-x/none adv=0000000,00000000,00000000,00000000 pause=00
[   10.508824] qcom-ethqos 23000000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[   15.099693] qcom-ethqos 23000000.ethernet eth0: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
[   15.122160] dwmac: PCS configuration changed from phylink by glue, please report: 0x00041000 -> 0x00040000
[   15.140458] qcom-ethqos 23000000.ethernet eth0: Link is Up - 2.5Gbps/Full - flow control rx/tx
[   15.140939] stmmac_pcs: Link Up

As I understand it, the glue layer disables ANE at 2.5G.

2. Link up at 1G:
[    6.261112] qcom-ethqos 23000000.ethernet: User ID: 0x20, Synopsys ID: 0x52
[    6.261116] qcom-ethqos 23000000.ethernet:   DWMAC4/5
[    9.051693] qcom-ethqos 23000000.ethernet eth0: PHY stmmac-0:00 uses interfaces 4,23,27, validating 23
[    9.061261] qcom-ethqos 23000000.ethernet eth0:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[    9.061266] qcom-ethqos 23000000.ethernet eth0: PHY [stmmac-0:00] driver [Aquantia AQR115C] (irq=305)
[    9.061269] qcom-ethqos 23000000.ethernet eth0: phy: 2500base-x setting supported 0000000,00000000,00008000,000062ff advertising 0000000,00000000,00008000,000062ff
[    9.080324] qcom-ethqos 23000000.ethernet eth0: Enabling Safety Features
[    9.114550] qcom-ethqos 23000000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
[    9.123870] qcom-ethqos 23000000.ethernet eth0: registered PTP clock
[    9.130412] qcom-ethqos 23000000.ethernet eth0: configuring for phy/2500base-x link mode
[    9.138726] qcom-ethqos 23000000.ethernet eth0: major config, requested phy/2500base-x
[    9.138729] qcom-ethqos 23000000.ethernet eth0: interface 2500base-x inband modes: pcs=01 phy=00
[    9.138731] qcom-ethqos 23000000.ethernet eth0: major config, active phy/outband/2500base-x
[    9.164930] qcom-ethqos 23000000.ethernet eth0: phylink_mac_config: mode=phy/2500base-x/none adv=0000000,00000000,00000000,00000000 pause=00
[    9.194764] qcom-ethqos 23000000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[   12.542771] qcom-ethqos 23000000.ethernet eth0: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
[   12.553890] qcom-ethqos 23000000.ethernet eth0: major config, requested phy/sgmii
[   12.561617] qcom-ethqos 23000000.ethernet eth0: interface sgmii inband modes: pcs=03 phy=03
[   12.570220] qcom-ethqos 23000000.ethernet eth0: major config, active phy/outband/sgmii
[   12.578367] qcom-ethqos 23000000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/none adv=0000000,00000000,00000000,00000000 pause=03
[   12.599545] stmmac_pcs: ANE process completed
[   12.607910] dwmac: PCS configuration changed from phylink by glue, please report: 0x00041000 -> 0x00041200
[   12.616188] stmmac_pcs: Link Up
[   12.634351] qcom-ethqos 23000000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
[   12.639575] stmmac_pcs: ANE process completed
[   12.647498] stmmac_pcs: Link Up

This is probably fine since Bit(9) is self-clearing and its value just
after this is 0x00041000.

> 
> Please note, however, that the stmmac driver does not support on-the-fly
> reconfiguration of the PHY-side interface as it stands (and questionable
> whether it ever will do.) The hardware samples phy_intf_sel inputs to
> the core at reset (including, I believe, software reset) which
> configures the core to use the appropriate PHY interface. Performing
> any kind of reset is very disruptive to the core - likely even causes
> the PTP timekeeping block to be reset. In my opinion, PHYs that switch
> their host-side interface were not considered when this IP was
> designed.
> 
> To get stmmac's driver to a state where it _can_ do this if desired is
> going to take a massive amount of work due to all these glue drivers.
> 
> I do have patches which introduce a new callback into platform drivers
> to set the phy_intf_sel inputs from the core code... but that's some
> way off before it can be merged (too many other patches I need to get
> in first.)
> 
> I haven't noticed qcom-ethqos using a register field that corresponds
> with the phy_intf_sel inputs, so even in that series, this driver
> doesn't get converted.

True, I think qcom-ethqos's behaviour is different than other glue
drivers. For both SGMII and 2500Base-X, it uses the same
ethqos_configure_sgmii() function which is just changing the SerDes
speed and PCS and depending on the current speed.

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
