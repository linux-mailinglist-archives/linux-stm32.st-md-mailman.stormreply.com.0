Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF99FAE11
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Dec 2024 13:00:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A51AEC78F67;
	Mon, 23 Dec 2024 12:00:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05537C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 12:00:30 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9TTXx016781
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 23 Dec 2024 12:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QV0VId4XPnG7jXmecEC7q4/L14x/wV2XNPe87e8Gr7c=; b=pzND3xLs1mZbBQfL
 LFyQ0K5LxvUjhVkWgE0R2lvPpY+y2XbReqJcUcZ1qNSrkyqLfnu3g7uPzF1s46sI
 N9N+eFbR/xLK6kHCZnIN3loij25D8AKH+9W4gNhIdiWZR7MZ1ONbpS//yNq8F+Nn
 O49TiQZz69mEev4aJ4WL0uPxWOFMviQ/1D8aioF27Q8WIDDJWLiFzuft92DCPqSD
 MXDrJlYJ6yfzDrmKejUUkjSpKhDL83UO4eMJ+Um+P6VrA68XCwNOGaZ4Fm+SUvJN
 3VgBoID+wC2XZt6L6R2nRMI9hEiIWcIZPK+ylQ4hyBu80mBVSi6L5V+hTKXSH0eT
 IIkCJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nmp5gw8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 12:00:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6d8f77bf546so14405486d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 04:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734955229; x=1735560029;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QV0VId4XPnG7jXmecEC7q4/L14x/wV2XNPe87e8Gr7c=;
 b=Aow1BWD9vO1tMA6Z87yUrPHHse2gSZ/L/Io4UHyQ3+i23elXa4x51x9JNz80v/3lzB
 Pad1IYqUk7lPluOX1+e7shtKdu4h06NWPNTUn9g/hVz8RHEP4BxxhuZsmK4tUP39rAJx
 gji6qYtDWqklLXhfpJKY6IzU800PhpYOz+/E11RmvvC0XKsfAF8kB7SaddTdZe5+Gr7d
 uiN5Nt0kv/YkEs6QElZzRKYwMmDVtoISAAn+Kug2tD7qSD5dS8I7qng4SNKuIsTBqNq0
 K1CM9U4dCLpQIeCZENUjoQtg7E5zuLa3gAodORgQbII9rjj4NWpUEB2u31G6bs3gvEiD
 PWhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7kaG/0vSPaizTFdoJ+W1WLvE3aDw0g88sB1Q1TZZNxS9HNgbhNHwKWx7qyL2Gsf9h3vOGax62lQ619w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyjJoy4sGsipTU5Nh0TWMsecSnfI+TApBcPxFhxuFtWQf1WBBf/
 GRslNW4D9XIJngnTTdRbL/BgfUbI0LN3YhMaSMJgmX8IRjuwKObHexE/sdPUbd8piczgaSFFbQI
 JODM5USqeplxJYz03y1p6D+HRNU+ltxokwqU36j9KJvvCNV9onAJx7OKBsexP/PE6xAIAtLgL1F
 IkUVQ=
X-Gm-Gg: ASbGncvRwcd+4M967NiYXqB40xzQUo5eI6Hqu2wcedkLejFrT9B3Hr1o4DsEqyHz/v7
 NumvqXKM/PcJ2NNiIuU7zuaCTzGBQAnpv/hCVI9S7mHHrphOA6yqQ3cNADNPagM7kryDWp7Ffqz
 4vq/dwvRz4JCCoyzTgk8SatwWdXrDPzpJtjx9fKSsJY9FNPtKsSNo050dyNPxgemjHSLNuiJ4BA
 LoSTiwqfXra+hkaAfX6i2p0oCy4C0SGLSZ+urS6Jyg1QF5lNOu/5gUSfIPH4qnjPWnI7sPmVYB2
 dhsJ4cHvljk6AHvo3Ul8RxHzhSlTxwoKj/4=
X-Received: by 2002:a05:6214:5f06:b0:6d8:a90b:1563 with SMTP id
 6a1803df08f44-6dd2332ecfemr68470886d6.5.1734955228895; 
 Mon, 23 Dec 2024 04:00:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE07MyBvqIKUXBpiZsouFYlc+nl1/rZ97d+byZH8jLrT56I5P2mnvuDGR3tDVnKH0tgCJCmCA==
X-Received: by 2002:a05:6214:5f06:b0:6d8:a90b:1563 with SMTP id
 6a1803df08f44-6dd2332ecfemr68470616d6.5.1734955228521; 
 Mon, 23 Dec 2024 04:00:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80665253dsm4826443a12.0.2024.12.23.04.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 04:00:27 -0800 (PST)
Message-ID: <e5dd4552-224f-45f7-b5f1-a6a5c695a268@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 13:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-6-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210031545.3468561-6-quic_jiegan@quicinc.com>
X-Proofpoint-GUID: ZQpkrWJM0KqHTqRFsRDnt2yaa05xUL62
X-Proofpoint-ORIG-GUID: ZQpkrWJM0KqHTqRFsRDnt2yaa05xUL62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=630 mlxscore=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230107
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jinlong Mao <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, coresight@lists.linaro.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 5/5] arm64: dts: qcom: Add CTCU and ETR
 nodes for SA8775p
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

On 10.12.2024 4:15 AM, Jie Gan wrote:
> Add CTCU and ETR nodes in DT to enable related functions.

subject:
arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes

with that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
