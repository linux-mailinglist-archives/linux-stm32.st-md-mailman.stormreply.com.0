Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C0BC9BFB8
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Dec 2025 16:37:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97602C597BF;
	Tue,  2 Dec 2025 15:37:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6D0FC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Dec 2025 15:37:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B29SrTD3242700
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 2 Dec 2025 15:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=; b=MNymD01fnkARBFE8
 f30Xj0Twb7f0JXMlzRlh1AWQmjzx6HXA4kbWVbK+kojTuHMCdOgSwJC7x3FlFDhe
 p1ESF91lcGvnoxNH0/gj4x7PtME5E7FoImmhRbx5eW/g0vIOxoTCLH9055hEy/fh
 0AiWHa+CYoT3drJcb7auPKuIH7TSlsk13BkfeZIC+MrPgsThZ1UDNEwxPEvSVc0p
 34TPvYZFldyEZiLjuYPBJ6yxT5ZfovBKNWWImGCGPXG0srgNI5VlMaZo6F05W3/m
 5BPOlySCNw8R4I3UFXUQzibHm7/xDr6VU/tKzbnSdqEFXbP/wyn+lxIquSuqBPHe
 pAjkiQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aswh5139x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Dec 2025 15:37:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-9373377ff51so218998241.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Dec 2025 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764689833; x=1765294633;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=;
 b=GDPcVBjU902L3yjn3NQsBQHjRGhUN571pT2ju1GkLkNGh/WkH9qfVkY/VWfeaEeqW0
 NjlAOfsoftDiuBF0hCwhycx7MtEUaZ7amkB9EuglzTqR5/rPJ7UTnAPCNSV1iikM95pR
 6M9wXREDVSC2dRSrBcZJx4DBKw9+AdUUg7PToaJ+FfC0CvSYy1HvqA8rClDRiHtze4is
 1C7AJm7AsaUwTALVqS8l59Kg2gIwM0jYQFc0Wr0CmS4N9n3uDmhe2zzgN46ciitN8vdm
 ZZ7ajolidqJpbM+SKKMriD5Kvn8OZ+dRINPOmWwTQZy7fev/Y+l56aVKpBaIqonUrjaW
 VO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764689833; x=1765294633;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=;
 b=QP/blKvZfuaLs1dr7ZB4CvLNXOgLMU4SzkyMDi4/p1hKYIiZVpRsTF3yDMRCkjH/7m
 YhZ/E38GE5A4YHvd0dAmPwgxZFDagW5vvJqjs979ayG1t0HzYCJ8iYe8h4/a1X6FMEX0
 ls7W6ixR1asxW9ZtaRv/+qHqTbGkrFiBPaN7iGdNSkHTUTeh/SYM8SzaiRCFjb5qle9i
 KVX05Hv1JRXo8HQljmAkf6Bv900KwCXNDjvM4sZUZfx157NQeHBb0pLkPtlL4ulquq0r
 w9s27uyJb1/oIUtwpifPgy49UbS2gRBMs1y9lAN7J/cN7qf8Bk+mI2GI2yzpd+bW+qT9
 5P4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZfTY8gFiLSpp8xp5TxGz6PR/XPEOa2UPrVzUfeTy8ZZKf//7/Avpw2MqrQSuudWeS7pJmg/Z5hmuZDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQyGBY3Pt+dgvtqCe8pC6dMSAphiAJgFyaavn8yf+nRSxLkjCH
 hd3dIPppPLAupQ5QHvCnD3ptVmdMe4ceP+lhLvsoxF0w2ywZzWVxA8KfdqXSS4w13nNYEvKBV8u
 n//N6ExnuXOi7RX5ejsqHJe4+0PiSDmTw47gAGPl3PabqUBenE4Q1ykp3P7m32B6vszMGhb+7nX
 z7+epurJA=
X-Gm-Gg: ASbGncvvzMSmT7Fq+zD5kzKbuTfL7L8mVh6Wi6X6jMGOXhNl4pVcQFnVgA0TKoQ8vku
 E3USms6wiRP2wMeBi7gHavViqSHnKakdqpu1of8787CIx6xLz2GDYAdpkI/nQTivJrWtcFqfxFm
 n+6cFXXzAfs9usoml51zrKKVYCWBWcyzbMyAet7IJ61uSSlQ4qN9SEvw7dR60nzEu+vAsqQYv57
 frwvTJgcQozrMGpttUNme12/KE7LNUVG9YwxN8O78+dnXO8tTAq0kvDq7I2o/YRNsTuLWCe0qj7
 H54LUdt3v6Lr1Rf7ZW27akYKClqbBKQX/kLQ6Cg7DpNv5R59Uj1FPf+6A2H32XjI5f2IbabEfhj
 2mR9VVZA0Tf9HDV/psamhm583om1qg7hCpKPB9ZtdxmbyhJklnC/5P1CICALRN0RJSA==
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id
 ada2fe7eead31-5e1de57c9c5mr9556590137.8.1764689832780; 
 Tue, 02 Dec 2025 07:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvD45845hdbmhM+YS7Wjjhg3RBweI2ZE3krzHTkcYizMtoYHA/7UWe6Faae0ZvkArgVzbYoA==
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id
 ada2fe7eead31-5e1de57c9c5mr9556563137.8.1764689832343; 
 Tue, 02 Dec 2025 07:37:12 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5a4b926sm1544786066b.68.2025.12.02.07.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 07:37:11 -0800 (PST)
Message-ID: <f7609d19-5254-4419-a600-d0904d92d525@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 16:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VNzQXtPX c=1 sm=1 tr=0 ts=692f07a9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5mhmk1EvtyQYLrneLBIA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: spZX67dkZnL6KwOVOSL14P2I7h0MWH9Z
X-Proofpoint-GUID: spZX67dkZnL6KwOVOSL14P2I7h0MWH9Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEyNSBTYWx0ZWRfX7yviN/znBG1z
 ZRPBh+3aClX+qvz15IK3Xub0XkXuDDexgQMLatPyeR/z8OeToNNnaGxkRpN+W3K9D5IoYv1y4ZK
 JrT3f1lSzRl7wwo2Lp4obA+5PSLT8VVBVYBEC8NP+IoQ0n0RvWINKnfejR30ZKaPTcxFouOlMIG
 H2IHoRDdLPXznjyEAIeAXpnY8lR1SfXZa9BrJm9wkoYzEadTaehN3hR5owMBIt1QD2g3Q5AU1uT
 AWoK7xEVxHf65YBxcLqXgbvGCvQDjVVldryxdyb3RuMCYpjKkWYjMAQl4u/TK9H7NUdAzNIpCNZ
 mAF+JwBjk7mbjqLMR66iM65oHnSY33HZaS2mx6nbunSBxmLA2rT76o6aGShysxL6ZzIgBwlDEr4
 MRijBfLc8ijH/8wUQdw5lc+PI+n7kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020125
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] clk: qcom: clk-alpha-pll: Add support
 for Rivian ELU PLL
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

On 12/2/25 11:26 AM, Taniya Das wrote:
> Add clock ops for Rivian ELU PLL, add the register offsets for supporting
> the PLL.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Matches downstream

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
