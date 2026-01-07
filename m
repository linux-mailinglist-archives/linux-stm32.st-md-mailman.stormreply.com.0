Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1824FCFD6E4
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 12:38:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAB8AC8F281;
	Wed,  7 Jan 2026 11:38:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23E25C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 11:38:32 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6074m0Pe1642747
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 11:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cTH/4ZeodwA/Q+RzWHaBeEgt
 NJJIoFwg96ta/DUybCQ=; b=OZOLRGdbF+iM/6nGiViEWp6GUVmJ1jbNqw8BDRKy
 GVRMBFHZbDKcdByXYp9f1Y2L25UOk6U1YXqXadHLdz/z6ORpu9vLR8zZhBkwKGv0
 4mf88z583y1k7VTLxclG4zVIwN5BUB7tSbEziwxi5nFlnVmX310ppbpU9wK2POSi
 FtahubmmKFvcRx9S1MBjShx+9W2JSed33cU1hsKMs47z3+lNhBE7GGcWrqGheKN4
 PKKtVkDbi3ovCo9yDiUukmkP1wbwDW4HA2wnDkfd5sm4jZXr7o+jUqbWSRs3zC07
 7cesJYcAew9cWh60c+O4JnZEsS7p/3MqLFuEyNNFXy3rDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfh8ay-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 11:38:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee0c1c57bcso71552051cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 03:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767785910; x=1768390710;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cTH/4ZeodwA/Q+RzWHaBeEgtNJJIoFwg96ta/DUybCQ=;
 b=THwrbt60eK45JTnq8TzEBKX522byy169Tz/TzMA6oEKhq4xcZWmBuvGBrMdF9StfWj
 StkqUCPGkmOxQz1TNGa0WHZ4jHIxKzgQjwOOZUndlc7tjdDZWV1vLEyZzEi5k7jojsEs
 Z22zcfKT61Mv8AjIM3P5+wnk0jkgwrargHgZ8MhR3q4FQpz2bd66b8EReaFjm5LCam0z
 IjFrpt85xUcno3iVIO7fPsaUFyjbrRqILtRzt/EewG/vhfBlXkhJH3MBgOLIAbcYKnnp
 vCGxjvj5p6dr+sRqt1IYNDwwhCcaW5wjfD5qTFEykIpBjXn4ivvNlmEuvFNHsDn9P5kw
 AjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767785910; x=1768390710;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTH/4ZeodwA/Q+RzWHaBeEgtNJJIoFwg96ta/DUybCQ=;
 b=H1ZDxhtmfs4zZtJG4bYqz1RrtBEKX+PSaPpQxnIHd9tI8NOC+VCmVifhbpdoYt2ehc
 W1HI0s/HcvlSH3zuzm1e3JBU21uzAml0sJq29fQ5AhWV2oHnTbvFiBr7L12mNIGRbsbx
 sjN9YtSrZnSJCng3UznQUFgNr39pqK0+BrTbSdSiaUYFS9E6ijoUg/2IOO+k67ybF2v8
 dtHed7F1r8SzwP2jysBoUkqDFcH4TaxoLZHNnPwBJcSVGvyGjlLcEd75Ufta9J4Y1dZw
 yhZFMHRtyKiSqevLiqQOEE6tMTDYaCCmYH/w76bERIDNz8xQiICguzxR8ozjRMWvMeKO
 ziew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXStcIrKGep84k4/HmlWWQQAISE4zuJQ10PA+tcB2Ifccl8nLAbnAabnj0RGjIG3Xl6rChjtldqOqwxDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxxoVbz0HZEk/R+bzDUwBl25sHKxdIfqj3wuNXc8ZAj85uAOk1F
 g99DcKcfHtWsY2nQfCLzuAaLWTookJHSScJR5FSedztwyizFwcq/K1MDf9B2qWNN9fgvcB6FjMN
 m+WLBrPUEshwJifS7mYtss6RnDKwxGGeljxSoRaFfgmVnbGBjhmFm2JdISLJg0Z+o4zb49L8lF1
 WL7Tf8Zu4=
X-Gm-Gg: AY/fxX7PjeLDIoudVMCYJcKRu8tO29o+LkUDwEbYBrvNyOYwHkvxUj0sfKjgCGfVsU2
 Tv4I1UeiRFtHwagxymjbj8XxzGZB1cuXt+WcFYEnEj5Jn8DjuID3pa5Vl8+V3HH8BExA0Et9K14
 Q8lMOFwramh8tbWPTTz7pXc/Mgxob2/JObj3RDTytxQEHmrbdeQY7+2Ycv9eqRKY4ppaahzBo5s
 dTK6VZ8rtNzpuA9dB4vt70QEW10W+eU7FO9U1Rb8VJQ3npJFONCwLa3kW4n/olROf2KJg1huHIW
 vP7CAZ2GTjgcbfiKgGQ72dqKsHAlhb/JAU2TSeWkpfleA62N4yHz5eeXuk+i1H7Pzy5Fy+7rnPb
 R0oRN07zuEA3NUkUtXetobJVBDUOGZt1ZTIljchY8N7rA63lF6gXrx0IJIGElO6Cg/AsGJa9ORc
 ESDZWLgYegjmcYOQZtP4s54lA=
X-Received: by 2002:a05:622a:20e:b0:4f4:e15e:528f with SMTP id
 d75a77b69052e-4ffb49c7d3emr28885841cf.62.1767785910437; 
 Wed, 07 Jan 2026 03:38:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfaBxfXO0EARRWs+zjZ9c7H9zOXqTKVd04HB62R5Cos9qRCEQe2HmgxwEezgO5LrfADT4Gyg==
X-Received: by 2002:a05:622a:20e:b0:4f4:e15e:528f with SMTP id
 d75a77b69052e-4ffb49c7d3emr28885451cf.62.1767785910039; 
 Wed, 07 Jan 2026 03:38:30 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65b89842sm1242653e87.0.2026.01.07.03.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 03:38:29 -0800 (PST)
Date: Wed, 7 Jan 2026 13:38:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <7lbw6rrrsxitcldgahf2wwqklzy3nvcmem7aylsw5yvbsbom2b@lgel7iicehrf>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfXyjO/HzumeeNK
 uTSHgfTsm+G9PdunBR85YmoLF6jZe6/1V3MPjFhwDv0JVlklnynIsRQjEwwlKYswB9wBmTcD4rq
 pnw2e2vAGmic/omDeqeOxieHrzT+0csDfIXjfvcO7Y8LQ9x1TiAIy7rrJvbyUkccOOQYv6YvgjC
 LGGFKp6OaqXFDqnB3ltG62/njdtVPXxv8XWnKcCGnfNcMQvIU/0uQgnYUGtSIRnw3Q3dpaRSVUs
 RJia9pbidXDBZsWH63l2sG7xDv/NSGcvp6ba4PU8LEE0whb4WOfPifHBuIQMe23oXeKmwL7wbNZ
 zUmWUoKmQidNRW0/Z4ai1+7UwdiJqJtc1Wl0EZxUFwxkqKxBenRGRfLzXdUtjNwrKAlEJAPkbvh
 OB2LD0f/YrJnQlDo9XUBBrLImAWaPhPsEhkZgexW+H1QnU5E4w3tUjfyWJRVlVe8CRlLLT0U2mQ
 ieg8UarsJuvYnmu+l/A==
X-Proofpoint-GUID: CAF-UeJhfuxQBWs45y9k3N_BZmuy6-Lv
X-Proofpoint-ORIG-GUID: CAF-UeJhfuxQBWs45y9k3N_BZmuy6-Lv
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e45b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Rar_LHnIVK7gKg-YXgkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070092
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 02/11] clk: qcom: clk-alpha-pll: Add
 support for controlling Pongo EKO_T PLL
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

On Wed, Jan 07, 2026 at 03:13:05PM +0530, Taniya Das wrote:
> Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting

Nit: PLL

> the PLL.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
