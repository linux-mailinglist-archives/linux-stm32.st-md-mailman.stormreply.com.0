Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48DCEEBA8
	for <lists+linux-stm32@lfdr.de>; Fri, 02 Jan 2026 15:04:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9CEBC8F280;
	Fri,  2 Jan 2026 14:04:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A62FC8F27F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jan 2026 14:04:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 602BnlMf1095111
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 2 Jan 2026 14:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=hiUiWEBwMnNLAklc
 Mdn/iDZ5S1Ojj+YUIDgMWzwynsLFeHLgc95409459dtRgAoD+ah6IAI7J3HDgm2F
 iGsrhafq+9T1vcWC+a9uyqW2yjBcmLeg5ZAm4ViVhMal8b/YU/tGO2+0yN0sjp06
 mmYHFtkRXO1EjmabOBfrG5BZMj4qgrRj27Ej6K+bXYGnSX/HJQwDMRnECsjNoA7X
 8yuu+Uq13kNoL1e2wMQ/Cr97Qz6Fwp7vrCLyCoQmH8y32i9WmDVER2gBkdQabhOT
 vAik/WgXoUOfMIuo9A8YvE9aPTszAkJ+mpRQu60bwvsUWkOrEaB40vj8YO9mtlPx
 qAPpfg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedg407c3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 14:04:53 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-640e5edbce4so3123812d50.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 06:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767362693; x=1767967493;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
 b=I29/FE/vegozmMy89NhB52ynCHbJz7QEG4rjV1Gt4i8AAfyxlSfUqTzn+CDGc3LVJo
 /Omm62QO0XAnIYOAtaxZvAId79mDbdSCln4Su7dGoA7gs7Nhkm1V50pyu8OFGO4+f3RC
 6b6lzCM90Le4sGXAFE6IVzgy28Jqu2Ly+gVBH2DY8JeJ/bV28nskpfanT4x3LBrIm3ul
 Gf84JWFaT9g2b7/lehHkzf0Lff8bovUTJzewnyoJdcjWanvaaMOhmTF8NHaIGlGFZqo2
 FPxlqvxGXGjDSyVzFOjEO0fmX79GbUgzyHPEsCdtNk/+5Wz0u4rOrS4nySOJ76AHm08w
 iegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767362693; x=1767967493;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
 b=PSoCYjG4C4GjGMvv18wvndEblyZ2knFWMC3mvHcVPt9IBhuSdQ+5K4j0D8Muqae6Br
 SnNZ6ucpAVr2miGQ9703SuJhvwMg7rHGXMursRwlRY4OQrsT2XfSxaelIWypvFxEFnBZ
 ZI59nQVOerFg2m3kYsPtzzLZuQKW05KDWBTkGqqP6/GrtAmzrlu2wJnC+q+pw4wLJGbx
 c0SA0KdkXBaaP1JpJ0anNI/O0uffzi7keQQzqRtazblMVu5iQWrlmGpFb6cN2LsqhioY
 Vd6sj3UbgySn+8N8I/vg4uLEgh5CICzyykA23+A0AA3ess8MTTkvpPzktW+EH/JIieXW
 JXAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPvstKniUs2kHi4HT7VE+1/wcqGkVw/GHYUgHz+Ko3i43P0q014eYh0GlD2OWSDYABhaURgr1RleBTcQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/DAvsWeSOxHJFw4XlU/eD+pkfcQNM9QVEJWjL6NqbEP2VxmGs
 OXB404oZ1rJat6A/6Au4JlXVgxRqXS7MfRsOhkOTiThkJAGzAPhFsuCOW5Yiy7gB2BUB/KSDlbl
 Ac8EJ58PME2+tnHg9EKS5iGUnxoaLaHEcMlZglC3sDDVjPRRY+ib557D9x7L6afEluVLX+oesKw
 8OnjO1P1Q=
X-Gm-Gg: AY/fxX6poxFZeKkOhJwVyhnU6+ATen7YGKOsWM6upu7PJOxC4R5vbyqgPv+4mMN1Xnu
 qdnby+FB8QqxMpgzmIC9dHgAOd+HahT4uMWU7lYSCjrp91a2RbsxGcr1NBVuiC3u4dVDIR4jKBT
 xF/l9N7dnrxsmCGra5GB5GPz7v6bmA4SUgw1YZOgBEALOjJZkZunWwGBZHR55XNL7ghCPSTmswz
 V2UtFuURUreu07RUC8uXjx4Chda1NS+MxSxz27xJd61yVyG4DuPsrD1F5CUDUZKkqbiR/YkPmfo
 EyRPLotdM4V1FDQRk53W9PCDgkxekYaCN43gLq9jdW3ReLf9HpQntxuf4+atf3UXdDKMgpb9h89
 2LFUO4pZDCEWnox4VWhvgu847mFPtYJKzyqJSbJ6DplMGEL8xziIttG96fa3qyIyQGA==
X-Received: by 2002:a05:690c:660e:b0:78f:c442:57bd with SMTP id
 00721157ae682-78fc4425d4dmr294187847b3.3.1767362693354; 
 Fri, 02 Jan 2026 06:04:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcuVYNEGxR9hACuiPoXsy2jxkn+9H/E2BmtBs6xGRA8g33A//BqoQw+Eh2o4U0h5D7LKzxRg==
X-Received: by 2002:a05:690c:660e:b0:78f:c442:57bd with SMTP id
 00721157ae682-78fc4425d4dmr294187647b3.3.1767362692979; 
 Fri, 02 Jan 2026 06:04:52 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0b7bcsm4718340166b.49.2026.01.02.06.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jan 2026 06:04:52 -0800 (PST)
Message-ID: <0707bdc9-001d-4601-a26e-f5645c8ae20a@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OOu5N5Xcq0LioVdoTfATTMINaFNnJ56C
X-Authority-Analysis: v=2.4 cv=IssTsb/g c=1 sm=1 tr=0 ts=6957d085 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: OOu5N5Xcq0LioVdoTfATTMINaFNnJ56C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNSBTYWx0ZWRfXyfoNDpmJTDsa
 QATHRa5NsubypvvFsw0IJprLYYwp747N7cTH04HH2t42seyfjZPoEodstAfyo0Fr4d2cU4pjwMR
 vMGoDRU24PW0Pf8HZy7FDbrqS/NExXWOckhZxj2x1r5u9KDws6dxuQEiJL0hz1/G/gIJNmGQwEZ
 Op7rAvFxX2XJLRIofTNT2yBCI7GY0ReATc1S1Gf4PnEiKYK42JctJIbXmnsmaAwCKLbwz+ji4nh
 R+YmqXNJMio4D7DY9USd/pbhkzPx7lXs1zQ/cqU5IjLf5Q5vHOz8yTS30rRC3w3yT3Pa6ovMkSU
 Z2y4Ch92iUvbuCoyHygjmVZVLIkPJXd7qCUZDW0FFcznkM7GHiaACpG7HYLWLQXNunBwUyAsOn1
 Ye3pUwhMZhdBnBjuLGj2Ais2BaJ1AkptmTExAtB6xdwQZyLi+BIw9iF61JRAa3u+Vr4XOW/Gt99
 1mdd8gIVFqHU2kMZbTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020125
Subject: Re: [Linux-stm32] [PATCH 2/2] bus: stm32_firewall: Simplify with
 scoped for each OF child loop
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

On 1/2/26 1:50 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
