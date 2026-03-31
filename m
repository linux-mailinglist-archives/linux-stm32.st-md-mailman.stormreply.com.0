Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD2cMSefy2loJgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:17:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D084367C02
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:17:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29A64C8F283;
	Tue, 31 Mar 2026 10:17:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9795CC87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:17:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62V9Bfu54053891
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 31 Mar 2026 10:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=; b=loXJfLsleyyK2lYk
 uUqEUWFp00l/vt2tn+U3wXTNfpw2JRYo4gzMgTuy6J0/uG8k+4PKq8OHAvufrzaJ
 6y4BNNrQ6nmC3zp0zQXKTurNGkkcaM/r6N/Qkhed2fa1vlRN+Geqt5d6Q9YnUCyz
 G0yn1c50zJoKaXna701oSwDAnh7NOB+GySLqiO1brg+Gi2EdLRVYl+ZigbF8qRjr
 cR61pM7/rrvBRksOMRhy0QPPlxIsJBFzSI7SNSDlfQwezPlVuf+dg9BovZhsZxwD
 60pDLZEkbp77A0gHRfkVlvAYKW6ZDkLB/3Yhke1+QkAfcEDe0M45BZrQSRkTYXmt
 N/He/w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3b22t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:17:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89ccb129547so19242326d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774952227; x=1775557027;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=;
 b=Wd6U3l1pO7Fs0LIXc5I1xxoyNmf2Y3mofkisEF8e8EP2T/2yOrOR7rMivAcDlz/+d2
 Q9C6ASNPsHMuPaDZ7DVRika4bN2g6vGinJPbRe3ATjrq8GotEEVvAGxOuOHFXFmjbz+T
 GgtjC5MWFJcVXSd1c3ASgg/b++TVLcEpbp+79a13T5j1nGoLI/WOduxq1mGvZiLtcAHg
 jwkKKwFXqi0Xxbn+MHqg3qsVpH9ljybonC8iRWbYU09bs4OdEtees7hZ5qwDn8MzBRcm
 kDYRQCGRSqAhTyqnqmK+Y4lp+6S0yvNwzyRPNLOQwr50QwRtdxwX3P9MFNAcH3NeXY3q
 PWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774952227; x=1775557027;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=;
 b=CDU+i1L0W9CvvugoCHDDj6yRgYGdnI7ygiUawXRHaiMGhs+CZyujuFlFyhrhjIPKrk
 qb66kJkhgZxTLgmeK28jLObay+VywYUEa73KrmElXueIHX9gWOJaX1dD/Hs3vIm8zaMz
 Cpk8GOLxt8btFzrjCvMs4WDaTcXZNFYmPkzjxmwxVE1a4ZmobvS/C+SqOQhjOrn9FD9U
 NFEOXlZ62BOvW2VTDoii1LXHJdEBV7QcnrvAtgqIiHnsN+DeeFLmU8A22c/51uC6OkZf
 29cYto/ip3g7mMpwYz/aUIEWFnNuN79AEVFAX2tNftKQHHaTxvx30wh5ZRVPj1t/PcmD
 2Y6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/AKmbHrE15ALbwAYwmc+XDVFrCkLiio4i2/ZsnJyxe5Vd//938AOgGNH2QY1UegTdqDZwjgYal55p1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5JxQvDScj1yS4H2GyosADM6faQZK6qQ9Evy8BGQPxXb0vyMFT
 8ARwRClZYsT1tptoOce6N0ZUSpP0qmsKVvviOjRw66S+z/plwH07ua3vyFdvE9GPeIvFdzcxEgo
 9jxP95iZyrZZBwNhSh7kvA+QUSJ9kEvw1+Uz4FT7T9K4elxro021ou6AzvufV//lM0Bad6DSuBX
 Vzsh4TbFM=
X-Gm-Gg: ATEYQzydQih0PcF8lQuALgzw4cPZd2eM9wVkt/3U39WtTwlLPFoabzXYTz5zdltAGAJ
 DXUp+IRwH3/cL/n1ucJMPa5Er2ml4o4Njcz+XqZYcNxjs52MoBuAt15ww3OUAAXWxwkrfC0qyPv
 75E0bV52etYIO5pgCW0aj00un8jFyV2y/B20AF+jZmuPY4Bi+5RSnYJW+RngukxPpS4s797MCrt
 h+Fbj15QEUz4YQxgZbYL/AKdxpEZAPuV9LCKbn1LCh2uaUeBtyb54AW4Q3V4qtWggTzAxfd6az7
 6t+32pJjB0YzZBBqm87l/vqmVUXgvzh5qUkQtBgPZZLpn1Z4xXwatd7S7Do2oLXmqyWCCVR8evu
 3TRTv9TzTDFZr7I7+siSKvNZ5l3G6t07JumwoAiJRgVvDWYmBGLKSvx4RhT6IDsNqwi6nx0pXzy
 A1Tsg=
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id
 6a1803df08f44-89ce8f96a82mr171653046d6.5.1774952226916; 
 Tue, 31 Mar 2026 03:17:06 -0700 (PDT)
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id
 6a1803df08f44-89ce8f96a82mr171652776d6.5.1774952226451; 
 Tue, 31 Mar 2026 03:17:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b7b1a6744sm377853566b.30.2026.03.31.03.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 03:17:05 -0700 (PDT)
Message-ID: <3e3428e2-b07e-4d65-9cb4-afad1a943bb5@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:17:03 +0200
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
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
 <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb9f23 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y-Wd9Zd1aYVehlAUloYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: lc3S0v4iV6qlc1eIXtUStz1Mz1VHB1wx
X-Proofpoint-GUID: lc3S0v4iV6qlc1eIXtUStz1Mz1VHB1wx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5OCBTYWx0ZWRfXztQrzEDdQbbp
 znpE71HfCSq0RdxB8ogiW2VlIcTG7HvOJXmwu7Q4lSGmvoFtBAwcXUhMsckIsC+lZVNmk3UOBeX
 wp8bTP8HjoolQAvkA9tzOlf7ZUebkS3BnFbSDX5U+gdfQkjP0ZrV0Hzql07AhDQ2w4I0H7PA+LB
 YW/rFw3G5s+IxROnwMkZk+F1hFuqJTT7TGmavPCmJdGvLgcU91Ni4nv3to4+/GGEzuFT+nvuvTf
 yvcq8U7AD13xT3EXmRAn2ioq5q0NSXM04gr7o9JGFVkxVTMqY8dLlvaGA1/BuvbMwFGF2vwBbgj
 tR6/1WAE5F80q6QqRSAhbwjn1ZoXwR2NpokLX5iRFibNSsdFYmqDzP2/hxIuCler/R0JRt1FRYX
 3Umjqaqr1CEl0YnJ4YESSFYTkwzZzuFiqEjvtBtds5UzB+vaPBj1KPCaAmCFEl2xPZhHHl/f2Wh
 goNVTNFeKG61tX3tn6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310098
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.908];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6D084367C02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:13 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:10, Konrad Dybcio wrote:
>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>> code using it.
>>>>>
>>>>> Make it const for code safety and code readability.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> --- a/drivers/clk/qcom/common.h
>>>>> +++ b/drivers/clk/qcom/common.h
>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>  	size_t num_icc_hws;
>>>>>  	unsigned int icc_first_node_id;
>>>>>  	bool use_rpm;
>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>
>>>> This can be a const ptr to const data, even
>>>
>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>> they also could. If doing this change, let's make it consistent - so
>>> shall all of them be const?
>>
>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>
>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>
>> So we'd have to duplicate the entire struct
> 
> No, that's not a problem. Pointer is not modified and we speak here
> about const pointer.

Right, I already had constifying the various struct members in mind

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
