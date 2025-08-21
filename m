Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 971ACB2EB25
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Aug 2025 04:22:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0454C3F94F;
	Thu, 21 Aug 2025 02:22:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BD7AC3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 02:22:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KILUMf021262
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 21 Aug 2025 02:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fhuQQAYtkFz1+EMzbo9h41xY8JijUtMlK2wIkAFemmg=; b=mx8Xv+UKFekjgIea
 zpwoOjBGpC8vG24HybBj9dFPUt5QlmnxYQI1nLF8qREnKjpKlPZWWhwvbIQSm75g
 AcfvH8kA10kv7f/86IZhqHh0uayUClUfBvRuLXE/AJBKZPrNY2mJlOufKoHv0fVy
 c0OBFnzpDknd9ZbpLkJ98UFg9FM+oxyx+q7o3t19K0C754pSN2QwlwdVhOeGq05S
 wyA/ACFZPVgH4tfzv/wZNXwBN7MwYWzXTMeO+citUmkwfWKIixxOuoUwhJzeacWI
 NaBtSrWeTcKHyU4ig+xdplvCIu80jwleequB4k36qWtceMtk4klLI/tzwrWQemCl
 SJD2FQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5293pey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 02:22:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-32326bf571bso1226295a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 19:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755742936; x=1756347736;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fhuQQAYtkFz1+EMzbo9h41xY8JijUtMlK2wIkAFemmg=;
 b=Gc7WOBeIkOXZOp23s6LkShoolnjAR1j2nlpS7cRGy86Q8AFtVEH3YoSIaGX7/Djn8U
 olStLYyvkT3hZ5Df0D5wfEvLEiSCBG2FKOrmB2k+mNaIVxQ1a/H50NQTP+WWc15X62vh
 L7bUiSOB1Kv/IYCvlrPpZHCDKI9mgMYNEEfTVTbu5WGc187RIYCXVle0WvCUw8CG06St
 I4JAUBBnljfH4htID1VW7kCBPqg9WnoktWt9QmAhDXqXNP1U7OYvDlfDA0K28DnHNh8K
 gtsmv4ypv2cjnWcFyc9AAjzlFXqXRBta23ont3vOVGDtVf94KC9p5Ow6CLs8I0LuBjl8
 hzbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpAoX2X5V+NCLRYzP+mnp4N12gnp+hMKQO7o4XBk11UAnMCDbjfHMHES0nI6V8psb/ivPLejd1NZwWxg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6X3rCIdpSIGw2pKKWsteF6u6P1jtkcHELaArmb1XLF7Q3sI6z
 QNPeWNqlZxEGenpo3FX3ilXLCk+8FqILG+y5tMVksF4TH/fxfPkA5fFbzYYCYsLBKuzeWUkTLfZ
 Ip9/REsBIrAGCOoyPToO4TBDMeMcAHOBiDjzknoCYMmTLBKHqz5ird9cumX2x8fKd/RndrhEnAD
 KC+0pPFIA=
X-Gm-Gg: ASbGncuEvH1QyFS40TpDgAH1hIw4xv0W24DZyZoLPvAW+PH06X0vVOUD3U5BfRFRU8i
 CP/RK7im3aIoFCbs48DFJv3l3oTCgYDak1IWDg7str9LeGXxRJvycMM378IUEWTlbafOqLnkpPg
 nCYXE7dxGpTV7I6YeOrAGn/WUMtGY6t1LdIJNNUoOZlH03vV9phC6FgLjuDQM+/aPo21+S2zuy+
 jb8M3Ol6yKwg7RxsF7sFylIJFZikhwsp+DDqzJjpVhD8NeE746aRnDE6fUqNp3FzlKV5NcwBe3o
 HdatGoUiAR6++Alfzz08G0WG24QlLXU6LpWwOX9VJ4MFpNQcJKQtYADWPDgL612KhGW4dBUnEyC
 yTHi1Mstu3fH7boh3GzKqIejiRcWkVHgj
X-Received: by 2002:a17:90b:53c4:b0:324:e642:b5ca with SMTP id
 98e67ed59e1d1-324ed13a72dmr1379021a91.29.1755742935720; 
 Wed, 20 Aug 2025 19:22:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJRz4sysTqGhrRLL4dSQy2QlK07feYrDXxAVKB+n79aOM7MsuZWRLWFY/xgGqdwpBUmHYgnw==
X-Received: by 2002:a17:90b:53c4:b0:324:e642:b5ca with SMTP id
 98e67ed59e1d1-324ed13a72dmr1378979a91.29.1755742935196; 
 Wed, 20 Aug 2025 19:22:15 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324f23d745csm356703a91.4.2025.08.20.19.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 19:22:14 -0700 (PDT)
Message-ID: <f467aade-e604-448d-b23e-9b169c30ff2e@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 10:22:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
 <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
X-Proofpoint-GUID: yBvjo-Lg4IPxZE5x6BI1a7Bib69wjPUy
X-Proofpoint-ORIG-GUID: yBvjo-Lg4IPxZE5x6BI1a7Bib69wjPUy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzlqriihOYELh
 jhUCh1sd3ukDELMx9BXAjnP8V/GlXFsWoRU8puemEtjgbQtPLdKJBGisodTGCQC34xj89CWuRcx
 z/YSSqW9iay2XZW4vV4oxZcpbsRG8f7UmuosPoOnIHL7oaCDVv584nXCG7nZXnNLkwton+HS8sZ
 cquMZG+j/sNa/3Q1t1SMCDcn3JW4LTdSPZZmIdDg3anJLvjwVNH/Eqsb5RO8LivxsXiIjYGtIbs
 CgpvAtMqjgFzgFUp+uMhQo28SBAfnRxcHbCVoZMVUmLjoZ1FfmCKAPSl0naeIAMBmkmGyOWLLV8
 jA2TcHEY5vfRFbMDEDImbaPI1NwesSVuoPCcyrYKngr4vkMc6t6XfDdnrvwCZDBlDZJcilwXTqd
 1+PUNrbGCHX7NG8f5AO8RvXPIXeNZw==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a682d8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=uddfqdTxQVX4ueY0IN0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
Cc: Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 stable+noautosel@kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/6] net: stmmac: Inverse the phy-mode
	definition
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2025-08-20 00:20, Andrew Lunn wrote:
>>   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
>>   {
>>   	struct device *dev = &ethqos->pdev->dev;
>> -	int phase_shift;
>> +	int phase_shift = 0;
>>   	int loopback;
>>   
>>   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>> -		phase_shift = 0;
>> -	else
>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> 
> Does this one setting control both RX and TX delays? The hardware
> cannot support 2ns delay on TX, but 0ns on RX? Or 2ns on RX but 0ns on
> TX?
> 

This setting is only for Tx delay. Rx delays are taken care separately 
with DLL delays.

> 	Andrew

-- 
Best Regards,
Yijie

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
