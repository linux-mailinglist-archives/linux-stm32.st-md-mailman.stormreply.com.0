Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 598ACC97885
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 14:15:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 090F9C628D3;
	Mon,  1 Dec 2025 13:15:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F2C1C628D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 13:15:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B18gXKQ3433200
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 1 Dec 2025 13:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=; b=ZcyfNaYE3hsYKWhy
 MjTAZJIxEM2TybhgAE05GpjxkfRiBf77qzbGyC88uK4tY6zjfTtxTjW5+PJALtbl
 6PZ9Wk/G19i0HJclMgzxFvyOTugwfHKOAoU/cAvjaKRkNYtVzjHen95AmaURrcUn
 0iFL9GuGtAhCGMxZX9POJuzGZ9yKAnRwWqxhpbcqm/sgarTjvECBsh9pNb44kjQO
 37mPAS3/nGeaOZwyBdGB5zYP4KLuqWS96nTZKLrzdNE+/+U6C07GE4/9eaw9Ihpq
 lA8P6RMKG1tMXHyT0Cw+S3qgeFets7YwkTIPh0UfJ2FNd8VZcrHdM+dq7WMdaaOg
 eSkABA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7re0rcr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Dec 2025 13:15:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee23b6b6fdso9803321cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Dec 2025 05:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764594949; x=1765199749;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=;
 b=R9KlawJ3TsvE/l52fE46nH0fQibTv+g3M4TE9blSp/vDg1ClmJtTRY6rBdS/VmsFBc
 s04oYuIKJE9Qvf8Q7PwyDy6KKgcE64RLE2UAKb5MkYuG9PS/HahYWTGvFGVg97ihgA+e
 FJucr4VfWW/f8PzouSDUk1b0KcJFeWb3zenHoMXqKmJWHcNbD/EoFLbVKUh9o1e0vWk6
 uY8uwdMlZRe2/CgfsoKLNDFUncxn0tnOh4zRAhdbXpc03/Jq520BdwOQxruYaFVnpfeh
 pfqtr8lGcB0JFmwACGb1PWw5TreFxMeMHaenY9NsOGlnsS6P9AJpx2UBgVwZFoJlgWmq
 9O8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764594949; x=1765199749;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=;
 b=iWaB9xNf9f6ZP9Fw5wGvLx0HqiLiKJvYdd398kyg0gDCdR7KOAcwK8viyuAX9PyiQO
 5fQDZVi9NaDRWTNe9mqTlfZ3n/RZ9gd5ZgA3aGwFmPRpTq4XFFJwfV0A0lEfvYgVrfYj
 snBu3LtlNbNltpB+Gi9xoArX+9o5Ak4pWziJZZ/6ukQWjvcX/RDTc57yu50oqWZk0ktP
 QMSDWzZcegPWMxT4PByHiMDYfTUo8kmnXwnJQE8s3kcT81/47kAiWvDwsYFaM02CcY/g
 7SZLGZ4wJpj9BESqxFSdOsya3rBImDHipf/t5WN5KRojsatvJslgPgCanW0IPh7vT9lp
 /fGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCuB2CweD1OOiyHjpT8RVJ+U4lRMnBgZ0SLZ6YhuOzBsigWHeENBEF6utYtZH8xzXQwlwKK7roVHWwGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzpY10DWstv08iNTN84gMcKC1P+eMgHmjnbXNqrx04m8OYy2USV
 RI3Ao5UfuyFVDhtgJkyPZo2L+ExTzJvlFH0WtC/W2CZ2+VA9yJOF15C1k7fnl8UlqqAoYn2kdTE
 NacstKdTuW84tCtGdiyaybwLX5KH8ZsnBKKdDYC+xF/Akioran5lkq/WutfH4FiQJm7pMnxIJ/9
 J4ZdepPyM=
X-Gm-Gg: ASbGncuJEQ2Y5cy5Dn+eIBymySeoZR1U8idCQZ3YLZMhn1kKuehBJLqLVqBdqm683WZ
 Rd7vopVvQvR/OdWWfJ9JLVopO8rrh943JEuPO2NI2j5+dokNPnsNT1F+GZGGCXVueiiQ7GbdxN/
 Yzwfu9ixfEqTwYAhF0y7vBR0FKxx2ZthIFPZH6NLkQT08sYXPWWgSmiVtN3DP+9EK27vhwPr4oj
 orPA8Kp4oPqdBqZ8zDPJlOMzpvPwT+ww8TrtYm8jJinqFhmVHzd8kFg52quCf0pSKW9cym4OXXv
 zZGbqXMA1fVW7nZuA5ZJQGoJPhrLrVsH8BDBu4jWSz1cDEEp8K/TeuHxokB++Y0A5EfamZ1dBh8
 D3+WDFA5YHNp7DiGbnFYS2SMuAtvc4OTYaFUDjjun7XN1jh1mgD5/LWT3Pr6BUcFMHV8=
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4ee5885ba39mr390589391cf.4.1764594947316; 
 Mon, 01 Dec 2025 05:15:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsc43YZ5vfth/ieBcfBTnzwxswN44JaEXdbd0f7CPZ1tdQd9HPE6e1lDuQM4FJ+9etruHieg==
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4ee5885ba39mr390587631cf.4.1764594945691; 
 Mon, 01 Dec 2025 05:15:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751035b75sm13559964a12.20.2025.12.01.05.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 05:15:44 -0800 (PST)
Message-ID: <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:15:42 +0100
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
 <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
X-Proofpoint-GUID: utCjEzRgGXugbWLA_m2GaOyUpYYiv-bI
X-Proofpoint-ORIG-GUID: utCjEzRgGXugbWLA_m2GaOyUpYYiv-bI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwOCBTYWx0ZWRfX+RZEQIJ3Iq3N
 fbWocQute7JU8ycces9ZO7SDm182YgRqI0uOwRggq4zD98O3t9Oq+wIVFFzw8kwDOzlomL762uB
 8/llC5AUnVuwyBfU7JN6h+KIxPP0fWWlgGCCzPQYoOGiPJlsHM/4Ao2PzlsHA38NTV3x/wIAAHY
 Rms5PrdkD5C67TjzO28AT1uBs98hb1Fek5uZB8Xpbe/RdJNu3ZCTEEcfL0tZPuJqB6mg01nOlLv
 M4sdVKyB/sn2wvIkQ56cM572fqXB8mgFi8nah1BgG18rHQGMBjEYk6HPcqZPijHTjX/W3Myjvx8
 S1fDmc7zhmZbC+foxGeyw9dfzALki3QE7zyDxdfvYhzuBqqX6P5pLGa2+viBX87Pg81R2ZBDdVu
 SR2rNTbIOuLxc+/uOiCJ0Ml/FDw++w==
X-Authority-Analysis: v=2.4 cv=BOa+bVQG c=1 sm=1 tr=0 ts=692d9506 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1utaWbyG55iW8k7krG4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010108
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 10/11] clk: qcom: Add support for
 VideoCC driver for Kaanapali
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
> Enable Kaanapali video clock driver for video SW to be able to control
> the clocks from the Video SW driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
> +	.mem_enable_reg = 0x80E4,
> +	.mem_ack_reg =  0x80E4,

hex must be lowercase

> +	.mem_enable_mask = BIT(3),
> +	.mem_enable_ack_mask = 0xc00,

GENMASK(11, 10)

> +	.mem_enable_invert = true,
> +	.branch = {
> +		.halt_reg = 0x80e0,
> +		.halt_check = BRANCH_HALT,
> +		.clkr = {
> +			.enable_reg = 0x80e0,
> +			.enable_mask = BIT(0),
> +			.hw.init = &(const struct clk_init_data) {
> +				.name = "video_cc_mvs0_freerun_clk",
> +				.parent_hws = (const struct clk_hw*[]) {
> +					&video_cc_mvs0_clk_src.clkr.hw,
> +				},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +			},

The indentation is a little malformed 


> +static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/*
> +	 * Enable clk_on sync for MVS0 and VPP clocks via VIDEO_CC_SPARE1
> +	 * during core reset by default.
> +	 */
> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));

regmap_set_bits()

lgtm otherwise

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
