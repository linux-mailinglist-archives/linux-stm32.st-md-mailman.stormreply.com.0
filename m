Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGaFNdOprmntHQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:06:59 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B392378EF
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:06:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 435B4C8F27F;
	Mon,  9 Mar 2026 11:06:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33C89C01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 11:06:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629AxpgA2466489
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 9 Mar 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TrEOcA+LHeeXNlAZJAw+XIej
 7hfOvjSZS4fXCV/6ZP8=; b=cT5pkRzXP6qVFsUdkwZYKvpu2QDIkKWB/m+APQg3
 xlQJXyfUDxe5z5j/J9YHHaQyCPT1iK2NE/VExyzQbVIPzEXUZl+ZXZxrAH/SZhyi
 tKDLTr3m9k69Gy909AFRL0cI6KdJD7DFNOmt3wC463C8wLM48cDSrkLOLtV5Ix/o
 EDSTiDTPnhe+j3+TlBGosUM8+4DtPOw1rEaWNMn42G008p9ZCTZJMzyltrDd9F4Z
 O85hGkC/n+PYGdq5mEMfYii5Gpg1wSToemHQAr1t3Jy3ucXGiNbcLnHmcYvBMfaf
 Gujxy+JLvzq0bucFV/9+WtoERcTQlj3aLeDFfn45uRcXQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrn8dh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 11:06:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ae6dd98043so53879875ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773054416; x=1773659216;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
 b=DQtijS1DC1JnEL4RWggZEnVuyUw+jZgsybW3luOjVL/1q16bQObebkmqJXZgR0M0Dr
 Vlfb+VX1Rhn+iUqELQExNKUuFFPg4OVJzjp/0USk8JP7LVVv/6vOZLAWdAZHFa9IGBHk
 09Or+W3b+P4+R5yIoQ7klAaFrTPVheNNcYrdukTYJqc6niNqYggAK/rCVSPEqNgu03vv
 NqqDIxbejCsMHy8A7CFbmf34HaxyTzd/c83rCOHe/436LUv/R3cbEpiu4Wcww2a3NX1A
 2vCyfI9c2ySI/CcEOAA8ifXHaaSUp1zV96jded0IJP6Pij+rXZJgh3r+iqtqr6liCQhS
 nHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773054416; x=1773659216;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
 b=XWju9jx2EXsC9BrPIS/YhhXwNg+eO42hu+9HpXOuYaSHAagSJ/+VMDhakoVk6eo+zu
 Wa/fVmhV+dj2q1FJTHsAZa6Z/huvOGsx3P7YPIN36Nm8VcIMC7lUhoLUV22aZdPEqgb5
 IUpwSGcohCgy0kY+N70QMCwT4Xw/0j9vZSOSzdhJfuRO0iKrhSpgcuaSvERJOpwvFhBH
 nqn3k9og03NHV7Eydi5BYIlkYJj3+pCvIcJpwiN4YMsEc88/iXOo58JcKYk3sgBQZvSe
 3iV+OpLRZP32eVVj2jr+51Bug4qDzf7O/qfQ6dZReOA4DY3gGowG+wMeMy4RiyLjGrom
 2+QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpt04SMm+4nl/LLAnvkedCHVk3yCyJpdglw75OZWSS4uBPn48usr5TCaW/RUh3mqIQ110qyAGONg+sxw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyaK+lQ8OAa3TXyQKLUVEYP8t1LNLzH6Eat9stOeI3OxxdX2+EI
 HKO7q0xN8NhQrwkxEEqNd/GhRyHwTG5IT3zlay3XdEmhOrnOzME82mWpXPUsPfb1arses85djjj
 Z9yevcZ6yux0oH49JSbiEakcyZqdMklzBZVuaSBDod+ZQMI8WerJC7Att7TEppUVI61TZE3uqqu
 QYIjsvakI=
X-Gm-Gg: ATEYQzwnGXpDQipJ29s+QayDDJ0Q7yG7IblorHFNX6KbtRlwSa/4T0JjnfCX1TSGJdP
 ARBro9YcNVVEZz687zN1EgZ6/A1nzOXUKiX8UdsEP1lgYnYYYj59JVI3vf5sx152aZcotOgjPen
 8XTKA2LB/1I/9Kg26bkufXqljriaTiD2WzoVYIQGxt4hb8H+xWKGABZ4bNZC/cqLbP2pz2E2vNv
 DAGZeKF7llNMzvtJyO3WsR20TY7RUEtCE8laox+6WN5jEfgvNwDR917JAtWcrVcFIaVusjEx9B6
 sCnWmOqDw7PtL0prLxPBuEupHmfgO1faGbmFZCjw9qV4d2fmkZzxjVzREFDLqTSym9Ump62oCrj
 I74DWXFg8xwhVYnBwwaS7Evj25tmNuWOj228=
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id
 98e67ed59e1d1-359be353f40mr9443437a91.34.1773054415401; 
 Mon, 09 Mar 2026 04:06:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id
 98e67ed59e1d1-359be353f40mr9443395a91.34.1773054414906; 
 Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359bcc2d096sm4067057a91.14.2026.03.09.04.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:36:44 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aa6pxGDvslU9ygra@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aea9d0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J-7NsHqoITSIJWJjikQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: CGieKiDSrtWZiuiRMazssNQ79C9ixa2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX9uhy0C233P0d
 F4emjG+RoZnh/CfvcGM5cGY4DfpfIgqb5QQUNZuihwuHD9ZDKMbtlVuZ4XjhknHEfah/uN9mfk4
 Jaf2M2dusFpPT7iWFkmh5X2Rurmf+DmQNG4DViI+BXHo59YDxkflnb+uiGRKDvaA/jhDeySdF0f
 TG0IlWMbMV0jRub6uayyNBaHmRORQK6Ex/K2hODC2FtCosA0KNezP1WFBr87mfBna6aJvdKdP5b
 IQbMUT+zISLr+Fa4A2umfKbXf9j1jLS5i8rum+YLhW0Q6WJv+ExsQWP6NjtzyIjP2tPebZScDQ1
 wJNx8HBoMQVw8nY/Znlc9P1wnxctJNZTi102fj7PWN+M1lakw837fZErMgzhPAETuJY/f4HTj1M
 1ZQ/F8P1Wy7LDHHD5tLuzFgQ7Fn5Cq7mpAXGJnBcOcE1IzRGbqNdPUm5g/gYzgmwMlex7YmjDmo
 qODtLfEeYPXUXDI2z5Q==
X-Proofpoint-GUID: CGieKiDSrtWZiuiRMazssNQ79C9ixa2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac: start to
	shrink memory usage
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
X-Rspamd-Queue-Id: 83B392378EF
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
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:s32@nxp.com,m:imx@lists.linux.dev,m:me@ziyao.cc,m:Frank.Li@nxp.com,m:edumazet@google.com,m:jonathanh@nvidia.com,m:linux-stm32@st-md-mailman.stormreply.com,m:samuel@sholland.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-sunxi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-mediatek@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:davem@davemloft.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.581];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Hi Russell,
On Mon, Mar 09, 2026 at 09:38:26AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> Start shrinking stmmac's memory usage by avoiding using "int" for
> members that are only used for 0/1 (boolean) values, or values that
> can't be larger than 255.
> 
> In addition, as struct stmmac_dma_cfg is approximately a cache line,
> shrinks below a cache line as a result of this patch set, and is
> required, there is no point separately allocating this from
> struct plat_stmmacenet_data. Embed it into the end of this struct
> and set the existing pointer to avoid large wide-spread changes.
> 
> Lastly, add documentation for struct stmmac_dma_cfg, and document
> the stmmac clocks as best we can given the driver history.
> 
> v2:
> - fix error in commit message for patch 5
> - fix typo in comment in patch 6
> 

No issues found with v1 on QCS9100 Ride R3, so feel free to add:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
