Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJEhHDK2lGlMHQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:40:50 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7214F446
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:40:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC2B4C5A4C5;
	Tue, 17 Feb 2026 18:40:49 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9458EC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:40:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HG8nk7297036
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4QQfKD8GVBA2aksYDATKy5SS
 tCQ8N0yPkSM4M0vZP0w=; b=Icz67uQZ1w168zYFAvuoeuarGF2Bn3D6hMvtUWNg
 zmTKVF3NpQStoRjg8WUb7wjYfAQI5z2BZMpvLmLpEHs1E/Q20DbCNoBEhR0sPTax
 ze9EMQknHWmfvSyf1zda+OpzVx3KY6WCHtjl3l49nAeUzR3SgiMQoLZ576nPQ7EM
 t8kwiF7RCCl7lVzF4qpCXw+Amz+clkZmYoyLKpnbDKt1g37NcoQZX3LHu1jSk2Wz
 vk6jCWqZOgYLKWYjC6TS6Pyd8lITbPGK+9Sx6zJ21h+l0ZHxpWH2CZI9CwcXIDez
 ETlIK2eD9FTSwSqfXkJxZtqsXnZHIrX1cxmgGtH9aarCjg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9uhuc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:40:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8249a739d4eso11489334b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771353646; x=1771958446;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4QQfKD8GVBA2aksYDATKy5SStCQ8N0yPkSM4M0vZP0w=;
 b=fm0PkjL+3bKRjv6cClcHPf3bOqSg6hTyICEoHHIvh4RD1BNyxTGJboJLmQC8MxcM4z
 WobHRP/TBWeGem5g41kwrw5Icp9i/rTztU3uG2aQFJG6cnOoZTrvnzqV3+vnP9cB5SsH
 mqNOywRFgItJ1PZKIp3glGOr9mIOP91hxhLbCwrWsJLTOWop1kjYAevkAUNFeZRrS3i/
 hJo2iQOF5IwImlKxkh5cfW+FWLIFiYXNheRcyPRETeLyx/40zibIxKpdT8e6Dq+s0Tqw
 KmNjamRkrITaibbmu08LcTOmBl7s1AgzHBIRaJ9tD1eDKixx0atRzYaxHK1vvlUofsLS
 wO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771353646; x=1771958446;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4QQfKD8GVBA2aksYDATKy5SStCQ8N0yPkSM4M0vZP0w=;
 b=WcthgDk5+AKgv166u2mSsToQOGUuO98PbAvFAK+S1oA7I4AzQXuA0ezTeYndeT32nf
 DqGb2db4nueo/68emDhFIBcm2fwmeKyMjV3z3f68sEXNs6jhxTkCbAN17cVaObmrcm9H
 noznHXIOsuzt+ghUto63s5iAWLqOzvRrnpqJccUIhuRdwGVeaP1V7zimcM9pVHt3XX62
 rIPV75xazMSGLtSS72ZVdEUD/NNPc6ED+gW8WQdYL7H40Vy1a1OZI6gsoluOUVL032Nf
 r2arfwZ+xfBFNoTl/eZkkonsG7Z1pDsZsVIW6KkZS4u/42R8sr5z5/pgcpukXVqLx10c
 omVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQGzjLklBZ2BNJ+MlthrPfdFNDHoFoabdsWhySBbBgVIQZr6J3hYakyy/fXse10fVSJK3L6LZG183HtA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztVWYra04D56glkHqQ7TFBteV+c8Hv+Uo3cjFcFWiuFbmOIbMm
 CuaT0EKQWAFgzkFYpaTO7XnTXwbZeZiQ0/R/7O5RKcdeFG0YukHG8VRt/bUvBSzXpk4dJEj0cM9
 GYUMapeR7kM4buBeIa2b/EfOQnO2tbE6i02fbVsgKoZALzi2VRPeZUXC6MicPkaPn+vo4CuBSaL
 XcqttiwlY=
X-Gm-Gg: AZuq6aKFfnPZpPOag2H8trn3mqPdC7qh+tfnwIQV7WSceCsS1teUldx+munjc5S72SJ
 74uqwj6SDx4YRvtEh6iJ3gJNoMrCVs3/F4V0eKy5hHui4cxvX5rhLNpcuzn/vaHt0iDxH7Vdsl1
 MUhdsXbo/OdkYbW9Nk97a/DR39mxGRuJM7Uox+clYMv8NOm0CZZt1iToJce75xI4va79kz6aCz2
 y3aefvQ0dXlcLRWaru2oTbwFBBZO3WBv0Qq4wXT4k5Qdjw/Uc8fzZFpf6rtX9haCxGDcuL5smF5
 Tm5Uoh3u1mcOc9HDW2htwKoMScYA83kjz8GEDpkHh4eHQFKIggp8oSqg+IYgcxeRJKp5/Rr8rJ0
 jRTY6/G/o6ml4RXG4vsvmudy20alzodritSs=
X-Received: by 2002:a05:6a00:2395:b0:823:998:95b0 with SMTP id
 d2e1a72fcca58-824c6102044mr12985357b3a.35.1771353646331; 
 Tue, 17 Feb 2026 10:40:46 -0800 (PST)
X-Received: by 2002:a05:6a00:2395:b0:823:998:95b0 with SMTP id
 d2e1a72fcca58-824c6102044mr12985319b3a.35.1771353645747; 
 Tue, 17 Feb 2026 10:40:45 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6b9a0c3sm14187532b3a.51.2026.02.17.10.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:40:45 -0800 (PST)
Date: Wed, 18 Feb 2026 00:10:38 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZS2JpQAO8z2xej1@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vqKPb-000000093mx-00Jj@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX6HzgMS6egWI9
 OifJ1Vl2pr77+NNLuMp0ixiknrpPm76HJQbh4/VeKwCyXyhb67Jc8NAr/Mg75yGYyGhBwglpCnU
 YJjRv5K6yOyP+XmqdHWwZINJuHwFoN0UqFCIMup7Rp+7HEY4XGYCUnrPbZ+aWAhgItj058vjRg6
 /QYxOAItsjtO26wSLkhBMEyYQqQdICwEiOQWg4T0EasM8tGmWz7RUtO4E/V6wbNAZWSdhTT1pSg
 T6aV2Wl1jDrjFGlXlLXs2i0z5TL6ntspt7bj6qwBc3ZztwRkapQtixRZOcyy5slqt7UZFwf3mBE
 wNdmLgTapqOsZtS7ANzptYnJKkXAeeME/avfRQ/+uvkUPE/IIOJx1aaxGDeWoUxwfWiBPJjs/zZ
 YMHzr9eOTywEt7u0uxfJ28RoQeVK7/O923Rlcyzm8MNGBs9WjZKKkj1/rMSLciVkHHz/83N4Dd2
 VBTaoQmqOHX6iq+g+FQ==
X-Proofpoint-GUID: Os3stHSi_btgS5ceHirI1ixO0I-EVX08
X-Proofpoint-ORIG-GUID: Os3stHSi_btgS5ceHirI1ixO0I-EVX08
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=6994b62f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=K0zUmU2yKo6XzqUEZrMA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 9/9] net: stmmac:
 qcom-ethqos: move SerDes speed configuration
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,qualcomm.com:email,oss.qualcomm.com:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 10D7214F446
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:27AM +0000, Russell King (Oracle) wrote:
> Move the SerDes speed configuration to phylink's .mac_finish() stage
> so that the SerDes is appropriately configured for the interface mode
> prior to the link coming up.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
