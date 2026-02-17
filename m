Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPi0M+C0lGlbGgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:35:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 669E014F313
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:35:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F34D9C055F4;
	Tue, 17 Feb 2026 18:35:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21DB3C5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:35:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HFUA4I2319792
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=whCFM/BSXgDYxgAJq7FXzzvO
 BcHA3JZlYE1RiqYzwa0=; b=RDgF3v2wzcsLhhMnH8jJtVlwHjzy/EmJS8YH71Tp
 knkpCG1Zd1yevXd10FcYSMEOEq2LtaMVSWqlWjGFlsZDZePz7mYyemc9eXkRQPAn
 OrRoeWRnSadtiHSvmEVEZAzhVmhC8bCQfZiGu3CIKGaKUG4lqLu1ZED0R4XpqubW
 035XsnUYSPWYNpS4mGmrj4KLyepupzJ6tBOuh7T+z0sPIXhr20EwdflWj/sdY2I2
 t+TeyoPQzbqkJRbueblz5w+iaXG9OawdWvbVW/Nqwh58LaPZ+vcWJDJqVT03J07D
 TL/knQp3vOUmSTureJz+tpOZLkSCpScafXm9cI9QUq4b/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccu1erm8f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:35:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2aad5fec176so52420285ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771353308; x=1771958108;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=whCFM/BSXgDYxgAJq7FXzzvOBcHA3JZlYE1RiqYzwa0=;
 b=fHcHtGo4PQiMIkz/R4Rn23XUblzvJVUSIPdPBDhiw1LJjMqEG3uMPmXeWH1zPAGLTB
 Nokj36qS/l4EY8e8YDpVk63ucQrRg//xc9hKGQzwNQLy9nCqkyabjRq+lDrRq6Yhdz5h
 d8MTEZIlFjbSQFZYbfdwB7h0gIJU0aO6xzhf7A88lGytCRtfWIcyQNwRkt0zzgR4cEZm
 yp4YVBC1lqWatVgSM38ILrlajZtTQG9jqAryDJGatozIiULN2YAyJleV8O3B+7r0XyS+
 0c3z3kNRoKnTpkL3hiNvvfu2MgdzNDqwjtLBhyFpxqmf7f4T6riVYQK0+3j3+vXhbSUN
 KGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771353308; x=1771958108;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whCFM/BSXgDYxgAJq7FXzzvOBcHA3JZlYE1RiqYzwa0=;
 b=R+JZZSUlk4nPo7XuIwc8YP2XjVMXD7P2nu7r1xLymjacRze4wJ9Od35X1H9ILVhQVu
 MLwi11TjQCxq1HCatsLTWnpaWQ+hyXahgT0J8vlVQ4ptV5hBELvZA4lvipZUrIlwiDGY
 mtjtTNoAyiquTh5Gw0/C5AfTbU+8AleyPFOw5/es6BJJWP7WY0OYdeYMQN4UkwIsr1ZB
 FgXBS2I7IlVyx3Amfz8J1zNRNQ0zCZKL04vU/xc8iU3AgYBK2aj5ORXZcTz2sUKLeE9V
 FrQY4ih34en3gr8MN3CzlGf55uoIt4yiKi7/4OWyty/cW7Fz0N9Kexa0sXHX8sqeJuEE
 A30w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAOA3O0GzT7hg7IQ3e4mSdDPczh2lQp66p+fn1QVhgLoYHajbQDhvFmq4yKn1q7JvOR2WdG63zajd4cg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOD7fS/iQdljxkB6g/NdCJdQbHjsOcG2JlE4mARgUlZ2Tm+DuS
 iBUAdoUSml60Kyh52d8Ld3r2sm+G7gBxwzvvuGXLNZe4t/zArl1Rt/e2CUyqooiG7nN59bO3yqW
 bEXXqgtrDI4dXv9OKZZlRWXaTWzz2KnDTTLSa9LWZ1VAErwprLOwEMPTt/Y9LGcj2ksqXplL9MX
 NQaQejW+I=
X-Gm-Gg: AZuq6aKXajgbUy1R1AhpZqQS0owwE0NNIboxkBwM+nZQ6bOh+asOIXDroqsYdmdRxLX
 dMo6N5muR+MRmsNQqqopxYfCaF377tNdSdhpNoup9hNObe04oDFXWbYppacBAckjxPSFjNHywy8
 wk48Cd16r4mlybi4sNrLzzIiOkqXAygSEF7Y7CWGMNMmmqSdpP35PtQcBBCzk7oMn4qswmFAP6l
 +lCf07eBt0LilHlgtigTknFiba/jylepXIWllwHTbue7NAQbwob/Wjz5+0EOQ4JI7WbuwEBIoD9
 kRt+FXaayuztLAIKmzbNQbsHbRM6BOde+H4PlSHXoqAcoQdZkRlfvx7ZcokcWGkFcJLUzYq2ZuV
 YsYyElhfiBfigvQkOCYkalyc438nbmGYoqpA=
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id
 d9443c01a7336-2ab505b61bbmr154642405ad.37.1771353307773; 
 Tue, 17 Feb 2026 10:35:07 -0800 (PST)
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id
 d9443c01a7336-2ab505b61bbmr154642075ad.37.1771353307166; 
 Tue, 17 Feb 2026 10:35:07 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a713d5dsm180261815ad.29.2026.02.17.10.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:35:06 -0800 (PST)
Date: Wed, 18 Feb 2026 00:05:00 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZS01CotaSazpWvD@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKP1-000000093mH-0Sqo@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vqKP1-000000093mH-0Sqo@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=LfsxKzfi c=1 sm=1 tr=0 ts=6994b4dc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=eMU2cjtvKFU-KvXMnqsA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: K6h-YqyMNriKFi-espRHHOJYOKyGBEO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX8PFtNY18Gz61
 CLcFfsFkCMB3y778wDhmKzrGDTEE4TbutV4pwMzHTSsLHR27gB5sdANafHJIcNZHarNXwZ4h79M
 UN5SODNlrcFPlcjUvPLtNo43kMmCEwP2IC4Ngb4jETfIl+QFrHN5qx2oEB1GF753awK7O5Al6BD
 4SwJh3QjzXmj1DCs5JgQBZIDp7z/KvRskeAN9MqgJ4CSgS8frx42wX2ZhvmNXIZE6NksjyOj5Et
 mJg4Lga72fcjEckblnlWB0lCMwcsb+ae/I9DT0QSJ/fh43jLDaWWG5lXxW1blIuywAMlVCm7sUH
 JAkS/LFitW9AOmh1RIpMMiy3wQ6BdZXWQUq7yJVmiY9zZus/ub0/lK7ochIqn/q88EUQUvZUNDI
 S6ZRGbTe7upXvmFK5YoHQcjSugzv1ozwtDANQJxwKP7DU5pFoaea9SCuBIBPbrmsUXfLyhPB+To
 twiTtLwDoytYj3qB6dg==
X-Proofpoint-ORIG-GUID: K6h-YqyMNriKFi-espRHHOJYOKyGBEO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170151
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 2/9] net: stmmac:
 qcom-ethqos: remove register field value obfuscations
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 669E014F313
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:17:51AM +0000, Russell King (Oracle) wrote:
> Convert the register field values to something more human readable.
> 
> For example, using (BIT(29) | BIT(27)) to update a register field that
> consists of bits 29:27 is an obfuscated way of writing decimal 5 for
> this field. The comment above needs to explain that this value is 5.
> 
> Worse still is BIT(12) | GENMASK(9, 8), which is used to hide the
> decimal value 19 for the bitfield 16:8.
> 
> Fix these, and a few others by using FIELD_PREP(). While it means we
> have bare numeric constants, this is more preferable than having the
> obfuscation.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
