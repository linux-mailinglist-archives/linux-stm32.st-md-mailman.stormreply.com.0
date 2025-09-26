Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2636BA2A14
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 09:09:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 926E0C3FAC8;
	Fri, 26 Sep 2025 07:09:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB716C3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 07:09:32 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6nKqX021655
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 26 Sep 2025 07:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FiMzZ4vz22Rl097tXf+wFhXKFt60cY1ODkrhVnPMDCE=; b=J3qVcvXYlUuoRVqy
 lRjFU5FuKBu0X9L67bFI4kTqDbMAJtUQFL5w7b0crDrJwycWq4V0hzLQ3S3W9wFH
 UF+MnnXfmDNDWtt1o235ygNStK1U5hD42Y6fBUvampYbuMB+WtKMHWnhVhIcEzLH
 yyV3FK5FfJNfT9zGf/+7dwaaRZCHmwrF40yLxKZ1/Xppj3lCe5c5/5FtzD7mc8gr
 cW9Mex9W/kS1uvPV6aMZz/HHBqrjDBMj4qw7VRGvOvpy9FvppBLFoc9DMSkgnizo
 Ho65NtBMoHW6X8Ie8sprgpmS5ImuV9Gt9PDpYv6ccm0UNajT+6Ofmc6ALRfjQ4s7
 sOTCfw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qst6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 07:09:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4f86568434so1378079a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 00:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758870570; x=1759475370;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiMzZ4vz22Rl097tXf+wFhXKFt60cY1ODkrhVnPMDCE=;
 b=W9iSCSTDipd/WrCyPSUaspuMpVBkXaZQtwRvkoFkCXHESCu289WRbvlh4cul3N9p6C
 m3S+QgXaIKnjrEnutABL4M6OcavdWsjol2cjJPxgUsHOHSXq8keMq8KbxToR7UhbsJr/
 ayY3Wk3xOp6KQvaukq179rVaxHkeYofkk/cvqPhdgop9m0FT5txe32OCRm2j1am/gWQZ
 FGmGs09419NeWy+WmolBgB7l2WT75pA5NZoSCdSKrkvFK7ilcMHh81tZ4TsCMs1ugMyQ
 osP1QjX4xjmM5IEOOdnwaasLVFnv8jp5At9/lIXUW8zBr3KGNajP22Q7kfVSqcbBD9UO
 j7yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH2NFulWIExbgdMLavrcbKgN4xJYpVLc2/+tmz5oU5kZQZV2WrEwkFSsbjjfZwz4owVvWQZGKvbuVqmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAAtcSss1JiHfuwVXql3khRKfhdkK4zE6YrWYKfNQg3YGOU4zA
 a3ymwTKCOffOUOOn0gV70Ey2152O+A/IwGIYsYQaQrDjOuHfs3UASFcTlq68LG2fp1fyBY40/ss
 4wAXIO0/NZIaZDSdO2a934c4xPvrq/JhHnWa5usE/bSvWtkV7s04mVliTIqp6hWsZcyrBkBIEaj
 6u5BxcL60=
X-Gm-Gg: ASbGnctAnFu9Z5MXaXQE1EGFuBf4ovmQWTfL5X1nZ8faLuxgSdkk97PB9hOLqlXqvZ7
 I2K9FD4J42pka4kdt/ejqOnEZkmvNW2HClTNuJWtt0s7DVN49ReuKAUJ5Gnax1R/6auABUxTfui
 te3Bc9genc6OwuoGLJILPylSXsaH3gE6ZvlqVqm38hY0E01Nm3B3XASEa1H663Yt0anQqGlEpZ1
 e3AhfjxldXk9MQpiMhMobIzWrnpK8YrpNtJ36Rs2VTYgvn/F8SeHc/t829WEjxrhLU2bUcqy11X
 OpnGtRl54+m0D705DR5Zr+xjaBvf2FRk9bbAy2H4fkhdj0QKzgQi2FmdwQyYRp20buiW
X-Received: by 2002:a17:903:32ce:b0:267:c984:8d9f with SMTP id
 d9443c01a7336-27ed4a0dba3mr75468825ad.24.1758870570323; 
 Fri, 26 Sep 2025 00:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqHGrxe8xhPkP6vuNLzQiWx+Rm84GN1CL+4+QaWX56Yg2h/x7LJeftQZFHKJ2KkwePgdl9Uw==
X-Received: by 2002:a17:903:32ce:b0:267:c984:8d9f with SMTP id
 d9443c01a7336-27ed4a0dba3mr75468445ad.24.1758870569854; 
 Fri, 26 Sep 2025 00:09:29 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ac94ffsm44250615ad.136.2025.09.26.00.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 00:09:29 -0700 (PDT)
Message-ID: <b0541564-3ff2-4cfb-84ff-1d3d59449f86@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:39:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
 <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
 <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
 <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
X-Proofpoint-GUID: 3y7YxOUHqBuudYyceRB6tEqRXZQipga3
X-Proofpoint-ORIG-GUID: 3y7YxOUHqBuudYyceRB6tEqRXZQipga3
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d63c2b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=hVoh_Pt7g2FPdimnm9wA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4JbgBDMIZ0in
 BnuWfykipwdVM6NJRJaaHxuRdLVYVQGaDyb8aH6Dp2qwO/74CFeut8dYn80aKtqh3bNAJiZSMSJ
 /xdhzDQTynnQzcZPCjkVJ8cJoMNV7AvNoQvsxD/0CXFBa+zo+9RB7QerJy6RShTL7HASh8Vrrq7
 8opDbUi9SYjaapfHzbw7W067FJSu++uHF6lFfBBexqCNHT/ndfYnJE9GIv9uP0NiJL9x/6Y6lMk
 49cyHSDl+MVWcApZ55MpDrg5X3Gf7fBVvFgxWx6dV6lTrw9iYLRihuiJxliXcYWmZ1YY3cYETcY
 apll8mCyyW2aknqdm1M5p/H6ewTyfXqLRX9fh0BKWZ7eEEUuaPRTM18iwTvczu+fTdpUCYFnQbF
 elwjYy6M7ExxKOKlyVU2sOQ7dNNDXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 3/9] dt-bindings: clock: qcom: Add support
 for CAMCC for Kaanapali
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



On 9/25/2025 2:31 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 09:46, Taniya Das wrote:
>>> BIST == Built In Self Test ?
>>>
>>> Can this not just be put into one camcc header ?
>> These are two different clock controllers CAMCC and CAM_BIST_MCLK they
>> should not be in the same header.
> 
> BIST means Built In Self Test ?

Yes Bryan, this refers to the self test. However, the hardware does
support functional clocks for the camera MCLK.

> 
> Is this really something to be upstreamed ?
> 

As this block supports the functional mclks we need them to be upstreamed.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
