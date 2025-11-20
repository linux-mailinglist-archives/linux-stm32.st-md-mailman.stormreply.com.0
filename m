Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73DC733F1
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Nov 2025 10:42:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AB7DC597BF;
	Thu, 20 Nov 2025 09:42:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C9E6C55590
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 09:42:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AK4xLpP4101104
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 20 Nov 2025 09:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=; b=euxlg/KQV7qwq9ao
 hSnEp1QgwUXITPyg4MV40UIz1442kR/jN10jYxQlIAbG/8ewSI5izgQqwdPFYTMw
 dwPyU//tMYJRXcf26OWNpgh/lbTOZ52VrdUQWgPxpARTjQp5FLuKhVvIqFPKGOxb
 S0nXUH97NgT4uVKHd/vSe09zXJ6ffH2u1nfSpfKB11aWmDj1NIqFSc+GPmgW/HW2
 pbkcPucEF8+ojJPa8gwfugB01iEPEQxYh3WJi6m9EdfTfjKFA3ceFsEeoywFxCZK
 cnUiRpPOjRO0cJa4TnxXSpmtwAzINhzRWBquXcgryKfENqOmcRwNxKjEbSgrkpB1
 E4watA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahver0t7y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 09:42:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8804372387fso2210856d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 01:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763631728; x=1764236528;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=;
 b=CpgJJEvNEnOZTuFfKjYlh4dgkK99onyRQ9d5BT6maTK4VdzFRZmio1P2VJz5hD8hsC
 LIihxw1XCJxmf8wKnIX4PxxqfQpHUbDrUQYL0CwbF6plsfKUOZJa3jandNXyDdbSsaqO
 Omutb+Yq4hqbuH3LHZJUrS0GwGKmF0snb8K8BbQ9zO7CKuPjLgTr0rojKf+iz1Mo+GLS
 7sRqacm3QbLJUWQuyKDHgfuw4V3HxxiDeJlMbZUVchFoPA0XWqkfSUk50OuwBEg2SHgP
 B+JdfL81DB6i2YGfF2ihRz9LN6aLxX3tGWsJ8vCKAQouUc5CMW+W07TWSMwkJ/zKsrJh
 uIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763631728; x=1764236528;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=;
 b=M4NHnZL3DGtYwVXc0jFwk8bkj4LH7Q8Ws1iUBVjV+UAsJqQPbaSXDekgNQZfqHfIPq
 Cj9pAq8yt1dzGbiXjn1LjtS81DDQmXNsxfag2fo2ircbfS49xnjWr7jneA7jMC1uzj2c
 fonj6CtK9SMb9o+5KwB5oOkCuq9B4LABgaB0CnkoTpBQYK7lJvSqmx6ZwRL3N0kdxhVg
 H44zyLyRmfNf+K6ti4KQ8teWsfvv8Y/aHxXMTVo0UoZUQxGZsEz0zgQx6aFI9tFmQebc
 zB9GX46lEhEWyRMGbC2KpE7Kj/sqaiJ6iXuPCq7Fdtmk1oDuKWBvwuz6E5S8Lb0I/epk
 vkoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH5Bt9R+LVWKcIMqimuU8NnHjJhdfWQUBI6yXJWtU/ijpa3KvxmUjvYCNu+kUwY+2eISk0mj06TOw4gg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwRb8gKyQaf9lAZtL+bOFcQaiqRW/QXS0DEfhPrmTdRJ4kcp5TZ
 X7wW7wy3jQysd6PaNwRsmCQbZI+h7QoCvVqhF3ggWj9/E/s25dbjgqzsrmz0dwla3APGiVNdEV+
 kEJQk2j7fln0FJNW0WWDZ+MoaImwCD+XPhNis04EbRLGzxcEQeNqHCM1zSH4R1oyTX8rCXKcRV9
 MZilcnht4=
X-Gm-Gg: ASbGncv+fBW6vAu9E4kD+z9iDHxUrIJ4oHAXqBP03ymY1mDoZAnq00Wx8yYibK2LZwA
 n8UbmtzzWHxFZg1+k8L4WgcZSplW1xEBRhpUZTZCNeXTdP1NaK4NDNYmG7uMhdwWPN3YGAdrFUm
 vOYLrkmt7up3uwuRW8gi72xVPdL2uh7uSZWDURh9cZ8toWlJtwKaHj+VAuadckj6SO/PnWk6WcD
 r3IqT96rfFBmKqJOl5CGcTYVj5UoLaGx2jjQvSR7VZdhVzQ2THd2zhBQlFtdet/bt2hsanq0uTR
 krX/zkxNoqbT9fU2nAGPZBigrukpxOVM1e4LqTVfe+pV6mByI7LX0/9EdjZEkGgv/twZUZN0iKs
 D7rFUOYLtq41lo3jaqhdSIOZIw+ch6K5Rb8ozbH7FOLD78g0zCIOjA+UA1HnTE64RbrE=
X-Received: by 2002:ac8:5809:0:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ee4946ddb9mr23360481cf.4.1763631728241; 
 Thu, 20 Nov 2025 01:42:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoV+9O4ZHEVJcW6VptazFPrTitDoxk6d6Ewz7I+wTr7KAcVQVGIDHM/4EdK+mcnY60jQIeJw==
X-Received: by 2002:ac8:5809:0:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ee4946ddb9mr23360231cf.4.1763631727776; 
 Thu, 20 Nov 2025 01:42:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd4f59sm162407366b.36.2025.11.20.01.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 01:42:07 -0800 (PST)
Message-ID: <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:42:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=ZvPg6t7G c=1 sm=1 tr=0 ts=691ee270 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EA-HfeqjSxqo7_82F5IA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: R8ZkthaC7wjFF6pibaTWlEx60vjPbVu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1OCBTYWx0ZWRfX7nwkLolZ3agl
 a9X3zPcWv/7hgpa5wz8mVpb5LIx+GuUWToWsHjQGyrLO5gCfO6oWsEtKMGDU+YKNKH2K8mkdh6v
 yUD6YFWhhQl1D4R8NfEibI4eabuLXFovOdKZuk8781kovBKri8wf0MZZEZDRbvLk+YGPEZRl22F
 YMOjyMNmyyKHNn6dTUxr5m+IQYazt2vpQfiNktY5olS7Orgu9skBA/ZFAB3BbJk/vsK7JTtvhGP
 uJD+3oKYTRg/0z34KbKEHIadk3eeCiF0yRXB6gP2uqUa1NHjEMAb0d8Bz7J6rOLdXmywVtLtYKr
 OLo9JJCHJOlsgAE/H+k11ZI5eeSEzWe2e38T+EGHd+d0hd4EU7jpNVvhmMKczyIOqzXbrRVl5/d
 rBUn/CWZOZH6i/V5/4M3Qj0QmTFkcQ==
X-Proofpoint-GUID: R8ZkthaC7wjFF6pibaTWlEx60vjPbVu1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200058
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> The driver has a lot of bit manipulation of the RGMII registers. Add
> a pair of helpers to set bits and clear bits, converting the various
> calls to rgmii_updatel() as appropriate.
> 
> Most of the change was done via this sed script:
> 
> /rgmii_updatel/ {
> 	N
> 	/,$/N
> 	/mask, / ! {
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
> 		s|^\s+$||
> 	}
> }
> 
> and then formatting tweaked where necessary.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
>  1 file changed, 89 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ae3cf163005b..cdaf02471d3a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
>  	rgmii_writel(ethqos, temp, offset);
>  }
>  
> +static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
> +			  unsigned int offset)
> +{
> +	rgmii_updatel(ethqos, mask, mask, offset);
> +}

It's almost unbelieveable there's no set/clr/rmw generics for
readl and friends

[...]
>  	/* Set DLL_EN */
> -	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
> -		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
> +	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,  SDCC_HC_REG_DLL_CONFIG);

double space

[...]

>  	/* Select RGMII, write 0 to interface select */
> -	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
> -		      0, RGMII_IO_MACRO_CONFIG);
> +	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL,  RGMII_IO_MACRO_CONFIG);

and here

Everything else looks in tact

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
