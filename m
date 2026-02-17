Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FN3Ft61lGlMHQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:39:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE59614F408
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:39:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AC5EC5A4C5;
	Tue, 17 Feb 2026 18:39:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70C0EC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:39:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HG8DH0288000
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HrP1EV3T54x1E7EsuxwJ7YEZ
 jkA7SuQSx7N9/VtPaic=; b=XnMxNOFA2nL3bBPtO0tGC9aKa0ddr3/TFFj3lql+
 OLwEaR61vOGo5OobG5tWWGPMXlHRCQ6VbxpjC7juDNVFex8dYWJr9h8fSJMzAqsk
 QfF9nWGB0+y1rq+o6ZpZAt2bHwH6LN5Ne7ZJvwkFIokvr5gpaMUwYI7vWaaMMTzu
 T0PNooiyLyxniBkd5QqjnoTglaHnsauLxybFqkADjbDK9euSUDGfrF8Wqxu7bD1X
 cKdC2BId1DTqMnOP8uFI/RplCaAy4SAbut8RVuXx6Eve3V0WKQ+Ks/EyX6q4NCqS
 sc9nxdPXDaKfhzHSt7IdyaCDsi8cGcOuzA6M4m2PdgGlsw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrug2j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:39:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-824af3c6c0cso2267452b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771353562; x=1771958362;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HrP1EV3T54x1E7EsuxwJ7YEZjkA7SuQSx7N9/VtPaic=;
 b=RStgfsqfT1azhPOCy2MaX2DBWhhgJDw4QZt/G7jgxgI/pWg1KmsgKNz5iH65o6IjZW
 2ZxpGqZNFzicyR0s5SaZjmQOVnHSUFcbOEAqsle63js83ZJnG94Q7mrJBqM58+YqKxGi
 BrtofhnTFwGi5uEZ/fchgvwquMTk/LYK/58jK95Avo/2vq2aKtpOrFzxkp+q2IAKKG8f
 6BD/RBQQJtuoKugVBH7RZuZFXSIPV869ENy+gtqzNf77+JP6XqAERonTBb9rX0RmljY1
 q+evL01dvHjRXMOpsROS7pHe927iLWDJecP3AJK1JUsER1ECzCxQXs37fuECncGTmTAD
 d5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771353562; x=1771958362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HrP1EV3T54x1E7EsuxwJ7YEZjkA7SuQSx7N9/VtPaic=;
 b=bXL+A+V5T8Qh6SV2dhB9d3LOsgrL1UCpZNnXlbz0GOn0wt2u8nYBQ//SabhiQs9dMR
 sAteuVgj9EDEXwAl2IrOafb/oq/EOaIwudPngk51x8Nmktdt/CcY50bTw9KDQeBUnasc
 +rZSzKgMb/t/veHW0yWxk1NSxhpNrxzKp6is1o+6mLfe8JtmbeWZsZBaJY9yf2y9XhbE
 QsXxIGLctTJr0j0l8q1ZSwzh/+RaaL0lPN5icP1QIBI6Q2P1KAEi/iuYb4AJtryUvm03
 4G//S6el3+qwzNqwqGGg0MKmyRqecMrOXlziUzDaNa5gkZDfloHwMfg81nPEC5Ic6sZL
 HyAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWluwufactiIuSP4uv0GCtU4SguWWg+yOAKw/ocJj+mp6TisDXE/0efpOTPkem/CHYil8ZEhb3LUbnUTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzi+bmm2aDs/pu1Md3SBPOqrKj2Y/5UP3YtmLgcBRa5cgOCkeRZ
 6QZqIRk7dx3VMpCNHqoYK6K2kVoilx2bFAxr/6M6pbqtvm7ZyE1QvKnze4QjWwZzd5jQZXon+aE
 l012ssGEI1omraHOG6NkQpjgW3WXyRPCoGs52Kz51c9BcWeKlsX5rkWaBluUCKDcUzQY2oDp63s
 By21LispM=
X-Gm-Gg: AZuq6aJb0NRssfI17vEHxWX8A6xjawdbXZkrgsOj1w2vR/MyQTM9AS9o495Qw3/sYp7
 l7F6rXAvsSm6nGkkewUqJ1aY/SY7Aiw+UqTjA1Ep++8sXWFDK4tH3Oqc3068Nl8NLeeFo7/HKNV
 JE5wo6m7skoyYcB7nTcbIEktiEClUnh2NsYMJ/rt6UxYAaMKYu/kq6yIFSfZo6Bpv0k5KDK6UR8
 n20CVq7oL6JqFbaiNsozjxWdy5kJAbHgTofxrib1Uzs4A3tBUVGlcBm1Iu6331NsXvyDeKV8iNV
 zQEG0vHMA/tFgzCEa41DfTltXtkW08xN2s/9GSAdYdN/y8KwVLlEURAA5TlqSBm4PDrUznx0tFr
 3FVsjzsGJuN8YhhpxF9uf/xZLT5NufVOJSag=
X-Received: by 2002:a05:6a00:600a:b0:824:a0b5:730 with SMTP id
 d2e1a72fcca58-824c94ed641mr13781186b3a.13.1771353561875; 
 Tue, 17 Feb 2026 10:39:21 -0800 (PST)
X-Received: by 2002:a05:6a00:600a:b0:824:a0b5:730 with SMTP id
 d2e1a72fcca58-824c94ed641mr13781157b3a.13.1771353561363; 
 Tue, 17 Feb 2026 10:39:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6bba008sm13377726b3a.64.2026.02.17.10.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:39:21 -0800 (PST)
Date: Wed, 18 Feb 2026 00:09:14 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZS10liDHG0r6UJt@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994b5db cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=VKYGXzwvPY_sFHXjFqMA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX3p98/HWp+NxE
 ZRsxjDypPafQhuYW7ck1K2WllWe4x39gSZ31Ojk0PIOgiSj0iIT/ImbhAFP9Nl9oonYnh+SmHcf
 lQScEJwhAigpC3o5cfqbf4o/DUHbpu24ZARiAX06iZDamFCM2jfFXfnom6f6nisZSX2NSnsmvns
 xIfKGaMb6164hJVDOW7fTA7kmUpmfalVFAqC4h7P9fTh59SDRjcLTzZwxeullSSgKXnAz1QDqUj
 osrURph1r+qxycEeNjssYQnWHZOxUKwmzqiiJLZ37dG5xRQTl85cumwvgCQlfiH3MqBgq3FrDoa
 jPtFMag7HiTooTaq/GIaSltNhwjQHKDIx+XA7Sx5mXGGyP9/dnbPkyBlyzfMfLRgG0yPysJtEa5
 /62gKaH/jpW+FpAZXFbb6nYGpwE3dJ2yegk4M82NbKZ18AcA5ZsQ0+UHQIfL4rlQiQ4ATAFcwTQ
 i+uAahUvbS5imdOtXEA==
X-Proofpoint-ORIG-GUID: c0lsMm4WOxSBXsYrlzy_m_pSp8q8Jm8H
X-Proofpoint-GUID: c0lsMm4WOxSBXsYrlzy_m_pSp8q8Jm8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 7/9] net: stmmac:
 qcom-ethqos: pass phy interface mode to configs
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
X-Rspamd-Queue-Id: EE59614F408
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:16AM +0000, Russell King (Oracle) wrote:
> Pass the current phylink phy interface mode to the RGMII and "SGMII"
> configuration functions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
