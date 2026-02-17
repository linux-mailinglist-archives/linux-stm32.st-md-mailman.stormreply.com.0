Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJWcGE5elGnODAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 13:25:50 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F7914BE87
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 13:25:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57C24C5A4C5;
	Tue, 17 Feb 2026 12:25:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45FA6C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 12:25:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H9WcJu985284
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 12:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ne+Xdf/klpNlR1z4hftn1Ok1OX4m0aO3qAGj4Do7clQ=; b=k+0lz/dfjjsnmxNR
 aBDAvatxGHy7hAkDALDL3Ze4mJVJRNLq7ORjuf98K8+FsUOfD+00XEZ1iUh6Fl0A
 6VZRDEPrloUufWBkezXWbrEr4AkFjh9IzTVPaVmZt/ANTzI2ua2FpM5+LrWOA8eC
 w0U2CK9wkss0yayqga8jjAZTt9IJ9kbkVI3uAoYPrNv1dYdM2wsxHx9rJXU3gRic
 PsmJgU26+RnQvSSpevsVO/An2XBuAxw+Uy1U6T0u8ysz+mDMPWF3HZtqzAnlQ+Z8
 ulYXSpcAN6t3DNtXbJjEneJdbyZ4LlKm1OQKWIg5tD/bsZQroTToIT6xwXg/craP
 up/3lQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap26sn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 12:25:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb4d191ef1so356318385a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771331145; x=1771935945;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ne+Xdf/klpNlR1z4hftn1Ok1OX4m0aO3qAGj4Do7clQ=;
 b=c6u/Jrv8ThHEoMVod7XotCF3reEpezBhxFAKcY+Wib+GpikTVgILWOCrDHwYtHnZY7
 GYKHQMUUjxjF7s1mHUl/hmkLfW44QI1HZgomaz1oni9Utr6EEEgwO6Zb23zdnPzDDtL+
 F97JvR55FWTaq0I3nrttbpIfzLylUm2Jg/HP1V/Bdk0VzNtVSp02i+zrnF44KJ84/Ney
 rtXQRYdKZmgnuSGp1LUYrgMFKMqYunFXMAefT17lS+14jEg07rJJy3py342M1UJVJn+k
 VVM//xfmcNEf4ySOYKIlNUQfOK682opY17AQQiwlT1iBdZwm9yEaPRgzBXi55f1jWVK1
 +scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771331145; x=1771935945;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ne+Xdf/klpNlR1z4hftn1Ok1OX4m0aO3qAGj4Do7clQ=;
 b=Y8gCNjFmptvjRIyRxvWsQ6SnPa2tl8EmPdXxiNY40+peWHgmQNLLCYJmTPsmW0ow6w
 w8YGhl12AFtxvyQQB02Yx2jvpp9Y80kI3euI/JyREOCwyGZcbp65VfNQJ3GxwXetPcZS
 3bbCeLQud4+kWrYsQWPZGxB3ym9uHbhX8DiZNVnp9u5NHMn9Llk6VESrph/hSR5I9wHJ
 0vcVbDXchyYzEC3k5s3LmQ7q294pSwOsaTh/vnQAhuPSzARfWAL9Xmz5PgJ7Sao44VW5
 k16r3olRwLag7yvHt3WNCgRczxE38T+sYUu/AXBsnH/eU/CPkO9VVaX7pdLyUWlnTxYw
 D9ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9fpdG9SHPesUB6vpAjlg9XMjMmsC6OmIiXJiNTZMnJipRjBtA+oIen/VYt4WNpoYi5nyWwGgijfskRA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw4/xjl4/igfcIWKDgj7qrqOi6exAcwxuuCR7X57Gz2c4wjVjkA
 LDiczfFr/mvN85W13FiLfvbJy68wD//S1CFcv9mF5JO3WXXvnMN4K5h6W6cgjDBp0ihwfTZnU3L
 moLk/JDOHUqhN0QppwbtVKoCkhlsofAuPyTRN/7YCII15j+MU6yCtPLz2/6g0GjFyihnv6cPha/
 oFfl1chKI=
X-Gm-Gg: AZuq6aKPbZynQPDYiX0+Qunxx7Kly/3kyXx5XSDRkVc/2Attvak9ixv+TWPNxq3grgA
 4J88HY+40RUEXWjDewRM2HzjsJvcTRxQrVcmxZSTLVAfITahXV63mNCbNCUO46fYHHlUNkXRLAk
 hE2Zs40Thvk+YwZEe9ug8lBe8O1AAOTv2a5gswtFEziT7cbZuY/lALZU8DL21nAITV90AISDo5D
 WwcIEFl3y+7UmpvboiHBVqJaf5MyV8Oo+SmaG/pPd1uQWimPMm8qY3PwapUsNv+LMoRo3PmJOb0
 PEO/DrYAypVb9adAuJ/7YtSkOrRN9pqgeoQBcMFIM04TEqXrMbrN6VU3idIjWZdvnvYCowfREyl
 wj3rnSKWRyfS9nb4mNz0BtQIfqkVvPCbl55qbtvUBnVHPUzFhfA==
X-Received: by 2002:a05:620a:4709:b0:8c6:d309:f9c0 with SMTP id
 af79cd13be357-8cb42262ee3mr1602128785a.8.1771331145177; 
 Tue, 17 Feb 2026 04:25:45 -0800 (PST)
X-Received: by 2002:a05:620a:4709:b0:8c6:d309:f9c0 with SMTP id
 af79cd13be357-8cb42262ee3mr1602125485a.8.1771331144703; 
 Tue, 17 Feb 2026 04:25:44 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac800esm36628978f8f.27.2026.02.17.04.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 04:25:44 -0800 (PST)
Message-ID: <3ae05b60-0428-40ec-a6a8-e60395a8dccd@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
 <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
 <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
 <5823f778-d422-4190-99bf-d66ffa437f6c@oss.qualcomm.com>
 <93de9e85-faf1-4394-a374-f9207bd823c7@app.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <93de9e85-faf1-4394-a374-f9207bd823c7@app.fastmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwMyBTYWx0ZWRfX7r9BgyGs7n7L
 YVct3Dv1asllz9PGQ5p2hFrgZLOGqPsZBogQOsGgc2kUA5S3qDeFNLe6ulsN8hACLAFkJr4Odyn
 NNTE6yeNE7LS8zbh3DxMCwgdhrgxrboy/iogZxHC+YsueLsUeG4+UJ4ehGVWXhR9jTjAgFbrrEb
 d50W/DDa9XXMVd/Dz5zj1RE6XeFHOJTSE/TGiTy1Et51RWqYI2ehSPRRNc9yUZt9S9Hv/HKlT4R
 JQXeAcVraCxlbyYfVYP9nenhHgMt580WqUMi5yTImCqrnWhtRC+D8tg4GzyzSeMhcJSjISqRbS0
 MfQekryiUZZ9RRGJuGhfobEuDGqKBb/t7JhX4SedQnlT/9OWtbKpv59mPLNwBE/q0du1MCe6d1c
 mmeESEIoDsD2ML/BSDJ456Uyf0EP/uI+Btp6OFBGH4AYQ6KCMj60FXAPHh4KgE/B5yVFPaO6moF
 HAngBRdquUisvfjdppg==
X-Proofpoint-ORIG-GUID: o84QIWfsXJU_5KGRv-OZK8atQ5SuAP4I
X-Proofpoint-GUID: o84QIWfsXJU_5KGRv-OZK8atQ5SuAP4I
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69945e4a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=_Y02hFW8pdDoch4LnTMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170103
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] efi: stmm: Constify struct
	efivar_operations
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: D4F7914BE87
X-Rspamd-Action: no action

On 17/02/2026 12:30, Ard Biesheuvel wrote:
> 
> 
> On Mon, 16 Feb 2026, at 12:07, Krzysztof Kozlowski wrote:
>> On 16/02/2026 11:43, Ilias Apalodimas wrote:
>>> On Mon, 16 Feb 2026 at 12:33, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>
>>>> On 16/02/2026 10:49, Ilias Apalodimas wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
>>>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> The 'struct efivar_operations' is not modified by the driver after
>>>>>> initialization, so it should follow typical practice of being static
>>>>>> const for increased code safety and readability.
>>>>>
>>>>> get_maintainers doesn't include me in the cc list?
>>>>
>>>> I use only get_maintainers and as you can see no. You might want to add
>>>> yourself as maintainer of this driver if that's your part. Or have
>>>> korgalore/lei filters.
>>>
>>> Hrrm, that's weird. Running it locally returns a more extended list
>>> which includes me and Sumit Garg.
>>
>> You might be using git fallback, but this is not a maintainer. It shows
>> random people either involved or not involved (like cc-ing me on half of
>> kernel drivers), thus it is not recommended for daily use and all tools
>> (e.g b4 or personal scripts) do not use fallbacks.
>>
> 
> The code you are touching came in via a different tree in the current merge window, and so this patch doesn't even apply to the EFI tree. Those 'random 

It can wait till the merge window finishes and then it should apply
cleanly to your rc1 rebased tree, no?

> people' are the ones you should have sent this to, if you had taken the time to look at the history of the code you are modifying. So please don't lecture other people on how to use the tools.

We are all using the tools. If Ilias is/wants to be the maintainer
(which I support), please add to the MAINTAINERS file, so the tools will
get it right, instead of relying on manual process of finding who
touched something. Contributors should not figure out how the code ended
up in the kernel because it does not really matter. What matters is who
should take it, who is the maintainer.

This is not a fix, so original author won't be pointed out by
get_maintainer poking at Fixes tag.

> 
> I've queued this up now - I'll send it to Linus by the end of the week. Thanks.
> 
> 
> 


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
