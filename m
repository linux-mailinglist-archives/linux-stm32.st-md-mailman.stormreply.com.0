Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BJaMGnIAK2oL1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 402A76747AA
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=F5iuHgXg;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=E3XUN5qE;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 034EEC9AE37;
	Thu, 11 Jun 2026 18:37:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FCA3C424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:36 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BIS2WQ1449430
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=; b=F5iuHgXgf1aSnynX
 P0axqcV/oPzWvCV+xrFy8Yb39DCbQeQiEeyihNrwxlea301CnoMJ2l2boBAlm9Tq
 7XeMKgdqY4Dy/UAmDLJhMy+zADavzOwUjaqoesTGJJZYXUbmdowcGLgh9iLa5n2E
 /zaLl7u9Z/MlXSGq/hPEvbdjR/vdkNj57Or1TgRCEjeM2nFsuTUEzhaIpvgN7Qkr
 +MIIn0DDoL86GpPgH0mA9wXl+TdHQCeghEovmNqJGgJB+h7QdfbVXeEJyrAXut/h
 ZNoRplB4M//3aShd7eOuoBxHBm7GuD1Lj5VUuqiPsDblWBqF8gvjVMYPlBp6unki
 hRqDpA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29ur1pc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8422b1354edso209829b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203054; x=1781807854;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=;
 b=E3XUN5qEwvl+NwscEBieXzsvpw1OP2+IGVsgGxwgOtmn9ckRd0vjx1wDTj65IGpo85
 n90Nw/NNkr2AtvXwIcK40lRaZqqHg+D4ri1BGww35unR4aYQT4Sr/vpdlme0Ivdri/6C
 ky2XoGfOiUkydMu8so9l6hT90s8nJimMNoLUpJke9G1KD7KdV0K12sibrrRjAjNUVniG
 RONcMrfbEsRpbHgO5gUhs6umfZy2EAZlAbIMxC5YcAtW8hPJ3wpetD6YkrP1O1rr1eHR
 Sb4aKbljjSxD/dGxhdBoLopQ4U1+yN6Z8wVEroo9bNtabC0J87ARyUAzhknfJWlB/Gcj
 egSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203054; x=1781807854;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eVzOoLNEuPfZZT/bNo/rgtUOyCTzQansB3UIDE8kQC0=;
 b=S+tmH5YIRhC9XxCqesW5IL6JBpT6QAQZqJ58KyxAgBy1GT8AH/dUEWdTf/Kfvmi+nQ
 JeuFSvEsvP0+VZujSfO//xNl7TzjteADlDs/2xQo6QaygAdu/rQLEctpb/Fr3t3tcuGT
 jlsUsG0NjRJkEXrc4XaAxuwykNjX6kMtbJrIa8Ft5Ef1v8XyWa752CwNpiYxuEz/cZK6
 4RRgZWrfnBRqhcBlprw70Cq/covX7xH6l+88/i3197BzUP87cKMLJAxkik0zO4Vyxnuz
 653G0JwmB9fnR90ML79vE7JcO7ZGoiixHCnpqPMSOKwWwSiF3Y48Ar/Y1uQBbDrFD1O0
 ObyQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rJeeaTgsaJON6n7jrlTKTKzgofheUih7UqSYsnJk4Z+5bmsqUPyMuz0K2l7Hnpa+G5vryik33ZvTq/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxz1Ce5X7ZicTMdvzUDhwD6TJ2uo0RMVQ5dTJeFwQHBY2mnKT2J
 5NGCDEkMEpdQrUp7Lloxp/6WVHTmTSgizu7CDXPp5/Be/FehbNKVwt18AJ/XkiPHLQvBdn0eAcj
 l43HfgwqQONO72noO0NyN0GGifn6QRo9hOTWmfM8ue586L3v4siGxNHonpI+i7Z6Kl4U01JLZZl
 Qz68dMJPOs6/kTYst05A==
X-Gm-Gg: Acq92OHwKR08yfmf0SGF1jPACrThV65/uBMjFSnQMvs89z88Ecq5AuWOUzapCKdcYId
 3az7MbBb45A+FhVJmPBecbYLh+1w9CX5M7AQP1+MHPbGHJzdV0hHsyNE6/iOeqzVUUqDsH4LY4l
 nnszSmvagkL0jpilaZsvAIDuT5bN/lg3sS+gvYxmB5AYRFppqkFL2IVZer035wqe76QnML0+VDz
 OMPZUxISXnZ42o/5pWbbUavqDlPyvb5C2d7Qnnnk7nkkJhwMZI2YvYDJL3wNbo/dosvuS+SOIwD
 e/qhSBv6TE9YuRdwAervvXQkonNABRT3KTKzLyWS7YWCWpzIbhzLbO/O0wdH/EqDs9NyrnWNbae
 rOxq8rZLPfXTUr12aOa2qOh1LY2yplqvxh+GHw/3jhJ02u83Y8D4=
X-Received: by 2002:a05:6a00:4487:b0:82f:9407:d167 with SMTP id
 d2e1a72fcca58-84336e079d6mr4799928b3a.38.1781203053893; 
 Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4487:b0:82f:9407:d167 with SMTP id
 d2e1a72fcca58-84336e079d6mr4799886b3a.38.1781203053392; 
 Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:37:33 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:59 +0530
MIME-Version: 1.0
Message-Id: <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=4799;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=GtqYv8yTeq4PzlXpWMuFX96v7sPl9ApaMmizTH0wFJ0=;
 b=A+o89b25yP5p1Mg5UsjerNAHlaA07dc6XakrqeXi467eWa0RjVcP6DjQXPcaF1Q9iH4lXirnO
 FRUuZjNj+8eDbM88yMdkC3X/Cmd6n8mAbCu9bcJ0Qil2xlIc6WbjsXV
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXy5d8GjDsG+Ux
 xZF5sJm+PU5zTH3HX5SbNGFWSsxA+IF+GtkbM7Fg8T+Rf4wKRiWUatNXgpGjPRd/Kg0PYqMuB8A
 y4RNcrBCYxdi+e6OtWw3m7AmHkgRokI=
X-Proofpoint-GUID: OmU0ZkWQLxOGSOfGG0zSOmLoE5XfJH1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX8ayMOjm8st9W
 ICoOog75o8Dd2lcNpx322tY6/mpAwEhgQA8HpgwCRdtKF/sL4WBkLnLob+uBPKLZcyA9om0QXuD
 3/is0sxXs+xsKOICF7AObhWy2cJruY2K8RX9YSPHbatg3AUdKPWgXH8ynDOEqXRayzDoQgX4Ria
 2nL8yQcz9zO7mvDHlqDDwllls7rTqF7XTRn+w3cGMEOOzzwwuNgeA0bWxpDbokzSirariqiH1M7
 VfK0dazTJPgl8Uu7Scan8Vc/Z5/ADzBVaJZGZ3Vio1NHNDZx4ZNv//66PJ2h1dx5ReRaWiMMEcW
 inq2XP880pavg8dXv8yMUHRJBi248BGn1GVpi7aISsFnmLKFXRIfhb1yJ5t/XZMmrifqMFRVdGG
 ongnihNnXMX0rKvCnTXqi4sDsdPJN9f64f+XK27rlIUJeAmj3G+l4/Ey4Z6sh5T9uxXt1VbNRMo
 r1Lvt0Aaj5IfgDLU5rw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b006f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vSCEUKm3QqZMBpSZvnQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: OmU0ZkWQLxOGSOfGG0zSOmLoE5XfJH1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix
 RGMII_ID mode to use DLL bypass
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
X-Rspamd-Queue-Id: 402A76747AA

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own.  The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper.  Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M, and remove RGMII_ID from the phase-shift suppression in
ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 65 +++++++++++++++++++++-
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 44270c25d874f72e7f971757fec659d36468c315..bec08f1eb8cb41484ba3c91c77393e163e7fd071 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -67,6 +67,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -405,8 +416,7 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG2);
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
 		phase_shift = 0;
 	else
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
@@ -475,6 +485,40 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG);
 }
 
+static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int speed)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
+
+	if (ethqos->has_emac_ge_3)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+
+	if (!ethqos->rgmii_config_loopback_en)
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -493,6 +537,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 
 	ethqos_set_func_clk_en(ethqos);
 
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+		ethqos_rgmii_id_macro_init(ethqos, speed);
+
+		return;
+	}
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
