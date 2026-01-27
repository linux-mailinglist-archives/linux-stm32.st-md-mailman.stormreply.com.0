Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD0FFXzSeGmNtQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 15:58:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB01596262
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 15:58:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87DC3C555BE;
	Tue, 27 Jan 2026 14:58:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89197C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 14:58:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RAb25D700433
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 27 Jan 2026 14:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LWpVchwqvdGyEWC9dq5KQLLm
 6bzYdAUNcEvylYGhyMk=; b=JfZPlapfYbLDmW8jIqIUG1zzsRs6BdzYsI20J1Ga
 vpqifUaODyp/EbBsE7VGur1lPvpwW2LyLCCFu9I9wj22Hc9AhTiXQrKopV5k0Teq
 R2GHzgjEQhEZnhP/yJV39yPxTvSDUm3uEQXB8csExTNm5EFWRdThOxM2rIRWZjSF
 lgmeGNIPVSSdJYSop2kWFXzJgUBarZXUnJMiTbjdzPTUWIl7z3yKiORpQP41xppw
 2UW04TuaCRTUoHoF9aX7whiNoViKOmS5QqbJZe6DyAvoRmxvYgOWzrpfyNfBujJ1
 jO40wm+ddDMn7K30vv0vgDucLij7LxCP8PCy5FRB8JEDuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3u6vw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 14:58:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34cc8bf226cso5872079a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 06:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769525880; x=1770130680;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LWpVchwqvdGyEWC9dq5KQLLm6bzYdAUNcEvylYGhyMk=;
 b=bflbBr9tI+1z7Db3ueLarwIuoMWokCW2xk2TCf8OqQGzAQrLMISZNEmO92F7nohT8J
 E6cyRFh+Fl9GR/R8M8oMDrS257aya3L8XUf4NULyv4lgY+ZySk3hb5LpTJPASNK8ZRui
 bPHkRfCFgRlaY6sKVN8x0GYsCedVDuvfESLi8+UUjMbYyJvDn29fkzGOt4e5Tb1B+Oxo
 Cs+nx8y8+VKUAIFrKbM+sraqbcCfwdlVUFI3NPdTGfsy3IseIRizoMYQuOCEHTMJBOZj
 Eslc/LScZciLpYymBHTaD/xYKbWxvPRTa00dA8hcMrWp0Sz/ZeF5Ifluojgupkq/Z8lb
 ApGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769525880; x=1770130680;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWpVchwqvdGyEWC9dq5KQLLm6bzYdAUNcEvylYGhyMk=;
 b=MVz49nsl8P3lyorD9H/xWW0feII1rXIZTOp0yqr0QDfaJRm4Upj7F04Sk1oD2T7CVq
 m2Y1Ps+E0OWg3MIjYh/KR/CSMhrSh3cTUi/vtD9nyjxQywvG9ubTrnB5dL5SXfTHvqpL
 yO9tujL7RNAJx+WrDZPMOj/GdhlCiKnGcQEleqMPxxDVxh3DW/+adnzQbtlnM4JXYA43
 L6vz+qZiqyJfQkqktLigOljSniDT4kD7Uh0h6F4Usg0POCn9fQDgzJkdzwCvfU2vv+pP
 WcjQCn4TbT1ATtFCBXFD6/eEksNfw3Xb2AQu8hg3QYJZsfb3UGDWyCGI+txLzcvuCrUI
 SwCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn2iVe+wXvPvJRKSIq/eCpOvzviVfuuIoi5HRF2BqxI4gM7MhC40r0GhrHkv3qdFvc7Ah4soGvOJIFbg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyOWGOvmfKbDTxiX5EBpjtjC9A4ioIGyk2cBtxqMYiDGqBv4CAc
 FVAXmB1ci5YCjD+N9XkEpJsy/ruoG4Um7uetPs2StlnQHQiydVSICMxmoYaCEpI54TNdBE7Kpe2
 lJtJGHfWc7Ako12dJclCTqDqDPPDuvWPPAusG8+r3H9oiGNvqsOidfMbjqqrcGX9xoD3oqCs5Fl
 M8QAyCy7k=
X-Gm-Gg: AZuq6aKfC4pPvpuUcEFqjTEVe1F+rJDwx35D/UjFMCtD1Oi0SNYkUaVnovI8oy9RXXT
 qMy5St+ev+UrMEKG8Ge4P6n4okvpokGjVOWGNuLn78P+Y0qK+Fvu22KQ2nQTPCBJgqvAEoJ5k8z
 Yt+bYOjk99tXs86BAYJZBWDwRIhwZm17eFKgsVI0y8TBt1HgPboV/GJHaSN1a6s19XyviC+GZWF
 MnPI3+nBkxYzQFNnlbMuuCQgZU+514C0DAjDDHBlUZpXNebLoESvYGIzE7LaWiHIaV/treVeTLR
 pjtskqcl6vn1uO2ZD+svtkwUx3qjvxBY7DlJxjFG+cAoT7MO8pMD/DihBDG4nIy7oVuErepSu8+
 uBN5f7jWeVNM1BN1sCQyMWNk=
X-Received: by 2002:a17:90b:5627:b0:34a:47d0:9a82 with SMTP id
 98e67ed59e1d1-353fed70718mr2006695a91.23.1769525879553; 
 Tue, 27 Jan 2026 06:57:59 -0800 (PST)
X-Received: by 2002:a17:90b:5627:b0:34a:47d0:9a82 with SMTP id
 98e67ed59e1d1-353fed70718mr2006667a91.23.1769525878954; 
 Tue, 27 Jan 2026 06:57:58 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536b050e08sm4712102a91.1.2026.01.27.06.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 06:57:58 -0800 (PST)
Date: Tue, 27 Jan 2026 20:27:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: 1pqFHN8yotZGOLlFzVkrV9n4CtvINmu5
X-Proofpoint-GUID: 1pqFHN8yotZGOLlFzVkrV9n4CtvINmu5
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978d278 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-kEnI-koradUIOcFO3kA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfX10jAUmXbTwmf
 akuYABJTDRj2jm0q3Dmi/RgRSjGAoMjUoVPMM383riIKliXjFuLYy1QiydQqPl7whQl0Rh4TEg8
 uMd4Wx9q1n1LwTvobX0B8aPNx6ykGhL5wqynpT9qVPEXN9FGnhx+0K4pj/xUEm+feH6AKUMzcRu
 4oCs8WgEd6ZSWP8p5B8TO/iahIH5RY7TH4/jfkLJZ9vHP3xJEwybwGLHF/JD1219jE7rJgBLEdT
 aTDJcyiMSeFccA1mxIgUdBIdlalhz5sSeWMKxyd7nLYeky+Yvv/vx0XGvEBrcO657UqBxJLdMEI
 HgRjocpbctINU+2un0f2TIxX55AA1Z4ry9AxCg6od3MD7UYZuOvsj2sd58Jo5JGpBSkF4fsYgen
 9drCmuvGgCII3Y9FojW84UimFUmiMyvy1wRCquvMVcgedMh5un0huIGfdetWdqBvjhMpcDNyGPq
 X+9WNrEBlp2HKuW+9dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270123
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: DB01596262
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:32:21PM +0000, Russell King (Oracle) wrote:
> 
> and the failing store is the one for that last line of C code - in
> other words, pcs = NULL.
> 
> This means that mac_select_pcs() returned NULL when being asked
> "which PCS should be used for 2500base-X" ?
> 
> This suggests that the SerDes detection of support for 2500BASE-X
> isn't working, meaning that stmmac_mac_select_pcs() ends up returning
> NULL, rather than &priv->integrated_pcs->pcs.
> 
> That would only happen if:
> 
>                 /* Only allow 2500Base-X if the SerDes has support. */
>                 ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
>                 if (ret == 0)
>                         __set_bit(PHY_INTERFACE_MODE_2500BASEX,
>                                   spcs->pcs.supported_interfaces);
> 
> fails, meaning we don't set that interface mode for the PCS.
> dwmac_serdes_validate() calls phy_validate() for PHY_MODE_ETHERNET
> with the PHY interface mode as the sub mode.
> 
> Patch 3 adds the required methods to phy-qcom-sgmii-eth.c to allow
> phy_validate() to indicate whether this is supported or not:
> 
>         .validate       = qcom_dwmac_sgmii_phy_validate,
> 
> and its implementation is:
> 
>         int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);
> 
>         return ret < 0 ? ret : 0;
> 
> where qcom_dwmac_sgmii_phy_speed() is:
> 
>         if (mode != PHY_MODE_ETHERNET)
>                 return -EINVAL;
> 
>         if (submode == PHY_INTERFACE_MODE_SGMII ||
>             submode == PHY_INTERFACE_MODE_1000BASEX)
>                 return SPEED_1000;
> 
>         if (submode == PHY_INTERFACE_MODE_2500BASEX)
>                 return SPEED_2500;
> 
>         return -EINVAL;
> 
> So, this should be returning a positive integer (SPEED_2500), which
> should cause phy_validate(serdes, PHY_MODE_ETHERNET,
> PHY_INTERFACE_MODE_2500BASEX, NULL) to return success (zero). That
> should result in PHY_INTERFACE_MODE_2500BASEX being set in
> spcs->pcs.supported_interfaces, and thus &priv->integrated_pcs->pcs
> being returned for PHY_INTERFACE_MODE_2500BASEX.
> 
> Is the particular hardware you're running this oopsing test on not
> using a SerDes PHY? If that's the case, how does it switch between
> 2.5Gbps and 1Gbps data rate on the SerDes?
> 

It is using the same SerDes PHY (qcom_dwmac_sgmii_phy_driver).

I added additional debug prints, and I think the crash is due to
BMSR_ESTATEN not being set in GMAC_AN_STATUS.

During pcs_init, BIT(8) of GMAC_AN_STATUS is 0:
[    7.985913] [DBG] GMAC_AN_STATUS = 8

Therefore, this check:
	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN) {
		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
			  spcs->pcs.supported_interfaces);

		/* Only allow 2500Base-X if the SerDes has support. */
		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
		if (ret == 0)
			__set_bit(PHY_INTERFACE_MODE_2500BASEX,
				  spcs->pcs.supported_interfaces);
	}
fails, and PHY_INTERFACE_MODE_2500BASEX never gets set in
pcs.supported_interfaces. Pardon my naivete, but does the
BMSR_ESTATEN bit not being set break some standard?

If I remove the check, the NULL pointer dereference is not observed
anymore. Although the SerDes link is still unstable.

I also tried enabling comma detect during dwmac_integrated_pcs_config,
but I am still seeing the Tx timeouts. I remember that when I had
tested the patches in October (without the SerDes driver changes),
the link state used to flap, but the data path became functional
after the link stabilized.

	Ayaan

---
Full Logs (Speed Change: 1G -> 2.5G)
[  244.817499] qcom-ethqos 23040000.ethernet eth1: pcs link down
[  257.066210] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
[  257.076143] dwmac:      ANE 0 -> 1
[  257.079668] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
[  264.260852] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 7: transmit queue 3 timed out 5472 ms
[  264.271394] qcom-ethqos 23040000.ethernet eth1: Reset adapter.
[  264.280493] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[  264.842309] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
[  264.850391] qcom-ethqos 23040000.ethernet eth1: failed to kill vid 0081/0
[  264.857547] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[  264.865795] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
[  264.873939] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
[  264.882111] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
[  265.792807] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
[  265.802389] [DBG] stmmac_mac_select_pcs - testing for 23 (2500base-x) on priv->integrated_pcs->pcs.supported_interfaces = 4
[  265.802399] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[  265.824572] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=334)
[  265.834055] qcom-ethqos 23040000.ethernet eth1: phy: sgmii setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
[  265.852828] [DBG] qcom_dwmac_sgmii_phy_speed called with mode=15, submode=4
[  265.852837] [DBG] qcom_dwmac_sgmii_phy_validate - qcom_dwmac_sgmii_phy_speed returned 1000
[  265.868580] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
[  265.884237] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[  265.893946] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
[  265.900561] qcom-ethqos 23040000.ethernet eth1: configuring for phy/sgmii link mode
[  265.908451] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
[  265.916159] [DBG] stmmac_mac_select_pcs - testing for 4 (sgmii) on priv->integrated_pcs->pcs.supported_interfaces = 4
[  265.916166] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
[  265.935652] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
[  265.943795] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=00
[  265.956407] [DBG] qcom_dwmac_sgmii_phy_speed called with mode=15, submode=4
[  265.956408] [DBG] qcom_dwmac_sgmii_phy_set_mode - qcom_dwmac_sgmii_phy_speed returned 1000
[  265.976997] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[  270.556001] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
[  270.567649] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
[  270.575823] [DBG] stmmac_mac_select_pcs - testing for 23 (2500base-x) on priv->integrated_pcs->pcs.supported_interfaces = 4
[  270.575831] qcom-ethqos 23040000.ethernet eth1: mac_select_pcs returned NULL
[  270.594521] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
[  270.603554] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
[  270.612286] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
