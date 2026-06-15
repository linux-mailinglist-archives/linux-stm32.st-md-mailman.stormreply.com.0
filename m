Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PXSbHG53L2pzBAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 05:54:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 001DE68327B
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 05:54:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=oD+3sASR;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=A3hj5785;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 826F1C5F1E9;
	Mon, 15 Jun 2026 03:54:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40885C3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 03:54:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65F1hvZP2725833
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 15 Jun 2026 03:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Aj28ezwhv4TnokMoW4RbU6QQ
 Lc/XH3Iq3Hlkkr+sF1U=; b=oD+3sASRNbigJz2LV03W9rx8BotwZ+1JfdwAXSh3
 4NIBVpJig6Mb/IcmtFvQAuOs2aEGkmZIHXPOUA8waMIixhnhQW69l1qbGmxCzm4W
 aWqW64mzWU+ZISOaN4fNIehO3fBhtfNCsfXRSNtTX9ZkHOsc6LtJ++nNFKGBtczq
 B+ZudPF5tCQxgCe96CU9aKwnz+rvIm0hV9UWimXzFwdCVqq2WASvxzlCXc+Gehza
 2W6s9fFP88QeirTC4wOayo0Mht/W24kqwYLlVUm1A35YoIeetD9TbYTJjXI3W0aR
 FbKX2DxZy3te03iYfEenoUym0UVN3SzrbaeA4N0uq4Hh8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgn73c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 03:54:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-36d98b6f019so3166101a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2026 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781495656; x=1782100456;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Aj28ezwhv4TnokMoW4RbU6QQLc/XH3Iq3Hlkkr+sF1U=;
 b=A3hj5785Axe/fc+i3KpfLSxYldfnrdvnxq5dJD2qE9w3i3p4R0B2qAf8yDm3EbzTqZ
 NetE9QjmV4CvHrzXM12dmJj4k0SVmKCUc5gD4wgbH7geJO4iJEUmoNL/Hh0Ng+qutrNv
 qVyoD4EV4bi0AzBqHjXAbSZ8qp1//eCS3Djol7e92n0KXH+r5gxjKKXyjdRNRZCLZGN3
 a1LIggRjhUdxi9R+OY/XSc1WsEEElexO7IeSBsTwGrGG2AzPSAb3WDHf95njI8IOELCn
 8P0Gd5eZevOgU8GOE4EQAdTaottqnWTjhwHLoxg5B4N6GAslY87pbRSvZqDKaRMEz9qy
 IbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781495656; x=1782100456;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aj28ezwhv4TnokMoW4RbU6QQLc/XH3Iq3Hlkkr+sF1U=;
 b=dQVUUMyXqmJJ2RJZNpi3YqWbkRbqfRPL+Y/Wpkp0k+mVt5Or1XWzSaaCkcWnQHXbDX
 /o+a24JDmu8XK07WzXM5kOLAND6DBbuKHF+VPtB2Y3GfWoCwLTQSnpJml38D9v4ve+K/
 3TrRjkp9EIXQVaSpmkz7u31pgnItMSDS85myfwesEh5E+80OyXN8vDddjpxkzrNFN5XK
 7dC3fJtWRu/D7vtTpCBVPNAExKmH8KT0V3Qj6yDXEv7TOQSb3GiTjhaFVeVhfcAqOJxG
 3MUQFNzQBkqwKxSbRZs+Y3PtOwLW/eK3nspowblClMe0ejS0qp/HXQGXv2cYicVaVGAZ
 mfoA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9GOmJeorNHUadu4YrOlEItBDr4xTE0HmSMXp+zKDieWKX+6dNwIpOSIF0OGoITI4l7a44xfKrTCJ7A1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4OkLzzTTVmu/jlg45DiMNE8rzKtl4gBr7yGW1Fa3ZOwrzwOjx
 cHt0njQVhk2m3n9dZMbnHAuJPcbdYFDqEjm+G+urz1u04mtifxChGey7uZq4m9Dwhj6AUxFVpg4
 ApNb1+qrkAJPsh7stUQ5dbIHq2Wq9pegj+JlPbfzeGbwvsm94OC0IDu/uPdEvRgDnetWIJnb+n5
 P22Y9TiGg=
X-Gm-Gg: Acq92OGm2XqnqA6+XMlvEWvbrPuHtmjG5DTVai9iu30W2Zf0+8HvVhT0f4/LGVJxNZk
 Ctuspb+7iiI9NdazUXRI8HVqkSr5OHqYkZXxP6YRAjPiNazwtrYtrvGLScn9DdwkAivGJBOcus1
 vPyW7anLZ91ReHaAB+7fXf7AAn3HiIdmFzaBkAwRvsJWcwb05ALJpaINUYmrNTrHT7IrSrPUFH1
 WBwzAA1NINhSQj3ASu7nDYAf6u9VbMux4z95rDyyjnCsVtzKEYsMYk6KcQgOjAg9sCZNSI4XAn2
 wK2nx4obzu2AOurSX9l5rPrvhDB651cAM98F58PgPL2TiuT1yS+16eM5E+HdLK9Dtaq5adTnTZ+
 vo5Q+OHapWJH1KzslXEF47TGbmX9zFpg3M9w=
X-Received: by 2002:a17:90b:5865:b0:36d:b662:708e with SMTP id
 98e67ed59e1d1-37a0202ecf3mr13816820a91.9.1781495656112; 
 Sun, 14 Jun 2026 20:54:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5865:b0:36d:b662:708e with SMTP id
 98e67ed59e1d1-37a0202ecf3mr13816782a91.9.1781495655578; 
 Sun, 14 Jun 2026 20:54:15 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37a262adbe3sm10477963a91.13.2026.06.14.20.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2026 20:54:15 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:24:07 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ai93X/cNWHtEQsDt@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
X-Proofpoint-ORIG-GUID: rvOPFfyexv8FvQEw4w3M1fFT6Zv1retH
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2f7768 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=h-cV_6-i1hGX5lmYmEcA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: rvOPFfyexv8FvQEw4w3M1fFT6Zv1retH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX4VQ/OFgXHVCY
 yFtjN7U72/g4VWb0A4oMRykov5XC0EdaWSVuvekuApaKeq+leuVDtLHFNLir3RZP9n8oxGY/NME
 GgqmOGS8FQzD/gzVqbntVPmzTE6Fi1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX6sjw5hJgWwU7
 +RdRZd0RaJc8F73wGIfc3v+4ZB9xyyA6AbkmfhzD0VDWdPjbADm1khLfbhTyDbhpz9PlQW7S/iC
 LngewwTqwho+mGO8EtixF/05ptr0kbjt+rZBQmyQN2O4Gq+M7c481Ytj5rGubllHhaSb8jfXecj
 Nkl7OBfjUD3k7dotRX6yKZGDt80lDOdF7SVITLMkIR/xmWauJVJNeU4zkE3a662tAfFr1UJ9qcS
 xTxJUOhXGspAn4k8l02aVJPDS+K4HCUNSaDsv0eWB+RLdBY75hEe7tuGd2zAavFki50tlSCdAgI
 P+TPAzuwYjNeF6NkQ1QJVzWwSOQLaBhKwJvp2AcQPdSAjGKz1HtEGuFHlTCervxihT7hsSByA/B
 zaz24ogGT/xtlOoO1JaD63ZR9ZGocu5bUVI+6AYwvxSNMF6LZEvRVkh+XOlet2SfEEgkgN76eqP
 iqoiUz8tpm0+j9bHdSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 001DE68327B

Hello Andrew,
On Thu, Jun 11, 2026 at 10:54:37PM +0200, Andrew Lunn wrote:
> On Fri, Jun 12, 2026 at 12:06:59AM +0530, Mohd Ayaan Anwar wrote:
> > When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
> > the MAC must not add its own.  The driver currently falls through to the
> > generic DLL initialisation path which programs it to add a delay.
> > 
> > Power down the DLL and set DDR bypass mode for RGMII_ID, then program
> > the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
> > ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
> > 100M/10M, and remove RGMII_ID from the phase-shift suppression in
> > ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
> 
> I'm curious how this works at the moment? Do no boards make use of
> RGMII ID? Are all current boards broken?

Searching through the DTS, I found that we have two boards using "rgmii"
(qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
"rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.

I don't think any of these boards have extra long wires which would add
PCB level delay. They are against the netdev definitions for "rgmii" and
"rgmii-txid".

But the first two boards should still be working fine since the current
driver programs the IO_MACRO to add the delay when operating in RGMII
mode. I am not sure about the last board. I went through the different
versions of the ETHQOS programming guide, and it should reliably support
either only MAC side Rx/Tx delay -or- bypass mode (no MAC side delay),
with each having different clock requirements.

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
