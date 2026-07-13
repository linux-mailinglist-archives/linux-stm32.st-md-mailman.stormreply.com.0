Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3U5MNdz7VGqBiQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 16:53:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6774C9DA
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 16:53:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=e7z7dP4P;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=egvaRLup;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F5ECA8E4B;
	Mon, 13 Jul 2026 14:53:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61754C87EB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 14:53:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DCE3Wo1561359
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 13 Jul 2026 14:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=; b=e7z7dP4P6kZ+hpy8
 zncf2bbzSinENaM22HojqRVcfDEa6yLFu4UbvOg9zW13JZQeBQcOWTG5mF4mDHwB
 /C0uCB8Glz6oE7/1rq8TeNEoaeua2CIno/sMsSZkUOOGyM1F45lVBmbEkk3Ps7uc
 vWwG1x/0IDHznPKkBH/lqD47NIogvsQALrI8Sjmew4xV0Ld+isbk1VTowEilEN34
 j1GmRQeZ/y+f8IaBu1qxaZ5Hs7+flE3kPl/9E0Td58cKL2kY9Hop5XWkuNZzvGwk
 W3+w8jsS2TEW3baDkBsNROHTs6p6yfNVXQAGDdNM86Ds3UyB+/vkdhZoN34USvMj
 x3TKFg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3b3vn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 14:53:12 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-48e2ce64834so4083068b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783954391; x=1784559191;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=;
 b=egvaRLupyzv41vVYpXGNjJlVVKVUaBZUH/HhivYifTEFv9T8nAxS+sYXS2evV1HTkK
 hMN3aF3Hk12Hszzyyd7ZdQunoKJ+J06TOrWv+2UMgqyg3cZmyasbDtllZ8MBDMvvG4DX
 JZoOPulmXwyqhzUeBKfD+feXzCq1f688DkDAtfco0/68RQL6LnkDYAwZDxjiJdjfDQuV
 DFLGuCdOkQqtOnalAV/IvtMMormb2ydvDlLWm6NLB4o1HjI71u/FhjccyJ+mVrsiOjIf
 W9c1SjhoXD/ZQ54qlXEVsQyaJWa+xjg5YkXzj+RRx9G8KVTWiqNNIGG25XavWvxBmcRC
 zvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783954391; x=1784559191;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=;
 b=alR+DXpdpNxkSJ83XmctD0dIX/AuTujdsY/OBR57nXp8ZWzdFokjlu9fvYa4lWeUML
 jfG4RghmDSW4Qo0jYMQ6Je6IkIj2ZLlZJbyrQETNCkIaKiDGREHjWwww4MY7GCK6jY/H
 h1acw68abydWB5LIHNtjQ5v81OCTaaIoUMQT6cjYhawn4WZK3YUUKi9VMij/nhhsVG4A
 pUPOMnsagkA/OsYy7DIFxOc4bkYIgZfgi3u99USwwDZPboPHaZw9aJU8PSWvKgEVc14+
 ovFwizZLwVTWJa0AY8DzjT9+mmqV5ZIXcqUMTLN7fI9JXUO2Z6oek9NSygMctoLEV7+2
 EUiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ87jJNiZkJMj/15cjeFb8LAm8PBKvcYWU2yRZwvByyUPOBwgK2NYU9/AKM38vo6uz7+SUSz5XCbhhfxyg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxepqGRXEctKpOTPrRclINnrigDetHbu5u4MzQ3LgAM10nhHBge
 odob+LlBVrHQaO27SPkmVATMJrOCJ3Qhw13pgAg8q1HnAVOPifWvrRMjUHRCZvdfaFQLXplg08T
 X4Y9xqBONVXguEcLnyFjRBQgM2KjvAeI5k5ipPXBu8NPBP4ND4ghFICUw9/+migG0KSLff0exRH
 CXBV1v7lc=
X-Gm-Gg: AfdE7ck7g3luZOAPwzbJpo2XHZBQ9DoYnPKHmnGj5/xzgohcOZHfqjoABvHGJn1uWab
 FjOHrPs8nSNpnNbmKXI3pMwBqjpgnRx2G1n2XBECLiNKMgWf2ujs+bTK6JdEXtEpG/O0Ba4/iJ8
 uzthh4tm8Os2npGzkvyxPhc55Ny1enCM2CUibM27yEPP0yf5o0BVzVw014a7HrcUY8Ji/xD9w8h
 nhbNj63kLgR9KPorIqMhIBVpCHK/8KIhhiOnVZHydZkQosC3XT7ykPEAaEjuZGMmQ0OsLl+cad0
 T2FfAIKFnuxfsNSfwqUjqkfWPnIEvJRaQ7LnODuGC/7JqP8R2W8ZMpuW9bcO/VtrxjLAGslRbOX
 zW5ir3MK1xzOwrAxDh8vpW5b7HeaKKbdQHOeyvbs=
X-Received: by 2002:a05:6808:190e:b0:495:db8f:ded8 with SMTP id
 5614622812f47-4a42abc07e5mr7016390b6e.9.1783954391346; 
 Mon, 13 Jul 2026 07:53:11 -0700 (PDT)
X-Received: by 2002:a05:6808:190e:b0:495:db8f:ded8 with SMTP id
 5614622812f47-4a42abc07e5mr7016378b6e.9.1783954390885; 
 Mon, 13 Jul 2026 07:53:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.186])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4a1aa006f74sm11978085b6e.0.2026.07.13.07.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 07:53:10 -0700 (PDT)
Message-ID: <797cce6f-850a-45f1-81e8-a1cb97c6a9f3@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
 <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
 <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX1rCOvkqgEYzm
 UYkc5WMKqfBNS0d2+7asCYy2pRFS3c+I1N3+AsCDDk/nLeanjZAIMs0Y84UmrarrT53XfCIbsoY
 lzq1JRcoC2dTVtRAoZdXNtA4qpMLHIDNOqfwr/xHb5neFRGe1XyTZr/z+0XsW4PuG0HiYxFPBlL
 gksjfXmv+RwVpWe3qmf36aAKkRcG8rxc0zxhoHf9qY/GjH1UxCiBZALMIyya55zrnkQo/bKmKN6
 PRsnlbvxdBKYHiXUpgfZwz8EAUfl6vT4DbM8/WMOXr7jhXosyeTCtqx2RQuqWZyIKL+5Z5bcez4
 FR80257CbdpmN0GBnDI1IS6GkvAGCv3nvhQ/gbxa0L0ZmaDhPp8SDEAnvvkBAWg3cBCAL4g6aye
 8Wujm4PYYFi9W58Q5mJcbbrYHRJKPUmDZJCtgvcASNS704O1BDblXk2l83WHBiREuxjjBXtkwiK
 I6PtrWooPlqZu5ErYnA==
X-Proofpoint-ORIG-GUID: Q1YHoS7imXYOk79xBm3RYfed4CMmwW3P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXwxy57pbUIbX5
 DVrLTehGTHbMmE/hA6GM5dJrR4dx1lASxZKzoSFjQkXwm9sjNyHSbQMQPv1S6iC9uqUdITgV1ZT
 FpGGUTZqqwGUREK/F4Q5D0vUKIstkMU=
X-Proofpoint-GUID: Q1YHoS7imXYOk79xBm3RYfed4CMmwW3P
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54fbd8 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Xoi8Q9uR1wpgCRNIeB3xeA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Qo9p9QJxbvv4IUk4TH8A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 7/7] arm64: dts: qcom: eliza: Add
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
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CF6774C9DA



On 7/6/2026 6:36 PM, Konrad Dybcio wrote:
> On 7/6/26 7:28 AM, Taniya Das wrote:
>>
>>
>> On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
>>> On 6/9/26 5:02 PM, Taniya Das wrote:
>>>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>>>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>
>>> Almost all of these nodes lack power-domains, meaning the
>>> aggregated performance state requests will not be translated
>>> into RPMH requests
>>>
>>
>> Konrad, all the clock controllers are on CX, similar to Milos and does
>> not have any special voltage requirement for the clock controller.
>> It is okay to not map the power domains here.
> 
> I don't like repeating this every two weeks, but each consumer core
> may need a specific corner for operating at a given frequency and 
> the way that is conveyed upstream is via a hierarchical structure of
> pmdomains, where the root of the tree is provided by the rpmhpd
> driver
> 
> If the connection here is lacking, every requirement specific in the
> OPP table or in the IP node via required-opps goes to /dev/null and
> RPMH may do something between aggregating to a lower state (because
> there's some other node voting on it by pure coincidence) or shutting
> the rail off (because there's no votes whatshoever)


Sure Konrad, will fix them for Milos and Eliza and will submit the next
patchset.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
