Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91EC1F66B
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 10:56:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97DECC62D87;
	Thu, 30 Oct 2025 09:56:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D757C62D84
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 09:56:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U9Xb9K810603
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 30 Oct 2025 09:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eZB9HUn7Y3yeet14Pr5P9kSO
 bdDDgoJccQktdlZcIJM=; b=lke02PP8ShDcsMh5V8vn/IlY/phnMoSm6DL2feeT
 L3TmOI+9lyqQT8yp6RcNpAlK5kfv75Y68Cau8Dq3VSNw9/fHa2TL1Ogy2qMIE7eB
 vPXHkeedoKErqcRUIUnRIYthF++B3fKHK928agAqAzdqnXwCI2xlNNz1zg4Ry7+C
 j3PDxOdO0IihO4/45QGZ0N8CycxBwyHrNR2+7Xed4M2RFQy1cNd6Ejw28avLCghU
 JJks/inWACHMOMQoaSPXfjIRYkVNevFw8SFIHrQMhW5g3rjq+GSr/DKXndRpUFOG
 kb2VUyljVA1UDVJUOp+vpuvsa+gLG/gVwroyJe3ocJGrBw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvgb3s4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 09:56:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-294ecd3fdd4so7405475ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 02:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761818193; x=1762422993;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eZB9HUn7Y3yeet14Pr5P9kSObdDDgoJccQktdlZcIJM=;
 b=O22jUJbGEK2FN9ro8mIkCLDhDE43TGP9qq4ladhotG2/czfeNGOOY51uf4V9b5fXAe
 UDz2cNdxPOH6iJyGUqptghBLBJoL6W2gB1bEws5em+Si9C8txoaxgPE5UymVv2rPG/qZ
 /94/h80FoA53lp1gyZNknVmDaxHRq/+1QEqMbNXTIKJhFRnmx9gzTno2uR0CIEUOipoK
 BcFfyf2RtfZhYn1i4rqdSars4tCnoCHKr/huQv+6Ky/g7MwcmvSl+kKIKMp2soMG6IDJ
 uQI2OX6MRFe8V8x5fFCv1xZW3w8zu11OyIOTDGOLKzB9+oTjcWw0yYObhakyFvJhwZKU
 Rhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761818193; x=1762422993;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZB9HUn7Y3yeet14Pr5P9kSObdDDgoJccQktdlZcIJM=;
 b=iypSXNB3EHIrTGuVG63iiNkxd+0umg3clZCQsRfr9oFZHIlIWDySp2THn3oIvyljf1
 afVmIHRFmD15EfDPXeHOanvBSv4A//rYAIR9f4u6A/kHxJ5Q5q+YS9yCzslMx3PNltQB
 oMnep+ym8614b452QNf/4v3blHCY5NigDWH84nbd8MM2iZCAxjp3u9fFlLiFdeGluqFW
 2+iwAl6vjMWce+d/c1soHSr9rVEAWuAl8OkuurvWGESV/jlCK/bh7Yj+B/zBxROI63+1
 AaUiLuThzUfbdlOxEsQTTwTCxgU01iTINBkRBkUwz3NcJLB8KAYGV9hXf6+3VIjcqEao
 dGRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU6/b4Lq0rGi2tzZNOCAHfncbyH+dUJEIL0dSW5owDN1O2sahjw/WzYSTY02ufeBExFxjcB4D/Yo5Kkg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLfYphGClS3CcmknwlhtFiRBFDDBTmtixYii56vWJOM3aU/nfV
 llaCBu7l5T82q0gww2QEXnrHeYTMlvKRuMiRv0KzWB+rlj1NTWkdbuH36+CP1Sz1U0i3S79yGLu
 Q/AhQNMyqNk3tpinz4m3R+zhZ8MTorXxKBQvcXx+OA6F1TOPmQObe3TCA4oUC2sRgy52ONT7Fmz
 Xdt+KwriE=
X-Gm-Gg: ASbGncvUH4cCArIcG6vj3sN2qbZCNb8AT9hMwZBlA63RbUWd45H9S5UCe5X81cjFHI4
 Hz2SctUGYJL5PQ3kRAa4ITG9kBF+loCqymyWDyKLzwrVqpj266cqu0wdnVb0BIoNVsQhPG/dcL4
 zZT4J+G8KAUHl0SWVB/2jG2NphDWnEplwrB9TR/4Rrw5uEikQKTtU1gt+qZMCZ3CuH9g78Q4Yis
 VE5QaLF2Wl4Mt4VGDtD+SivyNzCe4mZopTdRDszVFlBV+YWpC26B0ywOJ+GGScOQr8Gz1RX8WnO
 4vJOhgcKrEaSUJdCTsgC7p1bcbBhFpZVzIg2X2iFCUp8qUpLKvg8T7Qml8WLRAEpqxqzktWFSJJ
 2OESGm65TlQ7H
X-Received: by 2002:a17:902:f610:b0:24c:965a:f94d with SMTP id
 d9443c01a7336-294deee4d1cmr75107155ad.46.1761818192843; 
 Thu, 30 Oct 2025 02:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2pXZ7cZHIBfeTvJZ9UTRYJGapckxL928FafPCFjdaoQizWWG6Hm16UWtFXWraP2nuOKNJTA==
X-Received: by 2002:a17:902:f610:b0:24c:965a:f94d with SMTP id
 d9443c01a7336-294deee4d1cmr75106445ad.46.1761818191892; 
 Thu, 30 Oct 2025 02:56:31 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-294eeb94d63sm22841075ad.5.2025.10.30.02.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 02:56:31 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:26:25 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aQM2Sfdu2NqnEB86@oss.qualcomm.com>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MCBTYWx0ZWRfX8mJBvhQ6rSxB
 A4r7vy+TOu/DcqKAu1nxmEmR/TbevxCyyLvfP2PldshBj2L4JJ6sJtQFtoOwD7ZCuifX9jtB90g
 sZZBhIyw2tdqUqu9HItuWMb2/DSR+JW4vKgnxY/mRwF/wzUac/8wkIBcbtUE/DfxJo9wxo4M3Ci
 +kixAUksnY8dKIGPGYhFDNlL1Gm9cwJvq75Qn2l6RVSGPUT7Gd/4Spe/vGIwCsfWo3y6gDVIUIi
 +bREWgxo11eP8T3IOc/K3meRcDVuw7VkmMyaG9jgizStUkxKHk67qd+MvwuHPk32iAC60hi2U46
 askevUcx86UdQobsbJ++mUqhRg0+OPAeGOXFIa1bCePB/dyWjmgZdieF23O3SM9xkOxTDSBwPf9
 6QjaQEL90I2UneHn2TDc9k/r5Jyq8Q==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=69033651 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=YjBZYspd3xVaAZo-ivoA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: AlmqMgioxLlSR740Ul5ZW_Xl45541aso
X-Proofpoint-ORIG-GUID: AlmqMgioxLlSR740Ul5ZW_Xl45541aso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300080
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

On Wed, Oct 29, 2025 at 10:18:36AM +0000, Russell King (Oracle) wrote:
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

Makes sense.

> 
> Given that stmmac_mac_link_up() will write the MAC_CTRL_REG after
> ethqos_configure_sgmii(), remove the unnecessary update in the
> glue driver's ethqos_configure_sgmii() method, simplifying the code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Ayaan, please can you also test this patch? I believe that this
> code is unnecessary as per the analysis in the commit message.
> Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>

Tested on top of net-next on the Qualcomm QCS9100 Ride R3 board and
found no issues, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
