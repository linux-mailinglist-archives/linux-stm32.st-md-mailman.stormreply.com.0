Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD1B9F0655
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 09:27:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F138DC78006;
	Fri, 13 Dec 2024 08:27:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5134AC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 18:19:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHOLPo032522
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 12 Dec 2024 18:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GKtNCOtaL89pHw3G7/FzhB1Ks2fBiwK4pFoXlWgfkeI=; b=o0FIywXR9rpDaZOk
 gN/uFkjNFvMH/YtED0Junfo+qOBJaiHOnU+zjfx0r9K/Nm/AHg9hqGSlhE/07wZw
 b3UiDKFahAYRr4haz68xf9H7oKTD6fWrOZWimF4vLcvgmfDfunIMGKqj1OayLAB8
 AOSKsh1Dl0drIz8tWc2BIbri3DRleQIU5aJqHA5hQ3EeeYHuZUORjvzmKkaaJQV3
 xdIovlDrIpmYz/69pMs9GvuQ/KfUgomznnCEZdbJBQ/wMXaOr0DqV1FO+/R4Oa19
 EX6y/Uek4/YO4L6CDhi96GB1dno6TfP9gESfyp3k+98f8hSfeuN/d9IJzSbrziso
 w3uEZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfd4bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 18:19:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4675a6e05d7so1723421cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 10:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734027591; x=1734632391;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GKtNCOtaL89pHw3G7/FzhB1Ks2fBiwK4pFoXlWgfkeI=;
 b=FBIzk71hj5/w/657f1lebB+zZ5f1CMfm7ZLjghXxcWI9gtjHtUbsnppdd/H/IPNlLg
 yu47JD3EaxgLnkwG5wVFmbDIPW3Y5yp5H8a42oo4ecXMwHzFRclVqhwaIPb8FMOD/Yfb
 /0XsrXYS9uCd2K8OGKYNozH851g0JV2cyyldzMB1EMyexHhQ1p4TWkaUmkBcLBsQq6zF
 72KDOCaZ0oTNuf2awElBc/jDod+Gnl6nZxp1gZhXsvzZOW9jIsjGeqZndtBD2/w019Sr
 hHlfM0m+2eTlVE3WDZu/p1jpmhihL8MzyExbZJ9oFSgdSuaEyojuCHqU7CoaqYr19Icn
 KPFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBptbSSW9EoydVa1J8t0LMtGW49VdT1++J9JByiuY3AZl5z9sxT3rQMtplZISx12WPfXLljKAmzpW4rA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzdb7QfBGGwFeMF/mogu/0V114zxZzdZJ3vKfprUfPSCfmjQSGG
 Pdo98ugkcU9AOKN1aQugcep0pkqeq82YZaC+upgG4HKxAb3xZlZ5RUQnJaM99VCPVqrdDq04zgt
 YT+bwJd6WpenaA9z74WjXOwYE4+TK6xFyINHLqvPWBsDbVOvtHtkwTqDtt9wurzWg47HMWlMd2+
 FsDLk=
X-Gm-Gg: ASbGnctYqV2zKXd44UbjdjYxNaPrzD117OAdGrWRbxUBM986u5iskkCVUtz23SL3K1Y
 TCj6ZYaNQATft5XUmZt+msozXJE9M238DfDD79Pn9q3lKsd/1YWmYC7h084KrXtvLA+jpo4gd1N
 xK55pnawSFSTCK6ILvWiNTaJJ0w2nkB3KLWrTLk5ZClhJATe0z0HuGX8tg0+YpzJthdOaenQA92
 QQnxxS+zzaPjzP6rFtxiDP4Nknpd9K4l0Cvr/OfPDnM7WGoqlSxV9J+HzNfyHIByqL+C0RqZrBc
 Qqi1N//OutvNCXqQYhuOW11Zp9MMnVbwUlgG+w==
X-Received: by 2002:a05:622a:1a87:b0:461:4467:14bb with SMTP id
 d75a77b69052e-467a14cf99fmr7175711cf.2.1734027591079; 
 Thu, 12 Dec 2024 10:19:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC6KrQasDLA2/zeHAKapqCU8kql+Ub/Gc2FmOF51LQmMz74nDoscHAYcpWpck4WHEyFhI9xg==
X-Received: by 2002:a05:622a:1a87:b0:461:4467:14bb with SMTP id
 d75a77b69052e-467a14cf99fmr7175361cf.2.1734027590585; 
 Thu, 12 Dec 2024 10:19:50 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa67f26cff7sm672205966b.57.2024.12.12.10.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 10:19:50 -0800 (PST)
Message-ID: <8c60e0dc-531a-47d6-9c40-ea157a24da1b@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:19:47 +0100
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
 <20241210031545.3468561-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210031545.3468561-4-quic_jiegan@quicinc.com>
X-Proofpoint-GUID: lxKoyywI0esGRnzfvdRXypwWwh0YmPxe
X-Proofpoint-ORIG-GUID: lxKoyywI0esGRnzfvdRXypwWwh0YmPxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=975 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120132
X-Mailman-Approved-At: Fri, 13 Dec 2024 08:27:41 +0000
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jinlong Mao <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, coresight@lists.linaro.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 3/5] dt-bindings: arm: Add Coresight
 TMC Control Unit hardware
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
> Add binding file to specify how to define a Coresight TMC
> Control Unit device in device tree.
> 
> It is responsible for controlling the data filter function
> based on the source device's Trace ID for TMC ETR device.
> The trace data with that Trace id can get into ETR's buffer
> while other trace data gets ignored.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

[...]

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sa8775p-ctcu

I don't think anyone asked that question.. Is the TMCCU something unique
to Qualcomm platforms?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
