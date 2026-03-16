Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Fx1B1xWt2lyQAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 02:01:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5412932EE
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 02:01:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9240AC87EBD;
	Mon, 16 Mar 2026 01:01:15 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F248DC87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 01:01:13 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-82987437624so2085589b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 18:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773622872; x=1774227672;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
 b=MI6MP3g64Iym7ihMBRtzNkCSkyAIjAavt6CG0+lc4gIEQlnGVDfOJd/Ky7GVpqJ77N
 0mhWVoOKV7qYtSMIhVu0/pn7e6u3RxZeybhK+fCeEDRuWj6s2jKMvOf53BC/tB9MNwb3
 y8LYpFgh+5+HzQ+8mZ23RMZ3xlQ+pfA4xA5psJdF7pWTYEvAwBf9d3EE+ZTg+utwVaDo
 T8Oa8fh9HxrH+6JduLuDeUDMSB9J85vFJNrNxcY7i9fgRJC10KzL0OVHumSNfmZXhkz3
 DmS9iMLK6Q7UOfpL0dfOfQGgafBKVzc0+jvHA+qCBomP6ZQIzvQ7B3wZinEDvfUDkFtq
 jDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773622872; x=1774227672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
 b=DOS0x5EgvcZGt3RsUv6WeqXT3L9G4f2KWSsR/ibNOxWRUgGutIV53PsdOsY7sYTatK
 CoK6U2Pz/jJ0ZbB3Y8TFFTP61r9ULhIUvS2IDGItLV5thcmGWuchCIxPWXwOPkwo/74B
 8BMeTAjM97VlyAtDjLB386YHvfpOQF/NPPFeluxLWMQRgZG+Bs0vDZfr+amnwat2ejNd
 JKO+5BELQiTDamwxyvosOSYgSpv8RuaEUsDz78lIkG5Iha23In1gF0yOwK4zqF/WzUxT
 59uF1IOByZVp4/d/+QKHtS7QmYiJ8DppMSdtmc0L+2lywrL0NXvwQ5dcy3XAWR6a9Dfq
 g72g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqGc50XoNn7vfjExCtp4CFfAocv+XvuTnQOkv6n5PoNMWkGb3mH+gOl/LAogPwXUOOG+FJwyjS5FUrnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxptUBIviezIsry9w3x443aYeTbrOmFqtELttqSSItLEzP/+uWD
 2BdVtAZMBv0fAYbU/xnQwPomF1/0eZZXBWLEfldm0sg6K881a5VsHkVx
X-Gm-Gg: ATEYQzzZnDxzi9rQxvarfU8/QHA83CCzC8r0WVPH1Y6L7w42vTLtYSrbeVbzycralB3
 4/JGenCcZkE0h6KwpPKksp5JmnN379TEeS9E4D3sc2A7epCl2M5eRxLVLNVaE+8+y21ymVhNF/E
 XonJCYtHdkhitiAr/wzfW3jgDsTJ4IzYX40rLu66N3DU5K6rdBsKZh8JJZ5otDzpVt7kpPyVK3X
 qYxYaBtBjPxpm5/8g2WHgTlyNaGI6/MMMMHNOo5WwUmYTuP4hbHXevPlOCZBY8h6dmqwa0Xyl9p
 +r/UT9jPkPzsC1Jv0nGAHk5R7B245qRZh+F1s0IAWdAwrXjXEEZphfdqCOKrl6bf0TEc0uv6qKN
 Dv1ANMtZp0nkuSrildoF4Ezoecibi0tyqi2lDjsdVqOWJ5e4ZV6ovenK2Hsfm5iWoYU2hXzYHo0
 EmWb6tMPDDQWMKWL1RSTctibaCXm0DDkgkQQ==
X-Received: by 2002:a05:6a00:929f:b0:81c:ce40:b29b with SMTP id
 d2e1a72fcca58-82a193e89a5mr9456189b3a.15.1773622872449; 
 Sun, 15 Mar 2026 18:01:12 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a072419efsm12308166b3a.11.2026.03.15.18.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2026 18:01:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Yixun Lan <dlan@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Yao Zi <me@ziyao.cc>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Chen-Yu Tsai <wens@kernel.org>, Zhi Li <lizhi2@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon, 16 Mar 2026 09:00:40 +0800
Message-ID: <20260316010041.164360-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v10 4/4] MAINTAINERS: add entry for
	SpacemiT DWMAC glue layer
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:inochiama@gmail.com,m:dlan@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:me@ziyao.cc,m:siyanteng@cqsoftware.com.cn,m:vladimir.oltean@nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:weishangjuan@eswincomputing.com,m:wens@kernel.org,m:lizhi2@eswincomputing.com,m:boon.khai.ng@altera.com,m:maxime.chevallier@bootlin.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel
 @lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,ziyao.cc,cqsoftware.com.cn,nxp.com,bp.renesas.com,eswincomputing.com,altera.com,bootlin.com,cherry.de,st.com,synopsys.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gentoo.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.837];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,linuxtv.org:url]
X-Rspamd-Queue-Id: CC5412932EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a MAINTAINERS entry for the SpacemiT DWMAC glue layer driver and
its DT binding.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..dd72d26ac837 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24834,6 +24834,12 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT DWMAC GLUE LAYER
+M:	Inochi Amaoto <inochiama@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+
 SPACEMIT K1 I2C DRIVER
 M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
 S:	Maintained
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
