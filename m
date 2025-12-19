Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C853CD00AB
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Dec 2025 14:24:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 120C3C87EDF;
	Fri, 19 Dec 2025 13:24:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11D66C87EDE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 13:24:20 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJBJpuB4153892
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 19 Dec 2025 13:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=; b=BRjh5YLKMdZQPrxM
 26ZE5uEgDcEq4OjT/Pwo7zXFvhjgkSqjA4eqs3eJRU/E/4nBgrrL+LVcifvKDyR0
 mKPNfisybKIdkUJ8K9QtJgLQNh9T+iRXjqIo0D7rolKnxfqXCiFTMr3XwtLzwyBj
 T5OS1IxUb/WilgQYGl1LuKqxHcec8x+7KKayuP2SLAv1oaG2QLArRC9ddjOx7nJ2
 0ac011bncACHEjLpcLrO4oZPN4SO89gZxgp9W/iDo+W2XmqNl3bGRcUcODUrDLcN
 AOAUzIriYa0HOpP2zmM1iwUyuiutg3l0eYr2sXDFCz5ScNlT37OtOabRlLE0+YAd
 qKl1PQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ctsm1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 13:24:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f1e17aa706so7700481cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 05:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766150658; x=1766755458;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=;
 b=Hg9Tu1eFm+tNo8avCjMHq/JKEx740tNCXF/rgOY7YHa6CRsJWbnqfHmLhRPZWKdaKC
 ZqhMhfMzaVTXe/RQTqjM194z85a7QjShWC23b69wcGgt6SDsIdoWZAzwmKI1UpkEaBhq
 eBa5T+SM+Ui9pTNSPB9a97n47wkW3YiiYy5CO1vsAn9VKFt8QDWRlUu5b28vtfbXV21G
 j71NeU+dDJYNVVTsniP0Oc//i69xW1o/QhbfkkHXRKavoSmYPN7f5yXPOxJIIEdEIEZH
 pXJuLruzGZ6SbjJVF1zRt171qY6tvKkCovAbhvDaKAh/f3QKIPng0ZWkIdKR6rBFxdUK
 MkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766150658; x=1766755458;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=;
 b=rLPFMJEUNIrd8OXAVeRU4AukYHYeGveVPeXdGzYg+10nbfOrAsXYCiGeu5CKuEv4Yg
 NdihWCSbKieJ+oPDuhcgUn2MQQcfsKAFMRah+3q/lgszKbLOi3TrC6F/toUTuhPKuXgj
 MLasAmEtH7tr2q3xuBiF5VrBsV8BGQANv/snrqvbjSVSuVUL5zFgrZr1ZcdiuyMTXGbk
 6q6Wqf/cm7JVsxbpBh5SOyGXDXIzrCykL03X4VpTGWIWsqBfzLzClf4CchSj4y/CYjdp
 PULRp9Q7y+9klTBEGQc5ESeFyU1mi60tXLYgWXHEJ1d5EkuYq0nb6sYf/1osYg6jfvBW
 fAwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy1gs2kxSgAm1HDUIbleXRSljpLH6HULesLRu9Vj+uzoQiQDlHI/250xkPOkmuieqyHL8QFvVNw+cXTQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwYTgjkFk4WROJKgjzv7UxgQK/ZuVelQ0yH2mdAAhQW+GMd2Qmg
 UMrqaEpDzsA7+8I2WuGeaF4GwYmoEMkvE6SfIF6iOaFuC1TpAMOMHCnEYabBAK1YYLJOxEx+Yqm
 KJRVJ8C5IR40Nb2HH1Vu7v1QFxCCAzJO9xL8sdPQW1+pa+V+ZgFZdwgctNgBLozpE439ot+CF77
 Vceedbvig=
X-Gm-Gg: AY/fxX6UML9yod+BdaOxf7M6moPNoJj9g+DDIRgFn/FUzpNcYaUjbAa3d1thCItaA8r
 7aFA0APIWBrKQ7i7oCwD7q5nHp+TXMp5ht7ZQf5O1vIAOYzF6XVn0owO8gRm8/59Qt8fgj3dOSg
 Pn8MU/OEyTfPm9m9iRXhxqfutHbD8yLwnE3kdhBoO+ls/Vtvtie6UtGM03/ptt5uXYMi9Iyk4a2
 wVFXD/fpol6wTQloIW+OlFXe8cL1Ye93UQuoAhH2hdvNzAfURGL2E5ZwJokLla2YJcm+lw37O+x
 SCCX2kNc0zoxoH7w1w1aNZy8gClTJMllVaVL3tSNulTnAQ5mimYuFRWKXOmDmsl8V5k6Fg6ZZW9
 naTw+KcZNAEmj7kzS9e05gys0BRFRe+voAP6kDzo1JjAjXgb9pYyXPEx/hs5ZBEnS4w==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id
 d75a77b69052e-4f4b43e3a80mr8304401cf.6.1766150658014; 
 Fri, 19 Dec 2025 05:24:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAQTZER8k3jrnoeKYAUlmetrYif4/iAWP+Fg9AbI7ouvR5IbKvEBKFu7XRTnkrJk4vkJn3sQ==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id
 d75a77b69052e-4f4b43e3a80mr8303891cf.6.1766150657483; 
 Fri, 19 Dec 2025 05:24:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0b12dsm232466866b.48.2025.12.19.05.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 05:24:16 -0800 (PST)
Message-ID: <7038f5f7-e5c2-43c3-864c-e7ddd2e8c374@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
X-Proofpoint-GUID: ai2uPoPxa_1cA9iNsTAgKuQvQYEAAL2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMSBTYWx0ZWRfXx6+wzNX6usMV
 EcnBFHEC+FH0sv2f8Q1y3EKrcTcVER1+JtGsIG+iq2oCBrm1WxdZiq0weuVEjfMqLUzs7qzQqBG
 8ecFCnOhvIwPeJ6rPf3SoYxezGB62r7L+5WPJcz0oWvYaAxZ2JI8ALOjkOrkt8M4Ra8wwU5QkCQ
 jL4ts6JHfQwm9HLuRhVEh+tguHvhHzDsAWGQ4y+PD+hzAPDsKw7MjpIHGigRo5YKpKaW5rOydtK
 jILEWOet6waP4frJFNhD2HhwG/96DqUn8GrrWlIysTvF6GVnl4EIiz2GKl5IeCUapdvbMigK2Ob
 A8Zt9fzEvw72Gc8DeAgBRUe26Dp+FQ/iWX2n/LFzVKYrDJugv7h8jeJxh/R4jnmfEeKyGvj5a0i
 f5gA1G8oyt33Kpf3yOqBk1YosRbep2ukn3S5QA3vYMYFaNFrWfrU8hMvK4l0CmgCa7xssXd+zuy
 d82//EZ/ZPE06IbrMOw==
X-Proofpoint-ORIG-GUID: ai2uPoPxa_1cA9iNsTAgKuQvQYEAAL2I
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69455203 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6UiOb558mQ4H2NczljUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190111
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 08/11] clk: qcom: dispcc: Add support
 for display clock controller Kaanapali
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

On 11/25/25 6:45 PM, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
