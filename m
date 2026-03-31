Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK5KO1Wdy2loJgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:09:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19B3679DE
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:09:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E03C8F287;
	Tue, 31 Mar 2026 10:09:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCC7BC87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:09:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62V5iRUQ1841169
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 31 Mar 2026 10:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=; b=DLT4vlyhYAUOZ7Oe
 ugaXYJ9zmCj03KcfX7/2wB3sUs4Gy/Bq+v/4mxY5oEfrW8UFIlpk6wiSifoOQdPg
 ErcX6GzG95TLk+GAIP3SblP5OVlFBHOsl/RIaOYSZJusDVXmnO3Tch4cRLUu/r2f
 vn5zGEQcpS+Z3tk9Ky+ZAXmXCDKne1DPXHPMSOF+sdoBXv0KsIanHrGQAcCemGnl
 OugGjqxCjENqZ6Myhx2Yi7wT+4OPSviFrYHIBcBEGPJcdBVVz2opaAdUahbIoBVq
 bPxsaWHTxa3+AD5qzm9AbqkWQVwXjR2hekXfdznuoyx9TSjPRrikwkiNb/4jPuwe
 Le3tLQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsjj2n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:09:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50b4b81c632so177568431cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774951762; x=1775556562;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=;
 b=Ah4kEttppTAw2qI21hDfoo4ISBHPxjRs/kNuWf5BNmmux9FnnUji5n1ht74crPpwu0
 125ymbg9s2IrY6DDI5WREo8K6lt3cj+lOBaM+NPKdaJeft32RyOjgFLM2GZcUFE+JqW+
 eLGdoE38E6e6EaHqUTuJwf1RKunhq3RC+YFZ0zUWevilsPrdDxsH4GAy0zOtWz7SZ+X7
 L13mbzAdkx2IjwwqjR4TXieCk3iawvDW63Tso1/6H4DlewMbrjQG0ulu7rrPt2iPluAQ
 hGC5KLoqQw1qLMGuq8ZmTA51A5AcMzsFi79SP0NjLEh7zDOYlZPUAqJVw3JzYBmt5EfJ
 ZV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774951762; x=1775556562;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=;
 b=AgpiyReYGyr+xNA9nI2wPnNVtRhoMnr38RHDNWTWLePpvytGqBiAe4l4etDWH/h96W
 3OIVRieUZp9RFogXQYgm3UZ8ZX4AorM4tH6/vjlxtlF8gMHSiCpWOTRXPsA8q4v6ehBw
 lRY9HF4zIGi3ZLiK/Ea2DFvQdyv4Traq/VYRXr37gU/XV+2+XWIHAcTrXdoM0NpaDAfB
 0ofg6ruDUqrrf/mPwS/0tq2c7U/5rWVVh/gFRhYoHsCnc5DbH1PS9DNWYmk5D8pbc2VX
 swnCP4gOF5ApGDTNZaeaWcsoO5FOpd35HKBziaXUxLN2Dky4YPCNTzsFXfypH2E80cB2
 pHkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWii65JaETKPW/RC8CK3K6p10e3KtLuzLxzaIxjpAeQLy1xV687aATTSmqh1tmzIjFEIi0D/QK6eMGkKg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx3AJ18JYqHoJh98DmGvv3CCmRpT6JjHX3aHUkgLuHVHAoFyqUU
 e7oM9W7kCQoQL5U9FPuGXIlrK8ogZA57dGKNkKWok9ARui4bvz1dS/5LfHTj/ilQg14DrpH2cg4
 Kuloo0prGaf+wP1RwLC/Hv4Zmp5+puTrc2g6ElLiRLea2kRw7oOut2LiEZ6ctDDGGRcDQH6/TcI
 Rv7csuqco=
X-Gm-Gg: ATEYQzwvUi4VFIRUk2wAmBSJqDoTnZ/QSvxHgKEJhWPnhrfe6oMio/zgB0WtTtY4Jfr
 irkwtT0qpjYuF3pqTR9KOd5UrVbpzJaI6RD42NErl4FptnVNsisgh6OG4r5YnPj9AOsbnjAs9fG
 JqCPnFUvMQxrp31eJkkuH7nw3Tsee7zHiAyBvHCv6KiU3rCxhqq2WW6uetdQSoVoPsL7w5TJvwn
 fZaJlLqXg48BhT9bJD9AnyBYyVyWhhGbUkEDKfWRc8umbK2u7D/AJG/AbAf8uvZfW1itgBwkvH/
 uSw3yHh+Lri4SwtpPOcVeyKZz1iJe5vnX7zUhcb74oQzrehQef07iEcWQDntwuwR1aEDcrOU4K5
 B+SfKz3M9LGwemgQZlWjl7nSodwQbWrZrAuWHTB8UzGExPh4j
X-Received: by 2002:a05:622a:154:b0:506:2041:13d6 with SMTP id
 d75a77b69052e-50ba39655d1mr207868561cf.50.1774951761816; 
 Tue, 31 Mar 2026 03:09:21 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:506:2041:13d6 with SMTP id
 d75a77b69052e-50ba39655d1mr207868281cf.50.1774951761447; 
 Tue, 31 Mar 2026 03:09:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e72da6csm49983705e9.0.2026.03.31.03.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 03:09:20 -0700 (PDT)
Message-ID: <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
X-Proofpoint-GUID: OBCcuQT8WFiEDBXPy1WWC6k5QYFGETzo
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb9d52 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=oW2FW_nDJJYFMtiP85gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OBCcuQT8WFiEDBXPy1WWC6k5QYFGETzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfX2sEGarWZ8qDC
 hYcDTARMkem2ZvB5IGQ8ejYZCMkqGwW6uWAZfjVC9jhg2kTkBZfpAENm9ceQwizO8GE44z1qdzS
 02eARV/+wAJniI2EUrH/7QFDJaJoGo95JUEW8FPjnxbbFdgCVJJ/ACgz2HLPx9I+81+ANgpdyzN
 VWN6p9+HRIsO8IKuvkC3rKAOgZ/WbRx0TktU90ssHkAKI8BxItVq5EoHhIp6Ae8wG6ONR9U9mZT
 ts11l73nwsomzVA6oMW3VEFFtPVaUHeKJ9EWHZNSMAHltwUJ3sfW5WLD2an1ZsbTSvrdHhPrMSQ
 +RWNahbDXvrbkvoJ291rrp4YinXMy6nuIPxBXHjbliPLYeciTpV8UDJkrCX33jYN4ievcyTl94A
 cIpkYawBvuFQxh3Owtf842JNEvp40Yz9U+vO4FhptZhm8CITj8G5jNAk/vda5Kyh5WSERV7Dqn+
 Fl3FVVHtNNcFU20VMMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.912];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8D19B3679DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 11:33, Konrad Dybcio wrote:
> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>> and is not modified: neither by the driver defining it nor by common.c
>> code using it.
>>
>> Make it const for code safety and code readability.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> --- a/drivers/clk/qcom/common.h
>> +++ b/drivers/clk/qcom/common.h
>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>  	size_t num_icc_hws;
>>  	unsigned int icc_first_node_id;
>>  	bool use_rpm;
>> -	struct qcom_cc_driver_data *driver_data;
>> +	const struct qcom_cc_driver_data *driver_data;
> 
> This can be a const ptr to const data, even

None of other elements in 'qcom_cc_desc' is const pointer, even though
they also could. If doing this change, let's make it consistent - so
shall all of them be const?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
