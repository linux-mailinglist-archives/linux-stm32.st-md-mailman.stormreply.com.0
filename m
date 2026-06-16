Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FcfrNdN+MWpmkwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 18:50:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62166692814
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 18:50:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=HBcQsOmQ;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=Up0rIBTJ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AAFAC6C856;
	Tue, 16 Jun 2026 16:50:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15648C5F1CF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 16:50:25 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GFdPZ13965123
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 16 Jun 2026 16:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZOml+89Fh4slDZjDTDeUJgvR
 UxvqEHajVZitLYJCVjk=; b=HBcQsOmQY8YSSYu1Pd7AolxN7wxdOV5JaMmftSza
 1HmnymCwzB0EcCCZ+JHWjGiizsEHouhQPLgJtBorYRsBceIJMn/PdvlvpI/T5KqN
 3AbZMx7/dLKqnMSFkgyOhbbDaufPuy4VSJQNwYKOatlJuZMJUx6VC1ycTewcIuau
 ygQ9FUD/2J52U0O9X8Wku9yfzKGEnp9tumOCHz9H/uujiWMm/gHp/5CGLoR/KSr/
 xaDWJDrdvOsZxAQPnfxJOsH6bzoKNpvIRFDf/gTy4C3JMhSj1EKDnEDGV+2jOvDS
 s2moZqVXkPRroWF42OTK0RTB82EKAbFz1DQCgQWAWcjHyw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysth1u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 16:50:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-842b0dd8107so2916708b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781628624; x=1782233424;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZOml+89Fh4slDZjDTDeUJgvRUxvqEHajVZitLYJCVjk=;
 b=Up0rIBTJqEyqRUK3VRXouFpuRmcfK/47Qut56RvWpBa/vmg4J6r/EiIsWXT4aTf4tf
 pB1s+IxnrskcX2I+71gkO7PYpWlIWWvRpmae/pR9/fMkPUOhDgGScY4sa0Eq+nd6qVrI
 ZYPCCy629p/AGjPvd3UvaCocU8HpSUVfnm1siYEzrCikOYBCAu8xTbAkrsO3DuyweerT
 dMTHNrH61ULyqFjrP9lOuLh5uLGpO+nt2YAUIuXYl2SvfwUgwO25cC5g9rVGmHm+ZhKQ
 jfKtrpjVzg/6pPkdmEnjXdZTlw4hXEGao2WNrfWBoBQEmsf832CCINec2oysOC8oETOq
 j+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781628624; x=1782233424;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOml+89Fh4slDZjDTDeUJgvRUxvqEHajVZitLYJCVjk=;
 b=GaUKAuDurUDKPA5VqYm/qRZka+2e4VFZFMGZLXAn2eod1/eZtQXdNAby4gkPyElN+G
 5bnv6QZsO3E4H+SBFHWwIQ8tBbOlQHXXqqBgFfUKv3mbSvLlJjh03A2TIpDtHBK52fRR
 E/UKHdFusNyAN9hbHwit9Z9NTdBWPnq5OLO/JjwXYc9iqQnoScPPb+CZMqYpkBETBSl4
 ypfRg2I3hqiNwHID5FZOLbrW6tKN/78yb+PkRk0Ml9MOveU79KHEXlOBYJ3ow7jFc5gG
 1cFHk0ATYFQDGkxDhnBa0CAX6wQi3DStYsg5rBsh3HnrOMxpSm0pAo7Kd5QJQQQf1ZUO
 Skcw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MIR/Q6e6GJl552NeyK/cvXe/X5iScQAAW1EXcicwcSlEVPvAAsec0q+kHgi51dEE2kVYQtlnjFr2vnA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxDjdjHYAXDLrlQiDOjzgT4GQwlzkkLZD1vpSAjCqp2c+s602U9
 ySk7X95zKDvQo+Bmazw/TX38V9hj0BLJC354hGEerwn/1yasuQ9XGjrCij2v2xLCPJX78CVx+8e
 KRWoVhFObOu2/rillf9c7dYqcvT+iHuNEz2k0Vx4YG1uBHOg8oKSfIgnmgcjcSG/zxhx5b2bGit
 MfHX/ghAw=
X-Gm-Gg: Acq92OGqGlwoHxohevixeeXyfAgNXRRgQxIbJzMOqg038SDdaa3Fhd64K/v2Fg8/7O/
 1u4JN2d63AWA6poyZ65DYNHnJ2elnMVfgAzL8aJhfK/Byj5mOyxnQRd2AE/JANL5LQMWxi0nmF/
 YvNXh7Xy9nwdTyn8+XZfrIqYEknzBknA4cM9M5vwr7LQ394AkqZQVi3o49TLasRuXCOl3AXqaj1
 mBh0qvjRCiWhPyS1IRRNWMSoCVlO8nnVI5fAEuUOWKEd58s0sySAzKAkmIV3tSjuRTm0HcbA8yF
 yZ3qjAZQgCLJVgEKGJBjR+sfghlsFTbYUaVHJozf5hiOOWnBr5OVkSwUZpyscJAYRSQ7cLKvH/F
 fPCHhWUaC2luC04F6CkDSCMdvdyYjFvDnC1Q=
X-Received: by 2002:a05:6a00:94cf:b0:842:5da3:9b83 with SMTP id
 d2e1a72fcca58-8451561d685mr4168486b3a.33.1781628623520; 
 Tue, 16 Jun 2026 09:50:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:94cf:b0:842:5da3:9b83 with SMTP id
 d2e1a72fcca58-8451561d685mr4168450b3a.33.1781628623026; 
 Tue, 16 Jun 2026 09:50:23 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434b040718sm14167850b3a.51.2026.06.16.09.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 09:50:22 -0700 (PDT)
Date: Tue, 16 Jun 2026 22:20:14 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Message-ID: <ajF+xlipLuZtf4HL@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
 <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
X-Proofpoint-GUID: eXjzpgMW3gTXmlXrF4erVySWB5ON5xja
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfX9o39KGHv4VOt
 IOg/JLzC1f4Im9716MJyycsvuvFjqqlof0gIJghnXnPm8v8J2DyT1NgmpoYe3fOXijbuwB4iTCi
 B4qDEIHLsq2c+ldIVY94FfmORg6gk3I=
X-Proofpoint-ORIG-GUID: eXjzpgMW3gTXmlXrF4erVySWB5ON5xja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfX6QdeTev4ZnLl
 5d5thtSDMiPvrUieXI9TwKCgdi2ayUZtSjM8cXPqE+JDV7BI2k8ZpY6OjMheZT6/VCzbt4prVlL
 TGabgx5XxzxlAidNX6VdQgvMeVP/oGLKAF9wIqlejqtoarRCQ6YtisU1S/jmuPwC091Hoj/V2b+
 fMGV75EJbZfXpvg5gi7Qj4kEehKmOejjXU0ruKEG8LUBC3ayvQ5LCBHoQ/6ztVh2K4/jttVTs88
 B/gr7GGYVTHx82TyyzagAKvXUC6ZlyBikXU8neq4dqnVQUGDUAhPI4gjHfnwc0DtEXCnuYxjDCq
 ILjYriLMvXw32DEGBf6QA9ia0efWII9fL6mGdYkvFaAGMJgokK7YLUmMWVWgS5vZz8CDzY9vnmB
 K7V+ZLoxyBuJ1gz1w4VWJXEmkHGQH4zD8E60SGyn18yyFRn9MlnCBYNOsYfXFNmGC94NNvohY57
 ebbqU6+H9RBKsFgYA/g==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a317ed0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=u2jKJf8zFqWonMdemzYA:9 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160173
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk:
 Enable ethernet0
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,armlinux.org.uk,lunn.ch,google.com,lists.infradead.org,redhat.com,davemloft.net];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:davem@davemloft.net,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62166692814

On Tue, Jun 16, 2026 at 11:50:26AM +0200, Konrad Dybcio wrote:
> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> 
> > +&tlmm {
> > +	ethernet0_defaults: ethernet0-defaults-state {
> 
> s/defaults/default
> 
> Please move this definition to shikra.dtsi
> 

The CQM and CQS variants have identical GPIO mapping but the IQS is
different. So should I keep this in shikra.dtsi and overwrite for IQS in
shikra-iqs-evk.dts?


> > +
> > +	emac0_phy_en_hog: emac0-phy-en-hog {
> > +		gpio-hog;
> > +		gpios = <149 GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name = "emac0-phy-en";
> > +	};
> 
> This looks like a hack - what does this pin actually do?
> 

The power supply to both PHYs on Shikra is gated by a GPIO pin. I am
unsure whether they should be modelled as a fixed, enable-on-boot
regulator or just like this. They need to be powered on early so that
MDIO can detect them.

Thank you for the review. I will fix the stylistic issues in v2.

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
