Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4gaJE7F3L2qGBAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 05:55:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB6E6832AB
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 05:55:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=PBqZaOn1;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=jCXic0wS;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3CF1C5F1E9;
	Mon, 15 Jun 2026 03:55:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 876D6C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 03:55:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65F1jK5C3089692
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 15 Jun 2026 03:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=V5iYWamYBGi2g8X7XD8Ib5OY
 dq2ngK3owfPK32tRL48=; b=PBqZaOn1Mm3Oh21rL2hiBioLYSupkG3cmm4KUfYe
 mxmuJm7Fm5A19YvPHu6zLwEKJVGvRvSCgGVeYdo/NBzXqDM3lYkRzU9tF9JEtaNJ
 5VTXoNHPQaceMTusIrT+dc2hdQJ1FTvHfiQEW+Np3V/D+/HcwhCClYB+idhK6CwA
 +vTGh3weu/DDo7VhLdLaxAhsHhWz4MNWJYwJ8f9R76jmz9QKqVkm+guTftMjK3kC
 6yATU0P5UCM827/3ekTbic95ipQZMw+IxZN5jLtjdq2QM1jsdst/ewu2rCWLK7og
 cgB4+/mjT7mWnD1gOPKDfSwSBUiBrJZwVaE5Knt1jvrv+w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6da8w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 03:55:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c86487a8ce1so3060718a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2026 20:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781495725; x=1782100525;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V5iYWamYBGi2g8X7XD8Ib5OYdq2ngK3owfPK32tRL48=;
 b=jCXic0wSQIM2r3/ua6EDMEN0rokXYGy1ATayHpKBEcoGoChUjLkawo/YY+QxeRF6fD
 aKcK/K359yTJJ2Xvev4zZV7w4Y+4NTndegZXpNXknYpcw+xP/V3t6SKS0SdeW3zvqxqd
 6XxCQq+s2JbLr8udT2m7+uJy4/pq5ar9SUgycbvixkS0ZMAvNNnjobkttEhMxjUJhUPf
 0zK9ybCMfdP33FSTEwuyJVpB5ky2x2b1R9rXMF3nlJDRr0C+1bf77phAqje6IOuQpcwv
 9W+X59HgdtId9jQ67LG3NSAAchgtRgf888TiqBkE8JKm40H8QKzO494k3MeIKBtr6RsM
 BrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781495725; x=1782100525;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5iYWamYBGi2g8X7XD8Ib5OYdq2ngK3owfPK32tRL48=;
 b=Afd26Sc1XgJgkU6ozDw0P+AKk+ucwvswKBwIu3VOxTPJ5yNHg9Or1enPbz0OUtM3Bt
 C3vpXZTzC6ln0f042+H6T+2jICEGbG/g8rTY+m1sKcCES/bBloth3y+n5qnTjdsmCWaU
 9VJaDtnBJUbiD2LjqMYKUFEHQryg50AHqqWckDvN5hrqvz2VJTEbZDdl+mAOvs3r6ai/
 YtpYvf97h4wis4ztZeuHQtkr+el2+3kFsrMn4QJd02fVlfGdONnZ3eSApTNwAxK/0YUa
 6mXqOpVjs1eOgfoXkMltii4ciGhX6BECo38Ya91J+ZmsJ+ju2AcH08x4UkNkHXAAbHT2
 0HWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+uwSe6awjmpghWStgl5CMALeqMBiKZ8IOQB6O99g0c39GEM5ZZfktdg8e8HD/+vxzG3Q3FJ8fMGiIy5A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0e1pBfZwQMFpk5zA9ExkxQzfvnyhR7o+ppr6k767Sf2j/9zPS
 CQGkyM210apchNAkxSB4UmZmxUtzIiPuefRgVeiG4gVjsDa2yw5ksHtu15Ie90VIAZrCJVa3i04
 M5gMguIEpqcw0MkMGMwUmBrDwLZzZH0TiSCXcn4WoDPpCIOFPqdoz4URghCSl0NTA9kJFqYnboE
 Cff/+8Ui8=
X-Gm-Gg: Acq92OFdRXzeMm0IpF4GGPVoo+yTyAZTaeWG1s9Z2YVNoEAZabQnJkEPMxFtKD5QlJq
 4z9ZKYRTaPPE6ia4nzweIFkNZNrlgiLvDXljskP+pa4zvflvlbWQAADqObCg6JADy9tJYV9viWc
 EnjMtDyROvfjugBnHe//3YDkxac/qkx5OZKW0qSPDc+aGSyT+0Yg5bNwNpWMBZ2kBIQWdvK+FKU
 4JRFYpAcoYNFXRyEdYPE93Cu8OuCiNo9gFwSczkfFAQMJK84/an5nzpmcfZzNS+vw1AjMxAqzd8
 Pe58RqfklSM+xMsIUVx+eNjUKX+A2W9DAyspIg2nMMrlt50Mhi4gYZNBvU9wi/PbqrEpHnSFF9i
 Klla+fjhTNHBTGMefzomuExr+cu1C+zyYxeo=
X-Received: by 2002:a05:6a00:23c5:b0:842:6004:3fbe with SMTP id
 d2e1a72fcca58-844e1a28e6fmr10448196b3a.25.1781495725007; 
 Sun, 14 Jun 2026 20:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c5:b0:842:6004:3fbe with SMTP id
 d2e1a72fcca58-844e1a28e6fmr10448182b3a.25.1781495724608; 
 Sun, 14 Jun 2026 20:55:24 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434b05921bsm8482573b3a.59.2026.06.14.20.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2026 20:55:24 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:25:16 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ai93pMA6MQ2zBv6q@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-7-f0f4a1d19929@oss.qualcomm.com>
 <6fde35ce-52dd-4679-9952-728b6553b843@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fde35ce-52dd-4679-9952-728b6553b843@lunn.ch>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX1p4j9PU4B7/8
 sSzZkHamGdCA+ep8mPvfnhcuSYzI+5Ihct6uxC4VD+mcxVD9JybEdjy2/XFHSAhOl9Pn0qk0eY6
 DccLB5r2mbszclMUx1UuwhObd1Rb/vw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX1XWWdz0PIixW
 /lCns+Z5PNKeP2DF72uYS4ldOWjcjvX0kZJ/iDecYiFR42nibWOR5HJWvQdnyjII5AWmB62HibQ
 PP+kjrJMgRpbUbwrlgqiQ8MFLXeWc5/QZwk4w8vip42TRSxqhNYmeZ1D2dTJ4qXOcfcIB9w0P4s
 sb3onbY53dvZC8Nbs3U68EcoDCjLyscPXeVvkK0CuJEJdcBvDcgmorwYyv7ipQMlaxhEPxMaJlG
 XWgnrGoI+7opSC0hWrh/a3qUKQsQllvERc3GRFLBYlHFFCtPl23BnJZNZ4BzSdk81os3lhHnb+n
 Pkkmy4vat1Ix6rzM2jk6Hb2OPN80B17MjrGohGb0+26Wat0D7t34ZRjbZ881+b3tEJ3VN0XHzo5
 K3sIIuxSrFQ5lzwmnEGukfLpmudL7Wd8MPcOHvdv9uD16WtwiByuAp7nPXqKN0QlDMBVvQobxXe
 w3cWtUVaAJg2ppaOkyw==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2f77ae cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=HuS8l_LH735D3i-wPbwA:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: bclKZLmIe3amTy12U2VxbypydH1l_-2O
X-Proofpoint-ORIG-GUID: bclKZLmIe3amTy12U2VxbypydH1l_-2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150037
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
Subject: Re: [Linux-stm32] [PATCH RFC 7/9] arm64: dts: qcom: shikra-cqm-evk:
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:davem@davemloft.net,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAB6E6832AB

On Thu, Jun 11, 2026 at 10:58:39PM +0200, Andrew Lunn wrote:
> > +		ethphy0: ethernet-phy@7 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <7>;
> > +			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <10000>;
> > +			reset-deassert-us = <50000>;
> > +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> 
> Are these two needed? It should default to 2ns, since that is what the
> RGMII standard says the delay should be.
> 
That is true, I will remove these in v2.

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
