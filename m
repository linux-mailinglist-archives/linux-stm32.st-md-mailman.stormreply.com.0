Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 286FDA25B71
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 14:53:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E25FDC78F7C;
	Mon,  3 Feb 2025 13:53:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2077BC7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 13:53:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135Nwf5000327
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 3 Feb 2025 13:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QSv/7PkAKpQ8nAIRs6GPpYKojD4RMpnIBxaHmaeb+lg=; b=d7Apou27U4Va++ZH
 vrttHaIEfvF9zN9RDwikHgCCxar3VbEhvM02YOb4XiaELo1kKmWETCWkT/6TnC9V
 B6Xfyf2tvYCqlDhEh2sMM4q8rCKE0+qKCNqFwzLfl2M2HGAUGTUl6NIrPlFS72ex
 DHoakw0/abIMeE8n8eX6y/a3w0zt3NnooFA1gLSW+lpbGyG0r081MH8hY6JmWQfz
 v2L18DKJsYvqzlSI0mp3qMTNyLDzbS2fmxFqRk+ngW4aEdgjhCFXFqdXnSUc1NG6
 fQ8Q8FaSj0mD0Sh2eSDt7r7AB30W6256n620f0PtKsDE3trp0n8qDKSptbizyzMD
 M8VBxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm418v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2025 13:53:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4679d6f9587so3658951cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2025 05:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738590819; x=1739195619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QSv/7PkAKpQ8nAIRs6GPpYKojD4RMpnIBxaHmaeb+lg=;
 b=an29FA1gpud9RJhu7lRWI2PyQMHRlOQlSqo+/Uyk8gjK8HjF0ejCf3lCP5MktGw76E
 Y+09HJBym7X7Yz3WkiBCSBSPrfUwQ3AQJorFjoI+x2XgHbDSdCVApOK89wooWv9aWIQe
 N2jre5IIA28sxHir9J1+INqBDn3I7nEwYlmrct+ya7iZp5Z/+hsJs9icF7NfeSdHzjdm
 P4aqdycNVI1fKCt+EiiedFZWK2zosU8ugna7N7UeUDp9aapC9Vbuh91og3f/zD6/a25n
 7NVceKRoM7Gy25liv+4y/Aaz5LSFiFBHB/rMXH685o+FhSOnuRjtXJQV27fsPLiYwTxW
 CYGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlAsrsRqhZoPiqq/qpJl5Cpf7ObwztrZ2aR8yArBr+MfZrgoOKnQNK1aBlV3KSN2aXdLTQNQYyFT9IaA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxN1XfyCbkay/XodOyrDs/10JTNrIVipasHpM28J9I8sTQwWfjf
 Tne8nRv9JPs/O008flWCC/ARTfahkt/oktJc7M/v6TRt3tCr22/Qx90tOU6JtIA3uDlHxwPkvel
 b817UJg9V7H0NP/iE51i3NmHUof4XrOC3RhX4qDHHIdVV+2TLH8wLTQVPV7y8uEQjuYQwcrjMDn
 m70NY=
X-Gm-Gg: ASbGncujG6wRrrzoNI6CwrHzwWTMjpOw2E9HQnwwoF5y3mL6sf7TC0NHI/OXaAEtxNL
 h5TicZqzPV4JbVszo1+a+B7BaEoiHx3BDi9x1D7cyhu5TxhgmdfxnRgjudmPFwrmycobVbdpvN2
 j3NxrvnSMKt0TJrseyv7KKP0PXhMN6tlUgsiNu0V+UWWFNForOnOw69xbi+HE/iTLAd48O732ys
 crcej8wTUdY9w9/QLVN3gMd6ItXNaEFU9TaSp3Fu+rbpwCroL1E9x1o1kLTusH2Iz2EoiTGLeRz
 oS1JnWh1IlOjQCM3tI3X98iYArzePn0x96+5znae1yCNtamnPWadWdlwzAE=
X-Received: by 2002:a05:620a:40cc:b0:7ac:b32a:3997 with SMTP id
 af79cd13be357-7c009b38647mr822904885a.7.1738590819250; 
 Mon, 03 Feb 2025 05:53:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgceImfzV8y+oE8r85Xh7QN5KXyc4CPa69uZAzMjW/nziNSKht9JytBTvf5hqpOMhFNtVZTA==
X-Received: by 2002:a05:620a:40cc:b0:7ac:b32a:3997 with SMTP id
 af79cd13be357-7c009b38647mr822902885a.7.1738590818864; 
 Mon, 03 Feb 2025 05:53:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724c94b1sm7708809a12.66.2025.02.03.05.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 05:53:38 -0800 (PST)
Message-ID: <2128f6c1-9750-405c-9595-125995ea76da@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yijie Yang <quic_yijiyang@quicinc.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
 <30a82d74-a199-4ccf-997b-b8a6971cf973@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30a82d74-a199-4ccf-997b-b8a6971cf973@oss.qualcomm.com>
X-Proofpoint-GUID: wFvsYE5jEOgFVRzG8g4Yd5DZmBtFDz2J
X-Proofpoint-ORIG-GUID: wFvsYE5jEOgFVRzG8g4Yd5DZmBtFDz2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=620 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030102
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/4] arm64: dts: qcom: qcs615: add
	ethernet node
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

On 1.02.2025 4:48 PM, Konrad Dybcio wrote:
> On 21.01.2025 8:54 AM, Yijie Yang wrote:
>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>> functionality.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Wrong copypasta, please use this one instead:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
