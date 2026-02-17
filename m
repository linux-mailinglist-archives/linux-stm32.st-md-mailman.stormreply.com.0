Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAOUN+ezlGlbGgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:31:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E254214F27D
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:31:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 960A2C5A4C5;
	Tue, 17 Feb 2026 18:31:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C751EC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:31:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HEqSi12111750
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iOD+nAdpJf1uzrUdiNFRB8KZ
 FSJpSBc7+kYwsye2bH4=; b=ikqywinTuKS2fa7esxmRwIAfZa+/VkzXtkVep2ZE
 n3W0IiiKCI09Rb62+jl4GeMZ26ELYqCT0N0tftBYfFXFY6+QDOChej3a3Mas2yqG
 RCWvYwNHtKP8wqMmjnMwuqhJ0jx07dd6QsxLYoJ0uu2odhj0s7dAhZSEwpzVp7If
 Gm2HYurPUjh+dI5jivTFtRpVCSHO7NVSVLi+M70EWGHqBLmnoIAjJv1eGt4MOfwW
 12tPNDU1QGg17uQH/6nQvRUUxrzVABxih+o2KKiXgPz9ZpuQgiGGaQfqGiYxBL6k
 JWhHk2noSB+Emfs3YUqPqzrTHWBo+7C0zuoERW3bxCBhRg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4j6r0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:30:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29f2381ea85so231368785ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771353058; x=1771957858;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iOD+nAdpJf1uzrUdiNFRB8KZFSJpSBc7+kYwsye2bH4=;
 b=gxUQyo7Q5LHfGOxV+vhhySYPFZfDVLV422cSMJH7YHsh95miOHCIQgDLfaiuuE6Abo
 4FP8HtbENq74Sps+BQKC1iXIF/wiEVb6nNWxEbOPLSQ14rB6VS32c2BSUx6gWQm2eFEd
 WoBbJG1GrGaKoFa3jtI033EOikDfQAudhsTmSZkwZzbyW2GFhVNcL7loPBoFdf5Wkjgg
 hOpefq5FZbj5FohLuBVoYMt2Y0R0hBAsdchv+TnOsBPc7tKKXcAioP4nTaoxhik3FSPA
 KFsrHZBMtGM+KaNSvWD2FggAewbUfUpJNC+wmnph/qSHb/z2j1qEWlvJjvTpD6a3b1TR
 zdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771353058; x=1771957858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iOD+nAdpJf1uzrUdiNFRB8KZFSJpSBc7+kYwsye2bH4=;
 b=InGWyvZN67yBvy7QwOSu0PPv0CfbElDULBjNnFpASFmMCizfeL9Dx37Q2xPn4zoxcF
 L3/3EZvNs07webyhKtBFjj0rNQjmMlX6ZckLO0wn8yE5hD4lcUtl2SUxrzUvOJQIouq3
 Po1GGnW3eiPxsIPp+jrYoUsek+05T1+CWlh62gWJYX0BTJHsNuEEjBRiZWJcJ9vTT1mj
 xpTQ5qCVDoC3Mj7kNCYRHHWjHXZCRPZUsnL9G2UoyL2nGY25pVNfcDKcP5DE8iuRzjTx
 3EFLVClXcISLV3q88/KtsFNCR2lbr298Enthvpkj92Mk5YxX7XfzpcQormkvDp6RgbrM
 oueA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/XlpsaXoQcyQ+T/8J1lko0W6iRPvgEfyIIalZhnOpd2UXP5h6Lp7eh5M2kOUjYHLU7Wxy8xtMSQ5vQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxEGf21V91FHii/z0ShU0qDLHuWZuR2RvcEswwjSNzMHT8np4Ym
 HiPDhPtmsYgEQFDKsaWFOoAYPQ4oxu1iOjWWDAnKh5ZwuqLSXMSNDX0ppytVsvPGGOBz3tIOHuK
 wz+GHjMVPS+2JMkFmrR4JQxiWOM+/TABL8SK19sukCRVFquygpsttn2EFe1qnz/tkB4QgHWH4k0
 31x+VkJQU=
X-Gm-Gg: AZuq6aKnS3/10zg3vft35MigvrL5KB7PWC5IsvCyjr2h/EAnLbnWzCAF7v931S7GsXk
 ++ziV8EsDXIUcJuMo8Xcw2hI5b0Tcu5Io0akyefrl+FwpDAKQVVvlJxU6NEAw47X/M87AaRg+/o
 YItVwkg6BxOXjifCvRc0dwCQDD6k+f8gvnh2qccPAet74Z8r0U/WdEWs4its2yUk1yi+jCY5feq
 +twOiF9SGCp0V6dJKPgSpAayMUY3vMtN+JvRAMbeVKknHijHX/o1cKtFBR1zqqByfOX5Mce2NtC
 RmCYnXbDEhE5MBE8Wx20jpcBGM1qKnmkf2ZSSRHltITh6g+2c7EguXLuAZoVEQclkGBxTmLxlwy
 r28AeMMQ4nyucRcIYZLGBFD9/gQYHB57vtVs=
X-Received: by 2002:a17:902:ef45:b0:29f:1bf:642a with SMTP id
 d9443c01a7336-2ad17433468mr128152065ad.12.1771353057871; 
 Tue, 17 Feb 2026 10:30:57 -0800 (PST)
X-Received: by 2002:a17:902:ef45:b0:29f:1bf:642a with SMTP id
 d9443c01a7336-2ad17433468mr128151555ad.12.1771353057241; 
 Tue, 17 Feb 2026 10:30:57 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a72e444sm115401545ad.34.2026.02.17.10.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:30:56 -0800 (PST)
Date: Wed, 18 Feb 2026 00:00:49 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aZSz2Z5Ps47XrcHf@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=6994b3e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Q1s3vWhG7-J6-f9QwIA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX/Dylb7cTVC88
 SU07khsmRFH92laSs1v2bsTXP68xduZQqyGdBhZuMai9kneJPIq81sRtEL+60gHfHqiI0kvKZgr
 gTkxXOSZsJev9N/xDfdzIohe9AaETG7pQtNUgapuDAaGVOQLPTfE8oQFPJSUuNLL/0BsGCQUBK8
 tZPfloHtfmSFiFiQbpx31NATyx20QxlR62b35PVQfkT7e+eQGEKOSIJLQS/m9zD4g6r0R0UaH2R
 ECbczfMnNdRm5Fpa8ejIHgJkNRDW6KF7WhFKMUMNd8quyDwTESJJl2gaUNzRoir3hwx2QJaTzua
 6qKTzmCZR2szvPaq3xEYM0KLdUtCZhjKzGb8iuSq/AGgsyjci0XqWt0+PlxoN+n2phy96y5QOtW
 mnfC99KhLKcptPvlTF2HTb6b48B0jpvO6U8Ik70kpLf/Pr3t+w3jH0vCrrKRkgJX4SNY0jE3Rfi
 opRV+APArMLT/bWVyRQ==
X-Proofpoint-GUID: 3tPbc-lzx5rF1sQeJbPBP0IrR7VZaj3K
X-Proofpoint-ORIG-GUID: 3tPbc-lzx5rF1sQeJbPBP0IrR7VZaj3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170151
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 0/9] net: stmmac:
 qcom-ethqos: cleanups and re-organise SerDes handling
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:imx@lists.linux.dev,m:pabeni@redhat.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: E254214F27D
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:09:10AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> As the last series had issues with stability, I've changed the approach
> in this series to concentrate on keeping much of the SerDes related
> code within the qcom-ethqos driver rather than trying to move it out at
> this stage. This means it should be possible to bisect these patches and
> pinpoint exactly the code movement that causes any instability.
> 
> This series starts with various cleanups to qcom-ethqos (the first four
> patches) before beginning to move code, passing phylink's phy interface
> (which will change) to the fix_mac_speed() method, and then using that
> to configure the serdes and inband setting before moving the SerDes
> code.
> 
> Please test this patch set, and let me know whether this works, or
> where it breaks.
> 
> Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 114 ++++++++++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
>  include/linux/stmmac.h                             |   3 +-
>  8 files changed, 90 insertions(+), 61 deletions(-)
> 

Tested without issues on:
  - QCS9100 Ride R3 (AQR115C PHY, 2500BASE-X) - 2.5G/1G/100M
  - IQ9 EVK (QCA8081 PHY, 2500BASE-X) - 2.5G
  - QCS615 Ride (KSZ9031 PHY, RGMII) [0][1] - 1G/100M

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
---
[0] https://lore.kernel.org/netdev/20250819-qcs615_eth-v4-6-5050ed3402cb@oss.qualcomm.com/t/#ma85cac924488d580b971e6477e7df30dc7e48045
[1] Ethernet is not yet enabled for this board in the upstream kernel.
    The changes from [0] were applied locally to test this series. I am
    trying to figure out how the board deals with RGMII delays so that I
    can revive the series.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
