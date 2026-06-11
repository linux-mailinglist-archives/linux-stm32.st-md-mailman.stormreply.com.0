Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fm8AGl8AK2oE1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ACD674790
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=Am+kO7Mv;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=W1ZsLUAU;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD8C2C9AE38;
	Thu, 11 Jun 2026 18:37:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D84AC424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BIRnFA1433758
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=E804jMacXtWtCDDLwtWj/k
 LWRm+8LbGO5xfXQFEkchA=; b=Am+kO7MvE2JznTUpiQv9SuQvbh0OX/Ic8+aNSd
 t1MErlnFU5i100juIcjkAXCarM8B5S2gmabQZt68Bz/+nAwpBCPvfZ1YpK3+Q77p
 Ew8ipyemW8UzvkMr4Zk2TMq+gCgziEX1lu/BX13+/TN2zxDxXSSN0B0kdv2le1Tm
 PD2I1xFfrqdubBZwQNnfXlpLH1i1O9PJHRiBdH61/uJjxUAWCAyte+Xm+CBh48J2
 BPNEQRq+5iHPnkUDfrEA2YYhNdqzcutOBfvwS+7JYrYNpdfS0WNW7aPIR7m0O4VC
 2Coe4tXA0ylM4rXC4zuEniYmZBn+suwAkS86dOLGGAY61mrA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5jd8w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c85a366b61fso49036a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203035; x=1781807835;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E804jMacXtWtCDDLwtWj/kLWRm+8LbGO5xfXQFEkchA=;
 b=W1ZsLUAUu/2dVsYivBlMSngrcaCAXuLmbCqBFLW49ctaHYgOcntQmne1iGk8qBXHTf
 VnOCT7gComrQfHfvdXfuWCswjvCwelBfZPlDYhFrYRy3dBNhImY68BMj5sgZl7EjCYF/
 2db0inl2yVBaN8PbJ2M42kmBIuHo4h+drUgS/70xKZTMV2VP1u3nyPP3Rr1CjtXwB/KV
 6pFDU5yu9kjO15sqN0qr38FEi3X0Lq0H96BnEBssuEevPZwJOwt8NKqTptZXHrtZikqF
 wE6M3mlFLBi6DvfA7O0Quiw8V07eHmrXUODzoo1eT5FVjdA+k2eL8ZgJ70QP9wFiTha5
 V5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203035; x=1781807835;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E804jMacXtWtCDDLwtWj/kLWRm+8LbGO5xfXQFEkchA=;
 b=olvgDy5iswgwBougxuHoYVFF3CF5rUDWWaHhWpOln4glz+obN9UPIZuCH/S78YQ7JM
 JJGVzbbgzDCzdWuA7sLJLwZXBOqHEsJouj+MOHdJxhiTnEvPuAgtz97ulsVdSk5TcDMx
 aFCOPW/w/VK6BGeIuob3JEtRbN9TNVzowdYvltkYjl2nug0V2wcaIjp1EP47Rvx/c4ZG
 xqcigV7DUZoIjWBySXb5S03CLPjddPdKRIBTuUf2GiIoUUr7G5GoOHnx+CKmm++JXlhD
 Ia3lOCI5d8C1bIwV6uic+u9rbeTKpqUtfDuK91Vf7P11tXrKgkwIIQEmdWUcBInVSlVD
 RAww==
X-Forwarded-Encrypted: i=1;
 AFNElJ9dWCAALCbb4IdhNWdelzRs8s4hA48sdGG1146DAroySQHn9v3QwIm3sO3lmC2khJRgjPVH7PvgSZAETw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzriB3IB22b5OD3C8hUC5OzpbsNGlZYrCwO+E9A9/+oHfoYJK3s
 nuh3cAZazakZsVMnvdQT2IWm94XIwyY6VhXg5ZRBrKCUBPzIlqyWUFcUfIhEhz9LRqxauVdkVyB
 rr3p5/Yxn0LFs9pXGxFJnOUad+tneSWdzEcWEV6HWcgNPq9ZkMVpL0LZfycgkZ1wjDU1eIiPEnc
 Jk2gwsLQJCx+gAppMiFw==
X-Gm-Gg: Acq92OFK8d1n7USt+2xQsXAEDl6gQB92hJKI3w0zoldlIRvq4wZBJ1GP+07C96s8IoA
 KeRt6RpVjFkRZYlPxv1NJARXMswTKTOLKHZfbDi/x87KwsgZax76+w10K5ZL26ApE40eBgbRW6z
 0c8lRMfc+PfV6TLI9Scqegf959Oce4qbyC9SRANk24MjH+0L8oI7VRIsv5AVwcd3J+FsybbBl9m
 mtXnBHC14UTbzopA192eMXl8B9om8lUAMtmmEc/bE7bTHr+2SCFEtnUSHeIzejh9WR4RekIFOYZ
 DiElioF/gC6r43qMs6YutdAH8Ajh8HavcQFDy7ApnbYSyqaahOL31seQ5eGeB5O8zUKWwX3RjLH
 7YjwESEQIHlzeXm5jOLgpNNXulgpjMlQDPL7RZZAILMJP1/8s71c=
X-Received: by 2002:a05:6a00:9a6:b0:842:3aee:12c0 with SMTP id
 d2e1a72fcca58-843370762e7mr4554938b3a.23.1781203034616; 
 Thu, 11 Jun 2026 11:37:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a6:b0:842:3aee:12c0 with SMTP id
 d2e1a72fcca58-843370762e7mr4554891b3a.23.1781203034021; 
 Thu, 11 Jun 2026 11:37:14 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:37:13 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:56 +0530
Message-Id: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEgAK2oC/x3MwQpAQBCA4VfRnG0ZsslVeQBXSYthJ7U0Kyntu
 9scv8P/v+BJmDzUyQtCN3s+XASmCczWuI0UL9GQZ7nONKLylncxI12WxNGlEA1OBVZLOWmI1Sm
 08vMfe+jaBoYQPj4Pg6ZmAAAA
X-Change-ID: 20260611-shikra_ethernet-11a1b318d5b6
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3357;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=zOSsQzKp9Ek2NG4SPxgCoFd3tA9TdR//8RVoOu+YbLw=;
 b=mC8YQ0sxi4GApKV3k18i5RVzeURK1818Zj96NEZXl6n//I2UQPAi66L+X+JKeTpokQCenfv4t
 981HGHRwgSGBYozy7hJolcaURX9DLt3h145D3F7ol68bmeUpGxMO+pe
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX3c1991lU5RZ7
 d6jZ6Ie+f8HnILGDwSRi0JR2cDK+CKSVqF32BHATR3cfEffkgLOR2uuc9MbyMOg8deh8FUV/LVh
 VyxHi5g23hUBDz9DwsSI7tl+mZV8HVP97SqwmCQETIThozrOF5aQrG137RarwbQluFdMvWzdSux
 XsZEEID/dXxPPVt2+FfAGzUfsBxM7962lAY4yW5uxySNXptprOvriVF0XNvkABt7YRhhgpqdvHM
 ckNoR/lCvrYRzxvQCfe+9N2bL0EVOY0Gy2IkQ81vRO3KkX0fBDCckxHDy9QV5s3Xwo5pPQ3D0ot
 vb3IDhB8H1YTetPL1thPJVm2KyvdGpMe7aqDcJyZcc8Q9cYzD1LNUX1FVEOsgr/6qSwPC8CjitV
 DdLm6uh+gvjGRbeKW8W9wwUzdXmF3BdaSL26kYJqE+gxx2nUkLfvv2R/KrFKvDAtOXGmmwlH/Jw
 pX/eAyEhG6xwNGu/5wA==
X-Proofpoint-ORIG-GUID: aYJJps-dqbpwo8oaCKRRS-bbncRNZRuF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX+RuILD2u9dPz
 d4FhsFTfrhmBe3xV8Ia4xiTmFnqw4TwBy+jBk2tuv4PVd4IP+JrZk6W9EsA0sHhFPGvMBUQiYUP
 +CrEYrdeD7UFOELkVXT0sfKZNdK5uoA=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2b005b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nYSQqZ2dnBPUVzQNBmkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: aYJJps-dqbpwo8oaCKRRS-bbncRNZRuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 0/9] net: stmmac: qcom-ethqos: add Shikra
	EMAC support
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
X-Rspamd-Action: no action
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
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00ACD674790

(Sending this out as an RFC because we have a couple of fixes for RGMII
handling in dwmac-qcom-ethqos, as well as a new framework to manage
clocks required by the System NOC. If this gets into a decent shape,
then this series will be split between patches for DT and net-next.)

Hi,

This series adds Gigabit Ethernet support for the Qualcomm Shikra SoC,
which integrates two EMAC controllers based on the Synopsys GMAC IP,
similar to previous Qualcomm platforms.

Before introducing the new compatible, two generic fixes are applied to
the driver that benefit all platforms:

  - ethqos_rgmii_macro_init() is converted to void; the return value was
    never checked and the speed validation was redundant.

  - RGMII_ID mode ("rgmii-id") was incorrectly falling through to the
    standard DLL bring-up path, which may add MAC-internal delays. The
    fix powers down the DLL, sets DDR bypass mode, and programs the
    IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. The clock
    rate doubling in ethqos_set_clk_tx_rate() is also corrected for
    bypass mode.

Shikra-specific additions:

  - On Shikra, access to the System NOC from the EMAC is gated by three
    dedicated clocks. The axi and axi-noc clocks are sourced from a
    dedicated RCG (emac0_axi_clk_srcg) per EMAC instance. The
    pcie-tile-axi-noc clock (gcc_pcie_tile_axi_sys_noc_clk) gates an
    arbiter internal to the NOC shared by both EMAC instances and must
    be enabled for any EMAC-to-DDR traffic to complete. Generic
    infrastructure is introduced (ethqos_noc_clk_cfg) so future
    platforms can declare their own sets.

  - The qcom,shikra-ethqos compatible is registered.

  - DTS for the SoC and three EVK boards (CQM, CQS, IQS) is included.
    The CQM and CQS boards expose one EMAC; the IQS board exposes both.

Dependencies:
  This series is based on linux-next and depends on the core Shikra SoC
  framework (DT, clock, regulator) being merged.

Tested on the Shikra CQM-EVK, CQS-EVK, and IQS-EVK with rgmii-id mode
at 1G/100M/10M speeds.

---
Mohd Ayaan Anwar (9):
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support
      arm64: dts: qcom: shikra: Add ethernet nodes
      arm64: dts: qcom: shikra-cqm-evk: Enable ethernet0
      arm64: dts: qcom: shikra-cqs-evk: Enable ethernet0
      arm64: dts: qcom: shikra-iqs-evk: Enable both ethernet ports

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  31 ++-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        | 119 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        | 119 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        | 235 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  78 +++++++
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 167 ++++++++++++++-
 6 files changed, 730 insertions(+), 19 deletions(-)
---
base-commit: 999ed3289ceea2b2808f396b4bd2f9a43dcba033
change-id: 20260611-shikra_ethernet-11a1b318d5b6

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
