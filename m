Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9mlvGBZ/L2rzBQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 06:27:02 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E320F68340A
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 06:27:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=mcdVhBPb;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=aIo3akq7;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B107C5F1E9;
	Mon, 15 Jun 2026 04:27:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28388C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 04:26:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65F1khV03309045
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 15 Jun 2026 04:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ius7qSkqzXV/plY/PfxR7AWe
 MN4ainKUgEjXPW/93NE=; b=mcdVhBPbSKzQTqHys85yFccY/q1MdqJ6b4igU7DM
 RsQVUFzjWaEDez45O/afLn/nED+puAwousbBXTdh0ZGnVKUhUh8WkYqT6TVh9PK7
 BsrkRIuTk4MYRuiKAUAzm4FuJs7kAr/H8eMt2cjJnbck9DuGouPGuxDP5i3SAG6p
 7bxs5Sxfseek8aNwedw38AJW93R7bI3oOxU8+Y+tgd8ga9nWmnE82xgJllnkn9jM
 VP2a/G6taB+giFNN5sJJd4/KHlqxw0YeE7+RDcH42DlWxYAFuCEaCRZPvRWon4kD
 RMx1b/Tr3/RaYwK0X7w3RGg6gPFr5kmmmjdvdp4hAJYnSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6wgqe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 04:26:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2c0c272e532so30504675ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2026 21:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781497618; x=1782102418;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ius7qSkqzXV/plY/PfxR7AWeMN4ainKUgEjXPW/93NE=;
 b=aIo3akq7ul3YV5zqKUbVbqrTuSM4fw+BX8idjV2D2ojT+NBXn98cIEjnQfrFhXiIJN
 zIivbS1H7SQlzVXVNJWkWPmtFWExw65aOxiiHIi7H8mQA+KdCmE7OFJGfBu3XAbuUHtL
 coImKdCxmjgMYJOMbxFqc+jI+0AXt4S7jtWHqNBnYbV+tUU9g/dEVTEWXcGhXYMRuB9u
 5RBvDjujKZjE0GhParcGdnVO89Muo+nHKd27x9iFMZl2RMPx1dqjBmM8T/ylJVIRqNI9
 GAgjXnTbnC3Nq4lhDn3isPsF4751f0PZmkNTBtFzoUwjjzv0rU47+bsc9XpxjKKZn8GM
 1Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781497618; x=1782102418;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ius7qSkqzXV/plY/PfxR7AWeMN4ainKUgEjXPW/93NE=;
 b=Tk58kHFiuulrLGx3p1s2858iw9n2LddjLzwKZe3rUumxuC7CgxJIyLpK/gu7RMmmXt
 AHBrHhSMi6jzB4DHbE9WDfvtkzOieeuSh22LPy/qbAdemPlk0+UhFo1MTplrA6Z6B0tY
 gt5luzD9UZKX7qklEdVOG7GhnJopP9rRuRFksx/WKDDvjNPKm6qtO138PWY4XPDfhenT
 5Fa/xBT4dJPPSWdtCMxIGOOXlkt+NYc+d2ndZwCFQQ8L00i7U2j3tIEp1K8eYp8FqMP/
 u085zteEmGy+tTw2ZMeqfETxSGcyf5+SU02/x1jm9eK96fA0P5WiImgEvdf0E62hKBzT
 57+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/I0/gybQILufJV1zZzPCPEEbkQnf8xYXPmKHpKK6KcNNC+iQEuScrM3MmHJKwDBpuM3EKDCYX1UP+cuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxL0FXWSCzEjI022pumE3v6CbL5i6v3i+IVFQweuBXUOflzGw3V
 7To0nVhHFbiu8qLSms6kcdwF/JpWfvG1zd6vpf16xUAdawccCe1x8+YbR5cw6zKgQAtYxXf2f/y
 nX1HQCQZ5CA6Kb8Cf4HnmTNRex7R2VQpIHGXfA9HZ8uwyNS4BO7agWjSw72bzM7TYSMzf7tTKv+
 p7iDrIKZU=
X-Gm-Gg: Acq92OEkK3ogA0nhtyx1+U3mfidFDTtOWhcOXT5hyHwJigV44NMwkyzePMwIqJoDcmW
 QOEkYDvPID/L29WtAn2r7f35mBcDw+XX+/AFZAO7VZLMQ6nAAvAMxzDGnVXDr4dvwl5kw8WTDYw
 jBzWl8D1QgWbfJrnoPhq64+CswyGn1xZzNMS30t6YMd+pjH+UwsvVESnJWdB1J3JKwH6Ql9FZl0
 29nBOM+Q+K2elbb3WOQ7npV9Y+EgHBVDl3YWWQYfFy72+zYCYJNfRl2vAXErLWuRi/OFiV5J3vO
 R4DGsB76yP0EfoeYsZNHh59FBuay3VkJdzTsruosv8urgLlgtT+E4R+DurexDgBcjJ/xumwHyWg
 sJp+weN5nyyEmGsO9UpTU6K8CT8jDUtm4Lq0=
X-Received: by 2002:a17:902:da8c:b0:2ba:7881:948d with SMTP id
 d9443c01a7336-2c664148a6fmr98607115ad.1.1781497617751; 
 Sun, 14 Jun 2026 21:26:57 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2ba:7881:948d with SMTP id
 d9443c01a7336-2c664148a6fmr98606755ad.1.1781497617294; 
 Sun, 14 Jun 2026 21:26:57 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c4327ac80asm77208425ad.39.2026.06.14.21.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2026 21:26:56 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:56:49 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <ai9/CWh9oRpYvHfA@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA0MSBTYWx0ZWRfX0NIK5lQl/vJa
 ZqCQlqn8kYVVIVuLFvIOg4Zmvr2k+zkDhU6x7XBqFKZuD2uJMVe7pLOvufG53P1qmobiLijFLfk
 QMbqsQev8rl2qTUpMeG02tYAn57jnJE=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f7f12 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ppQq2EeoAVl_dUmsFbgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: b3aD-inOj7lJb8Ly0b1yNsP69EURdgjX
X-Proofpoint-ORIG-GUID: b3aD-inOj7lJb8Ly0b1yNsP69EURdgjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA0MSBTYWx0ZWRfX+/GnyqFiJoPp
 8Ihies1DoozmYhnYhyRwv3IlVphIlY2JPSnGIDsp3PTAqOAEOVF5/cbVmNd/7RI55UdxGXAq6Mw
 DNkDBb+deFVFKnGFpQUFxH1YsOvbXVDCiT4sagqqbCXputuPFabh+I8vUel9Z4jZpWKJXf3g2cB
 +i2mleyjHM4cgnSLIHvPgfchiGVploS1q4Zuxct0WRue5b2B71Nw/bstQWK7nVJ/nTZYbCwQsQk
 b4OmoRQ81YiLeFUIfg3y8PcEzP3zERraFb4FKttYrCPjldMsvCPfqUkifVYz76hjxX9fMB4kIer
 nC3SxVU/2ewZQAWtPrMQM66a+O5zVE9wKkRT1zuY/bm/ZUgbJa0YoPtjLNuyw8GOmz2ejAQjKJN
 3c0TwUs6j+6Fww1sBIqaOBeTRPwPb8q6A1y7owrBiNABIA5Qv+f74Be47UeX0ATs5BcVh9RyNBe
 6mwg/Zsa7ixxfMEuh/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150041
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 6/9] arm64: dts: qcom: shikra: Add
	ethernet nodes
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
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E320F68340A

On Fri, Jun 12, 2026 at 12:07:02AM +0530, Mohd Ayaan Anwar wrote:
> +			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
> +				 <&gcc GCC_EMAC0_AHB_CLK>,
> +				 <&gcc GCC_EMAC0_PTP_CLK>,
> +				 <&gcc GCC_EMAC0_RGMII_CLK>,
> +				 <&gcc GCC_EMAC0_AXI_CLK>,
> +				 <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
> +				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
> +				      "axi", "axi-noc", "pcie-tile-axi-noc";
> +

I now realize that having GCC_EMAC0_AXI_CLK for both "stmmaceth" and
"axi" clocks is probably wrong. I will remove "axi" and have the glue
driver enable and set rates for "stmmaceth", "axi-noc" and
"pcie-tile-axi-noc" to ungate DDR access.

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
