Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBDC2029D
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 14:08:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9029C62D8F;
	Thu, 30 Oct 2025 13:08:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C524C62D82
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 13:08:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U7YdEl1694250
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 30 Oct 2025 13:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=; b=bhNYdDblWuBJxjD2
 mL3qoZCyJ+T442aZtMFZeKLyjL1brsyd+kgrVcdTuCxi6kTz/mVm3sfgOWja9qsx
 bhXzmS/GuwcopzoczHF6ETNUOu5sYE0HSZNCYqdg6JLjTRUZIjvqREnmi2UgcanI
 QxWvkkKmvUe6MfTKYPNxKl0XYWPxxp2bxxJ0rrr9BBmg0ZB97cacltYlyhxYp4rD
 1pOkYutpydNYGIApCeJYOA0O9pd9eR33D+i3YbHN4coAmwp6wnR0gMPn3OfUjMv6
 1LkNxfeIMqj3XbLynfMP33wzuoVdUtrW224QpUZNJbCllU2eV5+gKXYuwaWiYGm3
 H4PsWg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv2cmx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 13:08:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5a34fceaaacso13216137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 06:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761829725; x=1762434525;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=;
 b=HBwb0urCxCqCyYwI1+3CCscaR+zOY+5cnYdHWQ/up/hOZ4tLOca3uflMNrwzGebZgl
 gX67OB//+i7i+lMPCLqK/I5kN84j0aydkK0o6XM32j/EMHyGU3wg0naWN7jjUwsTyy1o
 l42gO74iWOe5gaVcbERrvqj7Pj56mwnCC4h52Kuiz2eaxnSXCHQ4lwrMnV+4aZo0/JOE
 4/qdSCVo308rBExe4z4vFPzJ7Nq6VCW0mh5d8XuXoIlIiyJnh0tlfWvTn/XKsSi1RZ0z
 99iB599OeImmV5lanWSWJgJ3se+4av9qKYUBtDQSoc2fZgivvVPSrMiXsc7NOucsefiT
 UutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761829725; x=1762434525;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=;
 b=Ft9DabiN7J6OfKyxBDVw0qz+aitLSGPDpp4jnmrG+eT6jo4uQYPwNQidyV+Zf1nICS
 KSoBDuZ+gHFBy0wRtJM4Tztfnf6aDGUiEX06xDptSXt+n63h6C+VhI6LUzJLemOtfbV/
 xNGvDajeQQV02mYSOlWP/28WUk9w8CCNRtEGqe/IjFGPK/cLgltU9697KSjjcODrQDCt
 3I4DKSb8e1VIItHb8tk+Yd4Q8K61DoHnC3BQO4/2Fq7sQNf0TGJUyR69HQMEDUA6iTk3
 Zh5w/jUAARWFXTwh9JL+cp3+0rzC8PoPrvvkrK2vdWLRhFuG5nqjgLQf4fFtxgMNw9Oz
 T9rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1GDQz4qehTeB1WdlJO/2GHcudBkfjGEmQL7EmogeJe1BeaPtmUCrIIQmKAzsSLebWmiyAdlono6t7rQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5GWgUXtaNlDylJ/p21mqztc9/b7//fJBfXF8j4iU7/Muy5GcC
 aSxujyMVPSXOgycFEQjYtumjtiBnMlimMNqYGQxzq8mvN4BnDL9yS8zQYY3r305FbwvId9sFCKt
 qRvV7YX92+6EmcO/EAyV6gtMFAcG1kM29DYZUITL9ygVdAj/DcJznikQsARGBaghKvDRzPPY0DK
 8qYRPOJ/Y=
X-Gm-Gg: ASbGncuRrkbCLugEyGgvKIurDbPfg8zRE5rYefwDRofPLL2SrRF+psoryiYharw6xlj
 8B3np1Q4hJ1T1xZ10BQwnaYbpH6yGncaXcFv01hfboagrKA6WOdgrz170CY3ZUtaW406vOq2J6U
 tddz7SzUrY1ywiSLyslz2Pj8n0AIYBz12o4+9TFY15f5I5fpJX6vsifH/rUqvmVAPHDB07aOTOr
 03DFW2880I9SN029VZjv+3gFiMXbg34ks3UBmplv3FiBTCecQeDycgOP0dTeNGVa9IMpWOTdbaa
 vMaSk2l8QkOePGbNC+IOhsA3zhJixsvi6+ZCEV4tDJbkN5HxNneAIJ41JU/HsSPslSdRziBbXZn
 ctQKluGh5IwksJLl7AZ9dfzU6I6KeNkSK/U4ofIxX9FLEvw+lN/xmWR0u
X-Received: by 2002:a05:6102:9d0:b0:4e9:c913:2c9e with SMTP id
 ada2fe7eead31-5db905c1411mr1014184137.1.1761829725407; 
 Thu, 30 Oct 2025 06:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG/lySLHsbpbMj0FnhN0zM4kCoK9rJ1GOXWXMrK4mIf1oCOtFJHCl0WzymOFvWrOCkEIsQmA==
X-Received: by 2002:a05:6102:9d0:b0:4e9:c913:2c9e with SMTP id
 ada2fe7eead31-5db905c1411mr1014159137.1.1761829724874; 
 Thu, 30 Oct 2025 06:08:44 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7ef95e81sm14650483a12.21.2025.10.30.06.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 06:08:43 -0700 (PDT)
Message-ID: <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 14:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
 <aQNXTscqFcucETEW@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aQNXTscqFcucETEW@shell.armlinux.org.uk>
X-Proofpoint-GUID: pJ9dzLN8fJXf1WZgkUjdO5RYwWW5dHmd
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=6903635e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=lI0Jfkxq0giiNmayhAwA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pJ9dzLN8fJXf1WZgkUjdO5RYwWW5dHmd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwNyBTYWx0ZWRfX6J5mUzcpTn65
 ki2OeI6lEhyxvj+PocuwJuCil+0Q/GCeRQIINsfp0o8Wa1HZiVm+m8gjvYLyPS7JPC50fO2IgJf
 FOG8/D+PwiJxtnEK0e3EzWJ+t2sUktg+7C1jlZ+foCYDj9tf0hiEXXWxTiDk6b1y6lGZ422y5+P
 fW77HE1LsgaTI87Qm8fgTD2Y5HuTkPhK+cF2j0IMz4MwIn0W2tBaLUUgwqyqd7U6WAh5zxcnjsQ
 L6chZ3B4l5t4+ln/W39zR2q4PxaQpyuloExMJ5/xCDMQ8vNqkn1CgyxYRg3EMOkNCjZsoLdeGyH
 wY42GcEJMvXRfBpMsyqXEVotZ5tqTZH6jKPe35wfV70slQY3GXY3UscT9272Dzgha+uKpcsGe24
 zOLdf6k3483zsCHbeAxSuzjsBDL+Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300107
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
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

On 10/30/25 1:17 PM, Russell King (Oracle) wrote:
> Konrad, Ayaan,
> 
> Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
> and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?
> 
> Specifically:
> - why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
>   speeds, but never be cleared for any other speed?

BIT(16) - "enable to transmit delayed clock in RGMII 100/10 ID Mode"

> - why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
>   for 10M, but never set to any other value for other speeds?

[18:10] - In short, it configures a divider. The expected value is 0x13
for 10 Mbps / RMII mode

which seems to have been problematic given:

https://lore.kernel.org/all/20231212092208.22393-1-quic_snehshah@quicinc.com/

But it didn't say what hardware had this issue.. whether it concerns a
specific SoC or all of them..

A programming guide mentions the new 0x31 value for 10 Mbps in a
SoC-common paragraph so I suppose it's indeed better-er.. Perhaps issues
could arise if you switch back to a faster mode?
> To me, this code looks very suspicious.
> 
> If you have time, please test with a connection capable of 1000BASE-T,
> 100BASE-TX and 10BASE-T, modifying the advertisement to make it
> negotiate each of these, and checking that packet transfer is still
> possible.

No HW with an ethernet port at hand, sorry

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
