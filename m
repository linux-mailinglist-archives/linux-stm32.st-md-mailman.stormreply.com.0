Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHVrFRi2lGlbGgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:40:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1FB14F429
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:40:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9C4FC055F4;
	Tue, 17 Feb 2026 18:40:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23001C5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:40:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HC7wLu1973499
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4eqYZw+qW466/zd9o0hZO+Wr
 bSIyZjH1x8DDDr0yC84=; b=JOqpjRYupn9Fjgx6aUFYuSq+vqZrEJFB2W4Spezz
 aaDKrAUMKpj14T1ZnKXaGfIOTd50gSSYLFNaayjCIu8h+Io4msOmYBioT6cth/PS
 +IA8j2gt+eG1CVUxqloETCK6/njQZ6CEraP4BXqF+vjbp2kCm5thAOSuOTz68j5R
 ZFgTam9zOQR6DhCgOp/GruFXMeVTGG7NzsA+XtMmrfvM+/Qnwlv572y2zyEhNZst
 H8B8N9SGwgLLH14/wzcjVK4g52PIEc7SZWX1l8m7NrfqSN6VKftAGXkP23pmqy1e
 4e9vR0BdxdkhL5ZB12damwFeE4YLYzUePkKd13oH2Cn7MQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662ukbe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:40:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a946c0e441so45545145ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771353621; x=1771958421;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4eqYZw+qW466/zd9o0hZO+WrbSIyZjH1x8DDDr0yC84=;
 b=QPZIvCo/IlhY+TfwP0m8mrUTnLtUeF8WtroRpKsivTAeupWXfym50IATlFLrJjbPJE
 nDQLTMz7KqbpQwUHAnU77O5gwJNXpRkJSwPAYRjsI7fetIQgjU2aWJHtuNOmRUTm0zS6
 x7SQAzkS3wCw3EFgKzW8nkKOhjL+17V9wGCfc10MMNry1h4nDPZcdUzPexeZxkaJZjFA
 wwSBj2X/rC50T3F51ZBswlqeZ9WTKQ/+96MS8kiBiwuruRMgTShvue3f7vT/uSbvI9hQ
 r1JafzSUelamzRyKEMNtFaAjQWHgwkHE5yBOmx7L6CCqtVRB9ka8BdlbtL7BYc+ZHmmT
 EsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771353621; x=1771958421;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4eqYZw+qW466/zd9o0hZO+WrbSIyZjH1x8DDDr0yC84=;
 b=LI7WWfbrIjlXj3NrLxZ0ryUOglpeYgPKeyj8QUZHee5LUV+ON/Q9vmlBK9gANsrdpu
 0ep5d6pUEWTpEs8sqwd7O/DtmOBRDjb2msMTZfco5QaOwrwE7YnMstFLbuzSzVuPlSFp
 tmSlfU3cALKNhcW1aSwmIdnxEs8Al2qkxTHv08fUK3d91zyemeGBF12suZZcWznYsCNr
 G84JVgZHZ+3nKaqkEKpgFG/jBMKivlpyOH8kfrlEgoRf+A4K2/FAXzdWvwyHIN7LWq1L
 pGHIhNzwodsJBKWixSAKRJHuAMhDRsjGgDjgdAMwWNtvHfa4kNjamr321B+iFSkVydKP
 k/zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvc+/tKgidGZzCzCjdBnrvaPGwEv7WxHGvXDmDz4pm5R8v4oItyEStbfwmQMRBwewDxta8LaXMRo7HPg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJQPQ+hNdXMJqTN2v+rFgOktet5U4G2SFuaUHJPdIeJeuLgl/h
 iqBc9eHngdAt9RKzJVAa83wxkMteZFmAlCkFhWyCvoY1wvMEwD2h5/Dt+HRbZB6yNQ7SNsS1LgM
 LvFVgmeKbE6mlNFWrrUobUmAMnh21YyOypqJXg3tRLHx3EzJLN8p5S53d5KkohUg6ZHE+hfFAKU
 h7GbWBKj4=
X-Gm-Gg: AZuq6aIbFwUJITAg/AeBHmQfuUliVozLw5acJlHfdhc2TKaztiD8USur3fpF3U0VLFG
 /HJEqM1yJCCSvXNHfEE4yeifEKMf8beFEe/jPLojscWsjv8nVSYnzIyVQB0RE7lXZDnDXxgcleU
 ywY28iTLdYhQ6FlB0mCSG3kZvFwuoGL8g913nJ+1GjiUjK4W9mXlznOSgwErYKDP5mEozsw7EIk
 Z5Ct9SwYNndLxprFyNO3hRxNfV+zzYzZEEklwUV/qBwHGTauloA42VprugiuRTGI8WlYOWmGXwq
 zazI1NWu1jJ9ET5iiacL78PXTbu/FdbzFf7tBUb7gx10MGjiSNmeSU7EKja5H3ezebGPTZgfUNK
 4u4G9sjCyxSNFAyQEJYH6DvSNJmYcBnmnZYg=
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id
 d9443c01a7336-2ab505a365cmr131982475ad.42.1771353620410; 
 Tue, 17 Feb 2026 10:40:20 -0800 (PST)
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id
 d9443c01a7336-2ab505a365cmr131982185ad.42.1771353619915; 
 Tue, 17 Feb 2026 10:40:19 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad416ee045sm30863535ad.90.2026.02.17.10.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:40:19 -0800 (PST)
Date: Wed, 18 Feb 2026 00:10:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZS2DAd9KQYHML+U@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX3qeZECndARPj
 WbfBp9SoKpEQ9hyDfH5yfE+wkG8KeSD5S1SyIGeP9qx/eTPnC8dCinji48mrKUZ9Ph8zTJrYISq
 WIk/9Qsi4H2ffMFxL+KOjMFwU3J+5CWmCVtsBAduWjydnaLW39av0e1+A5zN7UOFK/XGftYVQdP
 LcWUr4/tXaNY9q5MhqOOrqo8wkqpOnBUtrIy1tPys5IAEFjNMdUwe1jnA0TAX1ViDDM6KTWggyW
 TFpN3oib3PM9xqDHS2v2XtYcMs/Lu4cUjdWgu7OPlSl1HHb9qkT5DLx7KrG59CvoW6eol3rkzZf
 wxd2XeLSh1GXzAaFZIhhUS9C6Kf7Na1t9+JuAw77jIzWhWr4icb7nXf6Euq/83mCtw7sZJHaYFE
 5arqkUaJqTxz/vSlX/2mk64Eqqx+xz19hiM55+YREUGkRCaQupdIuzcFtxKYYWnkafxQMt+5Huf
 +0aHLbnSMv7QYZs48dA==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=6994b615 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=z4Hhns87Kg07ZqANAhsA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: BQ8Y5c6Bds2YvXMemZY3QtJDmdvpSQVW
X-Proofpoint-ORIG-GUID: BQ8Y5c6Bds2YvXMemZY3QtJDmdvpSQVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 8/9] net: stmmac:
 qcom-ethqos: use phy interface mode for inband
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:imx@lists.linux.dev,m:pabeni@redhat.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,qualcomm.com:email,stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email]
X-Rspamd-Queue-Id: EB1FB14F429
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:21AM +0000, Russell King (Oracle) wrote:
> qcom-ethqos currently forces inband to be enabled for the Cisco SGMII
> speeds (1G, 100M and 10M) but not for 2500BASE-X (2.5G).
> 
> Rather than using the speed to determine the forced inband state, use
> phylink's PHY interface mode which will switch between SGMII for the
> 10M, 100M and 1G speeds, and 2500BASE-X for 2.5G.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
