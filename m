Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V5wEFFvsL2pnJAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 14:13:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF15B6860AB
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 14:13:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=YlKeDzal;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=CMAqVhj+;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87600C0A472;
	Mon, 15 Jun 2026 12:13:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C491C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 12:13:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FAoNua3956032
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 15 Jun 2026 12:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=; b=YlKeDzalYkJqdoSe
 fGINnHiA8B1eAOMBeKM0mFKgS8Ze8pG9f4SrSLvvrdp3K57AXT/9H9fzje7Sglbu
 U33VTKhIujWwAUM6irCLHZhmnQQC7zusCQRDI63d2nlmn2j5TgguG5Lkw5Uok/Cm
 fgbvo8GZljUdavF2/2wbYpytbjei+Noe2L52oHgRaYABN0S6sL1LsyaqmGReCEo/
 GboBI9PwPM4kI+IkVMt/zH3ExF2EhfKNc3e1HnYAq3AFg2aJqs+r4jRQZ1H4e6y0
 sV+orMcgtuQwF1gec3r1yOnPJ3UDig5Ezp5+okw0S2cmOSx09wjGvXshWJqwYoXt
 Pak2fQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter00k3j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 12:13:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51759082206so9157441cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781525590; x=1782130390;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=;
 b=CMAqVhj+T0DkoxfUdxFQ/c+mrtMEb5rNdlhxwFSLvEtl5M5ig619NRd5t2Va1prlfd
 iF8OO5BpTYeSpq8/i/GltIbqzRP0QSSphseso+xietBsIfpnCaye2hv78eFs/iBIWA/l
 eSVtv/67fW/BKVtelZhQ9/CiOiWzE7p3P5aEOFNRrByGR6iWdQAlJogHYRIduan6ah81
 MiQE4RNFbZd39pcOxXzICKejAoDhxJtwjAmjkNzHTRM5mNJxik6BOUIplgXzXwbvYYSF
 C0IQgkphEBj82+5/nVWPcP3b85wVz5M3kN+NpFbWqNcPCPzogVaedWwaq4UIqPE4V8l8
 71Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781525590; x=1782130390;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6pmdA4NzH1jhT7/XCJQKYN+fSOrkQss8V4mYUPNsLc8=;
 b=tB809iuVmrkiXr0m82YhQbjDygzRNT377tJMQJDswjRG1Wb05FqKu3MheRDD7epYEW
 OGJdbRW5QCixSK9+NEBsue7BP+SwDjpfNZex3Jj/2mI1xU1SiXvGOMbZtXmTVsAkIuuW
 gEOiJBPXK2n2J6widW1zDoF6sm1l1+Kvbh72266jLQkYODMS8Vpttd3ZVJvBthmdxvkf
 0SqvKpBizLTqXU2Gp5TjyfvCzl6uBxsIcknKA0EjwKaDDux2WA3I3yLjmLo+A+DBJJAD
 UP5tlzFcG7ufuo30oaurOM6c4/5x6msH0HZVOfMYoxCxjBwmVIIQ4nspa9W/Zzq2me/r
 En5Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9v2Ob4O+YuEu3KzAjojhNOmhU0KWg7YhQRg093ZoIQdQS3Sl7KLdHmt6Utb33AjA64sUcb3iv/FGRVzw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+DtLDp4g0ygF5jEk9xDpgeQlWKLks3FDdV73gJXgvwgNdItcU
 Wn7a7Fuz1sbaWokpSMXiFD0Il4kdiWMtHUsDg4LyRnOdFEdov/Yj8DOT5DZPBHwcsmmn4k/BRBd
 vQkN5EkryR9VChFrkb98qlQAgW9v4zS6Gju4wvAjp+uKnOT1g6XNn7Ay5A6ygIs+4GEGgJPTiuB
 05klnxbyg=
X-Gm-Gg: Acq92OGUEQAqoxTQROuNMtLepanu8cbA7EJK9875vP9yJ4RTqiZu+KRWvIeuctJKd3t
 bySh9m3NBz0ZGp0zrwVoO5aX23h7Z6Bd1eOLe84VJdS3uxi5MkWrB+5h5riuYtNtCtXj4dCWLvY
 y/HqFIHUKAsG4uVE24/WYsIxZfymZI5/6UltAZ8KzIBBdjThqsxLp/NTCRoOEmkV9ajw9b0IK62
 sIOvy54c0ZzeznAyXOl0P37W3Ai/y9I2Dt94vuTW1PUAFy0cIK+Qq0bRns6uCPkKN9E/8rCQUl0
 YGtVMUO8C7jxL40mPL+Xf7Cw1//R1iEe+bOQQouGF5drErJaNwbw2zIg7fUEY6mr9lz+QqaIjnA
 js43x3VFB4c+6TOk6azf7iYLgOqWgk8TReIFKWymn2iMiNw==
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id
 d75a77b69052e-517fde8985amr129458421cf.2.1781525590133; 
 Mon, 15 Jun 2026 05:13:10 -0700 (PDT)
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id
 d75a77b69052e-517fde8985amr129458051cf.2.1781525589661; 
 Mon, 15 Jun 2026 05:13:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb4423439sm459791666b.2.2026.06.15.05.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 05:13:08 -0700 (PDT)
Message-ID: <45d7faac-7c0f-4f89-808e-06129e8420e4@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
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
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: X9E93LzeF7OIxvvS0pJc9wn0xIY--UF1
X-Proofpoint-GUID: X9E93LzeF7OIxvvS0pJc9wn0xIY--UF1
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a2fec57 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=dCDc4JseV86iyfNbYEQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyOSBTYWx0ZWRfX6QoGGQ3EXfFv
 wmPVp7M2j2hj5s6L7G3o6JLHJk18EfegPU8PS7VHDbRwi785ya2jC2yXSLTav/0IaCCHIgVfvbs
 tFNBd7PtE41zuMBu+rOnBBHFgVevQWkXAZpQwS37DKbuI/fXzTgmO9fIGv1frCDo6ANguuQPuos
 O0G1ebBjMs4fvr4waYYDVkdrsmSUjLNLX8aeVuviivPFXFgxhLva1iaPlFMciYDraPowUVAqEgW
 nqICohypC7JBvdrQBwgia+dyHscp5qlU5Lfnoq7TW4iuf+8jPq+lHs2iaRvmJIJtJq2KR//4t2d
 SrvxS7xbd63FJNPhPwEoUUUaHzBaLK2LQ2UBNO5PV+7Q2fkyRf2lcKmwu87CbSzq/0l1rOhNfSI
 PdxjfLnw9Rbw4FfKkUDc1fE4MziaMWR1W3ZHQtz+7Ue55KdIBOJ++i1TKKgjrWG/u2ZyXafY49F
 vo9hOoc41IlNSsw/nQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyOSBTYWx0ZWRfX9tyt1A1Bc7nZ
 ZErTgEIlfZPSZuGJQ2DphFliMiKFEWBkRolloOnUW5pDcrXE9VvXD1d3TR9I7OxBtfygc6Pta21
 pYCAAEIFSvyOdpkkIiPhQVBizGgiINM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150129
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
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
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
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
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF15B6860AB

On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
> that must be enabled before the DMA can reach memory.  Add
> ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
> runtime structs so each compatible can declare its own set with per-clock
> rates.  The clocks are acquired during probe and enabled/disabled
> alongside the existing link clock in ethqos_clks_config().

Sounds like we should use an OPP table instead, we can't just do 
set_rate() on qcom, as that will not propagate the required perf
state to the clock controller's supplier power domain (i.e. VDDCX)

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
