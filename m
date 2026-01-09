Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE9D09164
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 12:55:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE2DBC8F286;
	Fri,  9 Jan 2026 11:55:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6853C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 11:55:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6099Xgmp1048208
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 9 Jan 2026 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=; b=pgOMANCprkJwasRk
 eEd4MYHFC4D/oEu/AVhwCa1dujnPr5drXX2/kVVpOf62KZf213Gin9ckOPTP/50F
 OzNZIjM82mv8Jp4GHuzFDMlQtkVxcl+j17ouuouKvIST5Jat2kCq2LTZnn1/DUY+
 BE8o3ED2NOm2GuSSMVzIG7r2mZ652l814XxNwP04dkYNKQpJmGcQMBiN7xjkMlkw
 6gNhS3nMG1bojXL8zDJVIrGNFfaghK/891hcFHXq81ciAPNdle/PRrSybzTcawDp
 t7f6cOII/7gsKMn8CeOTF1vPvUurMvinVoDXt4ekafGLIUTJf7ZUPy8coM6TrKIc
 82E4tA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b8cnn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jan 2026 11:55:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c277fe676eso1244123585a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jan 2026 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767959753; x=1768564553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=;
 b=a25K4GMRd2Y+vVfsnkQVbYa+xwZ5Vmf3why1aWloSfuj/VJLM0CxIqFcbokt0vqKti
 eGXR7tDfVMURfo93r3YgfTHOzkEcm1TVtboHBPceY4rAM4l+rdPdaEBswYBtdybsnMzI
 FHpd79NVsRP5YnLWFr0/8nbRdHXGcOTqRcSC7G3VsPL9bN/l2wicP8SG22GTnodm7VFX
 a08/zQXrWuVY1NTaqSVKPXJzOPZ8he1r53IpDqNXsaGmsC8F5CHaqpjzPjdQxd+tgen/
 FyHfj4emfcumb3XA6bNtHWJfqygQAtr4lavNPkvxEY+ef0PTVmq191JLCthspYwIUbHs
 W0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767959753; x=1768564553;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=;
 b=H6IEpObjFZdoLj6fA2H72j4y9VTnUD6g8XHULOndjkHbqK7U6BaQ2KTlS0W085JTk0
 RvV6aRnLmdjkn9g15rJ5A5zhPO+FUV+QOfaKDAG5HMssUQGDXTgA7S6GzJI5pzMzWWpJ
 UfyynYx18BjvABEdd0YR7/u4oOJDKD1+pZ7iJQNBDURVSbDEqM+c2tLHdOrgG/RYvmcs
 PAleyUZ8pmu25W+UH47eAKbuN250X1IfAssPJWz2wACDwGJoxNv0afxe+MGmZE/WjlCw
 qJ6+pdubNJ3TJbSVEO0ErFVLn+9hFKz0++6ltMg+Vp4NQ4+vg9NeF4/9YCD3jhLYEJNu
 Irtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVMwQ0W3Z6b1IEvtz/iLkRbuQvFLj2+xZZsK48lKq38Y0F2c7LrGw+GnzdeuAFgYE6ivmRaAeYw3REHQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbOU8SKhwBaYVq2PW4LWR3g57vYAJ3rPogZm3o1HDmLaS798jv
 /6upeNlkBKZ230Q40w1oz+almI5sgllAmp7nt4HmZ4rL/GL/vss13YWmPscvqjsor6IZmYjGdID
 Z8vSUvlOj5nC28Oyxbb6AWZofOct37nLS49A60tcVAWEJojQSmh6j7pDSZjZLSKF3IgagXUrBEV
 vC8Zf/o4I=
X-Gm-Gg: AY/fxX4SLEF7q8ld53lEcfMdZk40JqjLcfyuqFRLPNzCec3E8pyaLpT5bB8KLcht/AC
 6UPQP1xsbrvyU1NQSmJVsWjZDwpCAlaaV4KGnDrG1e/K7W5ICkWHffBWdQys+c79KhtTR245kaH
 ncXQ+mWdfKu3R9hWN8ujygwCyZyW3wf9ndqJk7xbg2YLjZvQG1pwgV/obBwyGDwB9qOLRc/ADwo
 5SV50LbUTtYspfZCQ1Q3Bdfl7nkhgukzMqT3kbLAKtTLZFCYZRbL2/xDgHHD8s6Box3ICjXlba7
 OiBniKrxHqMWqP8iBmVO+e+eBr2tZRXAm+juFUeI+ghF58JwHo7W2zqK8M0zFLjbb0kkLqylVA8
 Bq5IptaoHpmnuxoKwBJDRv9Y3ZOvac1ATTBFadw==
X-Received: by 2002:a05:620a:2686:b0:8b2:f269:f897 with SMTP id
 af79cd13be357-8c389409ddcmr1207345485a.41.1767959752714; 
 Fri, 09 Jan 2026 03:55:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+067aZV0hc94pvEUtBhDJm9uD0GOXh7JwLSZyYZ8jclFPY800/XQwNVtwW9PmsF3O1oGaOw==
X-Received: by 2002:a05:620a:2686:b0:8b2:f269:f897 with SMTP id
 af79cd13be357-8c389409ddcmr1207342385a.41.1767959752208; 
 Fri, 09 Jan 2026 03:55:52 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d1c6csm1074238366b.39.2026.01.09.03.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 03:55:51 -0800 (PST)
Message-ID: <ccebe9a6-34e7-4699-a4ff-1ee925f9c150@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
X-Proofpoint-ORIG-GUID: mfFYr0Y34dEkjX4oXzb4KM5Dje0nHsv7
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=6960ecc9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=8b9GpE9nAAAA:8
 a=81cV5ACUyFlniFfumqcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4OCBTYWx0ZWRfX3ODcwqqZTfWc
 gWF4j0dlZPdkfIZhikg3vtSQiult6CzSXXVR5DnDie6Ilf1gPtxNLWiWF4cklRPh8uN1SRgf8cl
 KhRVW2PfctHWn6LZpLdaav+3KqedbOGuGvuBL0rVDPsr/wLEcjBsiF5DMRvOEtTHtwNHbKUAjuP
 G84RuepMOKljVr3kX/5I9NQCSiE3BWk6Kzq2nmflx0eNEollh8+bAGVeFSovVGT43ec2h5/HGt8
 v04uX9PHflfMwB3Ff9r4kJbUML5c2re3UXDl1jSWzwYJ4szoLlWaSAeqSBQ9PBHyxa5BoZWDI8I
 z0wr5NgVCfhKH75/eThlxOZUU+BiDi17ePvQbraFJnR0KRGeplTj9PrVTb/smCOZrlbObqHn4bk
 CLYzmlPzl3GrNNuuCQEAEcHH9jJgDwf7lEfa0J6jo4yeCS6e4TFzCpyHPbE0ieu5XQFmOwQ09X8
 WFs9wqSTFOWR+EkqA5A==
X-Proofpoint-GUID: mfFYr0Y34dEkjX4oXzb4KM5Dje0nHsv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090088
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] bus: stm32_firewall: Use scoped
 allocation to simplify cleanup
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

On 09/01/2026 11:37, Gatien CHEVALLIER wrote:
> On 1/5/26 15:37, Krzysztof Kozlowski wrote:
>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>> make the code a bit simpler.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>   drivers/bus/stm32_firewall.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>> index fae881cea9a0..92414a4c7bb1 100644
>> --- a/drivers/bus/stm32_firewall.c
>> +++ b/drivers/bus/stm32_firewall.c
>> @@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>>   
>>   int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>>   {
>> -	struct stm32_firewall *firewalls;
>>   	struct device *parent;
>>   	unsigned int i;
>>   	int len;
>> @@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>>   		if (len <= 0)
>>   			return -EINVAL;
>>   
>> -		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>> +		struct stm32_firewall *firewalls __free(kfree) =
>> +			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
> 
> Hello,
> 
> I'd prefer to keep declarations separated.

Separated how? This is the coding style of cleanup (which is quite
explicit around other styles)? Or you meant one line without wrapping?

> 
> Otherwise:
> 
> Tested-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 



Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
