Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14DCFD6DB
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 12:38:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B259BC8F281;
	Wed,  7 Jan 2026 11:38:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1166DC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 11:38:12 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079bwpI2876927
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 11:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hHrWLmSLNK/AuxYZ0Fr323Tc
 qsIbmfwjvkMStothfTU=; b=cN0gxQdoBXNRBUGFuqRgxaRlBzprukYD5lYhDHbh
 pJCKSwz40xcwrwqkily6uh/EgL6nWBzkttz7gDMRrpeKgjtrl+kIctX4StnKM5Qr
 xE7dqdZXJKpjyP4HNVph54Kvu/feROYEF/2Gp8YsWe60Fx7NzqIOrJnAwe3iGOj/
 K6Q4znLDh1EU8UfdcpxuptPmjlECc5h7m1dhVk+lIbXNBpm3iJZggY+dBSocYQEY
 G5MRM6bFnP8DkR7MTRaidB986Sgmu3O2uHLlrX7hriaJIqu9v8U1HOeWAEMtpJfN
 EoDaq/XTcuPiHUOhd77u1VX3SsZoX99igl7TWD3kNc6pvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn1crbrt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 11:38:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eff973c491so49889941cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767785891; x=1768390691;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hHrWLmSLNK/AuxYZ0Fr323TcqsIbmfwjvkMStothfTU=;
 b=Gepu3JQJ0dUYKlmYuvD0I70YCzOwYNJEPZSeB+W8cU1rG6RQ7fvsLsu2sHzkAr3Nnp
 aJUo/JC5F9jX3R6Aosetft+dvmaJQPUWLEc+ee8IaMkCziMNRojbCfNB95zPRFkjDDjh
 gdl/vIqYcWfQF770NlZpwT68aqsVHqoTGp1bITU6NPDkGDecQ/CXBRH+VAZvXZ+4hK5j
 8HJjhIyweOArSK/2oAxsEtyN02Re18cipjmn3Enet74rNgrGbvgzWDTb+WevMiRK+vvk
 wAeOsMmJXPpDlTnHuMNW+VU2X55v5GGkx77n+oa/umKS2SBdCE5M7bbwzfCQ4DN8xSSH
 TH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767785891; x=1768390691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHrWLmSLNK/AuxYZ0Fr323TcqsIbmfwjvkMStothfTU=;
 b=MpWqwrzJUn5Hs2rvVTC2KnJpoi6pngFyKkfAEdyzFUhsLDrMBjgjdnfgk5TVJOJhjg
 iTwXHY91QMKrqvjnvqwdTrKM/mycZXYZFnUDhWlsEPWcJmkVwVF5agj61ar0rzfIAH6p
 LEHllMRaDOXUGdegJk561vsVAmrqB1H9t/L8EJmpJg+sJOziZS0VDFM789l+Ws060CDn
 2UAMt3QM7sFkOpH/ha8qzfsJY1VLeCHgkehL7bebYpP10TkCjzKNG8cVaj90MgNA79Qi
 H06luPBufDqbSTZPpMh9LjgDciENEXpxoTz4jgEksouDCn5NSOK+cQVGZT2q6EL76mpb
 K09w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaUwkDIpoqnoJeqCn+9c9K791NHARe2OUkoPl752Eb0VQ3+tUXHtt9bU5EGoBlHl89bTvUNB6WhL7UDQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPd3FdgdbQA5Qg3ZUIT6ClhshPUxoga+hWym4g7fiJ8AZAXpnc
 f2C56ile7ys1cYVc0l6JCM32CeWyn7h65Z2LbaQQcOHsI8ZNQXuy++CbBzXo0edW2o4log7cs3j
 x7w8GAYbA1wDGVlitVs6PjpjiARpiQUSyOgNxDTEaaEdPEsEIZ3GXe3x6WP3ktjs9Z6QiajSKgN
 zWBToOT5w=
X-Gm-Gg: AY/fxX6TxXSFUbkJKkb9j6HpUqnM73aA357ec2vIr+k6ELSOE1ie0+1RlpFXoF3Wm5i
 folxqqeK0cpdf9nDH1KSdwy3Q7XFjQiBORQG7kRUl/2l+w+zqJxh0/078mGb4Saf+qP0d9NHpmd
 KuWYKuDY1jlSZGqFVOq0s4m051IPtT2+WCQ0XlItQSrPcnO1HjNqkYzAzpZgaNrO356HjfJr6or
 NRI3mVtvg7vZhc3Cit7j0GoWqyMf6korTVkJp3EypX60AZd/WulZjtCt1ydE/l6bFykFkkNbiea
 vxaJbHcUeTeExxJ1es+E0Gq+zVEPsPQs+eZna5LmeJP2NlwQ5EPK5cykbQVZEpIRsYw96l7jJyH
 0HSZ5tIExNr/cAMqYMNQc/kAWxKHzH6kyJvkzYXS4qO5dIluySWOU72hnIzfR8f9T6GUFU3DpoJ
 fLvNixumKPIA8MJpCW8MgcxyI=
X-Received: by 2002:ac8:6f07:0:b0:4ed:2ec5:acbf with SMTP id
 d75a77b69052e-4ffb48a85c7mr24563691cf.24.1767785890990; 
 Wed, 07 Jan 2026 03:38:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHssrBbLsPN63EAqbkxOs6z7YlYy0fo56gNVYCJ+4TuA8iD6IDnXJH7V/amJMkJBpE+nIYMmw==
X-Received: by 2002:ac8:6f07:0:b0:4ed:2ec5:acbf with SMTP id
 d75a77b69052e-4ffb48a85c7mr24563251cf.24.1767785890529; 
 Wed, 07 Jan 2026 03:38:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b715ebf53sm343531e87.76.2026.01.07.03.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 03:38:09 -0800 (PST)
Date: Wed, 7 Jan 2026 13:38:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <jffkujjicjljsyqfzu4hotjetlfcextw4vmmagjxya22tshol7@buvtkrkmttos>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfX5f0RDJWWaM0b
 6Crh3i2dpF8eq0PYZTTVbJV7cS3CKkcKe5jhe3kcOEWVqHuoKfGacYDhCyGk4TgTZs8OY5LHalO
 Jxw5hTXXMtwP2j+uEHKwauGZJJ6uegtJuRVeaZwKwxFwWYStf9j/ry+yxBD3JzmLMX3XWfUVh/V
 AZQo2gPA4AIlxcaVQe/DflLo+Ug3RNflRn44eyCQAHTUcrkJ29Nq8NvjEQx5RQ9jYaahZhClPzt
 wV0vB7LFr2yFX9ELUwA9qZhcLdaPB6pfGlMQECOMs1PHKu95pgikyhldyStrf5y8pTZyrvk1Chz
 /vKQwLU7ItFm31QxdS33fL0LiEi1JrlK72tXhRv23OqXdkhdVw6G3zL7c6R4sG4yYJacNv5RU40
 y6b9BYJc+vR7/ld2tMt3DV7F0DHjPHOgT7uByFWx3mix0JxorQMD5gX414hkrCKBqqcdEC1mm7k
 vDJETk/sEHq+3GfolaQ==
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=695e45a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Rar_LHnIVK7gKg-YXgkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SnIjK7ot3EVzE35PiTBL2-jfdoaV8vbC
X-Proofpoint-GUID: SnIjK7ot3EVzE35PiTBL2-jfdoaV8vbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070092
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
Subject: Re: [Linux-stm32] [PATCH v3 03/11] clk: qcom: clk-alpha-pll: Add
 support for controlling Rivian PLL
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

On Wed, Jan 07, 2026 at 03:13:06PM +0530, Taniya Das wrote:
> Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
> for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
> PLL ops, reuse the Rivian EKO_T enum.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
>  2 files changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
