Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC4BA2B26
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 09:24:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF93C3FAC9;
	Fri, 26 Sep 2025 07:24:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39CC6C3FAC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 07:24:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6s1RM024702
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 26 Sep 2025 07:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xahJWVIETX5BgulbVmZ+wNN4Sel4PSrkSaX8qRSlVNo=; b=DzaNUATVlO1Gg7R7
 FrvPqSJJIGWbwHp+bb3iIjTSqI28zM5DONHQJWFuNRPeWeAGKgq+Ejof3czeF3Wz
 AShaUdVw4iggr2N7363Ps1yU11M1y+B2UuEkC3YEYn+4xJwkEM6CsIXIjinRGCNC
 qRnkb5zKtMegdDELXBEasVDZWRw5rK0X0SEAsSy9cwejgdkOEota6ULJ80NbK60d
 5oL40vw6MakX0YR5+FBGormVagK3lCUZWGsx6RmgbWuqFgOKfw1gWnlkHeOuZ4ZW
 +GMoUjkkTWaWmIU6OurCgXr8hZ8Js4MzlUP635Ef959hpNHahQTdRYizbwMt+TQf
 oS1KMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34husk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 07:24:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2711a55da20so15828945ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 00:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871477; x=1759476277;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xahJWVIETX5BgulbVmZ+wNN4Sel4PSrkSaX8qRSlVNo=;
 b=pgOwkeKM0Pq9oYn4l6Qk+U0Fwfua0wfwrMvEva/OJPQX5nvQI9bZ/gZ7xPbb9DsQ78
 VxZH2kNR1OotBzBHxwG/bvpB+tjhliO8RDQSAzs9rwgMMxfBcRb0FmrT/EedRA8nifSm
 icDu0sslcmLKShkiYUkIokT0YzBmyzTA/OCrk5lmxE0Zf3REX2Gv3fzSeFwb12zTcukA
 B0TY+p2yT6QhGtm5bt3URLM7IkwqCQ/pZIl0gz2Xp/N5tvSJD08tpo3gjobS/hg9iJqn
 slWhmTsQ0chabXQdGmXChIVeRvzuQ2V0xdeJA/DfoPQBRSVKlMdbtluB/F4LJ+Arq+94
 5ZJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9yzhe3CQK0NDU0cs8EEahTMRP1tdIpc79Sn+kRepH3t6QdGsAh6xOwlqhCXrO68FBqg1imKs0+Mx+xw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyEzH6Sj2C84FK/0IQL3Xe78B2NDd6sen/kBszwmZynGSW+Xn9K
 kQsI9pHdsd25B59XA7xV0xxfId1CHQZoDha3nou+rt8QPf/TLJKLJJRRR/zga79wrz5MkWxWStF
 wPcQADbmfa2SuRPrUV+6VtjrVRwIlQRe2Rg9Ru/iqLKULaEw5vPIWCX7dJw7aaZBd+QWh7TIiPj
 Nn0AwJ2Ec=
X-Gm-Gg: ASbGncv/GzmZCqW9rMN91BS4VQGil8+qx5FQEyJABlhkF+MkfhVkXcTALfJ0BIgCjeH
 dE63EhfZD/m6awxc0wS0fh+5iT8JOp2JelW/SMbYcTW0tzdCMO6yM5ivMrxrj29uQ94RtAn3X4Z
 xrd4UcQ79px6fNzRteqfRje+McK82BuZRazm2wpntk1YIJQJvAaDII2lOOMQ/YYpGRFhpuwcYlf
 EHQugsCjvf32UvzNyi5zgIMTzcl8VGYwcgRUGOADKvR3Trzubd3BzQ8w2mCQa0v9rloMEqolQkT
 AHuCdzRqD9OGvVzFFs8UX0v60+8obKTeUJQppzC6lC5feP74447cIlp/KO7tkxRXMp2Y
X-Received: by 2002:a17:903:2445:b0:27e:ef09:4ab6 with SMTP id
 d9443c01a7336-27eef094bc5mr16653905ad.0.1758871477466; 
 Fri, 26 Sep 2025 00:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9mU7hMFwtT2lvjIBnrzMBSX54y4ICW695ZcgZtsa6DZblU9rRmj4e5eTtaAR5LsZo4bmixg==
X-Received: by 2002:a17:903:2445:b0:27e:ef09:4ab6 with SMTP id
 d9443c01a7336-27eef094bc5mr16653455ad.0.1758871476971; 
 Fri, 26 Sep 2025 00:24:36 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed66d43b8sm45147795ad.9.2025.09.26.00.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 00:24:36 -0700 (PDT)
Message-ID: <b01e5413-c8d2-4e4d-af9f-106bdbab6e07@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:54:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <andersson@kernel.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>
 <ba4vkdcbudvyoj3i7eufd27luhmn6ai4mgkefza6sfbjzfwgp7@rvnpins2bruh>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ba4vkdcbudvyoj3i7eufd27luhmn6ai4mgkefza6sfbjzfwgp7@rvnpins2bruh>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfXz0IwTQyS4BnE
 MYSJ0nzVDGXlEtI1fk4CsIuO1GvnQzWBypSpRyigYbSh9DN1beuh67gu9gyv7MwYDeEFhtusIvA
 p48r1dMwUYMchHtCUBHrBbIh9PGThfr2Jb1no1VqwBiIj+KPvEHqREGVUFpZK414aUpL84ATD9M
 4B7qdEIErKYolkw5cvLfW3ls/+dy2epbu57Bz9Rvp85w3Qk++3B1zAIjVFv0ti3mqSSbBpunSza
 Bk2fRx17/u8f5aGL5iY6GSLTvbIkudWjwN9L3Plm+uJnx8/obmY607FfhxMkvCvcXeO82B6p/Up
 Y3He9fr0LYKUuMpGaj8uVoCnhWkxL6dO3cdeLpGJ/oRPEBWZTfBXmNt9oy9568NrO0kCSXNpM5i
 T/VmJYkYhcbEPGceB81I1CHWiVhEBA==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d63fb6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=U7xz_n88CXcP0GAGSGYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: bLt4912g73hRhOUn8aNqGn1y-Raon7b7
X-Proofpoint-GUID: bLt4912g73hRhOUn8aNqGn1y-Raon7b7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, yijie.yang@oss.qualcomm.com,
 Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, aiqun.yu@oss.qualcomm.com,
 Stephen Boyd <sboyd@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 9/9] drivers: clk: qcom: Add support for
 GPUCC and GFXCLK for Kaanapali
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



On 9/25/2025 6:47 PM, Bjorn Andersson wrote:
> On Wed, Sep 24, 2025 at 04:56:50PM -0700, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Support the graphics clock controller for Kaanapali for Graphics SW
>> driver to use the clocks.
> 
> GFXCLKCTL is a new thing, please describe what it is.
> 

Sure Bjorn, will update more details of the GFXCLKCTL.

>>
> [..]
>> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> [..]
>> +static struct platform_driver gx_clkctl_kaanapali_driver = {
>> +	.probe = gx_clkctl_kaanapali_probe,
>> +	.driver = {
>> +		.name = "gxclkctl-kaanapali",
>> +		.of_match_table = gx_clkctl_kaanapali_match_table,
>> +	},
>> +};
>> +
>> +static int __init gx_clkctl_kaanapali_init(void)
>> +{
>> +	return platform_driver_register(&gx_clkctl_kaanapali_driver);
>> +}
>> +subsys_initcall(gx_clkctl_kaanapali_init);
> 
> We're not starting up the GPU at subsys initlevel. Can't this just be
> module_platform_driver()? If not please document why.
> 

You are right, we could move it to module_platform_driver().

> Regards,
> Bjorn
> 
>> +
>> +static void __exit gx_clkctl_kaanapali_exit(void)
>> +{
>> +	platform_driver_unregister(&gx_clkctl_kaanapali_driver);
>> +}
>> +module_exit(gx_clkctl_kaanapali_exit);
>> +
>> +MODULE_DESCRIPTION("QTI GFXCLKCTL KAANAPALI Driver");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.25.1
>>

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
