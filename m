Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KQ0vIVpaMWrihgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 16:14:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E31C069052F
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 16:14:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=QAM1kyVT;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=P8Vj2FBZ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CA08C8F290;
	Tue, 16 Jun 2026 14:14:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FD00C712B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 14:14:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GE0FOv3364990
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 16 Jun 2026 14:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=; b=QAM1kyVTARUAiUx1
 HwN+Rt6ZPoLOrdawDoHFv7Fqdc32iTUYp39m0XzMLGHkpcqd0xkq3fZgHcaemSmN
 ANGPium+D5z1xual38fwaYY0vF/sHhoJ6Qglc3O7zImBcQbIu6aPNpiFueoVY7Wk
 OhvRw2QYbY6ukTECrhwTWbCr+mxQjrvSgMWy9VEz44c4mV8SVxkLqacih9//O6nh
 GDzAvqhArXNn/Sg28e/MY+SsHZ0p2+409jVroHjrIULgFyj+hZFtPLzQY3RkPkRL
 sO9NSscH/uSIWI3FrcEPfDskndnhaRb5hwOjaUv+7ogTIeycvXbhZwIvFzaQBNQr
 N/5jHA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8kav72-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 14:14:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-6cf9fa331ddso188293137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781619285; x=1782224085;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=;
 b=P8Vj2FBZ8N/bH2LvR7uVwKvMfaPkcLmCAxIk0PaC4kIEyi5fTwZL0j5UOJA11JZUBc
 XBiAna1CbIJhtXlNFnMCA05sRtNWl0JspzIIF/kJ40t4dOiU7cNOxTlSKivVnSZ+dQig
 IkxVHnQuokVB+al6gkNx9AiO4oxRhzcrxKzxPMNcR/V51rDxU4sI3ImG8J3oFDDn2XSM
 1MzyNhO0K+ARPTBmK5cEj92Xt74f0YFquAcdHpRIpYnEEvnkJPrqDM0sZjCVmCNnCJgs
 unUOZDTcLAY61CmxFgfmasjZFO0dhQvslkCu9FueVy1eu3ZFGv8IWlOFuFkNSDF56LrE
 EyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781619285; x=1782224085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0hAx854ISARB3ER/A8NJSDIfIV15g1Oji8K44z4BCu0=;
 b=SO62FKsbjqpcv152T9fLd44XSsBzbYCWcMjwb0srp4Hiqsg7k1iZOa/rn3miNph+4/
 fKff+NXCWL2Uel93l2X8blIiFKmXsKdexMWCYZOW5hADKcwvSz2LzsTWq9+kskHh3PHQ
 UNb2khCcBbKVYa33BdaiRUVjU/Tf0ZTsSS3wUHcgy1zZHWELGuUijUOUWddQSjlLcV5T
 KiFZibq5BlbLKIWxqaHzX960/Hgk06m6PMb54Pw8HWW98JDpxcufwnml8ftAhZuAfrpp
 /qfQVKEeeOyP5eGDJAxPYtY1pANfhr5/NehOpBe0etwgoD4Rq6HcZE6mVVV5wgmbEq8V
 nKhQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Zu5NJAVQxclC4MxHis1T4CgzKeZMDH/IMtDq/Ql0azW1oerQn+pZTT1ksB2Fqha75NccBo1DHrBOVeQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzt6sjCdTfcW9p+gPDtw0dQfTnVIhuxVVk3nU85Ft1e71GTpo7J
 qAyoXQKHtGbTbAtsJNx4CIf6R2LmTm8HbjIvgRcOpNQ3Mq+9sKLP7ImYc8zlTJb8zH4l9vKL11b
 R0fAerZGV+s0JAQNx8tPWx+b625y/6v05AAZWfNMX3s28sSluIKGMJkS1y8rxrC5xA+EhnOvtwX
 Fw1FSG81U=
X-Gm-Gg: Acq92OEm0Y7Pgarz/QoyLEstweUojy6xO7TcdsyEDhOCeN/UpcNXPRdlIpYaRcAawku
 qqM8ED3+Od/ER1pzOCKhJN31Ub/6bHaPt1hcgIJh7LPXJsSagXwrLQ+Q+VHtjnMdAiK4gjmDRKs
 blAeTahMNAoCc1PHQVQ9jVOkW/MrwDcxVF8QOG8wSpkHemV8GtM6xQTBg0dV70bAd7O6sO2R49G
 YBCGNSeoINTv2XIy5MG+Lq4UltDehxn9h5bRy4pAbxCgvmIMy1MjNArFUK4MqzVaKZEJTOmCJEI
 RFmUHGaFM0jeC+XjbXYMY/KXGSOfzZAxAZILODdRR30+eagjnnUau80P1fp3sdXx8pxrK9Xghz7
 5E3uqbDIkJOTlOD4fQQ5Ci7G/pJWxQbDqrtre3z7FimzvYg==
X-Received: by 2002:a05:6102:510b:b0:631:4d32:a86 with SMTP id
 ada2fe7eead31-71e88e3f21emr2770726137.7.1781619285164; 
 Tue, 16 Jun 2026 07:14:45 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:631:4d32:a86 with SMTP id
 ada2fe7eead31-71e88e3f21emr2770699137.7.1781619284575; 
 Tue, 16 Jun 2026 07:14:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb7b6d8c2sm638601966b.38.2026.06.16.07.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 07:14:43 -0700 (PDT)
Message-ID: <50f7eb11-7bac-4d45-9e0a-b209f7e8e9f6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:14:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Eric Chanudet <echanude@redhat.com>, Lucas Karpinski <lkarpins@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0NSBTYWx0ZWRfXxSspL1eDfL3C
 3V+S2H8tIKOBSBwH0Oz75XyJch8/6oP1t1MMUNqQ0x5WEs93kBJboKdfMoPORHc5NVSYH0Ozwxv
 XlXl4tG+n1qnm3JdwluIho1povkG6D0lvMFGvJmjjhdH0nOJltMj6DdUaOnPnKMVr+ukio1dajz
 S4/GGbBtDhgcIwewx5BKnlAGVVZz8T+fNRp5nr+XH4P2lHQNr4+OWptLX7zW0AIRTlQ0vH9Hibj
 jTZL8SrPo9SoOX+BPR3QVwcrxjZhnXCq4mqJPWyV7sBFumxO077aQRi2IfXqqcSUITHdC/XkvIy
 XuE2C3BdAZHgo0q+aRoUPSGl5GEkZNmzNcot3VKkChs83wrroNMdMT8NmiT2mcB8TuJBqWH42U6
 BuPPfxui6198Drgs8cArPKafesVIcRSjTxUMEsmoyozOBQui1Nd+VfdofO8O/NQ44LbVDjlhy+t
 tSDkvAf8IGnqBM3G+vQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0NSBTYWx0ZWRfX7UM+ModOV397
 PGSaNrsmRVG1K/VnFrNetTmFacUd0t6gNrKYRt8Anxyzkpb/FLp9Ht2Q554KT0g4NGGUlyvhPzl
 grjKiNzwPxl6KCSr8ClLbn/SdhDA6Gs=
X-Proofpoint-ORIG-GUID: j9rd0pXZg4QThyu7iJ7aV8DcqxZr1yvY
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a315a56 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=RaRby332RutXx2QLMF0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: j9rd0pXZg4QThyu7iJ7aV8DcqxZr1yvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160145
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
Subject: Re: [Linux-stm32] [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix
 RGMII_ID mode to use DLL bypass
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
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,armlinux.org.uk,lunn.ch,google.com,lists.infradead.org,redhat.com,davemloft.net];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:echanude@redhat.com,m:lkarpins@redhat.com,m:ahalaney@redhat.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:davem@davemloft.net,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E31C069052F

On 6/15/26 6:48 PM, Andrew Lunn wrote:
> On Mon, Jun 15, 2026 at 09:24:07AM +0530, Mohd Ayaan Anwar wrote:
>> Hello Andrew,
>> On Thu, Jun 11, 2026 at 10:54:37PM +0200, Andrew Lunn wrote:
>>> On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
>>>> When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
>>>> the MAC must not add its own.  The driver currently falls through to the
>>>> generic DLL initialisation path which programs it to add a delay.
>>>>
>>>> Power down the DLL and set DDR bypass mode for RGMII_ID, then program
>>>> the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
>>>> ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
>>>> 100M/10M, and remove RGMII_ID from the phase-shift suppression in
>>>> ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
>>>
>>> I'm curious how this works at the moment? Do no boards make use of
>>> RGMII ID? Are all current boards broken?
>>
>> Searching through the DTS, I found that we have two boards using "rgmii"
>> (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
>> "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.
> 
> So this causes problems. We cannot break existing boards, yet it would
> be good to fix the current broken behaviour.

These are a funny bunch.. QCS404 is a stuck in a perpetual cycle of
"no one has the hardware" and "someone has the hw but zero interest or
time". I think we've considered it for removal at one point..

I'm not sure to what degree the two SA8xxx boards are used. They
may have been stuck in some sort of a limbo. Maybe Bjorn knows?

Also +Cc some of the folks that contributed to them in the past

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
