Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CF3CA291B
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Dec 2025 07:51:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FCA1C5F1FC;
	Thu,  4 Dec 2025 06:51:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A7EBC3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 06:51:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B468cFD599060
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 4 Dec 2025 06:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=; b=F8kdsRl5LEWN6Tn1
 5FHZaLrLxQxo6Ra1PVUCwutZw95KlEYi7QFYpdKATUS2mFCN4XjCHExVsRsnEb44
 JC+qVhYS/ltNcipCo0tQwqtYXCRp6tmmJlX6IIQ8kuAUl9Sjfm58JFlcubu6EgzZ
 w9yovQTDhluuYULnJAkhHXIgwKct8Im6KmyCRfHS46zLONINXS+CCReEGa4tlz8u
 6vvdPDaWaFvOfBXArh7m2ZqQmqn4tHMjUmKgjDW0i7n1z+wpcnXkwRrYzCW5bixI
 b+i48exmM7ddaX3CnAPIldhqGYxsCD3Qesban++Vq9HMGzJcdgKfAJoFGk/IH7bL
 HNjuog==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f00n9j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Dec 2025 06:51:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2956f09f382so4385995ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Dec 2025 22:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764831113; x=1765435913;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=;
 b=Q9e1jFzFXJW+zofoMLZnnw8+LvG1ytHFXrtQXvAqeovBNSaFReF/WhOJD31LRdb+B4
 XG84eRwfr4NtdG1qeWbmNIA06EiSBviPqiCZKQqFP/SHcDp9FNpzTeNRDrMhd0pwQgoz
 PT8klFK2yx4bzCmRuvrSpKdROzuILcC3ubCf3qW313e6yKJhZl9QIa2Lxpm0b0FC94D1
 3J4LF80AIzT1VkNQWRTTQz3zjhnHYKjPDD64wGFnm33aMxammf6g32cZRE/sHBaXMCM5
 5fDO+cQQf0SAoYt6pcuTgyYPa7ek1HE6yy1rQUAxqa6Qxa4qnMLwXQKXtKZldqtaHheH
 hKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764831113; x=1765435913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SwIvTqC0vtcEcT4pWezqNiZK3gnYXhecWCg8UTidylM=;
 b=JSe4X0SHo1J3PhY/dqpRWopSWzfNorIwDA1bF5HFdsMMjbfAoZEMz9bDizX4cshDmI
 s75FXYJ+8GIlCBNelbkJEEJyJwp4Oz08YG2l7/JHbgF+aAp745V3HYnId/Xz0EOVdS47
 VHwshOIITLUNl8U3C4lNFK0i3VJXCOoFeog00waWH7Bdgi40vY0owsPwAnWTdr03yR1V
 86hoFZZcofET+0256kkuSUA8ykX+zwG83BykT4Ot87CEMXMS2OUECfSdHVlM+nMKxgLu
 IKIBuV+hi3lRMVmeYkJK4pOFxGeI0ilBj1298S+9VAynaDFUQxwmhlfIhFlTIVeFz8bh
 uEWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5gO1CWfeckaTqWYPF6CDKJRhr4dxjDk4vndeYgaQ3EPEEeXvBOgFr6ZVtzgw8S4Fw8gIl4VtsJgPT+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxAxlH6FtJByJyURYfvv8EUvDFBcNnWfFjmuSguGrSY6eZoFFVN
 HYG1zQ5dWdVgP1JaMdPXIUy45QaZCEnXK7PjE1ZBHYWJNB4YbkcQopEaqKCrRkPEUqa+TGcH2t7
 yWQQtagpryimx3z8mijOgpvdWYZXamPVO0qGOGOPB4ZrTMwgJT7Lw18m+9jhuOGY+e4hychmuwy
 gZup8YhaE=
X-Gm-Gg: ASbGncuBI35FeS4ko+7mP7hNsQqgiRpdBB7sLfoAk6UpNBshmoTf6rY+GW8Xh2bwRoa
 4FpRMfx2NVWuMCFK8I8QF8QVkiA7gy6MTZEtkCNn+Qs7vExPfIuNUW/4bUgOJ7w46VofZUOr3EH
 w/ymm7HnZntr1cJQjMAOQCMHZZM0jlNRyTm8GmfcLaCEHrTiaRbDIEpz0RBLgpDSKYmYmXFW+Ne
 L3bkJ8YZ29E1n8cJyKZvK5qXAmbavJd9TWDGWgZZaMnyzS1fJUQ4jEyfkDEq3PFTf7hFHK5FWBX
 SER+qbWVomeNOnifa2chR4U8cDnll6DlQ2BS+EUjtFjLDQ2z5r1DuyuEaeCigp9n6lMqnPef/Fz
 siC8I2lno1aMe3RwyHhDEItcOQoDDgyeLZ3Mrwg==
X-Received: by 2002:a17:902:f544:b0:297:eb3c:51ed with SMTP id
 d9443c01a7336-29d9ed0b4fbmr26080565ad.16.1764831113135; 
 Wed, 03 Dec 2025 22:51:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK/6jD4CnU7c208zP0SLAeyIoeJRxRQ14N6apIAj0JxvDPjIPkL429Mbb2KAq5S0NdCutI0g==
X-Received: by 2002:a17:902:f544:b0:297:eb3c:51ed with SMTP id
 d9443c01a7336-29d9ed0b4fbmr26080225ad.16.1764831112660; 
 Wed, 03 Dec 2025 22:51:52 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae4d3b5dsm9082855ad.40.2025.12.03.22.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 22:51:52 -0800 (PST)
Message-ID: <db8a9c71-8400-46f2-892a-a9a8adcd8dd0@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:21:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
X-Proofpoint-GUID: si4IOI_AUSSzPrggkUHOjbktO3oWvaEq
X-Proofpoint-ORIG-GUID: si4IOI_AUSSzPrggkUHOjbktO3oWvaEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1NCBTYWx0ZWRfX/JQAxLgIlbIH
 VbHdn+3KawGTMqEfOmVgKe9OXh7M2995cwyy5s4kcJbKJw/Cy7Cdv3H8F8j6RJtiQbByTuveqG2
 44vJvA3CaJlxRscRbmNT6nvyzzGr/nJkZ9XGKnk611jqLp1evz+nJTY14AdOdlND+4Czd5i3YYP
 JYWXF3KdJSjiaqV/y7iToKWmXLkbpK1yeDGcyQ1CfRW2uskxOhIoFCu42ZR/HdI0bHPWbpageY/
 WICtQvmavpf/x+7CXyM9VIeu/G1sxqMPxCktZ7Gwo9rdXpwe48RMkFI0G1i10gOYk1GGCVkJu47
 /cr8uM9SuXYiZHhKXkH/2um0VKKg0Q+Y4Yyexu3x/QH+pzjwUPGqWZtZIwGtfjCbseBd9OOUOs5
 EadDCxzOnAp+zZN3FLnRaNlAi7asYA==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69312f8a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6AvYVb4XUzzG-8MtstsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040054
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



On 12/1/2025 6:45 PM, Konrad Dybcio wrote:
> On 11/25/25 6:45 PM, Taniya Das wrote:
>> Enable Kaanapali video clock driver for video SW to be able to control
>> the clocks from the Video SW driver.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
>> +	.mem_enable_reg = 0x80E4,
>> +	.mem_ack_reg =  0x80E4,
> 
> hex must be lowercase
> 

Sure, will fix this.

>> +	.mem_enable_mask = BIT(3),
>> +	.mem_enable_ack_mask = 0xc00,
> 
> GENMASK(11, 10)
> 

will fix this as well.

>> +	.mem_enable_invert = true,
>> +	.branch = {
>> +		.halt_reg = 0x80e0,
>> +		.halt_check = BRANCH_HALT,
>> +		.clkr = {
>> +			.enable_reg = 0x80e0,
>> +			.enable_mask = BIT(0),
>> +			.hw.init = &(const struct clk_init_data) {
>> +				.name = "video_cc_mvs0_freerun_clk",
>> +				.parent_hws = (const struct clk_hw*[]) {
>> +					&video_cc_mvs0_clk_src.clkr.hw,
>> +				},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +			},
> 
> The indentation is a little malformed 
> 

will check this and fix.

> 
>> +static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	/*
>> +	 * Enable clk_on sync for MVS0 and VPP clocks via VIDEO_CC_SPARE1
>> +	 * during core reset by default.
>> +	 */
>> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
> 
> regmap_set_bits()
> 

Will replace with the new API.

> lgtm otherwise
> 
> Konrad

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
