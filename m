Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C1B18E66
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Aug 2025 14:38:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8980C36B0D;
	Sat,  2 Aug 2025 12:38:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CAFEC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Aug 2025 12:38:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725f2Nf021539
 for <linux-stm32@st-md-mailman.stormreply.com>; Sat, 2 Aug 2025 12:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yY+5Vc4wWCp8Q+lqkXgyh1f1Eka3dbE6PZDRDj30axM=; b=iLj+yzbIUQdJmpPE
 HSCMNc/WukNLpBT4WQTMuU2Elh3jlNsbdJ3wd7gziWpdQ65t+tBxIrNYtMU+MFuJ
 HkIflk49HRXLBE2e9aKmEFEMADiJXGpyVkCfWqzZ2oRbpsC/Is+DUfmvIOCD1CL7
 +su5CJLM5ymQuGWntuLQlXV8emoqlaA1Boot08Xzssob33f1R3HI/ecNvYw7Rexb
 A0P7DlMACxYME3GtSMcdlQDuCabxpvlQxkQpGykwEkKpz6XKqy0U5VviVBINJlk4
 vqmrWlp/XyTcfHt6AsjKW9089optU/83B4pIoedJbH9vwu6CHrl90A4PA/AyXS0L
 8x2ZGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a0m0uv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Aug 2025 12:38:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ab3f1d1571so7126941cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Aug 2025 05:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754138286; x=1754743086;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yY+5Vc4wWCp8Q+lqkXgyh1f1Eka3dbE6PZDRDj30axM=;
 b=arpvgCRPym0nwdQko/Kixev5J9KChLVnz7QQw+Yxq3DxzZDOq3Dp2ZxVM3gI2JthKs
 XlfT8LL/JOPuJf1RX3wL2hxtS/S+17Oyypym1iIqu18UvTvzfc4zjuoOKJb1s8fIM6Kf
 e2tp+P5qHmQbvx7aVRhcoBo/Ds84WnGyqasRsuFnuMRkS/Wunun3fp1eqOew+/FHbs1F
 roxE8SljEKyt+Vl34wh0zOs3rS9naPPsHBluNezqelYhUOVFHZ+ze9oKfbGI2cYeOoGm
 r2wlM0guexX3STr27OxwQO122SUuv6oDPIJMuEvMHwK4C/vgbmEwpocPloTJArNWughq
 Ofbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi92Bio/+Yqi/yrg70mCy3F250QTP4XhMGTjPkiGPh5BxdIWg8UXjz5N71dcFa7eDBvqbRTzb8iYRQuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywo4wStLwar+HxuGBa/2d15U0k6DqpQYE3wHoBSHAQx4DJXFLsx
 KFtYOkqyave11/FPBYH/6VN/zcGpgxW71lWiK3CTNKnoRvqd52xjoiOBtukIAeVUMQPGnioeWFb
 kejZWRmPMedx6el7SpYPd67hANJd11v/No+aTlOLsE5v+IIDdeotTDjm5OwhmxLAPnr3yM7K4/Q
 oiVBm2BNQ=
X-Gm-Gg: ASbGncsoE8ESG+qdVoWuhuPrNf03CSykXGgXhFlP2IU+MT+D/lNaHSgKMhZ/CG1cY9j
 gTwAOEvfcWio4UvG5v30/iiAqD7RD6Cb/buLRtapUBzxUK681Qodaya9ZKsaUN9hlypwZpKrMQj
 ZdH22v/NHGsgoFtlU7+OZ/6so4+tCNxF0cJHU++bVncvgE1RsZfXW9TEVWl8n21TqSiAbfIw/wT
 IVPnS9/L1FcAtojYbElawrOAtXy5tE27GfovICuyJGBF5QppEOVlSfCILb5Yf9Gtq7UKpTmAeae
 q1Ml3ZPPFXpbWsTRHsMHNrIvqawh9EFcr35S3hNg1g3oArhixXLDcidS8K5xmYjS4sIBEs9nWqA
 1JPcwv5O9FRQXbwkSFQ==
X-Received: by 2002:a05:622a:54e:b0:4ab:67a3:ec09 with SMTP id
 d75a77b69052e-4af1094cd78mr22382351cf.6.1754138285268; 
 Sat, 02 Aug 2025 05:38:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFPF9qOzJpGO98jPyAvuhk/RML1vSf6VMcwdOoFpMcr/LQVR1VYdVHuTAn5xus4wthkO0plg==
X-Received: by 2002:a05:622a:54e:b0:4ab:67a3:ec09 with SMTP id
 d75a77b69052e-4af1094cd78mr22381721cf.6.1754138284551; 
 Sat, 02 Aug 2025 05:38:04 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0761f2sm434931766b.11.2025.08.02.05.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Aug 2025 05:38:03 -0700 (PDT)
Message-ID: <0c2cc631-21fd-41fd-9293-fd86dd09a2d2@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 14:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <Frank.li@nxp.com>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
 <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
 <20250730180417.GC21430@pendragon.ideasonboard.com>
 <aIpmgpXME1BmThxU@lizhi-Precision-Tower-5810>
 <20250801120007.GB4906@pendragon.ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250801120007.GB4906@pendragon.ideasonboard.com>
X-Authority-Analysis: v=2.4 cv=JOM7s9Kb c=1 sm=1 tr=0 ts=688e06ae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Hh3C_mqfd76DgmRPW0UA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: lDtDVIZXdlyCR_0wPRUFlrIEnuQEk0t5
X-Proofpoint-ORIG-GUID: lDtDVIZXdlyCR_0wPRUFlrIEnuQEk0t5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDEwNSBTYWx0ZWRfXwOGo6jI8ekq7
 KsIfQGrJH9Ianxi+TtcOM/0ZhRE6JpCRnLgFaZIuKcFB7cnLkslCSEH0DdYGodWl8Ol6NMXuYbb
 csI5HmsRYAG/nxcnfIc0aaV00lQ6DqlxdXJW+wQiJZgu8/bgWe5zC/UmZNB0SytEGfz7nxfrFJS
 IaQ4Sl3GQ7XvmV3g9BGqD7KIUcR8k8a6lrAOdiv1/PRT5Kd3hFzv9OT6slvl8RSRiEgzI7IZf9x
 pQpcXmjmoiM8Oi3kf9q9RJ2lDiW5eFp9OorsbvaYc7swk3Oictau2gN3TBGOxNv/3ytUqZNNnDG
 au6jzXycgumYNUAe+MZanTloARxTeQrVGkIrnE6g659HXk9YRP62er0b7Pjsi4B7+AkSNUAA4z3
 lKnQ2vlf9rBcPDW7lzYmLTk82y6AC7ZRxxlQERN8HncyUtCk8A8t+TW7+dyjEbpThqho3Qvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=941 spamscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020105
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
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
 linux-mips@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
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
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
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

On 8/1/25 2:00 PM, Laurent Pinchart wrote:
> Hi Frank,
> 
> On Wed, Jul 30, 2025 at 02:37:54PM -0400, Frank Li wrote:
>> On Wed, Jul 30, 2025 at 09:04:17PM +0300, Laurent Pinchart wrote:
>>> On Wed, Jul 30, 2025 at 12:39:43PM -0400, Frank Li wrote:
>>>> On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> The DMA subsystem attempts to make it theoretically possible to pair
>>>>> any DMA block with any user. While that's convenient from a
>>>>> codebase sanity perspective, some blocks are more intertwined.
>>>>>
>>>>> One such case is the Qualcomm GENI, where each wrapper contains a
>>>>> number of Serial Engine instances, each one of which can be programmed
>>>>> to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
>>>>>
>>>>> The GPI DMA it's designed together with, needs to receive the ID of the
>>>>> protocol that's in use, to adjust its behavior accordingly. Currently,
>>>>> that's done through passing that ID through device tree, with each
>>>>> Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
>>>>> dt-bindings that are full of useless copypasta.
>>>>>
>>>>> In a step to cut down on that, let the DMA user give the engine driver
>>>>> a hint at request time.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---

[...]

>>>>> diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
>>>>> index fd706cdf255c61c82ce30ef9a2c44930bef34bc8..9f9bc4207b85d48d73c25aad4b362e7c84c01756 100644
>>>>> --- a/include/linux/of_dma.h
>>>>> +++ b/include/linux/of_dma.h
>>>>> @@ -19,7 +19,7 @@ struct of_dma {
>>>>>  	struct list_head	of_dma_controllers;
>>>>>  	struct device_node	*of_node;
>>>>>  	struct dma_chan		*(*of_dma_xlate)
>>>>> -				(struct of_phandle_args *, struct of_dma *);
>>>>> +				(struct of_phandle_args *, struct of_dma *, void *);
>>>>
>>>> I suggest pass down more informaiton, like client's dev point. So we can
>>>> auto create device link between client's dev and dma chan's device.
>>>
>>> Is .of_dma_xlate() really the right place to do that ? If you want to
>>> create a device link for PM reasons, isn't it better created when the
>>> channel is requested ? It should also be removed when the channel is
>>> freed.
>>
>> I remember just need record client device pointer here.
>>
>>>>
>>>> DMA Engineer device
>>>>    DMA chan device
>>>>        consumer clients' device.
>>>>
>>>> If consumer device runtime pm suspend can auto trigger DMA chan's device's
>>>> runtime pm function.
>>>>
>>>> It will simplifly DMA engine's run time pm manage. Currently many DMA run
>>>> time pm implement as, runtime_pm_get() when alloc and runtime_pm_put() at
>>>> free channel.  But many devices request dma channel at probe, which make
>>>> dma engine work at always 'on' state.
>>>>
>>>> But ideally, dma chan should be resume only when it is used to transfer.
>>>
>>> This is exactly what I was going to mention after reading the last
>>> paragraph. Is there anything that prevents a DMA engine driver to
>>> perform a rutime PM get() when a transfer is submitted
>>
>> DMA description is a queue, It is hard to track each descriptor submit and
>> finished. espcially cycle buffer case.
>>
>> And according to dma engine API defination, submit a descriptor not
>> neccessary to turn on clock, maybe just pure software operation, such as
>> enqueue it to a software list.
>>
>> Many driver call dmaengine_submit() in irq context,  submit new descriptor
>> when previous descriptor finished. runtime_pm_get() can NOT be called in
>> atomic context.
>>
>> And some driver submit many descripor advance. Only issue_transfer() is
>> actually trigger hardware to start transfer.
>>
>> Some client use cycle descripor, such audio devices.  Some audio devices
>> have not free descriptor at their run time suspend function, just disable
>> audio devices's clocks.  Audio devices run time suspend, which means no
>> one use this dma channel, dma channel can auto suspend if built device link
>> between audio device and dma chan devices.
>>
>> Some DMA client have not devices, such as memory to memory. for this kind
>> case, it need keep chan always on.
>>
>> issue_transfer() can be call in atomic context. but trigger hardware transfer
>> need clock and runtime_pm_get() can't be called in atomic context.
>>
>> Most case issue_transfer() is call in irq handle, which means device should
>> already be in runtime resume statue.  DMA engine can safely access their
>> register if using device link.
> 
> You have good points there, in particular the fact the issue_transfer()
> can be called in interrupt context.
> 
> For me this calls for new DMA engine operations to "start/stop" the DMA
> engine (better names are likely needed) from a client perspective.
> 
>>> and a put() when
>>> it completes ? (Logically speaking, the actual implementation would
>>> likely be a bit different in drivers, but the result would be similar.)

So.. do you folks want me to alter the patch in any way?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
