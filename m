Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA5GG0mGFWpXWQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 13:38:49 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F15D4FE8
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 13:38:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F01D2C5A4C5;
	Tue, 26 May 2026 11:38:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12DCDC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 11:38:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64Q6YhDi2145969
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 26 May 2026 11:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=; b=ottv7G/kaQYn5ADV
 +FQYimnhRSKOYIkxzJOVcCAzUycn1xlCnMgNvLj5KiZDfi+KqDyBCne6aNMf1HIx
 LYxoIpoWhsKWMoWvmh2J5Varb+0x2Uj5ncLlEaHn3vs3xXM/Uiib4uUdDgDWERwe
 qIM4WwqlxuGuTA1g+8HYE401aYWpb08/ivr2VXPwTEcgfKJoDO/mS8ffpTTcP81G
 8Nn5zl1p5tJuLwJ1dUYhLxeJ11CIh/LvoAa34tvuCUZyxhW1M9FYCZwsCAwb57QY
 aSDenf09drCCITyvSMlAJFN/1BiU03PFuy/5U772//2e6XkfpIzRai/q5j/55sCN
 IVbxhg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv4gxs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 11:38:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ba838d3fa4so105325235ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779795526; x=1780400326;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=;
 b=DWyjNxXDkIb8zNYOE7QTNSrj3aLoIuDqTZP65odbPyTia20BJ/2TCEPHMjKC8GGaci
 94FeySYGrv5wSshHnXMPnJUbzODm2wA/x3vfFciLGzXP3R4jDxCaV5M9feqUbqIkNSS+
 78slKeZNOCG76LnZ4stw5X4a59Ty05poip92408T3j1/xpaEB+sDADn8jm1DQd0hD4+s
 aNTX3vosDmvWDDSuzYk3k3fxkDnq+Q1Boe7KxboSUBtBF3JT+rahNvIcUG/kSx/P1m/F
 +CIlxEz3c/JtK+1e8URdqfut7LFDghI0Rbl7NDbd/BlvgY0Jym8lvX3wda9c7F2LEvIi
 NUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779795526; x=1780400326;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=;
 b=mnFkFEBvQe9AHdXaSgnOk2z2F+811jLP6HX68mBAktcWDUGCQ6YSqY61JorvFA7ywB
 fOy/9ZJjth0CkFhSrUhg24+IDUH+J/h/3RBxqkLpqeNTVuaFnNN1058TxhvtI+l6DMja
 +NsAjb0LuGNGalzx+29slMKuWsWKKYCE7eNVTe6izby9XrX4rWhOEuX6hKtRCYK7cQqn
 I/Me2DkcjC99RVVWvj5Pms1BduwGbJ3F6tb6RocR9jEzSlBOBQ5ew0/etPCfN7cLzYuA
 Q3qNYbWcyBfABRNM2eubhf9OnfoFKy99Ip3p5pMRIDDm0frK5Dy6YajIqB8aUF+sBNwB
 zhTA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9EWwkWOuCdxfQo7f8BnFCu5U1GE0qk3heuehILmwHphHBQIBPC1qNtaf3uvjsWsDkc3+TB4V2tse2ZAQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJ+GTQcxOkGLysnfjQyPd9HLL6SrZuJT/jyHa2cELXRAhXvorN
 k9OSMF81DxxZK5sk7548qXlNXvzFBHK4r6+r2TPDUJ1SDItOzJQ7SXQWUErCrWvcvPVxmN5zi68
 LbcjXu7LL8gRSbAVvs9RWQqAIzqFq/P9zSbCoWlkUc9CUVmxHdXKO4Mr+ZiYavGa5rL1BMnuAAx
 7JDzSYfio=
X-Gm-Gg: Acq92OFlQCjlFf3YEQ4X4VyIkmWaDSBES5fDTOgcUDj2Uapd4TZWBEloEolEvSXOVtl
 hvId5lrOfm8IGxXIDPzk1IlAN43G155ElDcNrCap3f8cEge7er+ok8Cvmb3eExZMOcK44uA795h
 d+b23Um+DoeEzg6Uj02Nxcwkle/pL7dXfNyem62jI4/WSVB4Nec+CCOOMAGhkMNvuRXTnmPi3cC
 bhCQ5WeqPxhTJ+Ahf1hkmBdILrwi3O0wTlGS2unEOCyZl4yvbfVtAvpOEK0GbTyScsUFvZwAfMF
 F0PQbR0VRcpWN4NkbISKSnjWYvpyTqfqyfaZ0t8VJYnGLzTz3yWJR6aPup/vBbG6KoBPHiLWEJ8
 7JzRoEzIG4jnkRG5Ohxu5HshgdqmpMaJT7gOtewJ5uQgDTad2JQqYaWa9z4A=
X-Received: by 2002:a05:6a20:7488:b0:39f:a8fb:3354 with SMTP id
 adf61e73a8af0-3b328cb6faamr18622511637.17.1779795525610; 
 Tue, 26 May 2026 04:38:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:39f:a8fb:3354 with SMTP id
 adf61e73a8af0-3b328cb6faamr18622473637.17.1779795525054; 
 Tue, 26 May 2026 04:38:45 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84164af10b5sm11685360b3a.15.2026.05.26.04.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 04:38:44 -0700 (PDT)
Message-ID: <bbc27f64-cf24-48f6-a577-5c1cf46d8117@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:08:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
 <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX9E4b11nxy0k5
 A4SzClhXBIuGmVCiHmNqEdBRBIzmpMgN8W+TAkphi8CKfFd6mXjStdCyqoZIJq69SdqFEqejNop
 5vbT/azOVd7BNXQW8eGleJBZVwM8+JXw6rf6pKOK3chVeVA3j7cQBB3A4HdjOFfBYrNtCMsHS8s
 RTayp8o0WedcibwuoNhowzkT9E/N/aIFh9pDQOx4R3pKd26B1k66b7ArVgXmx7IWWzF0SojhCp8
 8hiRD5MvXVZoozaxCmQAV7U1CLLkAj3cO+M1zqLbbmCAD0RTcmYIYtw80fQqPCXpER8sjcYde/o
 rxtJb3xyXHBUy1gy9cgeG0UMVELdPSRYHa8Fc3grS/eStbLeNKbierGyScHCpO7Egn8IzSLsaTv
 qVo4HvnAn8fYPpPaQPJ6j6GdHiFzF2CS+xeWdIaC/frQEBvOzmEnqVdFbOfVXrKtL+rGQ2kHimO
 XGrib1/e6MbdroLJLlg==
X-Proofpoint-GUID: x1O9PFy5d4wMwstMPAynZzEkMLTRpYBz
X-Proofpoint-ORIG-GUID: x1O9PFy5d4wMwstMPAynZzEkMLTRpYBz
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a158646 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=9AdMxfjQAAAA:20 a=JnjiVvBC-mdIheWOmMIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260101
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 1/7] dt-bindings: clock: qcom: Add
 video clock controller on Qualcomm Eliza SoC
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
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:imran.shaik@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-clk@vger.kernel.org,m:luca.weiss@fairphone.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.919];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,oss.qualcomm.com,vger.kernel.org,fairphone.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4B6F15D4FE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/2026 3:07 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 04:16:03PM +0530, Taniya Das wrote:
>> Eliza Video clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza video clock controller to the existing
>> Milos videocc binding and add the dt-bindings header for Eliza.
>>
>> The video clock controller exposes power domains, so '#power-domain-cells'
>> must be present in the device node. Add it to the required properties list
>> to enforce this in binding validation.
> 
> That's ABI change, so you need to explain impact on existing devices -
> Milos.

Currently there is no ABI breakage and no impact to the existing
devices, since the nodes [1], [2] using this bindings are already
specifying the '#power-domain-cells' property.

[1] videocc -
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/milos.dtsi#L1849
[2] camcc -
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/milos.dtsi#L1918

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
