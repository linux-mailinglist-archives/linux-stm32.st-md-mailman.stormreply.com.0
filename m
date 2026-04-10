Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBCzCdt02GnkdQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 05:56:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D73D1F6C
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 05:56:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55956C87ECF;
	Fri, 10 Apr 2026 03:56:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49D41C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 03:56:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 639KVdbr1433112
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 10 Apr 2026 03:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=; b=jcFlbh20MjLbhYiw
 dQqOf+oykWWbOk+ogXpUm+mMLyHslRkqQt0ncnh2rsVw/VOv+WToYoGnRnnPOUFd
 ChbM8I0FKStJHrScjXaDwFkpEMMw6uyEDY5aZ4eJyD0kq/y2rHSPbvKJi0cw6CzW
 JSEDj0VT5whWfeB1fOb/g39OHEMmGEHyitpoBY8wXHZIwSp1/zgfwDU1iSvgOJ86
 mqfbcP0CagLV5Z23YgXqP5gonhUz0JumWdSCEbkmZuFwCDanQIz3YTg2JBH6R/Nq
 rMAS1AHowtzVibo2dPbWkYXa7SwPBCvYvVhvd0ewSjz0xjFLwV9E2VWWwI/z49Em
 cIw/5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfamh9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 03:56:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2b24e9b4d82so13181865ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 20:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775793367; x=1776398167;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=;
 b=hw3H724OMjj16Bu+V2wnXzSAGU6TcK1Mh1vyqri0tdAJH4TVKWnlJFluqypvQYYf/1
 ok0W9u0YiWjPskhoRTlwfTSetpxO+ie179h+McAWGPLvsSdEy6c1I1Pp0D07+drmqu6w
 JHR2TpfAupkWL6vW88B0ivsbSAMFEB+WBexJcdwiSH3qy6hx0zsoxrQmaJYpeOAxQ0Rx
 7BDpo/iz1+h8eXsTZVrw5kmCJT6kF1HIzoSjJ6xhJbLvYPnbRrXGSaqjzA7hgGEvtikD
 Ab2A+9fqj4ZbLHpuSLXfmN0rple27s8LGpJYat4lFX7CBJerZpyBYOomfRjU638UVHFi
 qkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775793367; x=1776398167;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=;
 b=rl2S5JdOAGHMYgRETUYXNLoJtoaW3IczCMMr77WoRKluV2ATwG4JLElXOW9Ijyeznp
 8MtUmHAS/vdvI4ZzAQmNCfJxj82Ua/NehbJAidusU9NfrNTpDc8FG0KAc3vdzAnHVL+L
 n9xKyeLudX0iDzyttdC7W/u7DypPFKQ9eX8cc7xiRcYOX6Dc1zPGlcOgKymjnrOevpA7
 sJatmsq5jiMnP8tcwPYgohcIweJGCBJ8MsXgPG+lqQb62XkQTOGBo6y2wRzidrGOAYoK
 cGpykN8WWoaLn59WZ3J8ZlD4wN3Ypypogen+pfydSsxS9nWvdPO1soV4E7ROaL40Xrzp
 pO/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw6Uuo0nSG8iZ+Aj1FAUV5xy7UxVuXqmYeZ4Pps5JsWvU0n26TnkPQZGtpt6FQE3/xLZSLbQHkbDKd7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQ1ASLtBoK7t0eeAc7ovJ99QHhpUlUKs9PVM1ync4q/O1dPtEI
 5hLFou1EvOIwGnD4P9Pz7M8TlzufpzMhLL7U/p9jK4pwd37YmH+aJIpRLrEEXCbcwqp8fDHMeJ0
 FemJfg7GEjK05d0l69xy36IO4wCGbHRIwfQcBVll0FQdcuYfgnA6e9Y9XxMADYh4xL4v94jB95+
 UauiL5H9g=
X-Gm-Gg: AeBDiesUeMYVjcetdctWSnPvOja+3MX9CWgi3FUpCsOWesGuVgQx+pZt4xBe+RHByg7
 ZXl1L7PvGkMrMYdLZB9zP4l2HDPcFf2LFvkHm2GO/+CiNG+eUd+MuQkRHJ/rx3TE7p150+JAT29
 3KEbyfYbGSmXHJ7sPCpSG+eOTrx2sGmM0QbEJ0aGN9YOeULFwYlfBzzcxvgC1IkUFeCcBvfN2sf
 ow/AzySzD3SIZJ2MpcS5OD6CLoIs/LiAg4rvbTda/DKx6i3FKwqHLp93KLIBMY/l331O8EP7f+F
 /NOjnLBgex4hEbE78PfqfqElqRHzEUXDts0hIJOikDD8216rJijXab/fYozXH0DvPNr/gMe9C0d
 TUyepiEeshkN0eVEWcLsLWgTaCDxzgXK+z+rf9obZSp6Pyo3VLw==
X-Received: by 2002:a05:6a20:94c9:b0:39c:41b2:5d4b with SMTP id
 adf61e73a8af0-39fc928c9damr5656592637.2.1775793366753; 
 Thu, 09 Apr 2026 20:56:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c9:b0:39c:41b2:5d4b with SMTP id
 adf61e73a8af0-39fc928c9damr5656555637.2.1775793366257; 
 Thu, 09 Apr 2026 20:56:06 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7921a1d0d2sm802544a12.27.2026.04.09.20.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 20:56:05 -0700 (PDT)
Message-ID: <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 09:25:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d874d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=km6amy0AK99uZQ67LAIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMyBTYWx0ZWRfX61EQLCOQojZE
 r4Q0cKWvZbUU8myFR1HCK8R46rppSuU+WOHYXBZdXyxH+IWxg1GTZdKbO1i1FaJsFLJLsqB/+o0
 K0pvUxhl1gQPluYLJMGd5RBLRrhqoxhPWsfknrXlEHREwWgotqvooB5PuZSeKVxD6KI18ejSNax
 GEqmH7uNZ5pURUdc196N2TYK0bI+ghWlpDeWpjp0XXU3UzCKbe5GjShQBTk/WGkQtzZ3LjBsbIE
 hMxfKr2pcqTdJ+5WKtx1sKF0QooMBjSwdGoSLjZQjuynN3M7So/FGC8h27lFSMW45r1AcWyCA0V
 zzKH5WFWMcb3eTldGtg8lFmm+jEHVz8Phrj9tNkM8IHOFN2rUKvcHHfzMPDDy9fgHXf4fB+kNpJ
 Q3ImZVuV/5TELopWxtfuZSeSCp1wbifPMOwfgQ0Gpan88g7RgxDgeR56EW6kToVm0+UvRLaXmsO
 0N6BuYVKU5bv4k4lMSg==
X-Proofpoint-ORIG-GUID: nL0YBK8MUhO8lCxOAGlaDHvQnsKoPeR8
X-Proofpoint-GUID: nL0YBK8MUhO8lCxOAGlaDHvQnsKoPeR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100033
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 8/8] arm64: dts: qcom: eliza: Add
 support for MM clock controllers
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod.linux@nxsw.ie,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[nxsw.ie,kernel.org,baylibre.com,gmail.com,foss.st.com];
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
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.183];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: B17D73D1F6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 12:10 AM, Bryan O'Donoghue wrote:
> On 09/04/2026 19:10, Taniya Das wrote:
>> +		videocc: clock-controller@aaf0000 {
>> +			compatible = "qcom,eliza-videocc";
>> +			reg = <0x0 0xaaf0000 0x0 0x10000>;
>> +
>> +			clocks = <&bi_tcxo_div2>,
>> +				 <&sleep_clk>,
>> +				 <&gcc GCC_VIDEO_AHB_CLK>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,eliza-camcc";
>> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
>> +
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&bi_tcxo_div2>,
>> +				 <&sleep_clk>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
> 
> This looks odd.
> 
> Why do these two controllers have no power-domains ?

Bryan, on Eliza the videocc and camcc are connected on CX and MXA.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
