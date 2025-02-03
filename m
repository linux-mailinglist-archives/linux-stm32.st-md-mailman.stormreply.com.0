Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1903FA25B60
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 14:52:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA008C78F7C;
	Mon,  3 Feb 2025 13:52:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AC14C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 13:52:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BEmaX002591
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 3 Feb 2025 13:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pkSYbDqaSwny2usVYAuISCwLWlA3g2QgJUmnqeBMSg0=; b=FrQQsG/izShyy9H9
 1UTtnmuTDFZtS8bqaCaxbx3HQPCRNeZ5KMcOAMKF+tpJWNfTyFLTuX/lDRPiqxjo
 iWjdCjXeSi12T9ZrDkHatJznA3miLC8aKRFYF5SRCe6HzRuPAu4wq6dJx+m9kT1F
 OD3ISQ8GWUFwenWUSjZTLI4mTtdbx5yXefbt0dq2qsl5PyeaYMmt1qcvC1xa1GsE
 01c29dcq0uHpPbtu1eC+cTUmuK/K2EyLkLb/uIjC3M6NUKlbFAnaw2whVDxBasOB
 m3aCPRq0pbxrKKeR6ah3xjhXe29PCzj8WIBTb6/Bdw+y6qOLsTBJ/HrSe34TfAo8
 Twgb5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jvrkgh0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2025 13:52:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d880eea0a1so9741466d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2025 05:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738590731; x=1739195531;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pkSYbDqaSwny2usVYAuISCwLWlA3g2QgJUmnqeBMSg0=;
 b=jCKeZfWmRgLhkPcDfUJoLnSnXZLpxUKUrO2wF6rG4rnVTCNoC1uWxrt+2uDhjZRRYp
 MMiFotWAbz59isQvqSGhlUw/3LH1QcVqBOQANumzFd+ertIDOmFQojrbx2sFr+t57Qt7
 2vOyOATgAoTw/gCyK7O6ixxdmdXnaXS1O27TvD+Tlb2rGAL7V5ZgL5b3dyCdWMlhKfg5
 yE9rNl2GVdgaSj0Y8h1QO0KFz8dkRxADd61/bpw/HwxPw+vO16o4IdInctk5H9LSGrhh
 zG8C8VsRoYhqV0o8CjYUiWqtudanznBVICgH8rRlzasJNdeh4sVmxUC6uQ4/Lu3UAixK
 sbGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4t6fJxZJXKCS5npw/pesZT0cvuhNgxB4Gry+o5ZTZXYxmug1vq7YMT8+cPrb3CaJdxALYSVIpwQblew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXhzbHpDfK52s6LLOwC1dhJaJk0WwNcaoqGqjAhXT1blrM+ptU
 V06EnsRktvRraCeTAQUHWT3v/qg5DEIfN4QeWc9EVRJ3Y6hBUFdFBdy5Ot5S/gmsI+OdFRxDxEt
 GHR5U8eCE1b+xZQaGcbuKqX5p56157UjERi4AZlwETqrACWFyjQ2fCDSgtsn4NTr4zodz8rYeiB
 eUrDY=
X-Gm-Gg: ASbGncu8TWPeIYuWjI9M5yjnLbrbRO/64DZXLcS2oSSDG9FFiPNSEzU3OvHf8AbbRvZ
 cPqr1tiGlufs5P2Ik1vGpMp1Ne/cCYrKT7NJffVc0qne4xDmSR8D7jtGYG0R5x/b2oLbnOI+Ug/
 uBg7oLCfpdWMyk41/JRsYS1rmQwCHnu5DAlO3I5r7cxEtYUcL3IgVKeutxKlW7x/O5evmEWZgeA
 6GujmQI17jQitQETnAA7n6FR94xcnZPFYmwIhEIlIhiV/7jNlaO6CMVuKgqUlj+pv8JWOpFDZss
 +mWJpiuv65vxI3N6YPLo3jiluhNv1fyzrHhJCIH/0fLxC6r34mVCc+bGtK0=
X-Received: by 2002:a05:620a:254b:b0:7b6:e9c0:9c3b with SMTP id
 af79cd13be357-7bffcd0a31bmr1196149385a.8.1738590730944; 
 Mon, 03 Feb 2025 05:52:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt9A1Ywm1nPEK63UqBS+e6UYwlx6nzIpdhoFy2TYlNeJUUhk8BGO1TQBd333vNW/v3P8zaqw==
X-Received: by 2002:a05:620a:254b:b0:7b6:e9c0:9c3b with SMTP id
 af79cd13be357-7bffcd0a31bmr1196142185a.8.1738590729156; 
 Mon, 03 Feb 2025 05:52:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724aa0a8sm7559984a12.55.2025.02.03.05.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 05:52:08 -0800 (PST)
Message-ID: <21b4813e-b5c1-40d7-b536-3fe65a53affe@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:52:06 +0100
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
 <20250121-dts_qcs615-v3-4-fa4496950d8a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121-dts_qcs615-v3-4-fa4496950d8a@quicinc.com>
X-Proofpoint-ORIG-GUID: 7BIlwUB7HTdGIxJ4sjFajikHrWxIszjC
X-Proofpoint-GUID: 7BIlwUB7HTdGIxJ4sjFajikHrWxIszjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=645
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030102
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/4] arm64: dts: qcom: qcs615-ride:
 Enable ethernet node
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

On 21.01.2025 8:54 AM, Yijie Yang wrote:
> Enable the ethernet node, add the phy node and pinctrl for ethernet. This
> change is necessary to support ethernet functionality on this board.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
