Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDjUAJITemlS2QEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 14:48:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8120CA2456
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 14:48:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EFD3C56612;
	Wed, 28 Jan 2026 13:48:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E948C56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 13:47:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60S92730320202
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 28 Jan 2026 13:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wGMo0m1R2L9wwbTRPxCXUEgVOcQ6/Yw3wU/Y91P03Q8=; b=Q8YXT+QeY4P06cQc
 N/4uFGZiGouljnPWHr1Fr80N2Kqf0k01NRQuAeasyWrFpvFyzmVTsMc4hfLHsGjS
 kfY8MdWdpwixcVYhsvoE6Ep5Af5lLrcA1cGYd+LMnvOVUQGEk/czRmf2Q/B0FwRH
 2/daLG1us83CzfFERdEu+40Ibnf2W50lVoPtqVArBInciktD25oQBR3L95U8pGqm
 D67ea37JPV3Cmzggkv0n3HQhYkjW+M29AnE5rPZchNY5DUoeHoCdBv8kAO0MZ4CG
 7mWpd7mI830gRfF4o1taUUhf6H2YBqL4txuVAJKrcCrGFRP5M23b3CiY+Yi08O1e
 oZCHGA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjtyde-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 13:47:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a0a8c465c1so6277085ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769608077; x=1770212877;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGMo0m1R2L9wwbTRPxCXUEgVOcQ6/Yw3wU/Y91P03Q8=;
 b=eX4YNQPGvefWgDvX2yrW5U3ndFv+XKdoxHJPlJlKy/0+3iCNQ8jsU0jouDKgvoLPr7
 iu/XOr8tx5wi6oc3Rvd5RAw92fIXuWbJDBYyUi14IpHMyAfSfBiTJ9EmdAmWPc9yox5e
 MGwMNC+CyhvbI/up/mYzwKssxByLdycy7AJyCcbfAtVTjY0fTSOb9mIKhPiAOVkYZxdi
 J6SEr4A2wO3p5qxfaWFRhRK5P9B32bQpWe+uqr76vEYUFoMBrGrsRV9XRnvCmvu1m20a
 C4DtCXOWFpZRPZEE2TyhqHQwFl3aJWrQUIRiOSYGN9AcLtA1/BAoPesfV3N8CVsXboi/
 Ml3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769608077; x=1770212877;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wGMo0m1R2L9wwbTRPxCXUEgVOcQ6/Yw3wU/Y91P03Q8=;
 b=wcoJsIMq8HkLg7O2M5nptxUn5ko5JoppbPpE243A4IsGGFIeH3qKbi6bC3Zfnj0W8F
 pr9/Qxkik6Wcg5qPGObRBFFBSRH5IUGAUnugV1FeNBm1CswWsdwKuwIWgkU51suuqUyj
 6tWqK4FLKyxTOh7rOKuIsw+gYCcDZEfwks767kn5mNNE9Uv1EucY1RscoGKM/TurFPNS
 +lsGzCju5BKuEsH6MI42aejamsIfzfYIgysZaBH88nzzn+D1mCEQzi+6ONVM0g/V/UAv
 ER8MpwG+Ks7aGWDejOk/j7rLxcMz/SIhWzLvV6ushuTH7OGmEhji097o5qSrbb0ZYm0b
 sCQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu20cks5+39SI8kuPtk8ySx+woYimGbqIw4oItMN808MMyyqgbuOu8BFvIrAAiGGrcuAA9OFIMs5MmLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1+WtN0e/h6alCc1Qnn5wJHLb/Hq9DaftjvN/AK29Noi7Lrcei
 0fnIBFs4D5lQYnjqI7PHVG7gJlM0KKGl7n04CT1nrm+X6VQkw2hD/qo69jcWantZSwlsSC/wN6z
 klSVz+fuuP83unqVvqjKR4Qaci3yB+nTuK2KSEyNsqaUy9QGMkVMZvssFBfGZ9i7qOtODil1Kul
 ndOz/DSP0=
X-Gm-Gg: AZuq6aL9E5k+vmeqq/KAe2Foo04siIHsjIR9LZiAQC/u0aOV/FYLxqsg6nTZt93JIfk
 rlx4ybw9hLIx+qVZMxh/g1rz2NyPW+JUbhjdy4iK4TnzePfThgGRVy9bjSa+Kl3nX/+ZeUHTaAY
 ounA8qV4rn+NqDo5bdTAeVJZWJbTJ1YrILZr/Q5OLtRpqt0xG0AxU3QNnq7h/qnrXyPQWQDnLr2
 rDNGKpl8M11skKJhL+d6to69meh+7FgfUPqceThOul5e0KKRlTXd/sPGVFZHiScwXEiUBKjFrjx
 H0BpgWLsy3Wu7uflxAeKBr146HjLMphyvz9VbJbTAqJ4V5vg5G7YEntN1pTEsj70FPWKfsVp25P
 zJdAtk1A=
X-Received: by 2002:a17:902:f60b:b0:298:45e5:54a4 with SMTP id
 d9443c01a7336-2a87120f746mr50143975ad.1.1769608076699; 
 Wed, 28 Jan 2026 05:47:56 -0800 (PST)
X-Received: by 2002:a17:902:f60b:b0:298:45e5:54a4 with SMTP id
 d9443c01a7336-2a87120f746mr50143365ad.1.1769608076044; 
 Wed, 28 Jan 2026 05:47:56 -0800 (PST)
Received: from [192.168.1.102] ([120.60.55.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c45c4sm23790595ad.62.2026.01.28.05.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 05:47:55 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, bhelgaas@google.com, cassel@kernel.org,
 Frank.Li@nxp.com, Koichiro Den <den@valinux.co.jp>
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Message-Id: <176960806032.58847.15614322725355216575.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 19:17:40 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExMyBTYWx0ZWRfX7DUAbpJ1V9ip
 VNbBYDZFSAChnyE0MD2rpWgFdrWZmhsfym1Ql/X6DM+mrZoARBPE9wNFbk+V6ndvAzEz29GvAar
 mnTYZ5L7XytVm9MChMRtZzxBE2vqfhGXVUnbs51Zv0n8/QVV/whfILiJTuseAWsw60GBpzjvqzn
 PsGTwoSxIveNUwExdPRSEp+NV0IQUtdSe81eUozd++6TcvkEWdrh5ERG2nE7nSVFzN0h+zzYjsg
 yWhZ5MDUXdAkZU0MUjxPJ/zTv9oTT4Cy7dKFySo0JhMeEM0SLdpY0nmq571UrPMU7L5ms5Gy2HS
 FOi2XgUHn8q5J8IyyoVytLHdsNc1PjY2b7zudXYHlZ4hE/8r9MqJnGNPniyCmzLqZK8+p0miPg/
 H6axXTP00bcGTsVqE8zbzuBPbmFg4/oKFF5ZnY0qP9fSEUyZdtjfg3KX3m23wTVaBsdXrRrOTYS
 /Zs1hnwAwq3hw+wPSPA==
X-Proofpoint-ORIG-GUID: rYxZn9FhxYsKrrzrdlIBEcYlqORPaVwo
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=697a138d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=F3mjE3T3/ow0zpRzCzjSvA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Ux4BfgyPd-WidXiTcjQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rYxZn9FhxYsKrrzrdlIBEcYlqORPaVwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280113
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, shawn.lin@rock-chips.com,
 christian.bruel@foss.st.com, thierry.reding@gmail.com,
 linux-kselftest@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, kishon@kernel.org,
 srikanth.thokala@intel.com, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, marek.vasut+renesas@gmail.com,
 shuah@kernel.org, hongxing.zhu@nxp.com, kernel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, rongqianfeng@vivo.com,
 mingkai.hu@nxp.com, roy.zang@nxp.com, minghuan.Lian@nxp.com,
 linux.amoon@gmail.com, linuxppc-dev@lists.ozlabs.org,
 yoshihiro.shimoda.uh@renesas.com, linux-kernel@vger.kernel.org,
 vidyas@nvidia.com, linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v10 0/8] PCI: endpoint: BAR subrange
	mapping support
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:Frank.Li@nxp.com,m:den@valinux.co.jp,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:shawn.lin@rock-chips.com,m:christian.bruel@foss.st.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:srikanth.thokala@intel.com,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:marek.vasut+renesas@gmail.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:kernel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-tegra@vger.kernel.or
 g,m:linux-omap@vger.kernel.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:minghuan.Lian@nxp.com,m:linux.amoon@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:mcoquelin.stm32@gmail.com,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com,valinux.co.jp];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,rock-chips.com,foss.st.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,kernel.org,intel.com,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,nxp.com,pengutronix.de,vivo.com,lists.ozlabs.org,renesas.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[54];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8120CA2456
X-Rspamd-Action: no action


On Sat, 24 Jan 2026 23:50:04 +0900, Koichiro Den wrote:
> This series proposes support for mapping subranges within a PCIe endpoint
> BAR and enables controllers to program inbound address translation for
> those subranges.
> 
> Note: This series is a spin-off from a larger RFC series:
>       https://lore.kernel.org/all/20260118135440.1958279-1-den@valinux.co.jp/
>       The first user is the pci-endpoint-test, and the real user will
>       likely be epf-vntb for Remote eDMA-backed NTB transport, demonstrated
>       in that RFC series.
> 
> [...]

Applied, thanks!

[1/8] PCI: endpoint: Add dynamic_inbound_mapping EPC feature
      commit: 06a81c5940e46cc7bddee28f16bdd29a12a76344
[2/8] PCI: endpoint: Add BAR subrange mapping support
      commit: 31fb95400451040050361e22ff480476964280f0
[3/8] PCI: dwc: Advertise dynamic inbound mapping support
      commit: c0f1506f63546308e894469ceb0f1fadbdf9d2f9
[4/8] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
      commit: cfbc98dbf44d52738976f592f30c2ca6bb282939
[5/8] Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
      commit: 7d857a3f517df4591d4c85832c4ce5aeb0ddc038
[6/8] PCI: endpoint: pci-epf-test: Add BAR subrange mapping test support
      commit: 530e3701a81b228c369261798ce1b7f63f5d6c08
[7/8] misc: pci_endpoint_test: Add BAR subrange mapping test case
      commit: 622e1ad5e49c6949dd8c97d71f609bd17cfb8813
[8/8] selftests: pci_endpoint: Add BAR subrange mapping test case
      commit: 0ebf8e7943e01b2c38c199228f51adbb89c02425

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
