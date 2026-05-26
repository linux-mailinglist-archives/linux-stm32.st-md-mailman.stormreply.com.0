Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OV4G7OGFWpyWQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 13:40:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F175D5047
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 13:40:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28C78C5A4C5;
	Tue, 26 May 2026 11:40:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2B1FC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 11:40:32 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64Q6awAp3263677
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 26 May 2026 11:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=; b=lus2Hg6hWVD/Lvw0
 a/WSuZPrzBJ1wdgjRoztvLzLVSbxIO0b5jdcKAQ3qMz0pKfwnKazFXX+NAv5Uh1J
 GO9Kb+AS1ZSwJglJxzx8xs7SGKmuU2Er9bBh2OrrOTkOT5vZoKzPTGooa87Z7F/E
 Drg2lW5jZdbOkPoeeXTChzTpQrYlsyAwQ+DbBNBLlfNM8f/rFiPJ39n38PJpHh8v
 Ot2p5LuZlmdMov5yDtAu+nI0zGC4xAxL4SpJGRQTxEIXxSlYMArsWioiUFAOLS5O
 J03td3n++mRkTQaYB9Jd5+rpaa1fJtL38M7g4epaQZT51I9uUWe1HPJ5CLSGqzXh
 JilIwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs48wr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 11:40:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-83544d05c5aso5255255b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779795630; x=1780400430;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
 b=Fu9W+zBbUuXz6TnxvkJRigMKpSU/BAE6bu3Jai7cmJcefF3/ghrR2R9NFVtsfzUZRO
 gRq3tXUCB8kzd4Su7hykA/NEN3umx73CMkIT1lH2qkEggYubHDKNTUi+HfqTPScP12x3
 4/rgG/dpt9/auJYlcEUzN9bZX/M8X4RsGBvuVSQvKv8zt2oF02e7RIz/Td4dy8udRRD1
 YDi0F2Cl9opWXPYhHEsVFAg9PsHHApuyTopckhlBmh/c5tnbQTB1qcbBQPd8IPAp7CmO
 qfPKmOLkEutGL17HynNbwKZGMHjzDWBNs7lwcoizPZQdCYKy4mpLYUQ/GWeS3U+onfgz
 1zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779795630; x=1780400430;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
 b=B+APyeTIHFDPLflgZeVQw3Ig7CnUP0CjWBaIZU1Sibrg0pgLwgo4YZtDKUjG/5pzzN
 VXVZEYamvdVVx/Fg659gaiPnFIwxAgaye0noIi//0SlqmCjVl7alBKC5hD9sFm9S1g2d
 36JBGknPtG6/T42eudVFDG7SZwwtK4lSRQxWxAo2oeQAGAvpCFNRHtV0KsDHIsmqZF6B
 eOZznZhqTmBjr2Q3vIZswtI36b2eD2Cc1SEJfSooZNJb7j1PsSOjvgOBk7NNpYu8BURo
 65SYdknwN7T6c7kv/fr2ZLkmd4fvtmCjyVy9q9Rg/AtHYc+q+9eF0SlVjOD352tHypOB
 AGEw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9ZvRtny+n2AJHYvI1bfxZOi7J0yqoUNnNS49h8mVj1fomDY6rPxZ7iMeGjStfnj4S+gH/YaISBAUMsA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxsTCMvR/GcZ3HmMP/bVn3Twf7AWUcJuchEkGyuKzzSiZ/XEtGl
 dRo7uL5fKy87hkTEBeX/lss3BgoEmCiJzNaJEZL3U3pN5FITMrYuBiYypWmFj2z0zmgz8s9fIeg
 gZrnC0/5xn6dKZdX0XsKtxgdUqcfZCoJY+0hPFSCBD/LqPM3+F3H80hdjzHbCczP+vtP8EhRF+T
 OODa577hY=
X-Gm-Gg: Acq92OHsoXy1pEdRWy0zNmcEveSuHN9hJvjCbZQwePcB5U7FoM21zJQovS/TrHV5MIA
 FZVMn0CNFe2RthCnvuUsGH5XEBYr3Ch50wu5pgwl1Yf1SoqHs4qFc/h+sB3DQ9aygGz0Q6NsOFF
 v4RiKinpl/IKZKn3VrBtmzBJFmhPHk3Lismrt+xj5n6EeXGr4WNGTX+eMVOItLhWfuHksDqW5PM
 DfkTaFrDW/+VuXDbB1iyEhS+3P/r/57lhTZpTTEk4C1vUn/j+Lr+AwWc60rViqGbThMZ95QJj6P
 BrD6cjzW0BxN2+DulMGZ79nDr3TvsF0MaFVZWCb+GgyWSncd9IbTzPOV3OPNjPSDrp5/JeujITC
 X3PuZh1qH8ho1a/wPL3v9BW5CJHYpQyy/66baZgluCiIeeAn8
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id
 d2e1a72fcca58-8415f0f02cbmr16834764b3a.10.1779795630310; 
 Tue, 26 May 2026 04:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id
 d2e1a72fcca58-8415f0f02cbmr16834735b3a.10.1779795629827; 
 Tue, 26 May 2026 04:40:29 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84164b1b3d2sm13869414b3a.26.2026.05.26.04.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 04:40:29 -0700 (PDT)
Message-ID: <59167c7f-c758-4939-b760-b6de78c22359@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:10:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a1586af cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=SSzA4h9mN1o_gDQ-MaQA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: OX5zRenli5Rm-ERq1s2RPP-kna_N6xV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfXzaaeLwnZE4I7
 Wc0OgL17Sf7jCkD0vDirsKxau82M6bHgd5tLiwinY+baHzYYD9s3899KDJApU/+5X1pIgkL49F9
 VxPQH4ibQ4pSjG7KgAeWjnhQwJEqVc9RTxT0Sss7tumnE9xd7cRcRmeuO8Gy2jv8HDcitkpCGoi
 2viVGbAPab2X+Ikk2T93X7twFmkxJRPOfnqGPpzWnhC/npczMehynq42QbZX9NBrJCe0GHmSj6e
 WIXp0qiubhcdKqWEXRTDoNI1POSbw6ET+xoNsH7wmb+JXjpoRMrH2s0sgO43SlAWL6WS+bdsO6j
 9H2qAeI2jvMZwpddBw6d2/woFSe0ZJAAEPDtajSTFP50VQjhSGD95rGTxP/lJBvzZF2zEzrKqTe
 /VFbxNh9nj71BopVMbgJ1ocWUcAU44OqzqZzQv3uWPA1bUTJpOdHxiN2yIRdCeiL2Vf/XxJjhVB
 f6H7XptPvVHUlmgd9uA==
X-Proofpoint-ORIG-GUID: OX5zRenli5Rm-ERq1s2RPP-kna_N6xV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
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
Subject: Re: [Linux-stm32] [PATCH v5 0/7] Add support for Video, Camera,
 Graphics clock controllers on Eliza
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
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-clk@vger.kernel.org,m:luca.weiss@fairphone.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.952];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,oss.qualcomm.com,vger.kernel.org,fairphone.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 12F175D5047
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 4:43 PM, Dmitry Baryshkov wrote:
>> The patches have been tested on Qualcomm Eliza MTP board.
>>
>> Changes in v5:
>> - Taken care of comments from v3, v4.
> Which comments? Please be more specific in changelogics.

Sorry, my bad, it was the 'sashiko-bot' comments.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
