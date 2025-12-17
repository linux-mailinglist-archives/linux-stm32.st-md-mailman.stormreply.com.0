Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A60CC7CC5
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 14:21:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CB05C01FBF;
	Wed, 17 Dec 2025 13:21:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4FA8C01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 13:21:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHCKoUe2465110
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 17 Dec 2025 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=; b=hCIYQNOESCXFCU6p
 YKEuFyRLxurXofKMTnPM6vkrbSDP2L3maLCCXacWh8c1Fp+lv6QLnho7LJI4kLtA
 TCRYYz6KahCduqLm91Q6aREt2D6HZPsl6L48A0exhuX/zheING3fQuxrFaCsdu2f
 2IKc7PE3sNcDETH0g4EwJ/jRMStJGKPfiKWYK5MTq+s2ECFmlVXG6w7fKPWd29X1
 3bnbrL+N0Yy9qxZKZTkNM1Y9OrxhU5KpOtawmTJZHSZ4P2YiahJnWHgpnOMK/xKR
 BD6KYtzZhmAdLiAaywOEIS37pOxhmM6b4fp8fPRYikTo6Mlji7K8m+dES/le2eDh
 51rEbg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2agc4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 13:21:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88885bc90a2so14835876d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 05:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765977668; x=1766582468;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=;
 b=FcXP+OptEvZIpH8Fq1adSZyBRROwQhAoSCTf+bv1/m2rwrRBDIM5EYQfRTzLeKE/iZ
 h5koS06PlvBqOPSYwuR74zr1E7WlIqPb6fG8/AmvRNNCmg7tcwWoUtz0uz9WKluHTlah
 kHvmYHvlCY7ejUqYG/sOre1ZxZyKXhh8YXDfN/mv8c62MPySaZEGiMqcvkpLr3j7jQoZ
 +O0nf95CD4gOjLsi+LCl0qHCxwuyfygG5Mn8t2TV3tPr9JXzye0zGpubhi3rUjYuQpQD
 Uty2a5Uc+DPg0Xz9uKTKZjSdz80If7ftLodiT0YHS4g2uPmiz3l4P9t8r81sIZNBDov/
 Ypdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765977668; x=1766582468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=;
 b=mC/7Kn6aC2KQUgwtKVckH+fsctQnhUdDX2x0NzKfv9ApB3nRVcqJldtn40PCsA+OyM
 q3mPNO2wFnvt+QWRZVQt1/7F0e5u2P8DyePWv/dmViZLWEl9O5Bv2BHPeIU9PdavKuZK
 62Ud3ppu95+7tPwivYok67iyt+kT9Zhk/6ISjirxPs1PXHngpswW/ksScWrnBY5Ma2Or
 hcYD2Kw5qxdYdEUYFoNIkH5slIknoMLMj9lOAO2k+MpaWUC5EbreGCl4h0K8wSbDjc21
 UCE2nC2HxxI9YRbJLfVzRXPj82LkhQW8FZCEsxV2Ju/n06ZvH8KlGWvRkp/S+FXyne6M
 E6Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSpB0YcJyTfgK5ZXhn/hgFVy4jOeufHNFD+WTxNJ0YjlVmx4g9XRmQUJICe2ViuVKpoRtsp90irSlygw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwB9Ti7qVYmglva6CfUQhYe6C6qGsexJ8+TToyLSVVmZQNCW5dz
 d+21Wqpf9UFhuZWX/h3LB5PXVrarfN9Q+j3htEE3RYbei5j6HzDrhyp+n4x1TY1rix6hXf0k4ZD
 IZ9Hc7TLuDHKEa5Mn77fQZDUv1xdL+tK6uSsrYuipaGZc/dtV8Ca2yd/IhxSMb5rkPNd1t/Cbzv
 28m12iWJQ=
X-Gm-Gg: AY/fxX7YV3r7VregstfGh6Bj5W2JiYA0JD8Z5HfODWgP8kp4xf15E+q4RECQLYj9pam
 rSQdO6NWwDhV4BiE5ukhmlBd7ejmP7eY/80qVWm2OMLhAPygYCsxrXLkicFXELzbznTLGHCshy5
 FNZi3mhBQT4KH6qh2hwF2icoA46KMq11Bq5vCCyQtSmFp8F+jWiRstMJZ65FL6V1Ep/5UBs6F1u
 SX35DUG5W0BiT6Uv3W/gTR7e05H4auJorq+N8SZqOz/P2T3Yfz/nhHxH1GaD7BVHRvBUH+hJlRi
 ojWZ5U3twUv0bYSHpu9KfFozULl1R85N7A3jAXxckkoLtfNTiSB2KOGQL08m/uzJiev2kH9atxK
 /LDv631sN4iIIMg4N5q+JvBgmKP8iYXeHxWTLtE7oslTWr7MgiKqOaDpjATjtVlmmbg==
X-Received: by 2002:a05:622a:1191:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4f1d04b1b70mr183152681cf.1.1765977667826; 
 Wed, 17 Dec 2025 05:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsGyEI9MqyBXHu9MJGYHVWFgi9POwUHY6EBl4git78m54J9h05gobTJiMeDB2CkmGRH8oTkQ==
X-Received: by 2002:a05:622a:1191:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4f1d04b1b70mr183152181cf.1.1765977667204; 
 Wed, 17 Dec 2025 05:21:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b20sm1997438666b.64.2025.12.17.05.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 05:21:06 -0800 (PST)
Message-ID: <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Taniya Das <taniya.das@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
X-Proofpoint-GUID: Fy4BOltOqMHXv6rRRxTrdlPp_3ItpiO3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMyBTYWx0ZWRfX5YaRYw+PxTva
 EOxmaaYCNz1aVZy7kZpiV+zcAZHWsfwy2SvxcMKRuBGe2tOjw47vEDQ80EylcOeldSO2mN57qGe
 xFLs//ZCf3wyw7Sx0+BVf1B02QjtI8he/xDAq6xYas6z1d6lPOnHp0Q7fW8Y5fxHX0+H+ZrHo3q
 DRn2C2XRIa8l6SLXF6rjzoCm5C3D4N1Lr60abcbhx10sgSAdQUxQqT9eT9CpdctKgL2cXOPcREc
 9YTIXHVuMq4bUQf8E6DUUAF9Fan9FCskCf9twd48Abw7lASw0U9usb6NPcTBth6+E11KqkfK45d
 C38hIeiYWjodPxcnOJTdWIwEnRtajJbpzbgEzawlON4eWzSpB9/fqWDjFTJ16xQTXjLHX7WsLuE
 AQlgXIgppB87bcCusMNtIgDlfi9pzQ==
X-Proofpoint-ORIG-GUID: Fy4BOltOqMHXv6rRRxTrdlPp_3ItpiO3
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942ae45 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=37dNUGJFtcrBIb5saPwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170103
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 07/11] dt-bindings: clock: qcom:
 document the Kaanapali GPU Clock Controller
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

On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
> On 17/12/2025 10:32, Taniya Das wrote:
>>>>
>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>
>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>> matter for choices made in bindings.
>>>
>>
>> As it is still a clock controller from hardware design and in SW I will
>> be map the entire hardware region and this way this clock controller
>> will also be aligned to the existing clock controllers and keep the
>> #power-domain-cells = <1> as other CCs.
> 
> I don't see how this resolves my comment.

Spanning the entire 0x6000-long block will remove your worry about this
description only being 2-register-wide

This block provides more than one GDSC - although again, not all of them
need/should be accessed by Linux. I suppose just enumerating the "extra"
ones in bindings will be a good enough compromise?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
