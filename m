Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E4C7353A
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Nov 2025 10:56:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BE7BC01FB5;
	Thu, 20 Nov 2025 09:56:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA987C01FB4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 09:56:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AK4pRX93543749
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 20 Nov 2025 09:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=; b=Cw+UqZJCNsnBt1Zl
 QNbfmckNYUbx4cRRpsq4ISA6Jt092B1RDHSSgAt8QFsjfV4l3tczXECPsvC/5WPx
 I5xMA3lDThsXBtE3/Wuv6/iIr4DMg7MeVpimQA6/4Iyw7EN5E6AUg7jcIgSa2NvU
 800gpZTPMm6q1jbBCgBXS/y6QJ0H/eZqR9np+teeUY/2K6TG5jJM4Nk2MPZXcG7+
 9xFmPhaovdTH/SBq5K0XGXU1rK2F2Ws8pYfLQRCh4NN2a3/wShfIPTTkRU9WPO7r
 QVt9CuQPvtqcChlcLMW588nrggNNDtqZxnCjsVvaIfd6mFKpTSyGqRe9Rerw7bEO
 hbSsTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t2we7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 09:56:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee409f1880so1485891cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763632606; x=1764237406;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=;
 b=S8Bwkt34AXtdrW+DF4yeHuzfVxvpkuHMfCF/NCGSHBajJfy9pEH9GxAXs0cLyxm11+
 8C2sGXflLlk1yP03uAPf3s1RgkGgO18sRH8GrFjaVcE18monsaM32hIrRt6XmPmKO/yF
 shgv0y4Bu1w6ovU4O+JyAFJcrWSiMSCcrqTcxmiVYa8v8pP+Wnk6ANXv3SHqV4lp1maM
 anDGIOoe9moMW/aiE7JjwVyyrI4h3kzQoNMaoHP5n+00GHM2ninFxYnmTqv2ZfTv3z02
 LIITKB4TkY7/5trKMt8pO+8/I/AaThfflgcG6+KXWj3TOLCIiCw5KAHAH1yJrqsOstr2
 COAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763632606; x=1764237406;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=;
 b=CHEA+QrJ8B8hzeq8hLH4maUq4e74vA7KJYFEXyM3NbsggZmuJ4/4oDcA6OJf+Ns2f/
 tvrwmzAiuaJHJKNDMjyCt4gjWryWaGImmvpRWj7fvAVT1TvA8l8XgQYpJZdw0eXqo2D1
 0hHui0TsqzaThDJClhQ0Hwnm+jDyUNFq2u9m5Xe01/Womz5cxUnx93AOf1TlAgZWPPym
 7q2RIexVMkcDeAWj9N+l+Emragv4IXMYfzspt/Yu0lM3i7J4hgrALkFK4XYnH08Zsv+o
 B1AsemIJ7gi5UhjPRpSdTVtaTe5JhrptlZPThNt3hG4VYJm85M9K5jPIEmCrD/y736IF
 xLUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXUxJlCbqwR7O5CnX26iOrbg8sEwda6QgUHtoQkNX4ZwB88t/8XXWH38dY3s+htZ/441BdfGaCCJjL1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzWnsmJhwi4+91erVmxH42eflF/OcZdRCgwXjGbmewXwbPI9aRL
 vxodC9+tyo91NTro1DiC9v4YiSVllYfjXVQm4qS1zW747Occ/ilsNgtvxxGr1l2yPDDOCwZBIvK
 gssBlJtOZTuq0ZPi0jLh9tmIR3gWqnNA6s8Un+OLneP3dcnpYgOxcvfE7TRU1Cg31gq0HhGF5Wx
 q0ZfdcqeI=
X-Gm-Gg: ASbGnctN5bEiFlKuC9L5hjH2BfbBirI8G/AeHVOVRR81uvxMoQwvO0cnrqBWHFL6SK4
 Zmiagkpp/6+woN4zxzMKCnnbAJmQ3ixQct4zl3LMsQccSdGGy5oI9LDzF/rlWNZt6m+7Add5lAp
 sjArWGAa7iEUjVelUyjteuMaypjA18Vte3vr9sS36aWUjgNvQQW7igVd8hr1pOWXR4iuOeh0Yt/
 itZj/VmV98ViJ/2dp/59jxdHHnKQGmnspoOVx2ZkgMBDo6NcYlzW01t5YMgjjhAjhRrNjTjhwav
 +yArCZjqsjKqoZE690LekmdevhLStlAauhvNO1EUiCmHB/IEuyw31IP+p9bdjV+1DJFzPfryj67
 K84XZ24MjvleVlwinMiRhzIG5HoQMCSk11wOL94rhqoa+zyHXrpNI47uMEwbX/Yha4W4=
X-Received: by 2002:a05:622a:606:b0:4ee:2bff:2d5b with SMTP id
 d75a77b69052e-4ee4d3d9577mr9046191cf.5.1763632605832; 
 Thu, 20 Nov 2025 01:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvX5tt7Qoa7/1Nd3zshKb3HAhHIfws6mxUCD1woH2NH2kWlspMcanmSVKJFvTHbTJGYjt4Sg==
X-Received: by 2002:a05:622a:606:b0:4ee:2bff:2d5b with SMTP id
 d75a77b69052e-4ee4d3d9577mr9045891cf.5.1763632605320; 
 Thu, 20 Nov 2025 01:56:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d50328sm174027666b.20.2025.11.20.01.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 01:56:44 -0800 (PST)
Message-ID: <e099d1d4-7e8e-4212-a324-5e790ba7559a@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
 <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
 <aR7jZ4KkKE9nTsMh@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aR7jZ4KkKE9nTsMh@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691ee5de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=ZmNGhu4S8FOEUr0570YA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: U6Pl3aGXef2LDCxh1OLbyE5oT56Fwyg7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2MCBTYWx0ZWRfX9Iicj+s0Rqad
 uJA9TpfMaU1q+hd9c8CdkgUJZIk5x1VxV/bZ8xXXnLkLSWQYPXGP+AJtgunaCoYPb02OyAeuH1q
 nIVonJZM/92DLuxImZD2SNS8XjM7qklB7qdEP/9bNtqpfkbX6VDed4GaR3yd/9f+22i+QvmPyPi
 7hS62WyoOFlK+2V+ym2xa3OF4WVj8IZpJMdgjorLoXEdXAjxj/VN7i/jORf6q9fIQM/yLgqyqjp
 +4pU4EiDhzbWno5hnTHo9BVrUsmM/yGMAxheckYGflJBc64Lf2L2fkoJWa3MJxy9tUQ4vxjj5VD
 ZDDDRhRh+ejiq/Ag5JgUAsOK9OFUr0SvdbGLM/1YvM2p2AiikdBlQHBbRVvn4yf23JopYdp4QR5
 4drLakbmnxaLpR8twVRXcbRZj3Ej/Q==
X-Proofpoint-ORIG-GUID: U6Pl3aGXef2LDCxh1OLbyE5oT56Fwyg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200060
Cc: Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: qcom-ethqos:
 add rgmii set/clear functions
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

On 11/20/25 10:46 AM, Russell King (Oracle) wrote:
> On Thu, Nov 20, 2025 at 10:42:04AM +0100, Konrad Dybcio wrote:
>> On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
>>> The driver has a lot of bit manipulation of the RGMII registers. Add
>>> a pair of helpers to set bits and clear bits, converting the various
>>> calls to rgmii_updatel() as appropriate.
>>>
>>> Most of the change was done via this sed script:
>>>
>>> /rgmii_updatel/ {
>>> 	N
>>> 	/,$/N
>>> 	/mask, / ! {
>>> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
>>> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
>>> 		s|^\s+$||
>>> 	}
>>> }
>>>
>>> and then formatting tweaked where necessary.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
>>>  1 file changed, 89 insertions(+), 98 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> index ae3cf163005b..cdaf02471d3a 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> @@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
>>>  	rgmii_writel(ethqos, temp, offset);
>>>  }
>>>  
>>> +static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
>>> +			  unsigned int offset)
>>> +{
>>> +	rgmii_updatel(ethqos, mask, mask, offset);
>>> +}
>>
>> It's almost unbelieveable there's no set/clr/rmw generics for
>> readl and friends
> 
> Consider what that would mean - such operations can not be atomic, but
> users would likely not realise, which means we get a load of new
> potential bugs. Not having these means that driver authors get to
> code this up, and because they realise they have to do separate read
> and write operations, it's more obvious that there may be races.

Right, I don't think that would show up a lot in practice, but the 1
case it did would be exhaustively painful to debug

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
