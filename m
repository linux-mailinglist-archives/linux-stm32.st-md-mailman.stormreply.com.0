Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBh6Bg+gy2loJgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:21:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA30367D33
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:21:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74DF2C8F284;
	Tue, 31 Mar 2026 10:21:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BACAC8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:21:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62V912OW2761342
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 31 Mar 2026 10:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=; b=hHjyb4C1YI4pAYlc
 VA09wSsVJxi5ArZGeCM9LuzkO22pZKWz34F76O+KHECZSRvOMyO2o9o6lE5uQouW
 kPPR4YEoV5hxPC1bhRTuxyTIlhppgZd/NG9ttzimu7mlFOiLPqX4O8FhXFQgFvrc
 9PGpFxX//rUeDx/9BTjmS9fJ4DZprEgAIde7uZV42cF0p2HiC8mq0TpQsihWjJVU
 DjwAg8t+bLR0OgJErIC7lKyQJ4lXvfVpZRBGnYImdQ0D7G19y19zEPjO7XYar6yk
 P0w4SKmpge8g1mQvgoXGk/Q+x9gvtHhO2GNT++LoyM8xizwc6rUzHSmrMp83TBsY
 CFmt1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b930b7h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:21:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50b323c43fdso32923551cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774952459; x=1775557259;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:to:from:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=;
 b=L8JPBsDXvwC7sh06ibVEMN/VzrwlyiLhq1GbskS2xqucVYHCPAeN0F9xK/hOKSuZ00
 Xh83NdoqAkahj/6rhUaRjeq9UC/MkZQIrQNSMjxB7HSwG0PSWdTkX0Spy6rjpgAiXhs2
 RPgCkpwG8XgAH5+PBvG1LnT310h79jyJi0MzLEAm/jK6nrwHvOB1IbSYes1/aKXEmnIf
 4ckgPWi0u+F/rKHqyKAIY3JVH94K92h+HqgfoschsWSSXRaapplR/h/B7VVkBQhyfvQL
 Apu1Per/XOKoenDsT65Wvq9+nkzRDGJQEMmKGEtjb0bvt2mNzfkz/LKeLAqECzeUOLuz
 t9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774952459; x=1775557259;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=;
 b=ZMIBApXbapofIPgaYy4mkOCAWuXHq7xw5T5WIkt+W2Ql0WeK2+Y8sKjPqxRlGAmX2T
 LtdOo1o1rVFkZkFGmTYreH7ny9Wv5TKwSf8+xL9puNhFDZTZclUlucVz38vKV8GMHfc8
 UaMvVFMTQlFAZw4wp7WDmT1Yf0+/ILT/mNqwA+ro0qz1UI2f1ffYVSj+uyyafjNc5IX8
 66sVB+AyY/9Vg/AbfBZ+xhZNzy0U18nP+Drt+dbR44eSWW3N/5hrvviZoRmYc9n2oRfR
 J3mv3hqOCu0TIsSxosa4n/WbTtug+OOdO70d51La8E++15F/r/6AAt6kDbTBuESm+le+
 wg7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6FEaRKdKRM4unDFoTqaSgw2J1qzJNx6UfrWlXo89oZicfP/h5HOLANwqKUkEdz2bEfCUgMGoIgbefQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy0wyfjs7oAcpohn5IznlWOI2bg9gefwrroj9QWOxJsJ93DkyyC
 d65L4MO+dV8ewTePexdXuM65tZVGOXRBKz6NdpHGrNgN+HVbKHlhXHXSPZuzd8tx7WKghf3Mama
 p7tOTLPzfZaBgldTKE94xTebQWJns0iVFkxZkjK9ml/PXGYYn/6uvQL5SFdE/6BtcSwG6jAJkhz
 pAN9FJXtQ=
X-Gm-Gg: ATEYQzye1XIEnycDnKTdtwGK9F5048KzPVa2t+6shlErW4Hz+L7tml0dnVC09QXW2o0
 bOZ/XnJdPH1wB99tDYbvjb296fJdrih9blWo55ARNtprXS+QlIGKIFN4EnilKXfh6ThlT6HNaxV
 kO1Bw37puqgh7xyQ17Teav32H8Aznnsrg/Y6f9RX2ylIKTekrygy7yN2ZkyYR08jlLxJQgkbi+1
 nIimGKHdoL/CNy/w/SeOSuohWftmGJeRqK3kb6AMSemoHrWP6i5pjtnVIWlAMA/IFLLN7PcbBnA
 gqUb2L2u4jI/OiVGp45klqGC/JjVoYNwtjlOtD4Vs9PwaQtasSz+gJV4HRtEqbllohTNmkl83g0
 mrl7JDYnkYzgoMaH4pHxmN6ScSuBGo+NSvOaJzJBEnJXzNYz7
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id
 d75a77b69052e-50d28283268mr36255561cf.0.1774952459085; 
 Tue, 31 Mar 2026 03:20:59 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id
 d75a77b69052e-50d28283268mr36255321cf.0.1774952458674; 
 Tue, 31 Mar 2026 03:20:58 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887a648f3dsm25400765e9.0.2026.03.31.03.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 03:20:57 -0700 (PDT)
Message-ID: <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5OSBTYWx0ZWRfX+KloLsDYcciJ
 BiXUooV+dHmDI36txWi0Mxg5hCBo7MbZbShhOrWWxRzwrro4KQUuS0yMEbkz74LENG0Ko1v/xkB
 3xXfzLf0bRPwP4Ngkcj8kOTOIsOaMRB7W1S8JxCF87GQYdi1mUYAFCP1nV2SfgBJOw5OoT83/+K
 u9y/Ki1LQreg5Z70TtiL4Ml3g8eqb+UFvqXfHmY5nkxyIrMYe0AHZQwoJ9tIR8+LYlquIfBmt7t
 P8cFN1agPP1TRnrHDlPAEQGI5RlERMdZjIVXvkQ+va0RP3SUBmLpZSD9kVjAVps0H4FXWWAerWq
 Cy12kF6MICf9xs3ikOG8QhK31/2F1FWVV/tU5mVp5FhyVdpNgYUNO8s7pmXlogK3xR8qOEBYwuV
 RibWTqsfJ4uVkxhLjS9W3D+GN6XgV/k/XrhtLKkicUaP/L24jpvmEYw/iGWWgE1WY7yaj7lc0zW
 G9QUkOitRg1C0x2GmFQ==
X-Proofpoint-ORIG-GUID: fY_H2woQg1_WUlZUTuIpMKuRCrKIJOo4
X-Proofpoint-GUID: fY_H2woQg1_WUlZUTuIpMKuRCrKIJOo4
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cba00c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y-Wd9Zd1aYVehlAUloYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310099
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
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.914];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid,stormreply.com:email,stormreply.com:url,qualcomm.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: AFA30367D33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 12:13, Krzysztof Kozlowski wrote:
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
> 

So to clarify what the code is doing now: I constified the pointed data.
Not the pointer. If you ask me to constify the pointer itself, it's
fine, it will compile/work as well, but do you want it?

It allows only definition with initialization, no further changes later.
All existing drivers would be fine with it, so just confirm that's your
preferred expression.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
