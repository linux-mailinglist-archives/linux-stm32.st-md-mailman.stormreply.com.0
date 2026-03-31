Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLCDDECiy2lcJwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:30:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B362C367FC9
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:30:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A782C8F287;
	Tue, 31 Mar 2026 10:30:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E900AC58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:30:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62V9DncG843021
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 31 Mar 2026 10:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=; b=TQE/cA33jnncrQR7
 9aueJB+7igAtKck0CD+hZbqvEQG07r8biZ1TWTl3u9vId9WGvZWEo0v+sgqnh3Yw
 v92NcOd3co23QDQ9jg9HEFC5EmKiH6wr9xDaMhxdPxODZry74YKbwBTy5/9P8sso
 annNJe4JblQMFfEJgWLZbVUCHc3FIatSfiCnn280jaAsoMfqwrvObLz4B6j9QxKi
 40ewi9Ib6IJHm/ky0V/idNB3tGxGYiqd9BLwF5xLH0jzW5tvxhNptxGavBgt6ZBx
 xgnWsfunLj3EhEJ79okI4Plrp/tuHuemCZD1vzO7QeG9DAsAo8nLREn4y2Pzl2CV
 8CKgOQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt9jeu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:30:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89cbcb48003so24431926d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 03:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774953019; x=1775557819;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=;
 b=bicQRx9fHcIwsLmdtlyzYJ4pVYHNdaLq0FKclSjxkr5+U5y/qYdjnWNdCco8EGOJYb
 m+R91wE4zT/v6CU5dUcM6sf9pXlKAhb8kWxp3Oh3AdWcOjhRXJpL5N8wO586pJqRTIFx
 BfsyZsvrdoyU/qLUqWCpLUV6HOacsO0PUiMc6l1spzMxHtX37Kv6x2bRzrjS5QsJ6b83
 fdbCALP0MToY6WEjbte8Hp/UOmxHrNT+7yPK6NW0cfBKMNmv6epjAcdpRVOXfKec3/uo
 /RIiLHhimf3aGU6yPqzgg3+7/uASZ12gRn8ypM8xXf0T3/1O4CXgnQ1HPCFg+LpRiLYl
 SCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774953019; x=1775557819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=;
 b=arez5YN1rJZ26Unl7x+zMhZQFe10gcgw5mzGsY3iH8DqBdvADgZ6EZVmO5OJDwILgj
 j3rt28RI4fOklS/Nfsg82uUSlczezpE5mJrImvQ4l5K82M6sfpsPyY8B4N8VA44Q2RoN
 4HId9TdTiYxekTKWwqLUabhJDQ2/YjtQIgfP97X91I7qkYCy3khGCWkCx4p+okWLGDlb
 nYFt4MuvLc0EbJ6mrFqDPfV+4UHyzjXUB2vj70qQu4otPImaRlmp1yiIopV2oUqC7WSu
 cbEDGIkOimvi1GeZgO4/5B2gtOS+A1laGKumrKgsoZR3GNbsNdxFhRVYC8wUNRXj/Mec
 KpSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmTeEYUfRl9an52Enl2psuT8sQMHTG7SmD6BdK1Wac5tUYJjgbi3CyCZe7Lq8XWP8LJ0MO8OLcy68WPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxQWbJhIFGk0cIVN+c9DTC6p2xG873Vv+DTaeBYx5Bu3X8UAkqV
 l48eiPHT/7k5eOxdPkoBxQYpZWvn9kmB0jpev6L1oFDIoX8eCwrn1BY80+AbT+1ng2lHXK5pv62
 dPq98GR9pqS0UxlmOrsddJZdkmp9kKibmO+YsDSYP91XjD/AFKPmtOsThUsQvsINOjtO//UrpuZ
 pa+Y448NM=
X-Gm-Gg: ATEYQzyr+P9gXIRUgpYaxBhCpG4jFUSDSPkZ7JNm+q94ciC++0uNcRnGn3+FQRs0Kwv
 ClmwY3eaB2ydxu9yp3r45YXBvX9ILhSUReJj/Ys1sFkZercPeg6d03hpTv1TDH2n+m5fxlfDyit
 hujGMfJWalRNqNGrR1sMKBjX/x9urdEk96pqqRTW2fyyN6ZVpaHEQdCRmErDTUJoHeY2Q30CEcP
 /iCKMuiIRJkhq7/gPOcq9bsz23WI68NrwGK7Edfa9EbgB8tF9rRn+Auz/0dOTOCqqsEiTBdd/GV
 Mj4jOKmm3CMXOkMv4I9e+rX+xcq+mvPZ39FtxnqxEPzMwzc/ecSvzwtir6piEuNPah852TLf50H
 WizGv8/pgevJ+6Dp1NVu3UIDTUAAQWRLfYS2OOegeoRBuoRODDNS8uNDqfuUi8qvinJAOACTGby
 Yi3lw=
X-Received: by 2002:a05:6214:2466:b0:89c:e075:9558 with SMTP id
 6a1803df08f44-89ce8df76b9mr173233886d6.3.1774953019015; 
 Tue, 31 Mar 2026 03:30:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2466:b0:89c:e075:9558 with SMTP id
 6a1803df08f44-89ce8df76b9mr173233366d6.3.1774953018470; 
 Tue, 31 Mar 2026 03:30:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b7ae24d6bsm382655966b.6.2026.03.31.03.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 03:30:17 -0700 (PDT)
Message-ID: <da6bd52e-3bd6-4938-81b5-8bfcc6874e22@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:30:15 +0200
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
 <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
X-Proofpoint-GUID: NWCUR2rNzSQ4iYSY2UujCcMIP9ZnaHAf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMSBTYWx0ZWRfX7QsK2trWtFrE
 QU0oNXpiolNPO2hCVJObk4pG4bFnUhF62eFgM6ZMLVjbEaH1ytEu9SH3lilGJ7ue2fddMAZSWh1
 w5QLpCbb2DVPrxgn5c3m/8rRHaDRkNLbtVeISjf9oGtLRMVozcB8LaFUM28PiQbuBLp4KqIqW22
 xlTPPSWevQWcW5lxd7puQiiFHD8darz0Z6g0mqV4Kz2AOGCS7qqLM5shFuLxhshPLGTzYn6iRaI
 8Eko5VFs4GPEevyEdyS+JELfuCOm1pYe4vGSt+rJFMCZ6CE+vv5YX93SU+5M5ybKDT/da+JNxox
 gCDkBk7Qp1daLnP/lqVN4zS4ObsBwVyFTqQ1+p7m1P6Jz85SekCxTouluaypRU1BL/kUgT7FRgt
 VfH2lT815OcNeDzgrB4ZRUN0imCdEbb5lMH/xuOKyiIlfCxCOVMyjLcf2iqlKQlofUGNip/TO3+
 o14vPFb5YR6JvyhqASg==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cba23c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8ULpatOiM0j0TomVWBwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: NWCUR2rNzSQ4iYSY2UujCcMIP9ZnaHAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310101
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
	NEURAL_HAM(-0.00)[-0.906];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B362C367FC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:20 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:13, Krzysztof Kozlowski wrote:
>> On 31/03/2026 12:10, Konrad Dybcio wrote:
>>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>>> code using it.
>>>>>>
>>>>>> Make it const for code safety and code readability.
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> --- a/drivers/clk/qcom/common.h
>>>>>> +++ b/drivers/clk/qcom/common.h
>>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>>  	size_t num_icc_hws;
>>>>>>  	unsigned int icc_first_node_id;
>>>>>>  	bool use_rpm;
>>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>>
>>>>> This can be a const ptr to const data, even
>>>>
>>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>>> they also could. If doing this change, let's make it consistent - so
>>>> shall all of them be const?
>>>
>>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>>
>>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>>
>>> So we'd have to duplicate the entire struct
>>
>> No, that's not a problem. Pointer is not modified and we speak here
>> about const pointer.
>>
> 
> So to clarify what the code is doing now: I constified the pointed data.
> Not the pointer. If you ask me to constify the pointer itself, it's
> fine, it will compile/work as well, but do you want it?
> 
> It allows only definition with initialization, no further changes later.
> All existing drivers would be fine with it, so just confirm that's your
> preferred expression.

I'm actually a little on the verge. Maybe let's keep the current
iteration of this patch after all, as it'd be a mess to undo if it turned
out to be useful

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
