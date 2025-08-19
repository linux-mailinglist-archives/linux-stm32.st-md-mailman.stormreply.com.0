Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7194BB2B9DD
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 08:51:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F748C3F942;
	Tue, 19 Aug 2025 06:51:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FD21C3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:51:38 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J0jDVN007304
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 19 Aug 2025 06:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KhcnubSus7MkpUMzXlz1FJ9i66J4sJ3ytWF3Qtk0VoU=; b=RA1xZPkvzllF0MpV
 naoDi0yR2CxSqphg6p90qxi8lyy6MADcfyIb+nkKPjEoCoBV9uc+tBLfOsHmszpO
 xyJO08L2fhdIpPJKpszYhLkQzhlB3U8XKYaiWda/pkkAkRVK3HmBcdHV0DAx9+Dn
 LX7AjA3/OdnWRDTgQV94el6hFDRookIlXq1U+6SF1dzX2ia/3+Dp3slRNc/522k9
 oI1RPosK4xauiQymYlcQyykReT4tCir++VLdkabDx3DL02Rhn640eXmVfoqZLr2N
 VaG/+Tx1EDRKPPhWBqP31mETZ1MukY3FNGhCQAJj0+KAMbUMmdoOC5MBnAwSyNYG
 u2tiRw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtfq2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:51:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b47174c65b0so9953167a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 23:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755586293; x=1756191093;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KhcnubSus7MkpUMzXlz1FJ9i66J4sJ3ytWF3Qtk0VoU=;
 b=rokq3LYLcc3jrXIpVvfGR9wv/oq4Nbg4s7hefq4yLNFtEJ0mCRClgoWfvl4h8dWpc9
 eNHTvOcFwazZECnKsLfga6SQpG6JitmnU9m6W41eFI0WNZBA6lGeAJot7URfXUzlw/ex
 +L0agnITsN5DlQqNLKYhmZ7diUw7IdWDdthS28XgEfC9TReBcHcTimELyaot3uuGBH4F
 eDnkTkXQtsO3HiID4P5ig8EAjF3ab8Ufh354ItMaOk92LMUHqBGdmn4BmCnmbY91+Z9J
 LXwAmibwRvz8WyrDCcSMLphp1savHsLq/oYNYgjJuhpI/E8OS92VBizsLUiQbCP2zzrK
 87lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRjOPS7qehH8cjDuaRGHj5QwYHKWkq3Gg1NvrUQlOSuycnA1RIZQYv562fwfaQNJk8s/TtufecfZN0mg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2ItuYYxrqbrxxbmYAmmNt8SOHAzVyz3YN5U3YLetZmjtNGNSu
 eHhCF/Q4Ig9VYIb921z+DY/dhr9/HJw+GpS0z2jNt6/QmMJIpDgnvXb1vZBdIO4bL1cpqcrZ3fw
 2dHNM8qSHEdnDozfFQcMd6DtwAmFVoDs+A01Lfujn/c2JnTiu1di+HAe2NsrmaYclZ3fkJuITz9
 6sqYov9CU=
X-Gm-Gg: ASbGncuixN1EDuV9otiMro6NwjwKnahrBOTWajcYvANPBIBQ2ILHtXLzV4URm9ki91N
 5CZCrPpa4aSVQ9uyfBYh5FCL7XFU+DuF2vFO8qxplXhaNHrVC4WiSpJHb/+T65uBDG4EgMIfXHD
 3ndfwfSPu1mM2lFc/+N5WmovwIHPRZeTkmGsfNqQJrGuxzW8cA6pJWYrd/2yXKEBUysS5xLVnPP
 LhD5CUwooNFaCWLU/GP2vv406W5d2lVIc9/O5RQQIs0Qww+4uC35yDcSER/w6hiPDJVmNBTDEqg
 kZXJU14+fJatzb+BJQQkxNGPKqKVYNEDIIZLneV0haxAS4sWgENmvqTkaCER4zjahXb4s4xd/S5
 HJS5zTIyzhHzIjAwJk6S3ZmmCI5T5lUMK
X-Received: by 2002:a17:902:da8c:b0:240:aba:fe3b with SMTP id
 d9443c01a7336-245e02d7726mr20776705ad.16.1755586292689; 
 Mon, 18 Aug 2025 23:51:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrRQRvLzaR0no9uz4wl3VWShxiXhdMnGmDhx8W5wXZivwjwGSDV2ohd6ogQppD0UOvYx2W2A==
X-Received: by 2002:a17:902:da8c:b0:240:aba:fe3b with SMTP id
 d9443c01a7336-245e02d7726mr20776395ad.16.1755586292249; 
 Mon, 18 Aug 2025 23:51:32 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446caa3e5bsm99455325ad.33.2025.08.18.23.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 23:51:31 -0700 (PDT)
Message-ID: <157c048d-0efd-458c-8a3f-dfc30d07edf8@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:51:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
 <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
X-Proofpoint-ORIG-GUID: b0bkd2tf3cgEBFGydYJBSS_G1ThuakRA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX0NpPgw85icLd
 BbADTb01I1NQLGtxcq757OUpLK2F+gg+X+6WLDn92o/E32dWsyMqA4gQntJbGuikQTgmoYvzMaV
 CSElr4z5b2ooSmhf1d+Bgz9O69jniir4WVl4riFPhE/uIA0MHHHhuQC72CxwIMZPb/ITvw055c1
 a7TssLTWaMalOly7+N5ngXAom8NaTmauibKPj36FYfTkPgGWq/KnS2hTAjDv1mAHW8nFp+GHc5U
 ghCV7FeSusOlwRdm1SJ/mmMV27XHJ+Km6BqNYZBHsQ+ODCJhQA8X4DWXvRNWIsGkKPOK2OuqWvb
 syeoPeWGnP+eLapxypWYiOrL8ziTdcCzeBCmoPtFR2gIt3BOkS1GKYfMImY8BUaOODkyNacvgKM
 gGtJ9NWT
X-Proofpoint-GUID: b0bkd2tf3cgEBFGydYJBSS_G1ThuakRA
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a41ef8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=XWQ9mN7VkJ-Tecl8lUkA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
Cc: stable+noautosel@kernel.org, devicetree@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yijie Yang <quic_yijiyang@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/6] arm64: dts: qcom: qcs615: add
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2025-08-19 14:44, Krzysztof Kozlowski wrote:
> On 19/08/2025 08:35, YijieYang wrote:
>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>
>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>> functionality.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
> 
> 
> Why do you mix up DTS and net-next patches? This only makes difficult to
> apply it, for no benefits.

The DTS changes and driver code modifications work together to achieve a 
single purpose, so I included them in one patch series. Should I 
consider splitting them into two separate series?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
