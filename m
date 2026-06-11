Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e7HhNIUAK2ob1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF446747D5
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=LBISvqjr;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=OjcGskjn;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49BEEC9AE37;
	Thu, 11 Jun 2026 18:37:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 518EFC58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:55 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BIRsnn1432923
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=; b=LBISvqjrAxNErqiw
 sm9BUhuYLMngvTPRfyRU3n2KbBXwgMlTFAqKvBku17LdMduU/zaqD0iPkDqAIblq
 +IgyYa9PqOyEvUt0A1ByezDcHv9WCIqY2VGjLkFVm7df9ZdA/IXuY1+fiWGSb/sP
 YfJXZBRP2bBeL1qAFFE9Z4/ewiNsKdt/hvPWCumJGsasvJbs+m9PjH+yEp4k9VC7
 RFuoOlWsQZ6JOuVR41KyATDGuB87t5Jy/6FR6NAn3wGFvuUt3q/kdeKdvwGNwsgF
 lQiUE/Tq0pvVkHYq/qV9ryyJgMxWZBJCyqTE/mi0h6+hMPMF39a5pEOCTn1Lb0hm
 4ac+Bg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7051nk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8422a0eee68so247244b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203073; x=1781807873;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=;
 b=OjcGskjn/5Y+BodB2DVUnM8gGFGlA+BE1eJ+9trw6Dodr3hM2u9zSC2JkFBTm41EjF
 pTGsYHySB/rGPjFK2hoQ67WSTbr+U4iPViWDc2czvRKOZ7IgCflt/zUIE/jENdBLwkT2
 SnhYu6fkalVlMBkvdpJIrYyB7rhi1gCO6FZdIm6f7B+VckhFwIOPGu9OtXjCansTDuEN
 HNYrJ3jlV0xTNPX8GLrCy2jrdFFE9qCCihdAt8cMTm9mK0Yf2oLM9tQJB/QvOorqLlHL
 5mWy4/mKiCUGcNNPWV0B4jc2VY3SJ9nTqzytjxO5CViz6YpvAfJPG6iSKVwQ7mGy6qol
 WIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203073; x=1781807873;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6iIX6YyczVTNZnfKhOGek1sSjpYCGtZFfO3vE1d1fHE=;
 b=XGfg9jYVtFiyIZkp6+vvAunsHGbDtF/EacRV5xvZTgHvMxWDSchv5EKb/G9/gN5B+H
 8CG7RnQz3WePiJj3a+FiOS/Hlv3TzD0WUFQGGcO20wqgavp0mt/yTk2FGTxf2c3hX5T0
 NjyKspuuXnKrtzrk7R/CNdWkW25h8zaNcDIDG4jSy2gNYZSWy1vVdXdLlZ+5y18f9cg+
 kIQWBjLBvZsg+NVKBv1DyQy+eKZvjU0XZ4zU4/d90r3VBjMA7EQt4tyS/QfFEYu4te9u
 RnfHZY7SBXEX2cwxbNCKD+dfGSz7hYM8nFt4B0P/TDaNZZ3XAmdGC7OC7UTYxHcfzP/e
 wz4Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Vm3frQ6haq1Zz6zzUrrhDuVBJL2XV6d6MrQoTOIZZPPkvNq6QEmE/quA1RVozrtsL+6NhMZdFvX7SFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxc6HLasUDXcMVb5nCMgvSo+0VclRDFUO0WdEzE7YDFurrYXk8g
 B7j7x8ZouESbmMbLED/ZbB6Nu4bsYklJuuyoIRklgQXmiowclMKU8BmhyUErCCBW9r6OEIgXSP3
 5ISWr6a6tZR7qTopu9COJEP3eEqTiQ47aJNBumnEMipzQBercgX346EuzLLZGJo2q101zlIOGUE
 oLaaoVMp8R0mI4nbxGag==
X-Gm-Gg: Acq92OH5SpJ5TEoPyWdov8xysnTeWtHCHEycak1XM5VMlqCO5ZPUQC9IzioIccNYLzr
 fjC4hVXutzAvz86JpnQce6MioCNgo4EDt0JneoK7X+lVfUACC3RX80I++o47A+x46aVFkdlaYjv
 CMfXFuOAQ5+nRlS8FE+CQ56b29MUzBHPLbIqD+5ma1qzlno+50RoEgrzRGh7a7D0ei7f8gCgzJv
 Riv0/8e+OgsAqPa1htzbctpPZsA4vJKEQ1qGChsYQPjR/rvw9duoed1yA/p/AMKC6JEmnJWgsDf
 i4YAw96kDz+4C5yoyeIYO/Nkmaov1zU0cYFn6hgOQHzElfBzXtrmKBmUvOOv4S4Je6dTH0GoIDD
 trTOakR/AbT7vNCd3J8r02ohSMWtM+BtLJ4evLbJQgxK6LpCqTBk=
X-Received: by 2002:aa7:888f:0:b0:82a:17b6:53ca with SMTP id
 d2e1a72fcca58-84336bb0236mr4556615b3a.38.1781203072953; 
 Thu, 11 Jun 2026 11:37:52 -0700 (PDT)
X-Received: by 2002:aa7:888f:0:b0:82a:17b6:53ca with SMTP id
 d2e1a72fcca58-84336bb0236mr4556584b3a.38.1781203072506; 
 Thu, 11 Jun 2026 11:37:52 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:37:52 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:02 +0530
MIME-Version: 1.0
Message-Id: <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3434;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=oMO8EvsYcPF9+TMaWUdj9tkVVxeogwjZP8T4RkGhCRQ=;
 b=KroYwCn/3i+MFwy5h43g8syHSEKzKdoXtCPwEvaDoiOtf4wd25RpWtOWNNMR919JjBGGbXbma
 HmGbKLG9YAdASCvawXcOKjCh37wDC4o4t2BxpzwI7B08uNFv+rgwL5A
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: rjki0LdB9VDNvnyMA0jkdY8IyKNIiAWx
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2b0082 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=z42-wsbaeSSsZQV_GzIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXzVJ90q82ALcw
 CKI7yoUHBNI0Y7aK95QsyM6peAiyARDftmTy0lBXW170Zzw4qAAipHEfajhJoZ6rk2D+pxl9ax0
 BqFSmYiWUgmDcgssJnPATURj7PfkVtZYBhgRay7qb7eBviFVTTrmBvprMyQCf/lxVYIpN2+rJiH
 OEYnQNh/8hr/HBuvFIuGelGIx2clYkLoreWRbEk+luSF/6qgEuxEDHiZ6uTDeTe2w0fdJo98w6V
 sXRV7z3uZBYnVzmQL4B8+R55jEG4p93dD3SVoQboRBCkc8eOMbuSaDWG9mmrzxP0L9HRXBiO7J1
 iFS4vFf58Jjs8YtaDPjT3WgNPYVeAQpzurOC43LMJl11Goslm0Cq5/yOuxD8ZQ3vC6spug7DlW4
 hrTRM01ddds1y+x/84mHXfaMfOAjmQa0ACzb8DBOoZXD6LdiI4O/qKXWs+I6xVvvcaKCtjeY4Nq
 gHsTuucNz1Ky5eEm08w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX8a2qjAN+JU7B
 wG9ozPuytkvY+oQ+VC7cH+Yv+yDHUHdEsJyKxBWISkljBnY/ZNGlJtx6UDCHv5SEARwiGa5I5Kx
 zHZse0RrCacGMF3tDNl/PGOrzXeUi5c=
X-Proofpoint-ORIG-GUID: rjki0LdB9VDNvnyMA0jkdY8IyKNIiAWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 6/9] arm64: dts: qcom: shikra: Add
	ethernet nodes
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EF446747D5

Add the two Gigabit Ethernet controllers present on Shikra (ethernet0
at 0x5d00000, ethernet1 at 0x5d20000).  Both nodes are left disabled;
board files supply the PHY, pin-control, and queue configuration.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683aa566b444a847b57b4b47a25aa8a..cac1573e3eec9e52b62f4b4cd7c564c70d0d8f78 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1990,6 +1990,84 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		ethernet0: ethernet@5d00000 {
+			compatible = "qcom,shikra-ethqos";
+			reg = <0x0 0x05d00000 0x0 0x10000>,
+			      <0x0 0x05d16000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_AHB_CLK>,
+				 <&gcc GCC_EMAC0_PTP_CLK>,
+				 <&gcc GCC_EMAC0_RGMII_CLK>,
+				 <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
+				      "axi", "axi-noc", "pcie-tile-axi-noc";
+
+			power-domains = <&gcc GCC_EMAC0_GDSC>;
+			resets = <&gcc GCC_EMAC0_BCR>;
+			iommus = <&apps_smmu 0x0380 0x0007>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC0_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&system_noc MASTER_EMAC_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac", "mac-mem";
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		ethernet1: ethernet@5d20000 {
+			compatible = "qcom,shikra-ethqos";
+			reg = <0x0 0x05d20000 0x0 0x10000>,
+			      <0x0 0x05d36000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
+				 <&gcc GCC_EMAC1_AHB_CLK>,
+				 <&gcc GCC_EMAC1_PTP_CLK>,
+				 <&gcc GCC_EMAC1_RGMII_CLK>,
+				 <&gcc GCC_EMAC1_AXI_CLK>,
+				 <&gcc GCC_EMAC1_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
+				      "axi", "axi-noc", "pcie-tile-axi-noc";
+
+			power-domains = <&gcc GCC_EMAC1_GDSC>;
+			resets = <&gcc GCC_EMAC1_BCR>;
+			iommus = <&apps_smmu 0x03a0 0x0007>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&system_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac", "mac-mem";
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
