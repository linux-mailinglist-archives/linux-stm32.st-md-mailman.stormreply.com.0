Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEAICpydy2loJgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:10:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B00367A2F
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:10:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57993C8F287;
	Tue, 31 Mar 2026 10:10:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05FC1C87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:10:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62V7OakH2465798
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 31 Mar 2026 10:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=; b=pvG+2BobqzBs0TOi
 aYw1IjEyVY0cM3/yP62t3d/lGzz5EFXojW6zGq/5YmszC80MMcWoOUSioxfD5dHt
 Q+ELIZEJhW++jEtY/uK7d9HYYVwmtKGvbSjiEu5WDLUuiZIRVWkbHYB7PYbNHdQf
 vhnai5uso2JMOmOV1vm/Zb8sh3QbMS+pInOdztpj34dH5Sg+wf6tLfIAsvGvCxke
 vu+2+142yDkoRA4cbkid3zrA9QhRz+z3ccrzDBf7/lC/j+0FgWWFUVqr9sPIPnxj
 aPFTruBp61q6y29mj1/qObXpWUMx1kYpEX9HFfcXVa2dj3cL4b/NtB8Bk78JopGX
 /w2wNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut8qdg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:10:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8d1a5661ff1so58451185a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774951831; x=1775556631;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=;
 b=VIygA6BOmfy5RWsJhfs5eZecRG34StIB4k12J3jVLsIMiHHTJ5XlMB24o4bZohJyMn
 m766Wx9u/l1SQbjKgTbo8/CU4f8CeZp9fCHQ0q4yTr+yoUZShckP1Hy9jFDAWhRak5Lr
 i2a66E7PLRH3AuE5J00A+JBHtrIfjxQFYyJQMgR9FGwEBozFD+s0XTDxlMxzwHTNyvw+
 +io/KQSzVm7qT2Qkp8dK8mCPyRDBpS2rVEOWAkmDzQ1e6RqOA8F9Fs15eR1iuOxOgdJW
 VavxAj9DLVPALiTyunMMSRlt/ErwekUQhqEmYgT1GtPJ8rEej+O7rGNazRK2ZqLAztWx
 c5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774951831; x=1775556631;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=;
 b=AwwVaqMe3zO0FCvs1aeobPBJOBCE3YNedNLuy5wfUFDrFAOR8ovU1fN5HE4n5EXUFO
 Io5FXA/EQ+Y2Pw3tY/InN5rQ9JDy8+RmWdtfnC83fvRO6V9a/DsS4NU3s4OrnumzoceH
 y4HeACdGhaQ6IOTPoRQGGHECzObc41P0VXE7VTMoEEcjqydL70fgSuDOBjibu5dMLZzT
 HL+VePAQozMMlnbdEtlzKiiOgJb66gNDFQV9zftAMGsyHomospf7D01wV46tcaMMqffk
 DMbgbQySla7aoQlWOMMMz5X/2OL8TO1tX3HwNB+3qFlLBTG3HxX9sSk7u3iOIQIiPo3N
 kA4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Sg+lo4RNGtsIrqFpBa16n4PFl2+TxAoXtcqze1GpZrCQaTRt4BV1tetjLb4Wg3rkfKx4Ur73Kcft2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx86tOZoVp8PVMOHIQ46vXGYYh6BGXCmPq/t0nbOSKZ19MCbm/B
 dBCq9OoiGAAXlybsNRzYETLWNWPRpNoCr2zIHNxSWQeCU+lDrdneC2hSlAicW8F2THP2XTgzpKk
 J9kAk12AwHhvrDwGcR/FGR5sX4PL/53Tw1zADh4OeDV1NxYLH3opmc/Fa2Pe8jWBFJXgHUR8EOl
 gBMWpPBpg=
X-Gm-Gg: ATEYQzw9QUMkKrdY1krjM39c/JVqZQ1K2YH5S7qu8HlIUCB4EiAmuFpdgtO/ItGhy1a
 x3cZQj9nTKzFfwLexC6LGoqnemrqJbua/Pwe4uA6fHnfiUD9jkQE/XhMBsNeff2PBrCo6lDvDPu
 iPQ71mQ9FW6+iQNv59Gag2yTExkH6Y+Oxo00i0Ss9jZRmdGC+kivmKz2R7tyD4YCZ2NaVIaq9h/
 BrVwHpnRygzjdyO0TyU/BUD64RD3Ca0HkcUq/UE5seA+O5j5srTELT82Yky0cpSHGLn8pLtK3DS
 WgI+pR3120v5CZBPzpL0bGwKut5LVIxXm5mJN5q/sty71BPJrSc/7bK6y6GSak+0Ml3vKSzdWyP
 O83j4SBWgU3W/iFvBBHP/exMk/TpmTfhw+QfudinIrvp134SbxhFkLR/4lkDaPh/X7LnikalIC6
 R40Mo=
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id
 af79cd13be357-8d01c82312cmr1476138685a.8.1774951831229; 
 Tue, 31 Mar 2026 03:10:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id
 af79cd13be357-8d01c82312cmr1476134685a.8.1774951830813; 
 Tue, 31 Mar 2026 03:10:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66b7276304fsm3447998a12.2.2026.03.31.03.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 03:10:29 -0700 (PDT)
Message-ID: <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -PKsyljTW8_VlJXSE8MzUG5Osn8JYbCr
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cb9d97 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fArkNfqvCtmK_1YDpdcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -PKsyljTW8_VlJXSE8MzUG5Osn8JYbCr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfXyjhNLhKzdHrf
 AjmZkzobNtysszzp9Jys+tF5rXRzWXQUL1mpJC1j6p2J5/lGftJFgaFo+AsXzcydHc2s2ASSf8X
 j6sh+X5SYrcfjH9zXg1kmVd1Wt/Xkyb5m71PSOtcvUHsyfRChVrfvJ8RErKFNLGKguN8l4aKy0g
 ffis9RUiThs3b9MYz1+9fMHBvx4IGz2oQIO+Kz7NKuopii2LfETABYz/D6S69HMurhlF79IBMYR
 hpbURWJt9kXUidMD8aCqICEtODsFDPU+Sd4n4VeVnkcTHpewLRw6OH6R8kkjqFonwivSFkGXMsT
 VbiuwSz4oOVSkbxJoogN9hqlgYdgkFzPsJhOQJZxEC9ppndGetmlnTftc+/3XAIUncmBR3GI9HX
 kTK4HUCQUjGfTLm+BCXH4U8PPenIYeyUac5RQPwN1UUKvdgaagd7g3fc4V3k4qW9ouq99oo6ANh
 UpmgiFKpQ0+0iIcUjPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310097
Subject: Re: [Linux-stm32] [PATCH 1/2] clk: qcom: Constify
	qcom_cc_driver_data
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.914];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: C3B00367A2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 11:33, Konrad Dybcio wrote:
>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>> and is not modified: neither by the driver defining it nor by common.c
>>> code using it.
>>>
>>> Make it const for code safety and code readability.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> --- a/drivers/clk/qcom/common.h
>>> +++ b/drivers/clk/qcom/common.h
>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>  	size_t num_icc_hws;
>>>  	unsigned int icc_first_node_id;
>>>  	bool use_rpm;
>>> -	struct qcom_cc_driver_data *driver_data;
>>> +	const struct qcom_cc_driver_data *driver_data;
>>
>> This can be a const ptr to const data, even
> 
> None of other elements in 'qcom_cc_desc' is const pointer, even though
> they also could. If doing this change, let's make it consistent - so
> shall all of them be const?

I thought about it, but then it turns out that videocc-sm8550.c has:

video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs

So we'd have to duplicate the entire struct

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
