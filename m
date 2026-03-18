Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC1NCk+RumnSXgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:49:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9502BB120
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:49:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F278EC87ED2;
	Wed, 18 Mar 2026 11:49:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A29DC87EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:49:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62I8vZNg2730162
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 11:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=; b=PvGlctYeeBT1dA7G
 RwPpFl5T2vcc8r021RTxtqtq8x4jLuHXSnWRaHaLjD5859+tMWClat341bT7mLXP
 OmjHRXJFqeFGlNuwBon+fUzODu0HXpMoLg+r96wcf+r4+yTBcNpQqhYwOuVTnk6o
 GBhYXoOnpaXUcMG1GBXzSJedo0Fix1cVN4uHfl0Z5zB4eQITkl5j3W2mrZclLoCg
 lrqZptJ98MQaWqY6M8tmLSuDqE/I+EFgk7N9xGGJiYz6E/fp2Sy7zSNPFISfmdfe
 kPUqZjqrxSoItgY6CZ/KfYgo5gB+S+uyz1UaOPXObjYhyv+7vLfyQsw17eQu6hy7
 XZ5Wqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvna3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:49:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50918b9bcc5so43420971cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773834570; x=1774439370;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=;
 b=kUEcPAQ3TANujL1fZlUNLnYRV0nF9sOhar5tD6bJpEgVWVpvb7jqD7uQudID+o9I7Z
 G5GKGwTMKuLAPGvP8fRPfNLa5dhQKrAxMs5OkpQc738dGY4gmZEeTxr2KW/evFZ+rHZo
 /dvTq05fIvNvT+cgDYsSGMMi2lwU3TNqco1vD9JrVvGoKOV5e3wVS1vX4fHscam9LFy6
 /s8On6e754RlpZD66gGsyWj8oa1ksQqXAWhtU2rq1E84k4h8QV61YCTBrIYDi/ALGL/T
 CvQ4S4WRT/8ZxKldjBxDAsgf+w9eucIhT6nUPNrcDIhh0P4Ljt8YsL05Jg6RWbYj1P75
 IX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773834570; x=1774439370;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=;
 b=SuiLSIGavfr9YU71zLDsTjsWVt2gw6nJDjazVJ76US9PsnmFpdxRyHWl6kjOoib5eL
 +kp8Ut5VFUTtSQtc1AwRP0g9xABd6UDo8XPC2ZCnSQVR72HldToTzPCS0ZL8zLW+LXxY
 +Rk5MIkuU5Rb9eWuuURVTR86gh1kJczrOaSeJa5429o7G6QzDUz26SG6iUy08mLKgig1
 aLZeI31UHvkZIIVC77TUM+2ebZDcHYqu15kreOkFiNZo0wd2n3KNxzfTkasORgy/HTas
 MaWfQLgnh7V9u7wQYaUGGq1/74sxEWrjx6pw00AquEtkjlbwcrSXptp8MebZMjomu35c
 IhDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzQRdFSUTQquCCGG9Jr/cUtZYKXyYZRopoXskqDzv9CBN3QtiB4Vmysdm4ic6vJneUcIfT2DRUq4GFdA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSMZffstT81m5CML+G/WjYH2GcqmclcQK5foxkcAxgsJI96Jt8
 H/ylru0BSuC97ZrixSww67L/PgoEUdCBUvRVjxsidfBup8gIqbIZr5IrcFTrSsd8DWeD/GwIaZR
 ulDytw+gsefR3dq8nOzTvKDnKlBDx7fph3nS11qOY57S+ncNgpPcBtmZjRcR8VYt8pgm9gjh+72
 yg8XoC1pE=
X-Gm-Gg: ATEYQzw1tbk+qM3/jH2utY2NkyhPzO0eM3NbWXLBtFA+hD532hmqnIJiGvYMuDUt6Sr
 XLHhGm5M9t75kMbJd6u7y5iXXGMokx3F4K+9iBfSFNZCNM60o/ghkb9cZobttzbCFzhQqqMD1Sm
 strY3rQkYmvI8+1R53PJYavOAkvWRiWGopuSeqLqv1b0la5AOeYkM+4QHPEJ4pldjsQ/6/8DOOJ
 n7EoBpi0kz/Qh7V56CGt6oiCdk3hYJPEPkYs+/GbT6DqzmBNovwLFri7UWdp3HF6ijjbrPyZD3F
 OUcnr7oz+4VSCbtky0Esw+R8EYSakj3rYrWHCJ983cgMqntAYWYUFVsT3akfKqPx6aqpYW3nFr1
 r+6Ja1qScL7Gfq0tGI8cfmSfbbU64naxgJkQQ7y5PAJ85rAKAm+DXAw3nveVWfVUvTGngEwYGRS
 D3DE4=
X-Received: by 2002:a05:622a:10b:b0:509:2a92:8088 with SMTP id
 d75a77b69052e-50b14752dcemr27744431cf.1.1773834570102; 
 Wed, 18 Mar 2026 04:49:30 -0700 (PDT)
X-Received: by 2002:a05:622a:10b:b0:509:2a92:8088 with SMTP id
 d75a77b69052e-50b14752dcemr27744241cf.1.1773834569701; 
 Wed, 18 Mar 2026 04:49:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-667ac611b88sm1815696a12.0.2026.03.18.04.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2026 04:49:28 -0700 (PDT)
Message-ID: <9148cecd-6632-46f2-88f3-152c6d6df10c@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
 <20260315-stmfts5-v2-11-70bc83ee9591@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260315-stmfts5-v2-11-70bc83ee9591@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX1MdRmCAN/Qmv
 JN5cqQaQiKKlJCKN3dYTkaFHdaZFyTxZpRKqBO/MKAiH89GGB7juusRKvlw2Gy3Okpa5p5G7el/
 3jSTvvfzmBxeh6so2FkKEe5iK26kRLGAjgvPr/MeQNcp8bpITYFt6jv82Fmw/8PGPvRhDWcPRx9
 1Q4gY2eWVklMAKDSGHgWo80aySHDN/x3UyDsCS4hr278gk7CRou8V3KNgj37qOsuI7BBi5r1QGD
 fF68RQsr/xCAzdJz9yPlVuNAoGk1HVoDmhQQC+SzpPI6FAEMlfXOlmC0/39p5cwWzeCTO4QMCkV
 jM3K/W1Ch4kgtadC9Eau5o68o+4Zb+dK2QFvT281tQa8yKk1s8qMrqxDWjUI+njhK12DM6tdU9v
 6yAocJTV/tT3pZn9d2G+EOVHyHDvzQGUblzTgm5OrJ5im+dNPG3BPFfWRZAtXqU2D9dkfcLQH/g
 LJGg3l2//97KrgKfE4A==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba914a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sfOm8-O8AAAA:8 a=8wVjoaYgGRnUAGDsoUAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: z9x1lFyF08XRQJpoKdVNbw5T_BQYKj0r
X-Proofpoint-GUID: z9x1lFyF08XRQJpoKdVNbw5T_BQYKj0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180099
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
 phone-devel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH WIP v2 11/11] arm64: dts: qcom:
 sdm845-google: Add STM FTS touchscreen support
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,foss.st.com,kernel.org,bitmath.org];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.49:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.505];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,oss.qualcomm.com:mid,st-md-mailman.stormreply.com:rdns,ixit.cz:email,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 4F9502BB120
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/15/26 7:52 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..48d7e7f83c285 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -26,7 +26,25 @@ &i2c2 {
>  
>  	status = "okay";
>  
> -	/* ST,FTS @ 49 */
> +	touchscreen@49 {
> +		compatible = "st,stmfts5";
> +		reg = <0x49>;
> +
> +		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;

s/touchscreen_pins/touchscreen_irq_n?

also: <&foo>, <&bar> (this produces the exact same compilation output
but making them separate makes more ""semantic"" sense)

> +		pinctrl-names = "default";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 125 IRQ...>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
