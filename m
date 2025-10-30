Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6502EC1F6C2
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 11:01:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3681C62D88;
	Thu, 30 Oct 2025 10:01:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77F85C62D85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 10:01:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U9MhVX3115819
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 30 Oct 2025 10:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=; b=RCRCoZgA56ns6yDd
 +yKBRhyBmEiRgH/A3pfEKSzWFhIR04h7Iz2FBrAGKfLc8PNTcxkcTOvIzbApPQnO
 zDTib+W4cS1qTj+QOlhY2vSJ3etZp+sTAEwLusnkHsPrzHDq4O1Z/pYMi79ythDq
 HtT/tGGuL+gK8LCKQW8g0luvCNoG+3ZxzKX1JCixIYksRw0511e+nmCkoUINzVe0
 fj/cqmy6hR+2cS7ZV1/an2juZI/oX1duW9iPspKJtHEbpHz18dmNN87yFf3SzUw2
 784rl2kTyWAGr9bq6ouvOMZgCqbnb8Kt/QF1esQkIyl0JK3hzK5uh+va+rxWJjwA
 qDOypA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b404w3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 10:01:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8934ae68aso2022961cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761818512; x=1762423312;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=;
 b=Q0I1mV5ufFRD/hjTAPgAs0Q+pBKDkr9+LmnJs9fcR0nuXhB1iaAwZw4I4zxAVhVhKQ
 tfLRoJKB0zlKxD14R92K8jxQMrFECX64+EHn7Ohauy6m2F+CTViiKKnApVMAZ4nEznP1
 gnSJQtW0rHXHGC31gyJ/unA3R+CrrSb1DrmPZUjjAnvKqjzmnEk0sRmdEjkHlZ6Wkm+b
 XuV3vwQsDxN8YG7GDPw3tKeE1SCSr/jDgrcGWMHjYCtP6MKyFxhDZK5UqjYvrdsSKEQ4
 QaMydRI0WpT9zN2XhbqNKGR10uz8c7jP2HZb+IsMfVVsbHzQ/9Lh0rCAGcIUagKQE2mi
 zCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761818512; x=1762423312;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=32h5K3ewwycqfrD/0JMWOprkDGOg3ozbJGj35ETznY0=;
 b=dMWlXN63BJ9l2mrDqKS9Tqza2IaL6cFWyBNRNucbomdiGEehuPdfeURpk7Wv+5iNGh
 Mi3ZTUR6xjCP2aIuf5sfSWi+xgJaAgtYkrn04ZoerK/je8IhBO2+9yKcBqyzn4OM89ED
 eIPKChHfpREOR387hhWS9aOTL4rGaqHSW44FBcEwjTSUmzP2S7otLKT5XPTv4d7P8lsu
 sIbwpSgE9qecMFuiWA1jEuQx64ENV1kH9yf/3xuBjeuTK7oSj8dtImV1wtdns90a+9D1
 VRtbBJtKj4O+ovnLZGMBQrrpAvMVluX5aqKN0n/T8Eye16f4nb8acE+RDvdfPhlCW05R
 5YFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNo5YMUgg0lzZhBlgXwMk3cH0Qs5RiWwhnzTo3QdqubXhfsz9eyiEOmOP2nzP34iiNjPOFqPfrqC2NXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxq5iHAPEogILvks4TzWxfwitRCqbf5LOTB3ACuXog+ZNoDehO2
 boWmWE9x79eVF8XQlR1nKAXBKFDCGmkr2XNHLicmeqlfGAZ4v/H5L4i+5wHCKEhGpJ7iTba4KLn
 /GJAzKHvnP2v2HoRZNBBQxde2GmoYEVzjyPmjmIu6oqIxJiLLgEjifOjrGEoVz32YXNr/HOalbS
 fkc7hnX9I=
X-Gm-Gg: ASbGncte6WN75PLxpmNBa1cfGZ/BDVMnuL0QkvjEwYgK4gzd75H38sJKSVLZbipF6Zy
 xE/xyxrO0+TVmdNZ18+Rf04CMDY/MTizy6gxNfI89U2S2l8QU4t6FSYtwfR8sHHv+atf46sWfCX
 W3hw87PiQ/yoSU8yFtjF1TkRCnhSAp2sc1NZ357n8YjQqrk08wKSVglqcCrqscQHbODpTg6w/yR
 N2neRVBFshZ+kjP+NxZVxervzunvq1Anx8JfnuyObqhsUwW3KvZXdYMtMtPlFHAFHXp4WKTEgk6
 kUt7Ur+718fNrWgHnpfgsUiE+HkljLsYZbnG5PBantcpmIxEvBSfK68GyhiYKD7BtO/rOHjRZzF
 dkhkIRBDP1SNBD5LF7AO2fHjeFclXtymhzRkgPnF9v+u70gU5RxxoQ/0w
X-Received: by 2002:ac8:5f0e:0:b0:4ec:ed46:ab6d with SMTP id
 d75a77b69052e-4ed15c0e8f8mr55333661cf.9.1761818512162; 
 Thu, 30 Oct 2025 03:01:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRkwzCLPCxSVHJgMpfb+sSifTWDoxG9G5XDKheZ5CxBk6Vcn9HesLaF6FBOsZzqqrVE4rY6g==
X-Received: by 2002:ac8:5f0e:0:b0:4ec:ed46:ab6d with SMTP id
 d75a77b69052e-4ed15c0e8f8mr55333381cf.9.1761818511580; 
 Thu, 30 Oct 2025 03:01:51 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7058770e28sm164872366b.13.2025.10.30.03.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 03:01:51 -0700 (PDT)
Message-ID: <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MSBTYWx0ZWRfX+qR0xS5sTXi9
 EgoTeFMvcJVDyQoMz0+oM2t1+KZwGZajQzZXg8wuUVWsSc8hIJIq6+2wqZJ/Jmuu2dnCBMymftY
 JzKpTUipOUCj/kvPYvXmUpHmR8xWd+QdLztNFaDjdyP72JKaACOdbmUmqx+APLfXahp1QiGm3jC
 tPl87muNsmYTh8+YfRR+j1rLBCKOvS0Pol9WKOOuLAH3nxZaUwzdSrbFmTv0Skfk3PCS5h8jQa6
 dLNxxxN5vUkXoljqpUw8s0p2k//W179zPwbqFHosYRdGc+4YJxJbFuPMHaYyguoVLz4uBxpVn+i
 pYkx2mdigN8diAdhEh5O0xvLk6qau6MBDgYF7vJB6DSl0rP2Fp6Sd8ExMBHSX4+ALzMRm2Kfisk
 tZ4oe2wAHJdPpiYz0cbWTQ3SGo5VOQ==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=69033790 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YjBZYspd3xVaAZo-ivoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: HLhB5pNhfKgF6grgf-URt9KMOJ2XGeFE
X-Proofpoint-GUID: HLhB5pNhfKgF6grgf-URt9KMOJ2XGeFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300081
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

On 10/29/25 11:18 AM, Russell King (Oracle) wrote:
> When operating in "SGMII" mode (Cisco SGMII or 2500BASE-X), qcom-ethqos
> modifies the MAC control register in its ethqos_configure_sgmii()
> function, which is only called from one path:
> 
> stmmac_mac_link_up()
> +- reads MAC_CTRL_REG
> +- masks out priv->hw->link.speed_mask
> +- sets bits according to speed (2500, 1000, 100, 10) from priv->hw.link.speed*
> +- ethqos_fix_mac_speed()
> |  +- qcom_ethqos_set_sgmii_loopback(false)
> |  +- ethqos_update_link_clk(speed)
> |  `- ethqos_configure(speed)
> |     `- ethqos_configure_sgmii(speed)
> |        +- reads MAC_CTRL_REG,
> |        +- configures PS/FES bits according to speed
> |        `- writes MAC_CTRL_REG as the last operation
> +- sets duplex bit(s)
> +- stmmac_mac_flow_ctrl()
> +- writes MAC_CTRL_REG if changed from original read
> ...
> 
> As can be seen, the modification of the control register that
> stmmac_mac_link_up() overwrites the changes that ethqos_fix_mac_speed()
> does to the register. This makes ethqos_configure_sgmii()'s
> modification questionable at best.
> 
> Analysing the values written, GMAC4 sets the speed bits as:
> speed_mask = GMAC_CONFIG_FES | GMAC_CONFIG_PS
> speed2500 = GMAC_CONFIG_FES                     B14=1 B15=0
> speed1000 = 0                                   B14=0 B15=0
> speed100 = GMAC_CONFIG_FES | GMAC_CONFIG_PS     B14=1 B15=1
> speed10 = GMAC_CONFIG_PS                        B14=0 B15=1
> 
> Whereas ethqos_configure_sgmii():
> 2500: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> 1000: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> 100: sets ETHQOS_MAC_CTRL_PORT_SEL |            B14=1 B15=1
>           ETHQOS_MAC_CTRL_SPEED_MODE
> 10: sets ETHQOS_MAC_CTRL_PORT_SEL               B14=0 B15=1
>     clears ETHQOS_MAC_CTRL_SPEED_MODE
> 
> Thus, they appear to be doing very similar, with the exception of the
> FES bit (bit 14) for 1G and 2.5G speeds.

Without any additional knowledge, the register description says:

2500: B14=1 B15=0
1000: B14=0 B15=0
 100: B14=1 B15=1
  10: B14=0 B15=1

(so the current state of this driver)

and it indeed seems to match the values set in dwmac4_setup()

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
