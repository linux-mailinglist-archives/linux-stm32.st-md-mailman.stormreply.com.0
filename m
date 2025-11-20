Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E443C7340B
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Nov 2025 10:43:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A4A6C597BF;
	Thu, 20 Nov 2025 09:43:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2918C55590
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 09:43:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AK4peWt047819
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 20 Nov 2025 09:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=; b=hkocuJ4ZWK85qWo+
 s0wPA0FzDYrKQywcYqNCHNVP3nscP6gVXuSku7GtewMtk+eF7Hc48x6VAdZ1/TXf
 Jx/3kTd8tVU9FPktqjVMpK7NZEuHCmlP2vJXQ6/L8o9neG9ygrST9RAiVRMfTHjP
 Ch+Ru2t/9lfHZ4jJcxUj9Zq9im1rf2LoTUKZbL81T5nPc3DvH/kRR/NZOgfHcM8a
 s7kh3wOUI4TGLJmcmjOVPZ1bHdfuVTK7f/6bWAtwAj+5F5GcK/4wuEBeaJZfwvT1
 nH7TGTXYVoVsglJdF1V8sQXerroM5mKac9lUr9i8o7UUfRMKZx8vuVbaPa0QXYgt
 nFfNXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahcqnknrk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 09:43:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8824bb12211so2235096d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763631787; x=1764236587;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=;
 b=IfyCTXaI8A+QMGKo398kNwcUYfKgbSpwpdTkQAN1cMYxzMWe0sBloAkpTByaOHakcF
 ZvDdM/7AAdRHa5D8RgRCw4hsZ11ZZqPNzXDHZ+4YzdvB77SHKVOeR8jRPUQA0GvRyxIq
 vo+4wOkmly4NmvgX4DCdUB1nKM6Yp+z3nGiuoWd0NAIrCOMJUU5N2DIo0AI7UlzTh37b
 80CiFIEspjSawWo1wwe+T4MEDIlSVL7+vXXQD0Uy7KFRbKe8mNLIvUC4LwPxZQLTkA9R
 62pTEyJ2Ovwg1lQitDefsCtuKQ21Q0/yTKFJ7rjAe3zYtKKgfnQj/yUKmbGAK38mKsdm
 n1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763631787; x=1764236587;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=;
 b=XdCWexb61SyW0bMb2fWs5BoRFi8cXrHXN9RVsWDG886ZGrooVeKDaOMBlW0QOWoH/X
 cNeZ5NXYkUviy1wi4At9tqvGq70Grx+B4oCV1Dk0tMfsnOVgh3GCxx8mzgbJt1AvsnYG
 L/Js3UsILEGGSFuHQn1AP5YkjOHDoPN/pZGkHu0lwDzHuweJ+XoHxhPbxa0MPQtsG97R
 1PDQ/H/csRhW7JJ3ydVJ/x8DGIcWjUVe/64nHjQMAJv4OThPd9x9U4Qz22W+FdrzKuzc
 +mSlnWo+hvcfGtfy9rYnC/u2IVtBI1poxqaVI9SjqKgOQJWb57cCWTaL+KNKoJdX2SvW
 8jcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmy3v3W1T0mWFXQCF3ihwt42ReeohX0WDu0AecNY8273HN5qGaX2XCvRw1QNJmAVzT0cCxMHWb5h1CiA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyOdekF9T435TEvjIQK3avAfxUS2BevxRwBOQcbyIzg+EF1Og3/
 tjCpD1qQlxXPkNAiuFTDLVb7PPpXDa3to1TNe/e0NtfBxvjc5TZzciHs63qfYVVUv8ZKXVRm1PB
 +zlqxXrzeowrAp588uLY4RrwEiD9yC+bfuZ6fdLNk2wKnh0CWq8wcJA+6cSkFww3aULUOLuRpbE
 eVB6/R/+0=
X-Gm-Gg: ASbGncvjtcby7Ft8aLR0IxMuerP1INFsFsc4lNk8xW6ncUqydy+4uFdVxe6DtIrmKT6
 enVa1eHNkAgxMISvIvpOU/16YoN3Y6c7nn7tY7/ntuwy8A2daWoyWALmTHLFkDFjuUUvqWwgYPq
 uxXsH/U9xZOrLNfxkW+EV9JI0juTqBbnweI8u5IGKz1Jg5osJeNYD7a9NMlV9caS39AL6O/Hdej
 LknJoMKlBFW0VOplghDQBp1yDedksa4J/o1BojzOFs7cSYxRSL2/PuJ7Fj+4pUISk1XNXVg0W9H
 n1zxTq+oIG1lIlhmECO9lRAUhtR9VgHe/K2Q8eY5A1DqYAdHebWir4CEM2tPdnJyUuXTAd8ea1e
 MfAC1/FvTHiOfSHod2HhmoQCPbQ5s9Gc6M8+UvZBIfkd7aqrlax/WBQ5OIK5ZOBOOBm8=
X-Received: by 2002:a05:622a:1882:b0:4e0:b24a:6577 with SMTP id
 d75a77b69052e-4ee4943ffe2mr24836201cf.2.1763631786978; 
 Thu, 20 Nov 2025 01:43:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuygrM15eYuuL+Eseo+gEcRRrz8pankqv3+qIrqVyy6fDxxjo0USx1x43jtWRb6reybm1ooQ==
X-Received: by 2002:a05:622a:1882:b0:4e0:b24a:6577 with SMTP id
 d75a77b69052e-4ee4943ffe2mr24835991cf.2.1763631786581; 
 Thu, 20 Nov 2025 01:43:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd43b1sm163235466b.38.2025.11.20.01.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 01:43:06 -0800 (PST)
Message-ID: <b8e5d6a8-c6bd-49bb-8308-a8b5c390897c@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSZ-0000000FMrW-0cEu@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vLgSZ-0000000FMrW-0cEu@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1OCBTYWx0ZWRfX2N1N3U5gycEh
 cF/uFYLpHCZ2WAveZ+edOvhc4Kpx1SHtG36bx3wSNDNTLdH90pnAbT75hCJtKlKNNi/wOimUSkF
 2Mq+oTfHrbNfx1EZpadpHGN4CBHWlcINmJ+u/ipEI9GYq4NACIuEasy2y2sGdIn1AnMWUQ0GyvL
 pk1dkDBMwq2QO1rG8sZMWtS4TR54OqMiYAi/bLDaFz90xezQZna7FbaTnAVCgmt/gVaHYM5vs2J
 +52wV9cCQCHF8sL1A0GaiFNlXzFD4YLJ3pvWuw2jucwWKUirWrzjdHSfAJC642ecFBdy2YY7k6j
 3ynUPUxjZL8IHi8Z2V5+O0CN1Vcyr5KM6hThJ70DOqQMUcD4gy2aB6PPPb9Bvp1AWLbRd/BQVCF
 JqTU/FvOY6zz6PWCoveTqSlLD7WibA==
X-Authority-Analysis: v=2.4 cv=ApfjHe9P c=1 sm=1 tr=0 ts=691ee2ab cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=OSBbO3HZz-0BpLb1nxYA:9 a=QEXdDO2ut3YA:10 a=THfFRngN91AA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: bejEZWYG-Q0_oodnKL4MBmrEUJcRGQeM
X-Proofpoint-ORIG-GUID: bejEZWYG-Q0_oodnKL4MBmrEUJcRGQeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200058
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: qcom-ethqos:
 use read_poll_timeout_atomic()
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

On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> Use read_poll_timeout_atomic() to poll the rgmii registers rather than
> open-coding the polling.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
