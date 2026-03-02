Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGUzLblupWlXAgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 12:04:25 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9401D7263
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 12:04:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4B69C3F944;
	Mon,  2 Mar 2026 11:04:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28D6AC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 11:04:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229JZvu3742057
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 2 Mar 2026 11:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=; b=QZ1dpez4bJDficoR
 RhQ9Sb/0BsBhf+KyrowiYM+XlrAOe2p/WLjMTACPYW71uXsW40RAYZZB1MR9l699
 mXIkuW8bfNzsD8h4gp6cCs+ncFNcv4WBJ2hwhhw2zyzQKIEWGYPqsQPzXeDCQuF8
 HOl7r4ZtYbWH2Wv5Lkghjsf8jULz7jGNdYzRxnCsMfsk3uxQ0pN8ZezxOwnxo9H7
 jq0lgHH54EB2K+6YnKHFODRpiyb5cCmpI5Z2Sxe9W/PlC5BEPS984sQY+yjmq5OK
 KG+UdUyVsSm1D8/trBuXUnih4vxfdvgNh1f26Rh1q740PjEhg8I7fThUYiM+f6cX
 97pAkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trgc7m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2026 11:04:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb456d53a5so427060885a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2026 03:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772449461; x=1773054261;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=;
 b=MTOmbXCnU+EhzM8eCRu4NPliMKQriIGn2x7rBltzOcV1Bu+ryXPz2WUYx2pBDW/DqU
 BJm7gRm3hgg2ol7P/tjt74w+cLVRjKzTXqDp/cTrSvMg706icpJp71lFX/TEjWAsKUy0
 Gievb+TFUYihzCRUWef+2znkvFlqUsWOEoRU3RVtnescVOGJ+GLnR5AwIQnVjfUGtv3d
 tGhr0UmF5t4PeNyyyfnjJbtRJBB46GREzWE1hj6st26cAo3HS+etXh1dG6hh8ykOTISI
 DFyUrlYXQ26dInfaLP34z2Yv5zgOMHxQKAElAtjtpEV+KE5mnMSmy50Z+zsphRt7vCLF
 753g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772449461; x=1773054261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=;
 b=kCkGkuDLpqm6P/6RNDInTmMipFF5DEe6BIBfsS6w9xBVKqJNfcJWhExrI+s/knUMiL
 IiPbjsOVGLlwPoGwO5iVzpG8dVUPnLg2NV8SEXxmv0WJUo9EIQlMQRiop3tEFmFB30zN
 sX8pP1OMTtrVUQgKKbFkZ1M5QBhlaQQVp4nSesoGov4LPOnb4fIz/psocH1hK+0di+wt
 4txbgYWLWVPsqi54RujMvQf45TTLAp2ZaBlw3jsM6R6GTfy6Kic3roufH27H4mfvNlfA
 KUzcwJ0WXXgMBFldXJNzULPtYoJKEGZm4iyi4OsOcg1piQ9tajHHV+TkqY6kHhlE4HwM
 2K4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdu/ZZ9HSO6kJoVAhmU536mdgEOIeH0/IQhWqu2R6YW6oEY1jmLepqz5TJrl8P0o6Vs9G+GrUui9fHOw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOC5SwL1wsV0B/fBvWSwzy7bdG7ssYscG4V7c3JNBxMoxiFAUk
 X1GtH7IEd2csyqycJB4iFzcNjH/4Zj3C+KQuePuNU8MZbBmn6akzsfzPOQprcKPh1PxUdNGsuaj
 SYHbd/JAQmgMavvQIO873lEIu+L9VKc+1Xy/8WhGADRPMGObY0gzQO4THmXczQtdg3E+jk7ZA+T
 /vWwFDURs=
X-Gm-Gg: ATEYQzweJKD+/SLg01fvD6bnTQuW9pboslEPMzGH7QKQBgVSvs971MLno9Koo16+/ge
 nrCK+EnpwlzTrHj0YxpR3AN/zRDN+yRIOOyyHQ0NmNGWsvWRtwvVaT2fiiYEI++8hDNMOrIds3x
 4zX8OBtnmvuggpFTBGiG7HHEahwTNegGcxKquaICXyxdxWoBNoUFxjdSje6JtvxmHqvFoE4+KLy
 XQXB2dnx9Pj9yyXUNSWvarIrZC3p7F2g2NZjedlWGZP8MhWo/Ix4qIdPiKsIlBBfe4kBpFUspQx
 5NAEZZDMAQDxwUXU05YB0DvjRD26RV3krgLnCbVokEd009Fx2qZgvVccxSMu8B/ZxUzSzEkmNFa
 +Ijq4gXKsDYEYpOYgOZrXH2/NXZ04DHNII3WSOIfAcXlkYnUpsF9DYk/8wnxbAsXQlYrCpJ70CX
 giPa0=
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cbc8f2348bmr1176612885a.7.1772449461139; 
 Mon, 02 Mar 2026 03:04:21 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cbc8f2348bmr1176608885a.7.1772449460723; 
 Mon, 02 Mar 2026 03:04:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9385836a84sm318934466b.59.2026.03.02.03.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:04:20 -0800 (PST)
Message-ID: <5d3694c6-57e7-4943-8dbb-41334086e8ec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-7-22c458b9ac68@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-stmfts5-v1-7-22c458b9ac68@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MSBTYWx0ZWRfX015PWeRRwaY2
 ql+7p+VAa2lk7o7Vx0hgaVwj4y8vjaUzTI9S9DKDJW2Hs0E0hR38M99lj1pMoP2JnC7iV5kLB5A
 tIZxrYEYLyuxe3U0ZQpaySiokUkFdRdsja64f0WhEloIiyrcmE8wN/BC3BhTyT5O2mEGxlFPdvn
 ACzPK5JSmoAY7NK4/aAMbyJl8HqrqhkP48B7sSAjq8SIybnZ5Pq5E5vpOiN2CtQrTh8FdIUlrbX
 +3+cilpQtT82GksLbRAC4bpF1nBOhfzUoYReRhUYhULdtGrNoeEGUZH972xsn1OsKdJlyJTiRY5
 jTSm1qsrlYXETjvP3CHo2n/dd2RE9t+VblbOFtqPPaIIqNcSCr++UULSTdosVCoeorQIqey2bcf
 nVOWs3SmmsERnqzFMQts4OD7e58+ZMCs9Wrdnk33SAKnb4ShD5vgxZTImeTsimCfJXi2rcSTZxL
 yJ8L6XrKFr/meN5CeCw==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a56eb6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=sfOm8-O8AAAA:8 a=bmle8qjEDyfOUcEunfUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: mcQox8pzYy03C6NuzwirVv5hJ1xXXDoV
X-Proofpoint-GUID: mcQox8pzYy03C6NuzwirVv5hJ1xXXDoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020091
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
 phone-devel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/10] Input: stmfts - add optional reset
	GPIO support
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
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,foss.st.com,kernel.org,bitmath.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.702];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,ixit.cz:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 4C9401D7263
X-Rspamd-Action: no action

On 3/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add support for an optional "reset-gpios" property. If present, the
> driver drives the reset line high at probe time and releases it during
> power-on, after the regulators have been enabled.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						    GPIOD_OUT_HIGH);

Are you really sure the reset is active-high?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
