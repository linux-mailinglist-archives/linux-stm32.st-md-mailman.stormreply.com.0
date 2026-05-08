Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL+TCkbt/WlJkwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 16:03:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3A4F7894
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 16:03:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C11FC36B30;
	Fri,  8 May 2026 14:03:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E953DC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 14:03:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648D9wAr3891035
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 8 May 2026 14:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=; b=A/sY6KHYIFcKhS94
 NhiWomB1DvClA0fBtyGO6SgZcMfBuYQ50w+MPtem2yUW8HZxGwFdM22iBWMXYWEK
 SPLwfIZ7yqcelZQLTFFzBrIEfpTVEPX6pSmM8dQ0fLc77cdDpBzRCkgOnUQXs5xo
 hrvbnHXiC1I2Yf+kaO2ruFaVnrfojf4/+Rk9k5No29B4iwKmlAjb0mIp4lYGLjHK
 jMfMZHNnUXlr1+m3x4NrTHDxRXBgOprkfUICLIXLX2sj+tPP026KpsDia3MPJNCK
 C102f0AIeG6Q9UrWboM111YS23g0oJyYeng21kCsv3dqgcJYLEx5N+4tbmCl6Ftg
 KRL3NA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1gfqr929-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2026 14:03:45 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7dccb22cd54so513142a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2026 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778249024; x=1778853824;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=;
 b=bAjx/1BelnlxGIG0esDxEdXIX2OdoE+491xSJYJc4O2U1DJOgzpOZZ5lWxj4VdB10N
 uT7wjRTbOYBWkMfDR1VKvTKhO01jlIYNLusICTuQbNI3ytyNB4cYtytcbGopcUzNbiHC
 IZd2gr9n4Q0WFaBwq/wZYkEw3IlsaGITd1M32CvaQmLfLM7J6QfH/UHXrqQrVWIAo1y7
 6QAvjHSYwZFYWs+HrD0/Us4mn3h2e9jKglAuSXu8nQxUNog3cS2nn8v0Cg33QdZ55BIi
 XvgVTFeyYpH5NBtzWwGvp4ZzbPqH61UkQ+TewMNHzjflDR7W3tcfnBDIL6K6AfEzf/rp
 V3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778249024; x=1778853824;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=;
 b=JTphDliErUEvZH8+eqt8GIcLoxkpSSdjxwmMUdSTJvUKnh/Um62wGxqZEJ/aj1zdiS
 ucwT/ScDEUnGuZMfDif7Dn0NzbgAkc3XzfaluGMvmKhfJ77OYFZxW0etqs8XmogjdKWL
 QQgX0yDCU0Br3cG5XYqDCmHw6edreYn+esEUnM3R8C9LY4G8FCPwzeRAlAVjNIMGUd6Q
 Q3gtih/44CaCI6iBX5/Yaz4XvGkRdBFI/KWfkwC1A63rgK8ZX+bZwNoohdhVu2/9pV/w
 5hFwVdzLxSKJa4Wo2mSDH1hb4M47b+Wuti6z0VGsdPJHEuxHvIQKV/i734B2rT8RjEQO
 uUmQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Puj3jneqpTDp3RTf4dlHHH3PA2K+hQ6muGlYq69LbKb0AOocOdtKvH1mMXVbRhJFqQ2K7IbOyfZBP/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyccA9Ck9llohzmKPdw798K1iAtkHTPFkTNnexl6W5U+NtUZz5h
 yRb09u90Uf1SCgS51yqxZE4zzYWesyAsJgkjFzBPV85joAWpiUv1ulCb0w8rqpTqQSOagKUrTSb
 h52P0g3lqzaK2KX+PMF3FzKfw4480mxNi7dTdYrcyyW459yZFsKqwk7syDSquMCvQFxaeY5mTv3
 dXrc4lDwM=
X-Gm-Gg: AeBDietuJ7FwDuAaeAq9Jdv4OchJxjCv+dpAX0+I1nTIGNekQlPy08AUr0tfv1j1s9k
 ZatNM3Bp2Dlb/9T6gqbj+MaXu2nyVQJ3NgYweiPVfoHLSvV0HdSlI6wjASdQjYuW9AchcHWEeTn
 TacMyzs0q2Jb6mOpOaHf/Z4PC//fqps5J0cY+EbwqvMjrryf9zrEANcL6P7zDwYZwLv+4v46Cct
 q42fTuOPd7qQAFRyEthDj4zn0BZHuQo6SmpwvA3o9XsQJ40jQgjwEn86bycE7O8QLjaPzhmF+Cp
 8Uv1IUjtaNzr49Clefz2NDunIkTrmv5lBrtXc66rPqhytTcTtZk9B5mHzRX5aC58yfBhFpx2FVj
 4yXvf/rWhd/06Vk65G1t05F/Q1e4QqLlbzBT93VZNBhF9H5FxaIQaXkegyfKsKXeC67mH6Lt+Mj
 pZfAA=
X-Received: by 2002:a05:6830:2b29:b0:7dc:c31e:7823 with SMTP id
 46e09a7af769-7e1df018fc4mr4435643a34.4.1778249024131; 
 Fri, 08 May 2026 07:03:44 -0700 (PDT)
X-Received: by 2002:a05:6830:2b29:b0:7dc:c31e:7823 with SMTP id
 46e09a7af769-7e1df018fc4mr4435567a34.4.1778249023494; 
 Fri, 08 May 2026 07:03:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4358cedsm87169366b.47.2026.05.08.07.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 07:03:42 -0700 (PDT)
Message-ID: <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
Date: Fri, 8 May 2026 16:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501155421.3329862-13-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MiBTYWx0ZWRfXwOw/7Foz0Ikf
 U+MwOVLqlH+6qpeHWMf8RdADIaWLrIA7rqC1fmd6tLPqVFtUUCTlkrxNgfdA7L2L4un1Q9aMNfU
 pzFmKLGNSHZ0KGRtEjtB+cNlIbSvsBppoj/DaY6yAlZOypNA+s26bnLi6rNkhljBDM8xUFzyvBX
 LOGrw9c8qm6VNtkRuMLQ+IZFC88KUor/dkJov1zMY0+CcFHkNK5fdkpbQ9nHhLCwpSqFqSVcdsQ
 G0JHksrBMvDSdHPrExnMIsfhn0Z+om1+xLFfORY/S1uTtFeXux0VTQ3anhV+a9FavW5GHz2Ufa+
 oOuqi6ro/9AZWdV7JPsL4+JxxM0F8VejmlMalQofk1M8akIw0GOI2ZHCrkko5XhdQdF3tBx4ZEl
 Qpoh0PsDTIKjr0mrHANkt7jATT9u4rQnr6aM5V9a0cyl5w5C+VRFtU6D8hLIUN+cw5Q6X9iq8PO
 R/t0jmmH56ymnCDUg0g==
X-Authority-Analysis: v=2.4 cv=W80IkxWk c=1 sm=1 tr=0 ts=69fded41 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ee_2aqc6AAAA:8 a=lW0hg0oAPnnF6MRRTAsA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: _YkXxRBtffuHil4MkxOaBgqfI1FyCSH3
X-Proofpoint-GUID: _YkXxRBtffuHil4MkxOaBgqfI1FyCSH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080142
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 devicetree@vger.kernel.org, hawk@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 12/12] arm64: dts: qcom:
 qcs6490-rb3gen2: enable TC9564 with a single QCS8081 phy
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
X-Rspamd-Queue-Id: BEC3A4F7894
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
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.432];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 5/1/26 5:54 PM, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> 
> There are multiple builds of RB3Gen2 with components included/excluded.
> That means whether or not there is a phy attached to eMAC0 depends on
> the exact board. However all versions include a TC9564 combined with a
> single QCS8081 attached to eMAC1.
> 
> Add properties to the existing PCI nodes to describe how the TC9564 and
> QCS8081 are connected to each other (and to the host SoC).
> 
> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> binding, but checkpatch.pl doesn't recognize that.)

This should probably go under the --- line

[...]

> +	qep_1p8: regulator-qep-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "qep_1p8";
> +		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

If I'm reading the schematics right, this is only required for the PHY
- is it collapsible, or does it really need to be a-on?

[...]

> +	qep_irq_pin: qep-irq-state {
> +		pins = "gpio101";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;

There's no pull-up onboard, should we use the on-chip one?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
