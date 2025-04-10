Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6A9A849A6
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 18:28:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4696C78F74;
	Thu, 10 Apr 2025 16:28:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B35CC7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 16:28:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AD2iFM006861
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 10 Apr 2025 16:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1LYRnKYALBxstxnY8N2VWmQJbh99uAes3RlQszC65LE=; b=I3oNWYh1pmIWvoPZ
 YNXyQcTQxr0qCuCP3bjsX+gmUikLAOUHnI6M4W+4Z4iCmhJ4jauoG7R79DGyQaLR
 YRg9knFf18wr6BTpxnRr7MDWGcXkpgDZ6L3jPmbmd+HiMfbN6yDQEicmhQrqIlUX
 6tKvOV9Uxt33c/nVKz/ytYL+Cfqev0ynqT33WnoH5sMTx/klmCsJH6nt16qnTTKk
 FbbNhDcICoxYKKsdCJB0uOG6LJESAY06eXDPKphKszieSBsl+wgoSWCG3sGXfwYr
 C1KFDE1eKkHJg396QkFwC0ipB7VU3cyb3KnFUyklTldtsojJLNB71CsKoR+exSMO
 BvPqKw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3gkhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 16:28:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eeeaf707b0so338466d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 09:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744302535; x=1744907335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1LYRnKYALBxstxnY8N2VWmQJbh99uAes3RlQszC65LE=;
 b=Uzm4x1M2f0/StVg9l0hCFz/Kn0pv6Cl2ZtRUlcR/4/Pfn45MxIStTKW9XGnkskrKJr
 Si188IfoRBvsEQ8NclpkKp+MprKcfteiDt00+uQR6BRNymFgSx4dMYbQVgVs6nK2nqti
 1FciTr3gA6x2elBf2sTZFDchjcvBZqHcuzJcKt+FJGqcQ7VdyztfW0QgHGPKqMo71jBR
 IDkXEOdCvN6Nax01p0qHgpIA11mOGL4ogtLhB4zL5ZgVUSYoiJ4CQDjisVB90w8eCUm+
 8pgJmQYoGUgv2/x7X6vPLb+zx6ZYz7KBBSM9zuWBBrh1WPZ5DpbLASnlnEqV6rfQ+3Go
 MhrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLcaQpZ/6dxp5i7AWc7uqM+IZhV6qfe7D9A3oKAe+rRbPhaYcGu+CRKYZPeMRvzm+iwKdFVSkGFUi25A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzue8i/zWq8uwahF1t+6eqhwfXlauRNbXiObG9LBxkqn0JCSSHS
 tPCxaJQgfE7uZ/I+SdTNHoWiajzrG4EyEcdoIczkRcZDCxdWqN0JYMqoGCVuM7oM+oug0BwNuDi
 Hg+Vh3kXPgzpKwieeIkpj9xD6eXjfQKHNAWV1gGHOojYKflF5iFzUWmL3VUlo4w7jDGrJbIW/bE
 uiBKU=
X-Gm-Gg: ASbGncsSxh357C5bsIY3RgRfyXZTS96fPua13DPx+pT2WexQGcxzIa5d/S1SJF4q7j0
 6JNT20t/v/+KTVvI+2pFbR49WALtPwSrmBi7NNpq16b4AMrIAgxUietofz1oONmbiCvCA2WD+qa
 tm3lfRMF0K5qnOe4IQd897YeLqv6A29Nuu4byAVk0y6pz4Ud+QhRwytryZxiAgQ012i0Rw1+1kb
 +V/SdqgceqTdnO6blmTpk4+/hZHm0cgMU/W+EWuaB+G2LU6txSXORVyIGQ5iI2KKG2CVlDE5sZr
 J3yOt+Qedgyk3eGOguGV7GcUao5FVcDrW9rIMbfRnYNBgtUXHGlbURZrS7Kkg9xkbw==
X-Received: by 2002:ad4:596f:0:b0:6d8:ae2c:5053 with SMTP id
 6a1803df08f44-6f0dbc9abbcmr37085916d6.9.1744302535326; 
 Thu, 10 Apr 2025 09:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpQTzqEgSGnRGI9+a1gSJgk7i17w0vzyr4OAfVjD6W7x+6Le37QVc7oS6Fu1U4ISRaqoFqsw==
X-Received: by 2002:ad4:596f:0:b0:6d8:ae2c:5053 with SMTP id
 6a1803df08f44-6f0dbc9abbcmr37085796d6.9.1744302534993; 
 Thu, 10 Apr 2025 09:28:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4300sm305662866b.94.2025.04.10.09.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 09:28:54 -0700 (PDT)
Message-ID: <5cf9c47f-089a-4748-b4b5-21637fb7368c@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 18:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
 <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f7f1c8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jy6vGmKe9HVL-Nowcs4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 1nofTASEe-bKkIWyanIlYEMDJA1l05Fi
X-Proofpoint-ORIG-GUID: 1nofTASEe-bKkIWyanIlYEMDJA1l05Fi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=631 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100120
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/5] arm64: dts: qcom: sa8775p: Add
 interrupts to CTCU device
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

On 4/10/25 3:33 AM, Jie Gan wrote:
> Add interrupts to enable byte-cntr function for TMC ETR devices.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
