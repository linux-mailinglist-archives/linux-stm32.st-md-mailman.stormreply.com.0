Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fDs/NH8AK2oZ1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C36747C9
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=THsbrssE;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=gevM1kOS;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B76DC9AE37;
	Thu, 11 Jun 2026 18:37:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E788C57A52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BIQMj11418850
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=; b=THsbrssEx2QAUQoV
 rinXUVYsccewmN0Meth3D9ZoWwB11GGiBk4xo/5lz5Ue5kQ04de7MXEzWg5GeOl3
 lUMUpSAgYfBOm68beKb3jDQk/6LTgfXjacVAgJXZTJ+EqPeRvT1FMGv+579rSQI8
 YcxN4D63MSH3G84+PS0nqPlr74+2NZfTW5nfGcRkgS1eWlGwogZ6jqYJ8eYD6/3t
 AmYm9Kek13ZwAgTTj9pvh6pC1RLnCYmRTyhSRfT8ORiF+PbchoJ7JGQyniNihlwt
 CUb7aEwIPY2MtXvBxlry2UXzVeP43TY/wdal9tYzax05+bcido54KHzmftic0Z0E
 JhbpzA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tn5mt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8424aac207eso173437b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203067; x=1781807867;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=;
 b=gevM1kOShdifv9Kid1j6ofLhTndgre7IzwHRf4e/4FEHSYVTm9i7QOd+qBkXzK85lM
 ZJzBOvI6pAnW/NZZkPZs2gqKk+gejRwJhIEVt6bfUtZzDYKXrvR7iteg/upJIHQCENDB
 KhFqE7SqXg0NGwuYFKWOCn2ooDLFIjinPNj/h3xcTNdiedr95xDb1h4/R8lWXMQRqF1O
 jA6l8A7+rvEKxpmfiY34X0JssoHXG+BwjUBg9Lyltz1lNiJccbxCyrC5H8YSXCPNvVyF
 V5fkaPmFxwGoZt5Jgt53Bj80y3Axw17IdeDH3Jn0IBtlkVn2fOfWjzMuxuNkG/a+Q/WG
 N1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203067; x=1781807867;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=;
 b=ThtPWtK7IdXOTUR7/vAVk4QBFDeBvvrLj1RuN3u0RJPoOkR5SKB9Pj9iBY3vT1nQ3T
 oQpqmt60NeX/7Q43MzhVNwgTb40ky/x2ATldsOcNwkIhwcUGMa09CFI9EcQy/3Fr//d/
 xwqEvms1LppPfmthjb859Yh/IiWJMArBGz4epESOvWOw9NuNTh08uiasLOf8isqnGTDq
 fGBmUGByoS5kvxZtG5XsR+UXFZXkW35MXmCyogkVXO4J8yBbA/Ck9p5ACqdnfE7nEP1f
 Mh8kTzybQA2BxHqirG3MEPlXFJf0GpjypkxsTih0LEFd35g0rLDnzm2muFKWboCX0Xda
 l8MQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cZepa6Eh2HYXqclPZrzSsxsbIARPYMJFb+yj/tQRlGlIvDJJ2yIeWqV2v7FBQITEMDQAsvBd7uJID+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxFo5fuhBWKOIlMPhlkDGYatlVn6fj3LPsx0g+INkYPxKR+zHMs
 2j2XPea2uuUEXEHFMvOU2U/ctvSXSEXMb8gj+5I0r3EhADk0G8JYSse2VuO7duPVeV7p6QB2J5+
 99mUkwLeG62FOrClnmwBCxtAZvq9eFVc8IalrPoe7FV69iaWHPXp7OU1CEXZlbD4jkzlW1Idov8
 w676fLedetELW21iIwGw==
X-Gm-Gg: Acq92OE+wF6cXJQSFvAXM3IBFtZw12t37MYZNmk/pqAu5LnnwHUA0vc6HBpmxOT7vpL
 iZiSmZ/MSxvd/IIAUdxxAvlo+BNa26r9hODFOwGg9LMB4fkYHr5I9LGgxziTrazfRTT3wMHjD45
 LXc3gwS9Btl9KP+IbDKhXQRY9V9ix8Sf7uqQYahMfi5xOBp0t1Dco6Sv426jYnUiEopYZXGUl1I
 H0XxGB5Im5HqOn5kDvEilz1TOhHgb3mnWfC7pA2GyPYNvnhoeUffQyWyxuuc9aHnx/KEKiY0FyV
 76r52elrPGm7h6fZx7GZ8Q6wmN3wy99/3LsCd+l1YP/36TBlpTpZGdkFuxBM7AscZmf9acJHNXp
 D+vqU3PvALCEEgg3ID3DjvDUANCjvyV7KQ6U4/gMikzNsZ8AYDzc=
X-Received: by 2002:a05:6a00:ad0a:b0:842:57e8:1bdc with SMTP id
 d2e1a72fcca58-8433690d21dmr4523497b3a.18.1781203066685; 
 Thu, 11 Jun 2026 11:37:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad0a:b0:842:57e8:1bdc with SMTP id
 d2e1a72fcca58-8433690d21dmr4523453b3a.18.1781203066140; 
 Thu, 11 Jun 2026 11:37:46 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:37:45 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:01 +0530
MIME-Version: 1.0
Message-Id: <20260612-shikra_ethernet-v1-5-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=2407;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=JQf6FOaG/Vq86vxkcpq4Ux+LVaeDywLUVuBCL3uEng0=;
 b=cRNGFK07xiHzKlfJ26rgcNf8d9si3vcKtY1yMqoX9jY4Tn5HpHhsmYACoJajUnoL17r7m0Iuj
 aj7mu7h5iuPDFJLzcuqZgYVRtp2sNTuFVrYtAGZyIEl1l5ab36lm3PZ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfXxn1eitJC7cW8
 6o8pMHH+vyOYRVTvPBBwLn0FBTGZzandu6DNzK9KEEsH+eeP6xhJl4zCXNWCE7lOgc8f6sTTr/2
 ztOYR+b8Mh/BE3/oLd5Ko7Eru+M75rMVDrLXTfRq1D4K8wOr8TzB+ZxXZ5FqhewHlgoU9HR7fZz
 +6uYsao9MP/YLTHgS/P3EygjeuFw85d1J9kQ6stNqVxytuTwP5MFvTLgTbrbD2IB5RxmJjXkLF2
 qnRCY5BYMyUZolyQ5iF+Zw/15vz9xYCCWkn3wZSNhADfZEWRS1laCuPDnIaC86gdVZ07LB30cAm
 kjLCKy1hGsT8I14AuR8KqM3gXQ0YjUNN7EowgHQKkc5qztwxPNPEm4MTuQclfZvPoOprvcSlkwX
 1P/CM5wZ3DaeNDWbDako7GxbH/mtRm/5GKkODtLlyq9xOcwDVoWHuVsyU+EAhnc6EU73H85J+NV
 nYAoNZ0nBOcCyoIgOJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfX4RtIFE0UWRD5
 MBYyQhTXi+DiKqE0aUXf1bunvS73ZEcAzcZ+dmrCOzu38ZIYul1bQMWCm/R+XeEjCkq59x+sUsK
 5Jvk13LlUIcJXw11iPfQIEmuhWcvIrc=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2b007b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Mwvjr24TsYbRRF7WmgIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: xZSPDgg6_O6c4cPqUYRwdK0PPXKglvL_
X-Proofpoint-GUID: xZSPDgg6_O6c4cPqUYRwdK0PPXKglvL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110186
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 5/9] net: stmmac: qcom-ethqos: add Shikra
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 703C36747C9

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access and the 36-bit DMA address width.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f4d4b419a76277cc6c56f03bb10d883cd4dff424..59fa8779e4e4628ae585dd5625168fca824662b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -326,6 +326,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
+	{ "axi",               120000000 },
+	{ "axi-noc",           120000000 },
+	{ "pcie-tile-axi-noc", 120000000 },
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_cfg = shikra_noc_clks,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clks),
+	.rgmii_config_loopback_en = false,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -915,6 +945,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
