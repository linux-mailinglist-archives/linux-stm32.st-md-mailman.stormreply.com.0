Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652EB18129
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Aug 2025 13:37:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24DBEC36B14;
	Fri,  1 Aug 2025 11:37:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65903C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Aug 2025 11:37:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57192RPx005219
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 1 Aug 2025 11:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ib4lVo6bA5cxWNHRPcfBAhasx6+Tv4uNCb8kn2zACc4=; b=laVbsFeTSRGnvXcG
 VQ2dm5mVML9HBSszJSDpmG0jaePCntW0E7z1mjKqtg6++Z8M5HFFov1sjM/X9D2G
 Nkyl2xrjKsHMMLVk50u2aG46qOUQ45/z/qpRp8VKWzRkHc9hQUIZLXI14r4wvrH+
 WV1Z9xgZ7lYxJmlU/UJ9qzE2KefWiCSKps3+QqzjfxonfEFUamwEs+a1+2kOIGcu
 ofac97tI2++OhGEXEfinA9bnQfmZkWXzufN8lb/uBUEtqby9IQ4H/3xZ0XOJ0SZf
 fErNHoj4BWUjLc3siW8Qws/nSq9LSKUsgkheVYL2HdcctmL4Wiac7NJVOjrbZuO9
 2rFvag==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86c0df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Aug 2025 11:37:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f539358795so5637556d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Aug 2025 04:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754048220; x=1754653020;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ib4lVo6bA5cxWNHRPcfBAhasx6+Tv4uNCb8kn2zACc4=;
 b=KSyQ0jmXxNNJpxzhEyITtbb87t1t1gA2ZUz4O4MDZ6HXU5qFEQpZ8X+YfUXMma2kxW
 KPc2/gU0jbGDOXYbNKiQ5k1ssjYrZ74Kym1jqchI+NDUF8RXTMbuzzLHs2CzxkMDDgc/
 82QE2yIqyWax0rFc9jVAuyWNSAMQZ5kWVUiJLIQft09n4XYw6Or72nAib4TCgzmCGvNE
 x4otL3l0e/ZCmWXUAZKzDMESvup6VISSkZ25SZYOQpPNoAED3/JanYqlnXus2KcNFZ9b
 P12XqeudfWw0IXShmW1vyRCstf9nVzJ3/NAuRg9wdAgG88FTJdMu6xSV5b+gsMczJ7fV
 rcPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF1HK6H645SRgEjxMpifVeNi1pYXtBrn1vj/RIPCvzJDh5s25P0bso/OwHQYx7hhdlx4fIBjZjAWqPLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6v5d1139S07ylVTT6N2SQo3idgl9Kl4NUa9mI0uabDu1NCqFs
 j8mVIH9l6qcdMdRlWSyG3ob1Pa8eNKLG5sJcY4qoWo2GPMhP2fyK/nmgEQp+vyY0S1rNEdRyC0J
 rmHZ3l5VsO+g/Jg2NYbh8yBsfIEjrGCeii+curDIxOtnRfzX00y88/wLWO7cxGZExTWVurUaW5u
 Fh8uE8trI=
X-Gm-Gg: ASbGncsP1ZTdylsoSnG8MBsbgdvdtx5QUR/2UOo3ExM4LOHP9QWmyHfrwvMHA7RNy93
 R8pXh+iBazaWD4VgGO6y6E+RCSIKpt05p85k0MRXC7dPxaCz8X4Hz73xZxLQ/7yhX+RmQxuZ37P
 GpJSbMUuiWDc7a0KA+v7jCiP/9srw2A+XTMoEOgtSMrNRbwwkMb4+wPFdJPu/77LN7iV8qwYa9Y
 Adlt2Q4RQjDiWksPzj0GwPOr87jAcEfHl8kmc0ArPa5GEDe5v8RIa4j4BR7gmqAqhTfNm6PIpQK
 ZObuej4Ni83OwT5FDEQ6uKPWezGonVTBq6dp9NiH9UWsIyHUV5lon8lW1t4SCQApBZdAe0189fD
 iTMCAzi9J2qLsVv9oZg==
X-Received: by 2002:a05:620a:469f:b0:7e1:ba5:6ee0 with SMTP id
 af79cd13be357-7e66eec27a7mr809610185a.0.1754048219798; 
 Fri, 01 Aug 2025 04:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGISRK3LCNP6LCJEXt6pbFs22LciSzSSA6wDhhyR/ABPjUX2hHCx0gXfYiLZNNNjNHw2rNI9w==
X-Received: by 2002:a05:620a:469f:b0:7e1:ba5:6ee0 with SMTP id
 af79cd13be357-7e66eec27a7mr809604985a.0.1754048219285; 
 Fri, 01 Aug 2025 04:36:59 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3981sm272166466b.35.2025.08.01.04.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 04:36:58 -0700 (PDT)
Message-ID: <a1040dfd-00be-4f20-92e9-533a74803e9d@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 13:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-1-b505c1238f9f@oss.qualcomm.com>
 <20250730234631.GA1899887-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730234631.GA1899887-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4NSBTYWx0ZWRfX1x/hrHRok2vw
 ccHxgNYbzh//+R5KviHlod5rG3JMkzvKLeaP+ecAXl2pHugI1jHXOibpS/3ytFqH+oBeN/ZiG8X
 8deznfGsvT58OS/DZ1bAfJiFASKyKphYeKgC50RsCOZGWm6ByD2YJ9bITQuz0j64eMU4xMTSB21
 vrUvvlPm62x2Bkcyns7Fo7U0WC1aKFrSyCuzaqHdrjjIvf/OK7tpm4d8GgQfIxgiBKiIQREkxyJ
 n3h7UKoPgEK6IbSXXxDBNj2tfgjSzXgacdfRz6WpeTyBkCrUMdH+ylh5gyHB/aQmkO6EQEblUyu
 Wb5HnHdZ+zLjG0Natvc0mtO9jBTWUPzXn9u7UiQW3P7yKzJBQitoviv0g+OvbRJm+IMNR/Fg8K2
 fbeG7HJpr2ljZu659duPOLYd0kxBQP4RUxqOgZBkLYEGABkAquyKzR5SOaqLO48zW0D1AcAo
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688ca6dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=RNpRkCq-AmGuj0ryOp4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 8z6eYVeu7iNA-rIxRrIAGi287zAjWA9x
X-Proofpoint-GUID: 8z6eYVeu7iNA-rIxRrIAGi287zAjWA9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=812 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010085
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-spi@vger.kernel.org,
 Janne Grunau <j@jannau.net>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 linux-mips@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 asahi@lists.linux.dev, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-tegra@vger.kernel.org, Sven Peter <sven@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Saravana Kannan <saravanak@google.com>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RFC 1/6] dt-bindings: dma: qcom,
 gpi: Retire passing the protocol ID
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

On 7/31/25 1:46 AM, Rob Herring wrote:
> On Wed, Jul 30, 2025 at 11:33:28AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> This is a software construct that has no business being expressed in
>> dt-bindings. Drivers can be constructed to retrieve the protocol ID at
>> runtime or hardcode them per protocol.
>>
>> Remove it, as a pre-requisite for further simplifying the GENI
>> bindings.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> index bbe4da2a11054f0d272017ddf5d5f7e47cf7a443..745613b93b210afd38946030f7477e91e08c907a 100644
>> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> @@ -61,14 +61,13 @@ properties:
>>      maxItems: 13
>>  
>>    "#dma-cells":
>> -    const: 3
>> +    const: 2
> 
> I think you need to keep 3 and note it is deprecated. Does an existing 
> kernel support this being 2 already. If not, ABI break...

Hm, I thought this is a case of relaxing the requirements, although I
suppose some software might have had a "if n_cells != 3" (and not < 3)
check

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
