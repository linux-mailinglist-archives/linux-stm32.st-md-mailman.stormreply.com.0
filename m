Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE7zMRi1lGlbGgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:36:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6991814F348
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:36:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DD27C5A4C5;
	Tue, 17 Feb 2026 18:36:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08E0AC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:36:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HH6ZxC985361
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uMrQyicAZEEqH/BJVyGmHveM
 n6L1dPKlkyYCF6REmA4=; b=PJoYPYWQuUsB5FEZvA830Cal0DSGAMo+QGMVb6W5
 +dkW/CDoED86KiVFlyG//hqnjoEscrW4RLYHTuM9ACB5yFBkz1qYTYyJrbsef951
 j1iRi75pMnls7+m0t660Cuu1/7TRi6O1B9IgeLY2ZpQijJ+IfsFmsr8AsFdoCsu8
 GnvCWUwr0VmtccVe2H/8bIP+CnqKzc20mjEFOJWZBeAgDweS2CeGT2SoULFxFlbJ
 VXC6CkXFWByQXTsusr7jbwnJXgTIZaa/gjd6wba+gTqepAPx2QNIzf7W9gqMc680
 7UUdi6G34Dgvr7IYZu7HWjYs714WfEzqQrEJWJtrKmoP3Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap3da9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:36:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-824b461dc9dso10356882b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771353362; x=1771958162;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uMrQyicAZEEqH/BJVyGmHveMn6L1dPKlkyYCF6REmA4=;
 b=YEgXilT4WSBU7NyEVyJnR3y+WAbWW4ZSxF7p9bS6Rqljb1PTHjfAujxy2c1PcFKTKg
 JrfpMMjJZ5UOlGJN5r/pDRP6JysfrYQhwJYYExtKoPBYLKZduLnw4LVNd9k3TG0mP6nW
 VPUW3M7nLmkFsyIExHw8I71DCHD8p4rb3CGOGU+ik4B8S78DCUJp4F6CyeOmN2xbDsSp
 y9LpokzaYkEvZQvi4QS8t9BEx9/3norhVv2xHCazKXGQj9g13sUfZjpmHzV1F9Mvv7bo
 rWrfHqKfUeaxLam1iB2eYa8Q1XEhX09VLOGw7RfwYzq7jbV/1ljg8Aola0oTEHP1/0sC
 zT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771353362; x=1771958162;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMrQyicAZEEqH/BJVyGmHveMn6L1dPKlkyYCF6REmA4=;
 b=YI3Mf93j8UlL2pChfw3HpE2JJNlkm38S2mMm9mZkFESao6jzKwOPIg94Mv8LI3TKFL
 3DypAzpbXMJ1DFywfO3nW8s3IgQk3WrOt2Nj5GCoUgnLrlVeoy90WOh/JlW29LQjX6Fz
 +hzuaG6V8sI+fMzwsl5adMwIOEfKTPJCYh77caypFvPdyCOTVrXypsM5AWynU0FSDTN9
 QgqfmAsvaASht5lkQYZsCu4/ggahFvdPEKS5aKK+6vGMsMDIpsXqk7r3H+0K6hUOt4JF
 2wnFhOjY7OjDKGEZOf8qPDBbx47rL2JP2/fbmbYAl3AY2gB/EaSZErUcEg4BlggPGNEx
 dSsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT4mIY4N+fR8XYWzEhE1m+vM5M78dqKzHQO5d6EzOCJ1S8M6uCublIv1EbZytbppp7rkQVdxbS0PrgXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzoUv/Jfb2MwObBZPljL5AqclzwjR6XiTnz3oMju9XBlMuyTnK8
 W4Wv1fK+4CIdB8gA//pvjQte23GeJ8TO7qzsJhcamVOSWPKt8C30W3slALUZpbYXOSdqfL/IBCx
 uzGD90ibJMWDrkX33+t1kQByp47EsFPRTgV0ovKZLjpME35A5dEemc2hg/EcM+Phsb4VTXNdc3E
 iJrgKbwbw=
X-Gm-Gg: AZuq6aIj4NNJwz7Nj2bwE9cPrbBtuSVbunC4hhPG5cHbK6pUarhqizxxqWjPFFG/gDP
 aiVqcOovjP52xWB7lpg/izmNmE9VcMJ9MPztvNGvqr9LHhOZnIaXNvpdcLOFK/CcxzEB4dl51Yf
 rZrl1hPx7wpXaf101Am9rkTV4/jungSg5mPkDkZ7RS/78G2ieoUGDX2SJTEMJcAM6vp6EdnMA1D
 nuz8jDe6h2xNeesSPrUEvPYDqzwBCoYp/C0RUcekNTNKP83HglfiUTp3h/A+Q/22gonp5Z1zopM
 J/wdNY1gBCpbCjC2YiTUfaQcpWyLuOxfKaMe/kOoxvowFr4JwH9eHOitFrqZl6/Z9tpMePao8ep
 9pKQf+QqFJXsH80WE/UBcQ95gmN/01eTR1iY=
X-Received: by 2002:a05:6a00:808e:b0:81f:5037:a317 with SMTP id
 d2e1a72fcca58-824c5ea230bmr15684884b3a.11.1771353362503; 
 Tue, 17 Feb 2026 10:36:02 -0800 (PST)
X-Received: by 2002:a05:6a00:808e:b0:81f:5037:a317 with SMTP id
 d2e1a72fcca58-824c5ea230bmr15684842b3a.11.1771353361950; 
 Tue, 17 Feb 2026 10:36:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6b69b13sm13401027b3a.30.2026.02.17.10.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:36:01 -0800 (PST)
Date: Wed, 18 Feb 2026 00:05:54 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZS1CigRWTH12scL@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKP6-000000093mN-1IDF@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vqKP6-000000093mN-1IDF@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX0fIkuabDPUxg
 qPbE2OVDMZUyDcRexQB9AiAxsYn8RDi0COxnFcPwjfVmJnUmgrJAGJ6tvOXFyRPiXOXpbKIKcpH
 eetjr/UxULzyWcg9hcTu67gJv8S3t9by+dUhhFyoMpFXXikk3V7mtPDyVvI1PXgMOsNq605ykOT
 5z1I9Icavd5KhJOBZJK/Rk4dyiC50ffAWz2MGEmm2GEru/n9kt2o2PRBw5OHZra3xxjif6Y+ty4
 rWC8ZYZnKJmTTRtzv/faOBcJF8A4N76/84MR3ZDNwgZCtUQ8NJayhNL7jb7iY4sUCK9Jsav3l2V
 RwlM55FmJ+/wLKjt93ZA6tsd9eP29Jg2ECpbgvCTv2dI3KKl00WWKXz1KUsjtGyScGaWWTEDz0l
 A5Wv4gaVfrJSZb4v6lHKcC8ydu7OclVAQiM4H0e9Ex+RfWThInvWDMbXFDYJkUBjO1Lc48/uLHL
 wbd9O5rsbfPCLBQYgCg==
X-Proofpoint-ORIG-GUID: HybbSMBHvX9JV6FMrvv6laVq9jNz8opE
X-Proofpoint-GUID: HybbSMBHvX9JV6FMrvv6laVq9jNz8opE
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=6994b514 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=OS3fFONSsTUfBaauNq0A:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 3/9] net: stmmac:
 qcom-ethqos: change ethqos_configure*() to return void
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,qualcomm.com:email,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 6991814F348
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:17:56AM +0000, Russell King (Oracle) wrote:
> The ethqos_configure*() family of functions always return zero, and the
> return value is never checked. Change the int return type to void.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
