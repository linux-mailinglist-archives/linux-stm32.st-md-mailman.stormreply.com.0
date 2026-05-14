Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGZUMkeiBWo1ZAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 12:21:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 777CC54053E
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 12:21:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 117FDC8F263;
	Thu, 14 May 2026 10:21:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4E3FC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 10:21:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64E9kC3U2305356
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 14 May 2026 10:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=; b=E3kn8es9MXVd1/Gj
 4rFSCZB/DNa08vAsRs8ugWvy/fk/LBgTjPynLqVzu/PEOOF9XfS5Aa0gE/ntqkSs
 5D/SMScTaPW8f1oMOmz03Z3yidtI0gEHjWQv3zM9tQsyP2iC1V6v0mJxrVNOAvY8
 dBx0HB55nwv8cq9xl5Tp57WiCwafKGVLV4XZIdXMPNpasMh4Yi+y4QNKMST03dEK
 PskXU+myOmA1UZndCWiLrnpqtWuIaa5TNqi45vMS+us9cfrReWfAmG0uf9Gqa5Pr
 HbCtifSoyZAEWtCYs3poBC2hlWo3IxklHdiyMbZTCkUUlxenog+3E7+R82zlJ3/X
 j6PORQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0brcek-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 10:21:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c70ea91bfe1so4797857a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778754115; x=1779358915;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=;
 b=dbv1nT6Exn8fbe9w082p8+xrXS3tAR7X5ZJMowKbayHv1VRR0VetB/nv7BQGFp1Yif
 XL9n30PVUwF4RGVNjlhYQsliqkmDrKeXrTbVqHEMZnAZfTFh7KDH0RZarh3zl1hxKReg
 SKXr44GMibCDY+BED+AFxfUe30yySOqQpcFuIOuV6lhnyI+GzWQLeVmEF444sQeB3fya
 smS0SM0TYiad99zrIxhF/UFosMt8DwQJTIch+lWPnXL2CsBtdVPoW5E5oC8FxcdymXJo
 YxEaqZcFzb81ugq/0K9zcXFGuquw+hNSwTuiTgbVoXDObN+bI73IsUlawsxBvm1xEY9R
 2OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778754115; x=1779358915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=;
 b=gGDIK1cEdcJO7D+XZm5xEYq1dcxWWNcZb7cWp4iM5gR2Tdw/SXtbzU0yAJtr2IxbxP
 eInLKHpCsltaVIQpwnG+NkL5tM9N4jU7yzytRgeJ+PdMBeBL7yqS8O2OEj3phAu8F5A9
 9yLjUdGCgNM/GP1sEoYpqpvKPOceWh46irbmA4Mv70EQ9E0WkKUtbeYBL4aPXrCZ0FBZ
 rhJOIj1hx0SFm/riBZbILYA0JQw3Wk+d+J5EVQhbfRn6nWlXUjCy4paqstbUwQ69NE41
 30+/niDlGuEyjLE9KIP8bjzpR4vf6d3WkbgPTYDd6zmUo8aTz5SNL3jEQ/+qbHIdPuCP
 bOWA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9VMlFMShNBuojID5tQhVzar9SLNnb6/mfGqPuK7xHJjbByT8PCItoRxqEg9G5zI9DyRtOyc0lrqGMJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGX0cgEY4Zo0dDplcMCoMCUPzVusRF9RJoMdjTwQGZkLq72QfP
 Gz/SJCsTnkNpJJj9szElVTGcscAyYWApL8sSdPF6RyPWuPSdengU86azrjIgBMr2NANAS0LTLWp
 wroaW8lvxV5FcNBiQ5z+s1tVo+t2LxPoGvIiCbLQg459qtvFETiJEsLLTYzgXMCRDSYDdU2OXkz
 nJr+acpug=
X-Gm-Gg: Acq92OHm0teY6wIcYKayP32C7amqpIas1rLA38UoHML1YOpSZ4SLzH5kAYZCXo13S3L
 OOSWMJ1uP1bKNwXgSjZJi3GiSH9dk41isbotamNklRyKWU3D3Yck1iiNSlF3XQO9+DsTKidFiyD
 CmVD+IFCjCPeRxtI6wQSr7wGS8GZB9iJ9UUjIPulXuBx9NQb/WUwNiPFRRlGkky+qjdxt62nNXB
 gfZ1JT6mmmzczzIsnOT1QafCGnVvHHHGQ8+hJsnX/Ba5p3PuN5RvHI9wFxIQtf2O4IfTMY85x81
 tdHM79Y8OhLEDO0C+CbyNGq+atltiZnrywOaZffrk1pYl5Ll4E1Ho7mRnq25Q4khh+WuiX66+dt
 ZmZFlZL3lpAvKUAjBpx/YtmC2KShBZzRZF9Q1qb1cw/DOEvukMvNPKv3wUCI=
X-Received: by 2002:a17:90b:4d07:b0:366:132:fda3 with SMTP id
 98e67ed59e1d1-368f782f7ecmr6252251a91.11.1778754115134; 
 Thu, 14 May 2026 03:21:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4d07:b0:366:132:fda3 with SMTP id
 98e67ed59e1d1-368f782f7ecmr6252211a91.11.1778754114516; 
 Thu, 14 May 2026 03:21:54 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-368ee6280d0sm5974990a91.16.2026.05.14.03.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 03:21:54 -0700 (PDT)
Message-ID: <2ac7dcb3-6dbe-4967-bde2-10811597449e@oss.qualcomm.com>
Date: Thu, 14 May 2026 15:51:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
 <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
 <20260514-obedient-crouching-bulldog-7d63a8@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260514-obedient-crouching-bulldog-7d63a8@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMyBTYWx0ZWRfX9oFMYmOWpiUw
 mJYajcwA/41C6bUnxwDoIYyIoXlSEPRJu2xm4E0h+khV6glIt31koCnuuJJXvkkselv5+vAhm62
 zoiSLVCB4eKUg6PvRKFqEY4fuSC3kq2rjpYg+UCZeNuYghxc/xbt/QJsCcIOXUpAJ27u0X4HWtx
 9T9ZjG/cv1bz+NB/xFasoLCxAXKMuuAfCo0acaQzMFJSert4WA+dFLq4GPURIfaovL+PX9nNzJy
 1EBJTaGD/HilOx787ctT5sI9/eBoepidVBCQfQaCr0YOh8RmxhUtGob52c75xGxNzRXpigukgSP
 t4D5qXkLO12Ikq167JUwTHBMNbA5MkwsbLtOrwFtVOMM+gRj74q3yb6kxMZwZbcFXeuM0Ybbbxv
 DDN2ePpCSh28tmlzeJxn4XQZfh/woHewWxia9y0TtpTbjy4unJS2UWFlbhBofeTR7K6wVAAB5Lj
 azGTNzGCtLPomKVJXyg==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a05a244 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uKGqPZ-g_1yFZXzQAvAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Y42mrvtTwPEOdiqN3wPG_h74fRm7zM84
X-Proofpoint-ORIG-GUID: Y42mrvtTwPEOdiqN3wPG_h74fRm7zM84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140103
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 1/7] dt-bindings: clock: qcom: Add
 video clock controller on Qualcomm Eliza SoC
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
X-Rspamd-Queue-Id: 777CC54053E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:imran.shaik@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-clk@vger.kernel.org,m:luca.weiss@fairphone.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,oss.qualcomm.com,vger.kernel.org,fairphone.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.252];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action



On 5/14/2026 3:48 PM, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 08:57:36PM +0530, Taniya Das wrote:
>> Eliza Video clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza video clock controller to the existing
>> Milos videocc binding and add the dt-bindings header for Eliza.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
>>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>>  2 files changed, 44 insertions(+), 2 deletions(-)
> 
> Please allow others to actually review your patchsets. You sent v4
> immediately without waiting for v3 review.... which did happen. So now
> please address somewhere comments for v3.
> 


I have put a comment to ignore the v3 patch comment as I had missed
change in clock node, but for sure will address the v3 comments as well.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
