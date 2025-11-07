Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB208C3FBE0
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 12:34:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 573EBC5F1F4;
	Fri,  7 Nov 2025 11:34:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEAAEC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 11:34:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7BCHSY1864565
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 7 Nov 2025 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=; b=mbhMlNg6a8Eh/Eg4
 jC25f3ERL8KtItYqJP1T4SCPF5sO0yqkdB/xxI28Sow7f+paVZT8IcxO6q5WKQco
 /QkkvXrNM/3Q3kWcCFtMNkq4grI8mKUGYV+bm4ugCTP2g8OQoXj8wj5BxmO5GoVj
 HZ7k/6AECNCJ4h1xe4jlr2ulZQiI+U558tWmsPc1MgRZycHjGyxW5DjZ7RNYU/dj
 YF8HL/C0CwjXjsbF36F5CLW6bgeQhOuajLrj4XgY7n1W5bzVRPTba0mryeYs9Is5
 thz4vL1lu64xgwoyOettJbFuvWqG9u+hsQ5Kj8r1U3MZb4GtRTCqRERfMt5xuC8E
 ay1pzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a98ta1bbh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 11:34:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed6a906c52so1690071cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 03:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762515279; x=1763120079;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=;
 b=BE7zD05zWx8aA0Hm25vpLNF0iuAzzDC+bDFvBzItHnftepwkC2h9SecAc4U9j4HXNB
 nVkn76FywIAiU44Yrn2NGi2HkIIC+9ekbsqMnJKah0cqua/X/1dYeSk/hMIOQ/R7jw3O
 ickCTLsullhCifITJAYVhonAlmnsOzDgwFaIhlnAjjLSh9vThitFwat2h1rbM65gaqcP
 QUVOxavnnidGRYqOZRDbb3TKO72powoaX6xNGbRrpvPGYOOy63+OcIBqV+Cg/6S4s/Kv
 iDmUsXZ+9vAdLkKVX3IR+FAI0z8pJ7VUNjTnFrR4sNLpvFbdT8Xw9D5/TK0OanPaLoRH
 6M+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762515279; x=1763120079;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=;
 b=UBAbBSg/h96A/TqlN7nyOO4sBz5kCcIvZK2V8fnrNGyKwnLCPDafB4JlRf5gXa5+Vp
 cBOwwA+VU1n7OJrOslt1vBgZfu4ku+U7SxNEVDTMI9okuTqHah4Z0ccznQD8KrtDD5Pg
 ytKNgqB/2/eBnGkoDY2u7D6lPQ66W8Cl9nR0PtIEXR0/pivMhTliufZm7yBQB1KN2DHR
 Jcc/qjrBdUxKQBbS5aMsavKfv/PK2WB8pPgN5dnvnErv0GXwc6h0NKtnDmwgw6q8a8j8
 XvepsacVSSmazX9W6n9+BrEdum51HolJgFpo1feeo2Gt220t0ZpaDeJZNCXzDyMX2xhH
 LI7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2rD3RjSjzC33Enteww1c6eW7ilPd8LjspwGwiohBNZUzOTuyq0IscNJUmaHQscz0v0UDIKDvN+HGa9Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzbew5hH9RUjYR4VgSe1MTXKeYrOokkvo9UD+HyVvWq1CBtItv1
 UpAIRF4OVTF067TXVdVb59NpiN1JDE3uIMe5SPaA5DE2y+ZyYCv5lCEArAdSdnJjOLk5gL54+v3
 BHdgn+z01dqrJnxUkbSN0Dbgw9hFzoIxM4zdaaQrM1qbLoswz60EF+3gpc4UP0yv5BRpbtq24iI
 zA1yzktZk=
X-Gm-Gg: ASbGncsmOEPc+AYZfCH3MatAsXX5hWg3V5ZGjiU1QLeQ+YYYsHfzAq12/OB7w4cjSgP
 4TE5szx+ErP72g5YNP2yV9g494rrvvJShrwEhLtT2poqf/5cNZx5CIQYsb/8mGeqVu8m3t4YApL
 PqYDLyUE29Hw5JtqijzL/DQIvRhDp92Vb5dJ+SyKCjoHRuMfWz+C67cPoMrR/9ouaKMWyLiybwi
 PYyG5gfhSzLLG52cf7auzBCjFs+zCrPlRZCwrVDYyDTuvEX3+25DGtScjQDNTY29NIqx66uppOj
 FxmbCSvgst0rtkKhZY7sFVYIjlman0SXeBB3vro+V9A5T1YExV88hhH+ekPxCKJ1tyOJUE0XZ9+
 abLFY7uOXTx/u/iyVE1zeGYvPrvEgHY6Vda8lmKvPmAf3yezxL/FqfvJN
X-Received: by 2002:ac8:588f:0:b0:4b5:e4dc:1ee5 with SMTP id
 d75a77b69052e-4ed949427a0mr23309201cf.3.1762515278850; 
 Fri, 07 Nov 2025 03:34:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+LAqOyus8ryKtljdjGtTT8tpekQXhHgSlDk1UkXksjpY7RbYCRhZLRuzIlyV/Mr61stF/eQ==
X-Received: by 2002:ac8:588f:0:b0:4b5:e4dc:1ee5 with SMTP id
 d75a77b69052e-4ed949427a0mr23308921cf.3.1762515278322; 
 Fri, 07 Nov 2025 03:34:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbc95e4sm223260366b.12.2025.11.07.03.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 03:34:36 -0800 (PST)
Message-ID: <a80d25e3-9178-441c-8b09-3f69b703484d@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 12:34:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
 <aQNXTscqFcucETEW@shell.armlinux.org.uk>
 <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
 <aQNwoC6aMPMMk4M1@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aQNwoC6aMPMMk4M1@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5NCBTYWx0ZWRfX242hae3YSEkr
 LuyMGyKprmPharj7PvEOrsYHqLNX+EXbAUq/YaTpkHI2QOl6ITuswlWZZUznwOmTK7/hzBA4g0B
 +umxHygiValKmwGZ8iH5ZdrDBQAUcrJqQPty9C0AmvRUw+kjZSXw6BkcV8ZPrt/hhmg862N/28Q
 crTAO7A/QcaUeZA1UqI5jX/HWV0GfYOE9y5yv8L2v++AEMw/P94O6HFv6kRON0pGyjdkT8Q+CcS
 BHJR8VkiXUNys0SFkqM+znC97vR1UTXfBCgUYxWEnxjkwryCkhk0qRqNsZJeIzszXGMjt0KNzio
 gjL6KwYswzdjfJcOYE+nlqg4I99LBwI9da+VXRkvKeJkVEZtlNCG+amnDBesUwqcxsYzBFnf7pu
 P7MJAL2QsHhkbtgoFsLmpzTEPFa3gg==
X-Proofpoint-ORIG-GUID: eo4mmPz5yp0F_HonP3thYI0PqVZwFuAr
X-Proofpoint-GUID: eo4mmPz5yp0F_HonP3thYI0PqVZwFuAr
X-Authority-Analysis: v=2.4 cv=G9IR0tk5 c=1 sm=1 tr=0 ts=690dd94f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=H4ebBzf8g92K_wxokogA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070094
Cc: Vinod Koul <vkoul@kernel.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: remove
 MAC_CTRL_REG modification
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

On 10/30/25 3:05 PM, Russell King (Oracle) wrote:
> On Thu, Oct 30, 2025 at 02:08:41PM +0100, Konrad Dybcio wrote:
>> On 10/30/25 1:17 PM, Russell King (Oracle) wrote:
>>> Konrad, Ayaan,
>>>
>>> Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
>>> and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?
>>>
>>> Specifically:
>>> - why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
>>>   speeds, but never be cleared for any other speed?
>>
>> BIT(16) - "enable to transmit delayed clock in RGMII 100/10 ID Mode"
> 
> I guess that means that changing this bit is not relevant for the SGMII
> path, and thus can be removed:
> 
>         switch (speed) {
>         case SPEED_2500:
> -               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_IO_MACRO_CONFIG2);
>                 ethqos_set_serdes_speed(ethqos, SPEED_2500);
>                 ethqos_pcs_set_inband(priv, false);
>                 break;
>         case SPEED_1000:
> -               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_IO_MACRO_CONFIG2);
>                 ethqos_set_serdes_speed(ethqos, SPEED_1000);
>                 ethqos_pcs_set_inband(priv, true);
> 
>>> - why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
>>>   for 10M, but never set to any other value for other speeds?
>>
>> [18:10] - In short, it configures a divider. The expected value is 0x13
>> for 10 Mbps / RMII mode
> 
> This gets confusing. Is the "/" meaning "10Mbps in RMII mode" or "10Mbps
> or RMII mode".
> 
>> which seems to have been problematic given:
>>
>> https://lore.kernel.org/all/20231212092208.22393-1-quic_snehshah@quicinc.com/
>>
>> But it didn't say what hardware had this issue.. whether it concerns a
>> specific SoC or all of them..
>>
>> A programming guide mentions the new 0x31 value for 10 Mbps in a
>> SoC-common paragraph so I suppose it's indeed better-er.. Perhaps issues
>> could arise if you switch back to a faster mode?
> 
> Could the 0x13 be a typo? Its suspicious that the two values are 0x13
> vs 0x31. 0x13 = 19 vs 0x31 = 49. 0x31 makes more sense than 19.
> 
> The platform glue is required to supply clk_rx_i to the dwmac's MAC
> receive path, deriving it from the 125MHz SGMII rx link clock divided
> by 1, 5 or 50. Normally, this would be done by hardware signals output
> from the dwmac.
> 
> This suggests that the value programmed is one less than the actual
> divisor.
> 
> There's two possibilities why this value needs to be programmed:
> 
> 1. the hardware doesn't divide the SGMII rx link clock according to
> the hardware signals output from the dwmac, and needs the divisor to
> be manually programmed. This would require the divisor to also be
> programmed to 4 for 100M (but the driver doesn't do this.)
> 
> 2. the hardware selects the clk_rx_i depending on the hardware
> signals, and while 1G and 100M use a fixed divisor of 1 and 5, the
> 10M divisor needs to be manually programmed.
> 
> Any ideas what's really going on here?

The computer says:

RGMII ID mode - speed == 10 ? 0x13 : dontcare?
RMII Bypass ID mode - - speed == (10 || 100) ? 0x13 : dontcare?
(*the 100 above says "default" but that's again 0x13)

RMII mode (100 Mbps) - default (0x13)
RMII mode (10 MBps) - 0x13

SGMII mode - speed == 10 ? 0x31 : 0x13

Make of that what you will, I would *guess* there may be something like
2. going on

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
