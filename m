Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBHrGsuqrmntHQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:11:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9AD237A69
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:11:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C90ABC8F27F;
	Mon,  9 Mar 2026 11:11:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F32FCC01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 11:11:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62964xtJ2288470
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 9 Mar 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2vcqntBHnJ9jNcmMCrhjcICJ
 WTC4/uHfcjNc+otCaEk=; b=JeyvWL9CvFdqMvYH4Uwf5YXE6DfuYFJRKgNHwPFY
 j4P2q15t+EjR4zrgqEgCtY6mhfSEZVxpWD8Ja4EEbbJDJoOAyAd77b3YHrktAGR8
 sNrWbQJZhKLG1cyMMGplh0w41UKXhpoPf2MeJiOuhVMxrIJl8FxS0tnYn5yh/K3i
 tdp2qiAEg51gDf7PkG3fG37g1BIo+w6nyF3PQFjASzyrU9UmTqeePxxdNJ8YcKQo
 GTlIlhBM6cKjrIZ9Et6Uc7EyRo5Ofl5HTG3DK13vijuu2TQ48ylv3nf2LEd7a8DA
 ca2Whh2J67xeuowrAUHuoD5nRjBWvj1EenFqV0oJlTNgbg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrn8s0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 11:11:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-829ad81b132so7559374b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773054662; x=1773659462;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
 b=EMN7ObnEU7wEKq6GlG8sPhVSYLHpYu8I1J8F245mQrElr1TDvK7DPRB8+OfZE8c/PM
 L5zR+hDIUakh6vC6Xs00LQorp8h042mB2lNCgpcoM5I5TzybUvA1tOTr0abP26Wg3y/e
 0H3FlGr4DQNd/OUembixZe4qUDKgjBEzRAXSiZ6NjWLafYYMa0gwcqXXJB/h+k/gE6vp
 wWtzcaKiyklEhx59VxvZl4ycejO0ZMxEEnqDyBvQVICwTVlIJY6dq1k1jrV+CC7yk1KQ
 RaYVFdZ7ZpHhKCzrVxUDPkWlcS/qFZ+B+Yu0M125KsXML6FAZl/IEzW1kB0NbFj1bhHs
 uPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773054662; x=1773659462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
 b=A9vlNtfh3Wemcb8krwZ2cmfmkkFnXP9JqjMrJzvdxb4YsXPelwiMceHa9duljx4TVY
 j9F/+20YYHKYmQCNKjqZJ9R9gdZiPZVZi49z/HoZVbBxpwLnPqgP/w5ayg3j8iPl8wSk
 nM+gd0mn32ODniURnrLUN3ihbaB+hGNK6HZoBVCkrFtvX7IxGovS6pHB8nD/1CdSTy7B
 wxqZLwkbqQEztEZj0GqaX6+YpUO1M4Vpg+w0LFsB70mCYa2+0z0SzTZ7v5It0KAQluXa
 A5hmriO1zJjqHqYsDxoK9g5fsnMEJgYqWEWMvlAE7lCCsFM0VSLlSF6hG322DBx1AX7c
 xR6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMUejyHWNZ1SZjSMVn7w4B7ZC+Nsbc+7YrUG8wNSvu5Bq6QfMEycbkjJIU+JM5+uQIJAvVNGDbwaAEMA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxU/VnDhWludZYdnmdUpkxhzQJ4xOwmEm5Mu4VIgX/yG+wctM8a
 JM1/Ju6r/JWUVIQIFyRRU3L/0shrLXhMzeUmrtDU2tMibCCia2LxpCUOyInFcUXEku4esxXmk4Y
 hHYQ+wYyqK1rlqdIRqWpDtvKW7k+W7+PnIe3Wxkk26g6FZDrLSes6gI48wsy0a2imZttxNP37tN
 tCAPSQbNQ=
X-Gm-Gg: ATEYQzyiQTPQT7Tel0DJD/lFmayjh+Fuo7KxNj3wo1YhFHO/JzRaCI3qTUeixUn/y+j
 4AcKbUnl39xVyGi5LAZ1fVK4Qvc+BqOrGtn4QGfF2JGe8TXYBqIyir2m2dNMia+1kU3VLdeQLQ2
 S9HIQGXYmONmcQlF4tNezN7CSwTMqyIAy3wIGOPoe0SnhYiTdAvaUgSWMOaw/fjqIUMZTA9+oqa
 nwArONUyWxa6W2OBw5ZSa2AsIJ9+sJ/1GgFP+Fx5hEp2lZDWcd8AYAN/ht3T3grwMv/i82qDhc+
 AgngfdsSm6sXR57ZgzSoPptbHFnYEQaNxQMIQHl8J0hRcO/4qyYZikt++LzqeusiBflU1FysyOO
 ezJhnA/uLwW1iq51mBO1acQFCFlwPxLhLM7Q=
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id
 d2e1a72fcca58-829a2d85103mr8988612b3a.20.1773054662329; 
 Mon, 09 Mar 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id
 d2e1a72fcca58-829a2d85103mr8988581b3a.20.1773054661861; 
 Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a48676besm9478833b3a.40.2026.03.09.04.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:40:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aa6qu7oWLeB0Dpeu@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aeaac7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=nXI6kmJP-DpmoF2jiF4A:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: UR-S3P-CRURd81V4qoIC6FtlMZZSevtM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfXw71MOprw70dY
 /YlRCyyXFeWHBCFE7wwzHXwpRZpe7e+yBFpdUB7USvYCPYNw/tcrTf3uxdCBU+WmTWK4OISuqCw
 nDODRPt0sB4YDP8mLiqDfc2nCL9K2eg6QiGMgPsVCy3xmc0vPksORJXW+G5wP+djZp8ZPO+Xp0G
 xpKY2ygzudZDr/nQ+MtIHdhQCz6cCwsJwhXQWExXy5xq8OSEAY+xhfPAK/8Xzlk0CY/lw3VHfPF
 OitnM1tS8BhAQd+k5YSFrqDUSMloqZ5fKmQHGZq1MZSp9L57QNJM6bLY1swQAKGpB+Q5tKzbYdH
 c/mt5J7l91WIKjfliM2VkL6eeeMOe6OfTVCJnqXON7goCWLOx/aqRQVuXsG8yZtCO+jp+fsVSZ4
 q2RlkfmaCii8MVJcMKUm4dN0D/kuklzCmHetzyazfA+i0orx7SbqhuwYwaBcV7RFWXzQN1opImK
 aCpxfJHWyKmbcHVGnuQ==
X-Proofpoint-GUID: UR-S3P-CRURd81V4qoIC6FtlMZZSevtM
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 5/7] net: stmmac: use u8 for
 host_dma_width and similar struct members
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
X-Rspamd-Queue-Id: 0F9AD237A69
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
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:s32@nxp.com,m:imx@lists.linux.dev,m:me@ziyao.cc,m:Frank.Li@nxp.com,m:edumazet@google.com,m:jonathanh@nvidia.com,m:linux-stm32@st-md-mailman.stormreply.com,m:samuel@sholland.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-sunxi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-mediatek@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:davem@davemloft.net,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.583];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,qualcomm.com:email,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:39:39AM +0000, Russell King (Oracle) wrote:
> We aren't going to see >= 256-bit address busses soon, so reduce
> host_dma_width and associated other struct members that initialise
> this from u32 to u8.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 6 +++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  include/linux/stmmac.h                                  | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> # qcom-ethqos
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
