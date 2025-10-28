Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B27C16E37
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 22:12:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8626C62D21;
	Tue, 28 Oct 2025 21:12:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76597C628DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 21:12:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlKX72609629
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 28 Oct 2025 21:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1LtehMKAD0jYV0omlxKXVwht
 t876OECEZc58jyM18Sk=; b=OuDANcZqW+nEL2Vx09QGC0PRAzwYVuLSZ/i7cjot
 HiFoMynvHwDfZhOYW0WTcyP30TJiQ06KtROZgPLGdBM6IMZ4VL1vHE22cRqCJjgZ
 aLO+N9MQjqyW2nMsVHfRYMpBH5ueq5mZbQApTPexEydfHtkjloh7ts97mA5K2PMz
 X7AR2v7X/xgwlfd1Ca3Cy38rYrn6Jw4VN8JVpdvKvzsTMx6uhrZ2JDc5g8+6O1Sv
 HuY/44tamzhE4bm+Zhqpg5Xx9YxH3nXScuufVXjRr7dLJp1DIcQWAd6lu+UsWWgZ
 CPIGvReEwAlKc3yoVFAZX6xmvGo6S+wjwNGA3rTNJMbsBw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0072a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 21:12:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b6d53016548so9407261a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 14:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761685969; x=1762290769;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1LtehMKAD0jYV0omlxKXVwhtt876OECEZc58jyM18Sk=;
 b=SBO7Ae8Q8mdEzORoM7Gwtgxrl90zi62DN/b9E4bmFriMt5WIb/iY4NdPLdRAfIVp6Q
 g2jLnJkTRJxv1lAqn5aJGhR/6uH1LlM2ZThUvb4XqSnFNn2A+K1J449hKy87q89pBhUt
 LLbNaIakNexg8Hslj3b7Rl3tsP7NOPmhVLlSCEtLo0hJ+VG5pUtYZzuTxVRvBgkDuvKx
 J6KafH6NVX0nVE6tC29+UkuzQayNb8V1OpHsiFTiDHAZzijJobA7+RCVpARjPjuH5tsS
 ECxVuZWio/++6K60/PFNleo1K4uPWGt45FSbbRIuAWvJgaYZ5cizZsocnxSCZpo1tLck
 /W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761685969; x=1762290769;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LtehMKAD0jYV0omlxKXVwhtt876OECEZc58jyM18Sk=;
 b=hI+A/CNbDNs97sJWdkc+025f+c7v6dq2V/r7Uttqfgi0+Kfi1hb+1IB+keQ4QNVTAw
 IiFvaSe7FIizNtAYfDzj1gzv9d4bsJdM6Wugyvjl+Hart+b1+S2Pw6SMlokElHEo3bMi
 wfkE+/sp0PVZpCfJ6RrvxiFcWGm71luKPKdbB0gFUo/uiiRzarrGr0DKtMFensKIvj3C
 xJP6zdndsnYvBUlnlPfqCRkr0Fwapfs7dR+3EHjujHY3Y9iqTjsRFSLVabKRjkWVfKYo
 Ig8vCI+GdiRqIrQYkdNp3SgBxrW2RC0Xp6ZOl4ZKDl7oYc4LhKNnYqddB+lJ5ynfsl/H
 H/Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMj2P2NryidhjTQ/i4BYxTsOux0fHZfvIz6Rmvn9vpolHhQJGPzIU/O7hBWjRl9FpDwl8M2odjTlOGag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YytYex6dTkS0nzQStWgCLz4k2ekV4DzrB6tFRQpuGSPJgkkKEOE
 T1KVFKso8kdSYcqJoMNufrAlbPaAoJccKopEvS2TOy++o9w7Wlx7BUMhcjLrTF+gEi1GTupYl5j
 aM1jSpKWItsu97d45nlgdXJpvNXGgFYNTfsY7SVLpgncZyi85c/hrNr5wWV3NS3uXLoWU8XzmZU
 O0thGm0Zc=
X-Gm-Gg: ASbGnctfc0eeyeiGc/GpAiyZHVOWJpTAOlyhbPn5F8/+B5YE9paqS09jBuXrS1OF/jF
 3JchYeTTi4R6/AICD4YVReYXOCI8PISQD8DjSJMmHbk/41foecNjLRVUlY888TQcxG2lBvZlSzg
 039zHs98v2T4QwP6rZ87SKkcy0N+kRSql5hMDsiIO+arHiOKdKwucYokbvfehYyBCkiKDTvkz2f
 NLI0LlULnxtF2NlWTh5O1hwHMeOLePyPsszJcTEFNAYPIlHOkCkRJXR5InzqjZvEfSAzBU7y4hd
 5QIeiB0pzuFMAxuw64sGxo9qbzFeE9ZaZK88z/kvbFmCInLgu7v/jc4SyBe5uUENAKcKF1Ny5h7
 RGXjJ2uJnI2GO
X-Received: by 2002:a05:6a21:6da6:b0:323:b12:bda6 with SMTP id
 adf61e73a8af0-34651d3055cmr536752637.13.1761685968813; 
 Tue, 28 Oct 2025 14:12:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7e6BLeImkmGk7yQBouN0uZRYDkpUAYFZrrUgsRCUtcrqntlF3BSsWFJ6WikLzqyRU0A1XWg==
X-Received: by 2002:a05:6a21:6da6:b0:323:b12:bda6 with SMTP id
 adf61e73a8af0-34651d3055cmr536697637.13.1761685968234; 
 Tue, 28 Oct 2025 14:12:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b7128e41c01sm11277005a12.23.2025.10.28.14.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:12:47 -0700 (PDT)
Date: Wed, 29 Oct 2025 02:42:39 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aQExx0zXT5SvFxAk@oss.qualcomm.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3OSBTYWx0ZWRfX19bXNXyo4zFv
 CtOU88CipMxt+L0lqT+jE4qs55jB5jSIdQqkMyz+Wvdq42opnheTUVtCygyDU6YC97SeWjVMfhf
 gCc1R8CPZ8C3Rst5DygYQrWF46iEe9WivjEg0OBuJnZbby2tRrhECW11klKAM8hph2F99uacUab
 G81iP7fpNXZpPdX5KpaoZVjqgFHrvT/eV56Eg0twxYh94mNwy3lnys3Sm3lfMwcq50Qg0qYkJcn
 dwhsoaILX/b/I4M+pa9mr5AsE6OiGpq+iuy7O3co4jebTGbdWpf0yCOBx47ZtiuqF/OfuLjah71
 zJHrgounNdW8mjI6hAnS+str1vcY2zRoFlrEyjCRCxHrM1av+yLvPW9i12hpMGSM5YaRtiFWM1o
 dadBa1Cz8iYPodL6ZgA0g+rKmEcPUA==
X-Proofpoint-GUID: fz0f_5KSN699cgixQVhpCPsPAt0Pmm-G
X-Proofpoint-ORIG-GUID: fz0f_5KSN699cgixQVhpCPsPAt0Pmm-G
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=690131d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yuzM4s2KeON4xd7rU1oA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280179
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Furong Xu <0x1207@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: phylink PCS
 conversion part 3 (dodgy stuff)
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

Hi Russell,

On Sat, Oct 25, 2025 at 09:47:37PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> This series is currently the last of the phylink PCS conversion for
> stmmac. This series contains changes that will cause potential breakage,
> so I suggest to netdev maintainers that it is only applied if there is
> a significant response from testers using the PCS.
> 
> Paritcularly, dwmac-qcom-ethqos.c users need to test this, since this
> platform glue driver manipulates the PCS state. Patch 2 is designed to
> print a warning to the kernel log if this glue driver calls
> stmmac_pcs_ctrl_ane() to set the AN state differently to how phylink
> has set it. If this happens, we need to do some pre-work to prevent
> these prints.
> 
>  .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  7 +++++-
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  7 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 29 +++++++++++++++++++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  8 +++++-
>  4 files changed, 44 insertions(+), 7 deletions(-)
> 

Thank you for the recent stmmac cleanup patches. I apologize for the
late reply. I had limited time to test due to some urgent tasks at work.
This is a long email, please bear with me.

I have the following devices on which I try to test whatever I can (both
of them have the same GMAC core with an integrated PCS, both use
phy-mode="2500base-x"):
  - Qualcomm QCS9100 Ride R3 (2xAQR115C PHYs)
  - Qualcomm IQ8 EVK (QCA808X PHY) - this is the same board for which I
    had posted [1] to resolve its issue with advertising only 2.5G

# Patch Series: net: stmmac: phylink PCS conversion
I tested this series soon after it got merged to net-next, probably when
I tested out the hwif.c cleanups. A summary:
  - QCS9100 Ride R3 - no issues found.
  - IQ8 EVK - same behavior as without this patch, i.e. 2.5G was working
    fine, other speeds aren't advertised.

However, this might have been expected as both boards are using
2500Base-X whereas the integrated PCS changes are limited to SGMII.
*Sidenote*: I was able to get 2.5G and lower speeds to work on the IQ8
EVK after adding an additional case for 2500Base-X on top of your patch.

# Patch Series (current): net: stmmac: phylink PCS conversion part 3
(dodgy stuff)
  - QCS9100 Ride R3 - functionality seems to be fine (again, probably
    due to the changes only affecting SGMII mode). However, the warning
    added in patch 2 comes up whenever there's a speed change (I added
    an additional WARN_ON to check the sequence):
  	[   61.663685] qcom-ethqos 23000000.ethernet eth0: Link is Down
	[   66.235461] dwmac: PCS configuration changed from phylink by glue, please report: 0x00001000 -> 0x00000000
	[   66.245488] ------------[ cut here ]------------
	[   66.250240] WARNING: CPU: 0 PID: 71 at drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h:130 dwmac4_ctrl_ane+0x68/0x84 [stmmac]
	[   66.369320] CPU: 0 UID: 0 PID: 71 Comm: kworker/u33:2 Tainted: G        W           6.18.0-rc2-00357-g6c595c926e8f-dirty #1 PREEMPT
	[   66.381547] Tainted: [W]=WARN
	[   66.384608] Hardware name: Qualcomm Technologies, Inc. Lemans Ride Rev3 (DT)
	[   66.391848] Workqueue: events_power_efficient phylink_resolve
	[   66.397770] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[   66.404920] pc : dwmac4_ctrl_ane+0x68/0x84 [stmmac]
	[   66.409949] lr : dwmac4_ctrl_ane+0x68/0x84 [stmmac]
	[   66.414975] sp : ffff80008124bc20
	[   66.418387] x29: ffff80008124bc20 x28: 0000000000000001 x27: 0000000000000000
	[   66.425720] x26: 0000000000000001 x25: 0000000000000001 x24: 0000000008032000
	[   66.433053] x23: ffff0000b1148a00 x22: 0000000008032000 x21: 00000000000009c4
	[   66.440386] x20: ffff8000847300e0 x19: 0000000000000000 x18: 00000000ffffffff
	[   66.447719] x17: 657220657361656c x16: 70202c65756c6720 x15: 7962206b6e696c79
	[   66.455053] x14: 6870206d6f726620 x13: 3030303030303030 x12: ffffc6e220a06cf0
	[   66.462386] x11: 0000000000000486 x10: 0000000000000018 x9 : ffffc6e220a06cf0
	[   66.469718] x8 : 00000000ffffefff x7 : ffffc6e220a5ecf0 x6 : 0000000000000000
	[   66.477051] x5 : ffff000ec7437408 x4 : 0000000000000001 x3 : 0000000000000000
	[   66.484384] x2 : 0000000000000000 x1 : ffff0000812a8000 x0 : 000000000000005e
	[   66.491718] Call trace:
	[   66.494245]  dwmac4_ctrl_ane+0x68/0x84 [stmmac] (P)
	[   66.499273]  ethqos_configure_sgmii+0x114/0x1c0 [dwmac_qcom_ethqos]
	[   66.505711]  ethqos_fix_mac_speed+0x6c/0xec [dwmac_qcom_ethqos]
	[   66.511795]  stmmac_mac_link_up+0xd4/0x370 [stmmac]
	[   66.516823]  phylink_resolve+0x150/0x604
	[   66.520861]  process_one_work+0x148/0x28c
	[   66.524999]  worker_thread+0x2d8/0x3d8
	[   66.528855]  kthread+0x134/0x208
	[   66.532181]  ret_from_fork+0x10/0x20
	[   66.535870] ---[ end trace 0000000000000000 ]---
	[   66.540750] qcom-ethqos 23000000.ethernet eth0: Link is Up - 2.5Gbps/Full - flow control rx/tx

  - IQ8 EVK - I will try to test it soon and share the results.

Would it be helpful to change the phy-mode to SGMII for some further testing?

	Ayaan
---
[1] https://lore.kernel.org/netdev/20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com/T/#u

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
