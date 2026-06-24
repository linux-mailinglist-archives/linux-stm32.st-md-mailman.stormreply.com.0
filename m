Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fR8sIdfNPGr/sQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 08:42:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AB46C3190
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 08:42:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="U/LcBtNo";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0FDCC9AE40;
	Thu, 25 Jun 2026 06:42:30 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3FC8C6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 08:47:12 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-36d8b644473so630085a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782290831; x=1782895631;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LLcfgRgcRG6+Y1GgVHrol+2NxklkD2AbD5mhAFMMnog=;
 b=U/LcBtNo45CukPsdXB/PKiEb+BTmALUW8q7eFFr+ICu60hp3GvVvSoRyXbEduOWrQ5
 52T9ipR/4/dRybEna1+vIzzbksb+/KnETuoIZir9ZATZaHZBupJ5L7ZbOZ6hAwdrh5sl
 XnM2N/X4bWbTlX02IZiLEuT9HoQEJtfVpxGcNaJuupGqOgCWDiF8P8kws94i+jHRymJ4
 u/BO62L7LSZFqLphmuqTBQyjHPLefZODu41MfthGm8ivuZcO8GWoQWl0Xe+chc/fBd9Q
 MfnQfBU7aNYRg8t6asHdM9Dh8OVHk7s0nlBtw4LtesSnqR5v9mjOkeqzzXuIFDQKMdNr
 SnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782290831; x=1782895631;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LLcfgRgcRG6+Y1GgVHrol+2NxklkD2AbD5mhAFMMnog=;
 b=gHJDoZQsqaFqmfzMjwwui6il2M7ZoSaaZdzHFffSRWiPAqd2eICWoZDj435g8LQyHX
 LL9llyDvpQ6wHfV2aF43KD8XzSW20qASbmPMMmQjHV5MmZnvAK99JV9fytDEWD4xt0qc
 Cvsytenzm5TBxJ77q/PLrILsKqxuMAxYO6vhpvsHmpmjlHVkioS30mxDdSiEVt7YYCNl
 mSxv//vqKOHV+xm1tmdt37EixSWFbAnG5IJuireUJnkDWllv2VRWgl6iCkFzMuUxQLTg
 veiTtyyvdN60mhX90XQwXQMOUTBeOwcl7AbirRQBnyr/RNB/S5TOdGNWVJXtlDookike
 YQJA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro7ajqBOcrQVJYMW4wFLz8lybV1qtMhLKy+2CzQonEuQXRRXihtD8P0QUPAoK3TEUk8wDnmCy5HwVD9ZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YymUr2eTc5MsDWMcGuOc2e/KntyDEIv1xcdnf4x4GUJpGSuTxYs
 MB7Icg/QaEYH5KXmc4ZBK6kSHRlEmTidgqonD7cu4UFNKTNam1ihESmKT4PaLQJ42xg=
X-Gm-Gg: AfdE7cnlDfSH02mR3INiP9e5f9hCGFuiPmXWWaxkgQxWU867TLXMLcb3g1jhPe9e+R5
 K+JbY/w3Fa5gT6mCYdTR5grxAXp8Gw23V2uG0rz26RPCiTJYRp78LQhhFzdLEERvIgwkXmSrbMG
 bWBtqO8g61pEZ6CPUs/i4mvd/QVSjQwXCITxRp21/WlH3Zxjg8hXPRnXP5vUUo7CdNMGP87GKoo
 aNZm4HdEEOgYX+2l3vjqBqQ7UHkSG6ikHFF2l2pQtQBo5AALUnnX5GZYX99HCZF8RXaB6XDFlUN
 LWHmbzOPms1SDBE7IuFF1uM2bGmb3JiEKWt4QkKQhqccwHLLOVJTdZZnNSt8W3xabnm347K01EP
 3eczvNtYR+xdnym85yhDlz1gyYjWtAGcMgNFLO1EsERlE+OxeRd2rgrVXPtoAuZXSBcb6kjbhgT
 9ulpQ/4ftNnq6heqjmOC1VkvC6
X-Received: by 2002:a17:90b:48d1:b0:36d:8e6f:8d9e with SMTP id
 98e67ed59e1d1-37de428c345mr2433707a91.20.1782290831423; 
 Wed, 24 Jun 2026 01:47:11 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 01:47:10 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:42 +0800
MIME-Version: 1.0
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-5-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=1157;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=8EosIzzR7UzOFP/v55N37uL3TxX8W4lq/3WtMuwfnjU=;
 b=r1c6yrCwcpidwG3sbm7w7O+CAbkpEjmxfvytGLFSVdZDGbuxcpNNDG74XoG4SVu6zMjqBnqL6
 vaYbrNImRDfBTvTqOkFFkTzjjQ6aTtP18tsj4zv/DrAte13JPeV4nRW
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-Mailman-Approved-At: Thu, 25 Jun 2026 06:42:29 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yanan He <grumpycat921013@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/7] ARM: dts: rockchip: Add RV1126 GMAC
	refout clock
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,sntech.de,lunn.ch,davemloft.net,google.com,redhat.com,rock-chips.com,gmail.com,foss.st.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:david.wu@rock-chips.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:grumpycat921013@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[grumpycat921013@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grumpycat921013@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60AB46C3190

This clock can be routed to an external Ethernet PHY as its reference
clock. Boards using this clock need the clock to be described so the
dwmac-rk driver can acquire and keep it enabled.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 arch/arm/boot/dts/rockchip/rv1126.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index d6e8b63daa42..5b1ee06dc035 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -624,10 +624,11 @@ gmac: ethernet@ffc40000 {
 		rockchip,grf = <&grf>;
 		clocks = <&cru CLK_GMAC_SRC>, <&cru CLK_GMAC_TX_RX>,
 			 <&cru CLK_GMAC_TX_RX>, <&cru CLK_GMAC_REF>,
+			 <&cru CLK_GMAC_ETHERNET_OUT>,
 			 <&cru ACLK_GMAC>, <&cru PCLK_GMAC>,
 			 <&cru CLK_GMAC_TX_RX>, <&cru CLK_GMAC_PTPREF>;
 		clock-names = "stmmaceth", "mac_clk_rx",
-			      "mac_clk_tx", "clk_mac_ref",
+			      "mac_clk_tx", "clk_mac_ref", "clk_mac_refout",
 			      "aclk_mac", "pclk_mac",
 			      "clk_mac_speed", "ptp_ref";
 		resets = <&cru SRST_GMAC_A>;

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
