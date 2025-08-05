Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA21B1B5B6
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Aug 2025 16:05:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60245C3F92D;
	Tue,  5 Aug 2025 14:05:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6217C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Aug 2025 14:05:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5756vsFW010359
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 5 Aug 2025 14:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FUcLnureUr1s/7YsNTnvW5Csv2CIZeOY1lQ56p5/Cj8=; b=JswbVhN9EiO/3bXB
 KFFT2FK5zmrdDsAM9Z4O6z5zh7QsngVwmJQyJVPLIRQZy9tXuLlXFzx5q8QeK24Z
 UuASYCo8lC5r5kPQilhktpk99gMDFXxhv/dT55dfFGKBCQXaaStS6SqslNBHs+Pk
 6lpCnGjbmxM9hWGEUq1bYfANmhL1k2BCrodCT2z4jODPS9GZvl5Ka+gigTeBZa4j
 hrLEdMvf9GRA+didrRj1V7EI/VkbiYXs7SbD328oyEfQp3RkEeUY0iTi8A1CYyOi
 HGtkEWfS1GX9/TR+jdWzEglaT9vngedtZgPPmRClZ0L8g80N1lRCZfR6JAq2vIX7
 73cJtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek8ph7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Aug 2025 14:05:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e802ee0d2aso14090485a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Aug 2025 07:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754402707; x=1755007507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FUcLnureUr1s/7YsNTnvW5Csv2CIZeOY1lQ56p5/Cj8=;
 b=QYGuyCdoXRRQvJzM+Bq+VWLjB6anm0lDOoDfhEwBjmmIm6Rgj6i9/RrE22ncb6qfT4
 8WcfC8DylXRRSlsZ/Zg413SKErHlw/teYYc+ZzDQNAdbI4bibeG4563Z+mc19b7JaFd1
 J+3qPW+0F1uLqMZM9s2hP+8AGxH4aS3emv7qvwZ4x4I60ZQgZvnwOcEvBh7UDy3QEj4Z
 cNJ0LMF11vP8p3ns2xOI2yrMrAGbFbC1YlQitMazGwLLYJ2jV6b4AK8ZwwSQNIdLDuc1
 o+aCWhkRI7g5xUrCjno11lv9MPeOZtrCKGZxs6zwvi6qbu4hNC+Bv0j67I633rOZaigK
 nawA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx6NfeRdviHP4nzmRU2NGkriGNTWjrNioXsf+BJib0bBsmPQEnrnrvoD3HNrrQZA/gWQP0u2Xn2OjTSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzpPD2BQ8Pg0Mu1XY58qsoghe9pwEXv5QBVfqh1o82wypTjDyg/
 DJXwrCUhCjyXiOCPXbNxOs3dpTv5zGl/4sdRA9KNKqXKl2ppYrYriDnaVE1YxhsPU+gQsHxHgog
 qL+uheLeiLU4jL4+9JduxvBS1oOecgUH3/KvHeqsub+UXcfHmfJwPqrUcJb2uESyy/AvMgoMANi
 vgR/xWO8Y=
X-Gm-Gg: ASbGnctkDiWFjT1rEDA0iek0j6mQJSY1MBGgN3tyBcYdAKKjCKyPNs9NF5DqiMga6ig
 kuilcd49IuIh4jVp2I4DdqfmczNlb0/+r2pNJpigm2fcN6RKRxvZXKUHK70gH1fl73xM4nvgEzU
 zBa0wmSZWf7DjMufxCcrg8AxEHPQkFVXCF66PIH02h5UbdsSwKUnuNiHhwfcwHYLJpQqKQSiItw
 YOQs8lXHNty6kVo1u9B+jbLKxM2o+1vnW78bS/vn2EZr9y9gJeNmTnk2Sq48KFnyFJ+ZZncpxzQ
 BlVYlgoEfTAf+XqTzjIJTtVkMtJ92FRuwEKUY/A+FDCMN9njd7IAWE6ruL3j2q2wBSm0t/ldwQO
 7MfR+12Rhhk4Q0cLxsA==
X-Received: by 2002:a05:620a:2a14:b0:7e7:fbbe:a193 with SMTP id
 af79cd13be357-7e7fbbea796mr612195685a.3.1754402706891; 
 Tue, 05 Aug 2025 07:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu0CtTCnSeovH7oZZIpOsR6SihrS+IeJBeYEWKx2ZbtzZuol650T7aTGGDwlvwPzoxkQZS7A==
X-Received: by 2002:a05:620a:2a14:b0:7e7:fbbe:a193 with SMTP id
 af79cd13be357-7e7fbbea796mr612187885a.3.1754402706081; 
 Tue, 05 Aug 2025 07:05:06 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f17829sm8316020a12.19.2025.08.05.07.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 07:05:05 -0700 (PDT)
Message-ID: <96cf6022-ef69-4749-88b0-e18a07bb8427@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 16:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
 <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
 <20250730180417.GC21430@pendragon.ideasonboard.com>
 <aIpmgpXME1BmThxU@lizhi-Precision-Tower-5810>
 <20250801120007.GB4906@pendragon.ideasonboard.com>
 <0c2cc631-21fd-41fd-9293-fd86dd09a2d2@oss.qualcomm.com>
 <20250804235140.GB12087@pendragon.ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804235140.GB12087@pendragon.ideasonboard.com>
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=68920f95 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IUwAV-ZVHCOG9dU_XxAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwMyBTYWx0ZWRfX2xuoBscu5nbO
 4MYCdQkfYJfS1qQsW1caiB039DReDr7h9ACROFB2FhQhgu1ieH0UoSU4SSDr+g/uUGmGg/Wbgm8
 9YRs+fO0nFtbey/3jweKelAyBm6kpyiOEBMc9ES2QBVWbLAPkJeoDSD9MeoVKleXgQyLQ4Qft3A
 BXWueVfjmXx0onsGaSEjTfcGyhh+QXwaO7tME8V7cyAsDat9e8fKo+y7YyWga8zgvMwp8V+D4fL
 IYOzmHA+Pr/fQyH5ekZNDf4LeDAGGyiO9jszuu4OUS7kLti/qSPiOTXk8Wr8JIM2tpF8bXXV4JH
 B0EswQeLAyV9bsUC3lVhhDC5FF0uWotS7l0c/vWVfxnxpf/Z84ohBaH0rd8t+b73jcOVnZ5yqNW
 yosiasJbHs2wYitathPH9TWsybfi+yUaUj9uLK8lcwT+GMmYBoQbb0IguF8oozdbyfcg/nL+
X-Proofpoint-ORIG-GUID: Y_prRXBrcGxw_71fEUw8cskmSeb98RI6
X-Proofpoint-GUID: Y_prRXBrcGxw_71fEUw8cskmSeb98RI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=962 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050103
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <Frank.li@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Laxman Dewangan <ldewangan@nvidia.com>,
 linux-i2c@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-spi@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Janne Grunau <j@jannau.net>,
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
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 Sven Peter <sven@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Saravana Kannan <saravanak@google.com>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH RFC 2/6] dmaengine: Make
 of_dma_request_slave_channel pass a cookie to of_xlate
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

On 8/5/25 1:51 AM, Laurent Pinchart wrote:
> On Sat, Aug 02, 2025 at 02:37:54PM +0200, Konrad Dybcio wrote:
>> On 8/1/25 2:00 PM, Laurent Pinchart wrote:
>>> On Wed, Jul 30, 2025 at 02:37:54PM -0400, Frank Li wrote:
>>>> On Wed, Jul 30, 2025 at 09:04:17PM +0300, Laurent Pinchart wrote:
>>>>> On Wed, Jul 30, 2025 at 12:39:43PM -0400, Frank Li wrote:
>>>>>> On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>
>>>>>>> The DMA subsystem attempts to make it theoretically possible to pair
>>>>>>> any DMA block with any user. While that's convenient from a
>>>>>>> codebase sanity perspective, some blocks are more intertwined.
>>>>>>>
>>>>>>> One such case is the Qualcomm GENI, where each wrapper contains a
>>>>>>> number of Serial Engine instances, each one of which can be programmed
>>>>>>> to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
>>>>>>>
>>>>>>> The GPI DMA it's designed together with, needs to receive the ID of the
>>>>>>> protocol that's in use, to adjust its behavior accordingly. Currently,
>>>>>>> that's done through passing that ID through device tree, with each
>>>>>>> Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
>>>>>>> dt-bindings that are full of useless copypasta.
>>>>>>>
>>>>>>> In a step to cut down on that, let the DMA user give the engine driver
>>>>>>> a hint at request time.
>>>>>>>
>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>> ---

[...]

>> So.. do you folks want me to alter the patch in any way?
> 
> I think the runtime PM issue is orthogonal to the problem this series
> addresses. It can be addressed separately.
> 
> That being said, I'm not a big fan of passing a void pointer to
> .of_xlate() to carry device-specific information, in a device-specific
> format. This seems prone to mismatch between clients and DMA engines.
> .of_xlate() also seems the wrong place to do this. It would be cleaner
> if we could use another operation, such as dmaengine_slave_config() for
> instance.

Right, I noticed that the drivers in question already apparently do the
very same thing (passing data through a voidptr), inside slave_config
(via the peripheral_config/_size fields)..
But that doesn't solve the issue this series is trying to tackle, since
every DMA consumer driver passes its own structure (or NULL).

My immediate idea is to add yet another field, but that's lame. The other
immediate idea would be to put an `u8 variant` at the start of all of 
these structs ("we have tagged enums at home"), but that's lame *and*
dangerous.

Ideas?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
