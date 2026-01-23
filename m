Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB4POBJ5c2kfwAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 14:35:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB776503
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 14:35:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CB90C8F264;
	Fri, 23 Jan 2026 13:35:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1945C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 13:35:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NCQtLw3503291
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 23 Jan 2026 13:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O9Cy4SLjAsob13FAw6G7LSUf
 poB5IQOhJ0cwKNKdsJM=; b=GL0sO9IVrNhDjicwy5RJXHqwJlgfytS/7K3wsG0v
 LhdUI5ZDKzSUtmNemT1zhe8DDh6eslWs+st9L20H0uy+X6HGuin5SmQWzVuo5m1c
 wkPqTy7E4GyPTb8PU+I8m/A7smCsrx3POjrXXXAzYBQMD+6a3wg12tiVqFnnfg5A
 n8UpBwGnoa3fV/349JtVuF+dw9zR8AnI6S4mZ8tq1FTJcBo6y1yOs6M7R3aScX2G
 3fisC2uPCzdxYQXPEyb6ngzTqaC6hFUsXsbHiat1K9dRIR8TiM2685O4KNNgYh0Z
 hR0sQxPS0kA5ivIdZsI8xCgPdKTP6/oCKwctWQqmyFzXrg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bus983jdm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 13:35:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a0b7eb0a56so20102595ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 05:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769175309; x=1769780109;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O9Cy4SLjAsob13FAw6G7LSUfpoB5IQOhJ0cwKNKdsJM=;
 b=P7H271+LnxzUSmPvXsbO61AcZAKMCZFp/kTQlClFXc9XFduysbXsLiwV54aJDRm8mO
 pLOFKZS5Ln/CMUOcWTqNBDzKrv6pho6T2POebQpOnLX+wcDGojDSXgoE5G8NW1Ol+7g+
 65S7t0VoTP/9cZeq2BwoRySjkVW2eyG/3u4U8ww6DtI6hNFfzRofGAvWTMNsaoNvaLAw
 k4QNOnxc4+YZkeX8H3td95xpWaWQ5CUoSDai0NsqStXExh+xVWZS2k1Opq9FUeZyJlBZ
 KedRnsil8PNV0ezJQdQKIvsesHfP7rmIdW/10QvO/hFjhOr1+z9viOYE00y6i5kEyHR/
 hxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769175309; x=1769780109;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O9Cy4SLjAsob13FAw6G7LSUfpoB5IQOhJ0cwKNKdsJM=;
 b=P+uLZPI8j80TWwYWnGlVO2qXTc27TG4+AsGvcFo6/CoOwxDKXSPkyHL5cQdlhgUNbk
 sTs/fQffrpxKDscyeOuNDLPBwZRh3deqGq+mBzug3MrX/Tj+nPu9XjtlYN7aEZj6nB5k
 UdIzT7fN4r9Xdx1EF6zBNZ6imxZCw/CMWIWzIFxcoqyExtJ34aUuv8LKzpOMYTGi8jO3
 WRKByEf/U9GyHWlXycjMQRNUIB4YCU1rtUCOLU4ldbqMEp+SNO12J80UwcteGBMxsVUG
 bY4dQVC5IWA9ttvWUFtG+Yk061g4ZWkPGlkbAlMjpCKsH/8zubJTV6JK+AJ11KkNvrZa
 9aEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNoZM1AeirITQOsTpAY5dyMSPIF+2TTUXBC1Lm4Ajm6mH68pCPDJntlFSTB9nt54kQ7lmeeHH95K0Emg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy3sBgx9r01ZzQ2L6JW1h1bubIdKZFNSZWkXSleZsBE4CQJ7JXW
 Bh8dqLnQ7Lf1id+qg8Ty5PYAoN8qTmQQFAzUjRh4Rr7h9BdC93fTcKY8JR+kVpZTJ7H4eXYwQrw
 vQrR3VYZQcT3+kNzGTxddDlBtA+mIx40rPtTN3MnSTPGfx9rFroa5SbfFCnpzoNV0XI2wq104kb
 V4YIDrWS0=
X-Gm-Gg: AZuq6aLRxy4VZasmMob36mphMSORgxURN58pQt3evOjX/eOeBIQu3ka68sAo0OwwOdE
 iN7yFzcaB7yore/PRDsEc344+NLTxmf35zja2UFWSghMgxCkj3uNSXCpOYDfNrkyncdihzg2YV1
 Qc4UGPc1Pe0RSNX0bRUMn8uF0f2glaYnW80Wfs/dX54WZIGGLiXzTWDhkgjpbPAX4zlGp3umffM
 JQ7Cmk6CsCtTfXXr0VkSYJxSoFCufu2Q5ly9sE/Xm95RdsLANDuhAvB07WKnhqGGdL3QynYFK2w
 Fu0E/JOfdRy6dGTj0R/IKRdcLLNPku028AjrqBKOf4ZMu1xEKhXPYT5d2t9A6INR4O+beZjlvfU
 1l7jgdpcsD2Y7NE/pwxBT8T0=
X-Received: by 2002:a17:902:f549:b0:295:888e:9fff with SMTP id
 d9443c01a7336-2a7fe55eb73mr27275715ad.20.1769175308630; 
 Fri, 23 Jan 2026 05:35:08 -0800 (PST)
X-Received: by 2002:a17:902:f549:b0:295:888e:9fff with SMTP id
 d9443c01a7336-2a7fe55eb73mr27275115ad.20.1769175307878; 
 Fri, 23 Jan 2026 05:35:07 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802fae223sm20914885ad.77.2026.01.23.05.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 05:35:07 -0800 (PST)
Date: Fri, 23 Jan 2026 19:05:00 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExMSBTYWx0ZWRfXwfeHGN31Sej6
 QqM8doHKKXFqzSdHaEGbWls3L3zhJu5XBFf6v3td/snP3TJR6/4ZQUzmq1gyOAK5bKnssVmIs32
 eue+rMGcGF7vQdj5X7rCDfphMXqEP04y3YBt93gKzScoY7alAKDCb8sMohmnNcBtsA2Ze3M2igC
 mRctWVwMaq7kWzHkAJ2hqIf3M0AW9kLSyskHsHgkoUDHm2eU6mWuUtyyKe15JX9crkeuzhtAR+y
 9GWjgj57Vssj9h4pA2plGZoU4YYIgzmkJ1yB60nTR8j+g/rsBvYLM2Ud+0zSJaqAIeR/SaBSfp0
 SEM0h6DlYDb2UVEM3H33a1kWSM2Afkv9BjygwcIebPP/rNy3z6erSXjeoeCqBJzaRsinJ8nxf+w
 1DVLfaWR43T5uIkQyZOg3sJhrL3hLSjmlo53jchYi6sZ7gRaDCBKxm/vTsR0rZ0dhGNW+9kcTAk
 51rt/IdcNP7Ypj7zj7Q==
X-Authority-Analysis: v=2.4 cv=JuX8bc4C c=1 sm=1 tr=0 ts=6973790d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0r2zT4SsX8YMVSwxOEMA:9 a=GhYN8kBgHxEzIWPn:21
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 3svgaPV31_5Hteibg-x-9eYJczbC_EUI
X-Proofpoint-ORIG-GUID: 3svgaPV31_5Hteibg-x-9eYJczbC_EUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230111
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lunn.ch,linaro.org,vger.kernel.org,st-md-mailman.stormreply.com,google.com,kernel.org,gmail.com,lists.infradead.org,redhat.com,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_SPAM(0.00)[0.467];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 6EAB776503
X-Rspamd-Action: no action

Hello Russell,
On Fri, Jan 23, 2026 at 09:52:00AM +0000, Russell King (Oracle) wrote:
> This is the v1 submission: if it doesn't get tested but review goes
> well, it'll end up in net-next and mainline without testing on the
> affected hardware!
> 
> Mentioned previously, I've been trying to sort out the PCS support in
> stmmac, and this series represents the current state of play.
> 
> Previous posted patches centred around merely getting autonegotiation
> to be configured correctly, to a point where the manual configuration
> can be removed from the qcom-ethqos driver. The qcom-ethqos driver
> uses both SGMII and 2500BASE-X, manually configuring the dwmac's
> integrated PCS appropriately.
> 

Thank you for CC'ing me on this series. Sorry, but I have been M.I.A.
for the past couple of months due to some health issues, which caused a
backlog at work that I had to power through. I haven't been able to
monitor the mailing list for stmmac patches.

I tested v1 last night and just picked up v2. Here are my observations
and logs (phylink logs are enabled). I haven't had time to debug the
issues, but they are not seen on the net-next tree. One thing that I
remember from our last discussion is the need to test with comma
detection enabled; I will test that next.

Tested on the QCS9100 Ride R3 board with 2X AQR115C PHYs. I have one
more board that I can test next week (IQ8275, which has a single
QCA8081 PHY, but that is limited to 2.5G because the PHY switches its
mode according to the speed).

1.  Boot up at 2.5G: Continous TX timeouts keep issuing a reset,
resulting in a broken data path.

	[    7.492567] qcom-ethqos 23040000.ethernet: User ID: 0x20, Synopsys ID: 0x52
	[    7.492576] qcom-ethqos 23040000.ethernet:   DWMAC4/5
	[    7.492601] qcom-ethqos 23040000.ethernet: Using 36/40 bits DMA host/device width
	[    9.556835] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[    9.566440] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[    9.577175] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=333)
	[    9.586679] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[    9.615015] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[    9.622371] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[    9.631155] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[    9.637701] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[    9.646026] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[    9.654175] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[    9.663212] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[    9.671797] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[    9.695529] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   14.219898] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
	[   14.231487] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control off
	[   26.308402] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transmit queue 3 timed out 5512 ms
	[   26.319068] qcom-ethqos 23040000.ethernet eth1: Reset adapter.
	[   26.328258] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   26.885477] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   26.893552] qcom-ethqos 23040000.ethernet eth1: failed to kill vid 0081/0
	[   26.900711] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   26.908972] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   26.917145] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   26.925232] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   27.836839] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   27.846435] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   27.857175] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=333)
	[   27.866659] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   27.892561] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   27.899700] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   27.908831] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   27.915373] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   27.923697] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   27.931850] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[   27.940894] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   27.949481] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   27.965702] 8021q: adding VLAN 0 to HW filter on device eth1
	[   27.971735] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   32.552893] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
	[   32.564571] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control off
	[   44.292394] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transmit queue 2 timed out 5548 ms
	[   44.293874] qcom-ethqos 23040000.ethernet eth1: Reset adapter.
	[   44.295010] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   44.846480] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   44.846503] qcom-ethqos 23040000.ethernet eth1: failed to kill vid 0081/0
	[   44.846652] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   44.847116] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   44.847529] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   44.847965] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   45.752841] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   45.752865] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   45.752875] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=333)
	[   45.752881] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   45.764640] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   45.764958] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   45.765223] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   45.765228] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   45.765232] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   45.765236] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[   45.765240] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   45.765243] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   45.775210] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   45.776826] 8021q: adding VLAN 0 to HW filter on device eth1
	[   50.455049] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
	[   50.457389] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control off

2. Boot up at 1G: link state is flapping + the same TX timeout issue as
above. Also, a warning due to qcom-ethqos toggling ANE. For the link
state flapping issue, the MAC/IOMACRO configuration looks fine to me, do
we need to handle something in the PHY?

	<Console gets flooded due to the flapping of the link state>
	[   34.444213] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   34.444229] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   34.444257] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   34.444262] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   34.444818] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   34.444832] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   34.444862] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   34.444867] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   34.445124] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[   34.445154] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[   34.445426] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   34.445439] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   34.445480] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[   34.445509] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[   34.449951] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   34.449957] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   34.449966] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   40.476697] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 0: transmit queue 2 timed out 5004 ms
	[   40.477296] qcom-ethqos 23040000.ethernet eth1: Reset adapter.
	[   40.479898] qcom-ethqos 23040000.ethernet eth1: phy link down sgmii/Unknown/Unknown/none/off/nolpi
	[   40.517655] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   40.518174] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   40.518623] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   40.518986] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   41.405148] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   41.405175] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   41.405185] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=340)
	[   41.405192] qcom-ethqos 23040000.ethernet eth1: phy: sgmii setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   41.416920] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   41.417226] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   41.418826] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   41.418832] qcom-ethqos 23040000.ethernet eth1: configuring for phy/sgmii link mode
	[   41.418836] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[   41.418842] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[   41.418846] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[   41.418849] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=00
	[   41.425947] 8021q: adding VLAN 0 to HW filter on device eth1
	[   41.432191] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   44.979659] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/off/nolpi
	[   44.982047] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[   44.982092] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[   45.019087] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   45.019101] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   45.019120] qcom-ethqos 23040000.ethernet eth1: pcs link up

3. Switching from 2.5G to 1G: similar continuous Tx timeouts, warning
due to ANE.

	[   97.318077] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   97.877280] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   97.877309] qcom-ethqos 23040000.ethernet eth1: failed to kill vid 0081/0
	[   97.877507] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   97.878080] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   97.878530] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   97.879004] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   98.784839] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   98.784865] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   98.784876] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=333)
	[   98.784883] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   98.796612] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   98.796912] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   98.798518] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   98.798522] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   98.798526] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   98.798530] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[   98.798534] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   98.798537] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   98.802000] 8021q: adding VLAN 0 to HW filter on device eth1
	[   98.808472] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[  102.180528] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/off/nolpi
	[  102.182972] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[  102.182986] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[  102.182994] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[  102.183000] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=00
	[  102.186901] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  102.186913] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  102.186952] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  102.186955] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  102.187089] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  102.187092] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  102.187123] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  102.187126] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  102.187169] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[  102.187175] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  102.187178] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  102.187206] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[  102.187213] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  102.187217] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  102.187218] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[  102.187273] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
	[  102.220947] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[  102.220958] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  102.220972] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  114.309051] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 2: transmit queue 3 timed out 5588 ms
	[  114.309141] qcom-ethqos 23040000.ethernet eth1: Reset adapter.

4. Switching from 1G to 2.5G - similar issues + a NULL pointer
dereference. I am checking on the reason for it.

	[ 1235.996004] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[ 1240.517716] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
	[ 1240.529470] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[ 1240.537642] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
	[ 1240.546702] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[ 1240.555441] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
	[ 1240.564481] Mem abort info:
	[ 1240.567377]   ESR = 0x0000000096000044
	[ 1240.571242]   EC = 0x25: DABT (current EL), IL = 32 bits
	[ 1240.576720]   SET = 0, FnV = 0
	[ 1240.579874]   EA = 0, S1PTW = 0
	[ 1240.583123]   FSC = 0x04: level 0 translation fault
	[ 1240.588162] Data abort info:
	[ 1240.591149]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
	[ 1240.596799]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
	[ 1240.602007]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	[ 1240.607483] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000137f96000
	[ 1240.614107] [0000000000000010] pgd=0000000000000000, p4d=0000000000000000
	[ 1240.621093] Internal error: Oops: 0000000096000044 [#1]  SMP
	[ 1240.626910] Modules linked in: --
	[ 1240.737142] CPU: 1 UID: 0 PID: 55 Comm: kworker/u33:0 Not tainted 6.19.0-rc5-00581-g73cb8467a63e #1 PREEMPT
	[ 1240.747223] Hardware name: Qualcomm Technologies, Inc. Lemans Ride Rev3 (DT)
	[ 1240.754461] Workqueue: events_power_efficient phylink_resolve
	[ 1240.760368] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[ 1240.767509] pc : phylink_major_config+0x408/0x948
	[ 1240.772340] lr : phylink_major_config+0x3fc/0x948
	[ 1240.777167] sp : ffff800080353c60
	[ 1240.780568] x29: ffff800080353cb0 x28: ffffb305068a8a00 x27: ffffb305068a8000
	[ 1240.787894] x26: ffff000080092100 x25: 0000000000000000 x24: 0000000000000000
	[ 1240.795219] x23: 0000000000000001 x22: 0000000000000000 x21: ffffb3050555b3d0
	[ 1240.802544] x20: ffff800080353d10 x19: ffff0000b6059400 x18: 00000000ffffffff
	[ 1240.809870] x17: 74756f2f79687020 x16: ffffb305045e4f18 x15: 6769666e6f632072
	[ 1240.817195] x14: 6f6a616d203a3168 x13: 782d657361623030 x12: ffffb305068c6a98
	[ 1240.824521] x11: 0000000000000583 x10: 0000000000000018 x9 : ffffb305068c6a98
	[ 1240.831849] x8 : 0000000100006583 x7 : 0000000000000000 x6 : ffff00008083cc40
	[ 1240.839174] x5 : ffff00008083cc40 x4 : 0000000000000001 x3 : 0000000000000001
	[ 1240.846498] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000b269e5a8
	[ 1240.853824] Call trace:
	[ 1240.856339]  phylink_major_config+0x408/0x948 (P)
	[ 1240.861167]  phylink_resolve+0x294/0x6e4
	[ 1240.865196]  process_one_work+0x148/0x28c
	[ 1240.869316]  worker_thread+0x2d8/0x3d8
	[ 1240.873171]  kthread+0x134/0x208
	[ 1240.876490]  ret_from_fork+0x10/0x20
	[ 1240.880168] Code: d63f0020 f9400e60 b4000040 f900081f (f9000ad3)
	[ 1240.886423] ---[ end trace 0000000000000000 ]---

That's all I have right now. I will try to test out with comma detection
enabled and share the results in a day or so.

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
