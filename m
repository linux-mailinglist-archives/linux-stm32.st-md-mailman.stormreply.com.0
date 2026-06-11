Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SScKKHgAK2oU1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C26747B9
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=MUO8Nask;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=NZMTfVu3;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 146D7C9AE37;
	Thu, 11 Jun 2026 18:37:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9702EC8F294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BIU4ox1406016
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=; b=MUO8NaskBty+GQfn
 grcHqROxQkF2kAJTeL7/02vjr7Om122IM0OxpiKBgVuC1yhFBwQwzqAXNoK+Bap2
 pCyjGAQ4vPTsaeX28NlguttVcG90Dlu1zeWkGURiMS9JvsbpqQQVCmgRxfIw0fdV
 pUsFjSeUWZvM6Jhj56BI4glbnUbmbxM92ll7HdCqJ93dEs0NjtCOarWtkymEWjrY
 mJHy2Y8zYdlTzQPuYX4IWGGU38CiktMGdA2s0sr73R1lys1CuDnoajtKfyP2r0oA
 mO0FREmCkDR8Pti0cLAxIRKydcif5MTDrYNLvRnMBqxEEp+wu+MqZjLML8+z2Yls
 MrwdHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbgcfp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-36b982ec27aso137174a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203060; x=1781807860;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=;
 b=NZMTfVu3WJOj2IjFKTU4WV35mHHH9EyNA8KSxhf8AKecpkzZpXg0MTy3h4ONMja+dD
 4UDfRjgH/EFlvpz0xXokC6Bb7dhMR+D5osLB8cCD6AKcZtAj1j8GqNm8Hquako/CSnBe
 LoxqTTwnLd33Z7j0/ZTa1QwvUA3YQGq8+of6Yf8vZDe3zU1X29oUXk12Af3upAIFD8HB
 JY5/jTJDmMuI1jHwWRLBb32CQ3tkrJcsvdb9Ske+bTRHyQBmtmXayY57JIElAVC0pCtD
 grw9YTxjY9O81vAjXiv+wv0fc0rUANWH5FO5Z536zxNrRvaRa5SKXh/lUu2BpEE6NQNv
 SUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203060; x=1781807860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=;
 b=UnKBPxi3QUFoC2aCQYvllPPywH10CIW682GHWexSFzyY/mSCT+cA8Fh+JczgXdUWlF
 n8NfUOX0sxJmy/RvXRSLgk4vftMh/Qg9w3CvrkXlSNFMeMWBSW2rzFLkywMX0F2g958S
 CMhAsIJUveGUqLcAIOEzZwmR3hdoDz0CoXVENwFUZ21HAoj2c6T8AfHIdUCoEzxPUokz
 5xSWgGGG6hGFInp23TanTOEwCBmuscCUz2bpVETuIE1xQAwFR6S2aTAmG3wvoLyL+AAB
 i/w9coT4tPVKtc0IpDUban5yC8IS/miQNx/I8vQUcqWQZQPduD0FsedBBTzg/+Uj+6i1
 2hsg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+YAub5O6qX4rRI3cloRjVZUcFqxmTe9a+FImPKcVtesuU+MU/yChN4Ge3dHv1+WMKZcrRTGqI3bv+RHw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzuSATVBNEBmptnZuQUxsZFG1Ruq1I11AOdLduKj7aP2vfXPaOc
 VM+GJAAHvDCeVPwOI+fKdGpycVAJx8ILaEQRGdGCwjxLPYh9VDz3Klsb4in6BvlQchcVTY9nLQV
 0UyuVApwS9peupi0qHd6TEYwTiI3Y658R5gSyLcEB+Z8GT2MZPZpe5cqH/LoWZF/rCPxrzDpSCv
 aQ2JJZCT7wqsZlqg7L+w==
X-Gm-Gg: Acq92OER2uGv0SpyT/2FC8PhChRwzW5Fr3PUTRi6A5OlsB5HllKYhr4Uinq/bYMeGyM
 QNwq/C3GBG4mpKmPwarhWV2KCzdgfsCa2t8eaVBYP3SLrmOkV2pTK6RoVBDS7ZTaMzEzf7H2GmS
 DOVx//hMKNt14OFLZ7yvpJ6JRf4RlIVVkk/+VxVfDpHXhpONtdFDaz91IARd44sJNYZdunnXKmm
 Zmq6SzTIXV36N+ueQdeJvDsyLA1VOYed9XyIDpH8D7sm43e61M3oahh5MmJUgdUhLGyxgX90U8d
 fGmt6tl/KoQv0rxtA8enFVSlsee8cyInUC1aJ16PPnKgQEBe1DKKZxOsj4pRZLGS+OZumDXRLg+
 nwQqoT/fdHPD2mz3oCNEyV3Ce6iWYvoRPQdyUL0SxMAQDAt475Io=
X-Received: by 2002:a17:90b:2690:b0:36d:ae6a:22fe with SMTP id
 98e67ed59e1d1-377a4ca0e30mr4643594a91.16.1781203060243; 
 Thu, 11 Jun 2026 11:37:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2690:b0:36d:ae6a:22fe with SMTP id
 98e67ed59e1d1-377a4ca0e30mr4643571a91.16.1781203059802; 
 Thu, 11 Jun 2026 11:37:39 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:37:39 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:00 +0530
MIME-Version: 1.0
Message-Id: <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=4681;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=ZmBtT5CKOpRmxcc7v3W7uVY7c9Er9mvwK+eDsLT5JgE=;
 b=bCe8anHiaYQQwnOm3jo4Hsfoo/mKrJW/Wl8EEkqNTPeb4F7OP3gQPxML+Va5VRquQ4ea3SbeS
 NSdDKQSUdd8CSPtEDIX1z/IMfhBJE0waxtMBBKSSF5s2NDKd8mzvSC7
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: Kc2ev9auBJHL8mgJA41gKuJBTy7KWIFq
X-Proofpoint-ORIG-GUID: Kc2ev9auBJHL8mgJA41gKuJBTy7KWIFq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX8E//6R/DTOe6
 58if8UJmfCXJxLY2qDpMYBBkUoF9s/gx+QE8iAX3UvRNhvvOT70BmRv+Ai7BFQamA/wxYvgVNeV
 mkVN1q8byGzR0ubk3W/Gc5jLyyeZTXU=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b0075 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=upsBg6xUXwFThmIlPvgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX0PsY+n0IiUfr
 0q30OQZSey1fhQJyvtAIZtODhS2ARJvkk5FWF8Pm0HA9FenU9lOLWKU2+uTHFZAxvVN5skyTH9h
 8ogVwa0+P6ZsQQDluemFdSwaoLomm52u+QEXi26M8hzrfV0WcQ2MyLng9pUP267/D2BNqzjPnCl
 fmFaAG8xDIBLV22P/hSf3vUU2HRdubiLZRpcDbMKyDvWRWYG4+2mIAVR7sZkR0x7saSgvzjC4ey
 /0sYraVd3wgt7cXo56S+SCIWEzrh/zSl0wZLKjks+XfKmg4LjS96d6YAKHg2htC1NFx+98ewBBb
 Besg6Y4Ou2TqfyzQBNXO1qvWtIWxZF21pc56mS53fmtV+RtKdDgIg6uwN0Fd4NGqkv3SlxmNhiY
 dq8tmHk5ECKbKv19bkojK58V9aSUzTSyeHYOP+GLfd/dc3ZXLxmnw1mNZKkKQbPJnDG7FnCghYS
 uzsgdXwQGByvc3IaPhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110185
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
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
X-Rspamd-Queue-Id: 5C7C26747B9

Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
that must be enabled before the DMA can reach memory.  Add
ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
runtime structs so each compatible can declare its own set with per-clock
rates.  The clocks are acquired during probe and enabled/disabled
alongside the existing link clock in ethqos_clks_config().

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index bec08f1eb8cb41484ba3c91c77393e163e7fd071..f4d4b419a76277cc6c56f03bb10d883cd4dff424 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -84,11 +84,18 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+#define ETHQOS_MAX_NOC_CLKS			3
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
 };
 
+struct ethqos_noc_clk_cfg {
+	const char *id;
+	unsigned long rate;
+};
+
 struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *rgmii_por;
 	unsigned int num_rgmii_por;
@@ -98,6 +105,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const struct ethqos_noc_clk_cfg *noc_clk_cfg;
+	unsigned int num_noc_clks;
 };
 
 struct qcom_ethqos {
@@ -112,6 +121,9 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+
+	struct clk_bulk_data noc_clks[ETHQOS_MAX_NOC_CLKS];
+	int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -696,6 +708,17 @@ static int ethqos_clks_config(void *priv, bool enabled)
 			return ret;
 		}
 
+		if (ethqos->num_noc_clks) {
+			ret = clk_bulk_prepare_enable(ethqos->num_noc_clks,
+						      ethqos->noc_clks);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC clocks enable failed: %d\n", ret);
+				clk_disable_unprepare(ethqos->link_clk);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -704,6 +727,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		if (ethqos->num_noc_clks)
+			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
+						   ethqos->noc_clks);
 		clk_disable_unprepare(ethqos->link_clk);
 	}
 
@@ -732,6 +758,37 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+/*
+ * Some SoCs gate interconnect access to the System NOC behind dedicated
+ * clocks.  Acquire them, set their required rates, and store the result in
+ * ethqos so ethqos_clks_config() can enable/disable them at runtime.
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < data->num_noc_clks; i++)
+		ethqos->noc_clks[i].id = data->noc_clk_cfg[i].id;
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	for (i = 0; i < data->num_noc_clks; i++) {
+		ret = clk_set_rate(ethqos->noc_clks[i].clk,
+				   data->noc_clk_cfg[i].rate);
+		if (ret)
+			dev_warn(dev, "Failed to set %s rate: %d\n",
+				 data->noc_clk_cfg[i].id, ret);
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -791,6 +848,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
 
+	if (data->num_noc_clks) {
+		ret = qcom_ethqos_init_noc_clks(ethqos, data);
+		if (ret)
+			return ret;
+	}
+
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
