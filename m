Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIaqFcusrmntHQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:19:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0555A237C71
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:19:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B434C8F27F;
	Mon,  9 Mar 2026 11:19:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88CCAC01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 11:19:36 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6297vxbX3125277
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 9 Mar 2026 11:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aBuXrT3z0syHkRjP3iylAVgo
 7EGbnv7gdiOgzGuaCiU=; b=IpI6JDD0HWnBmmlj0OFHN8/gFzwsaR6GGIPaSRWZ
 iFf/DH7u4vd7h1Ql6MNsSNVW9oPR5VFW70oJAOTynQa/kotTy97vXA0zLfU6dzvA
 uNntI343AApVrwilF4Ccnldt+LK7L50ujgLUmwLSHh8Zw6kc69JCAMGvA05QoRPE
 9O4dpQc5tRl5IG1keLHk0u4cwJIhRoOu4w361lkUDa5Q2QOyO9hNNQvNH43cn8he
 7kk5Yw7SulMX0XAPaDCMv1J1DuARQsDGemPZ4pfuNOCdlEnEvGJDhSE+ExzyMWep
 mCjRxW8ZWiSYWgw7VY+HBiZ9DBPabub841Zlzj4UETzIkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83d4nj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 11:19:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2adef9d486bso102877165ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773055174; x=1773659974;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
 b=I82IO7Q3sJpZ7Uo95EXmGQ1G6vw0U1YbcyODwtuoiqZf0CcpV1InZyj3Go80BLkT2X
 ySOC2vHw5BxK4sxp3ebbw0YX2yJ3El4j/KWBwyavY86nW8TdE2xdezOidfJPaaKqakvL
 BPlLzw9U2hpCu4lXImAEYe9DaJW7PjqD44Qts+WN6k9NFu56K6q1kkPwNjXRDyqTSsK6
 NdrXUrFjVpEJ7wV2gyW1zbb0ojX1cvj5YSM2JyFJMT2UwqLzK+facNBZh5pyl/xgMqgl
 HEUu3sOnI/1A0eNmEOyEBPH/k7ACUZG+Nqh6wPQ6Q301M7I4Dl2pxCbZeDgWH0wd33GU
 de6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773055174; x=1773659974;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
 b=oz50Q5jX88trtwqxJXm7wdfKCfAzx69PB8qcYq43gSi835a3tcF2pshfLvJB1k+gEA
 UgG+SrQqaXCnnW2pBl2GdiIjwwRi97ZsMMWokKK+Rl7CrOQIoMY4Lh73Jky9UBZG2YWg
 EvrYPov+ZUIr/nIeuqtZOFSdJpp0QjaVTRDsyzrrRdLj3/+GLx/18OdQ4jhBOh0fV7ZP
 QEujRgn5I6/4p6gQ1Y+d+wpThDT7wfJ/ix0pPaneaC88ukMEGoEbm/wVVIllZjcx5dmK
 zeeAXlowsbUcWZI/YKx04hdmNfNpd/3APEgm4Hwz+4PVafd3Ml/UUyLPJYh0sTSUN/6s
 /Bfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzQdQ8MHGZUCVKZrgKpfdaiTSJ27g3XD4zWMGLrze8OpeTC6V1YcTai2/NB5LQZGFMx9bgp4fz1E9yDw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyKMID8QbqD9wbObcPO30VWY7IHV8z9SZky/uHOTVM15mr4o0sS
 1XvsD8XF75SBsUMHQwcNKD89F+1ZXm3qclvVnvACTLiA7AuLCYsoVsAyq9N/P5GrVtBq+wbwxyC
 1B31UeXs41KGPtWjIRi8pOT4ktFud8eP4wKlqLzZX4OQKDI3H+HmIZbIOK+n1qcXLE2HdpCdsCp
 lEDoZmCeA=
X-Gm-Gg: ATEYQzw0d2muK1Ldy3AVm24yY42FJy48rhssZKsUmLnwpUQsndBZDvZ3bVuPo9RdEKt
 rCvbr9dYltyqwcsM3tG3Hs4LBsX2C4lm3ux6JFOq6dkPqXOI/gagMpS1vxRJlmvPOIg4iAUwiAi
 ezsIQW3I/HRCr89mwdSwdNg3wchmudwub9NeVFYxeqpwtlqlXyYVURbNTDNY3TdZ2tIaGDXWxy0
 aNVu9PTXdHdvm5x2WBxbpWpk2T1KnMN2nyaO0SESChY6+WMRtNSNP4fiFwSeM9McrV2gBKK0nXA
 e9ll/krpjdT2HLWI+w/q3Yi1BmH6ubjyNQQTUylSPCcoQsZnxCLaCu48/3U04sCx7mwTk3JDqWy
 Epn7WugWBzpfgMlaaMPtsylfdYBv8zz8XeSk=
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id
 d9443c01a7336-2ae825056cemr110474365ad.41.1773055174154; 
 Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id
 d9443c01a7336-2ae825056cemr110474115ad.41.1773055173696; 
 Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840b2e9dsm150127135ad.85.2026.03.09.04.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:49:23 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aa6su45ASA4jR2VJ@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69aeacc6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2l7Dc_Zt4Q8SQ2GGjncA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNCBTYWx0ZWRfXxMALnst2djYS
 BTquf1bQuyxoO7l/JY8JzWEJ0cyj3kFxhbIczIxsIXVpnwBIy5mAOUQfsqc7C5BpyNIN2e6rmTQ
 7l05ledRvR6zrWA7ulctMgWz9AzXA1kTo9+7DWdarNQzglK/6Nfm+H5g5zvjBqc/V/obWNeoRo/
 zmzMoXkqfkT3QTCxlnfxKNlmOUWDrR7IcNJ9dM+CLwrWHp+6tddMp1PsX1J79PMVHynEXAMi20p
 NM5ositAblNz9QqB1J3R6/1aq/FR4ZyvFFOqCQxsB0jk3JcMtcIa/6yZWI2k9w45+KGqt3XfwKK
 rJvO7klD5H5aj2kRFnWK345NXNnQ1SBUiuyqaeYBUzOYJWdMsmqjTVjyRXw+kWm/P6Y23xrko3p
 VPGEtTtp2cCIHpmyhrrcC/fihCz8IQ+qsq4D/wWxSHD2jHfgq9CVafir920vVUQ6wtNHKghXVGc
 w0MwhXNgAp518U7Eoyw==
X-Proofpoint-ORIG-GUID: aiydxpEdQ3jRjAoT9dSG0t5LpZzYCWRa
X-Proofpoint-GUID: aiydxpEdQ3jRjAoT9dSG0t5LpZzYCWRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090104
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com, imx@lists.linux.dev,
 Yao Zi <me@ziyao.cc>, Frank Li <Frank.Li@nxp.com>,
 Eric Dumazet <edumazet@google.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/7] net: stmmac: use u8 for
 ?x_queues_to_use and number_?x_queues
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
X-Rspamd-Queue-Id: 0555A237C71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:s32@nxp.com,m:imx@lists.linux.dev,m:me@ziyao.cc,m:Frank.Li@nxp.com,m:edumazet@google.com,m:jonathanh@nvidia.com,m:linux-stm32@st-md-mailman.stormreply.com,m:samuel@sholland.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-sunxi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-mediatek@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:davem@davemloft.net,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid,stormreply.com:url,stormreply.com:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.926];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:39:34AM +0000, Russell King (Oracle) wrote:
> The maximum number of queues is a compile time constant of only eight.
> This makes using a 32-bit quantity wastefulf. Instead, use u8 for
> these and their associated variables.
> 
> When reading the DT properties, saturdate at U8_MAX. Provided the core
Nit: saturate?

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
