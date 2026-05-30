Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD+XLrbsGmpg9wgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 15:57:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F33260D0E6
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 15:57:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 450CAC36B3E;
	Sat, 30 May 2026 13:57:09 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4F9BC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 May 2026 13:57:07 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so1248328f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 May 2026 06:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780149427; x=1780754227;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pwY4UPqEIISkAfS9Cp0aAOo5zFq6rHS+7VWOfypc9Vk=;
 b=XuJG9KLYNZUzYPjDaG0TG0atG0bxPs/uyiC3nrDQB06Ux/faQfb48L/u5aMt1lxyey
 EujqO0bsGHZPCv9Z7dw7z5K8SAdFfS6khl8sadAXBwiK+N6wS70Xsuai3/wxradMYHq7
 RsIpU5f0UIgl/zuWBNi2wmFCbX5sA6sNcfrT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780149427; x=1780754227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pwY4UPqEIISkAfS9Cp0aAOo5zFq6rHS+7VWOfypc9Vk=;
 b=kdiMnXmrE5l89ZvVhsVV3P0E9ycJWG5daBBTC4OoHDkGlfvWRkriVUgagb6LmEsEdN
 PHo0q3qnGhPKYRlS+Mbf0Eu5mQvv5HDGpWl2u7Bft/t36IIQK+xJGq9uC+BF35gzIdvj
 MPwDj/OjWCXNWcdVDXS1NjFnCecAydk8iyDv0ppTo5scgrPdtONsaNLbD/tzQQsCGUyh
 J5fQPq0GhZJjUG0BNymjqLjEOGA9oXzV0CQCOYcItvs5ZKpO+dopQUAoMEx051Lcb0Zv
 PDST3ba9W0txO5CedpMoVLhmbDTIfJ3gt9Yhyu1rdhr5yZnpIzM+ThTKSJ0F99opytam
 +6Eg==
X-Forwarded-Encrypted: i=1;
 AFNElJ87F/8/za7x24w7LbevglIs2OGGEPcWLAjRyQrSPMauHsuo6CbXnB+UE9TT8KH+UCRHNLi/vCQaQSpUUA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHi0VgbQVAGjr/jLXJm/gRqfUfQ6Pr7FV6odHh5kvvXCu/nt/f
 90FdAFmPdLv9iBkIUgO8m9xLzaKWXMt/uZNEtXjbO1SUvnmxGNAJpM/vmCPlQRG+Yuo=
X-Gm-Gg: Acq92OH0eIw4MqY8HLGDgXfX48KKOnsE6zjb66AhX3Gif2oDYsAoX5C5duD9IDbktSF
 jO19CRxdXHjtJyWwhQbgcKCsJFA2wGZgzTFEBL5QFqaRHVlfbTP4ldMiGsrco+jKRKFQ9Sg7/eE
 bpawhcxEU+IhoQo2XOa2VmxazmTUUFXN98LZc9oKv4AxXSDK9jY5fRotiSE0UndC9K3z1/auoRX
 q5ermuXlBrcV9RWfEyBKbS9A5Lg0kA55UUZry3+gL6RmYP0PSsQJzRZfiPTFpr/hE4dzjKo1BKJ
 VlT28vpxpBCgjLgia8CPuD2R4SgUcN4wGDOCD1WZ3rETfGoh5kjAgaK3MwfPOpTv78+VUkjMERh
 xHiFh8r62U9KVYjj2U3Zr9WoomVDxlDU/O6VRExeouzeJRFuxt/K6oYvRD9M3vhGEYeL74Ke1aq
 3wNHJYSCTn9B3Ur7MdQW2cJ7brKqj8TlMkoOH0dW2tOwiN+rQpmdABcHv2ySe2BaDlL8DFlwycV
 e/k/KoFyBHxrO/gx4AyPAKzX2AHiFXoxA10fzSz+X8cpdtpmxwrbuiF1Z6ssJpXaOcky1K5yj+d
 KWuaPaLWTPWzssV6k86pJckgSaasSuSU
X-Received: by 2002:adf:f902:0:b0:45e:a225:6dfe with SMTP id
 ffacd0b85a97d-45ef6b5b552mr5701275f8f.25.1780149427200; 
 Sat, 30 May 2026 06:57:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-0-96-182.retail.telecomitalia.it. [87.0.96.182])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b47eesm12101711f8f.9.2026.05.30.06.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 06:57:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 30 May 2026 15:56:54 +0200
Message-ID: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] arm64: dts: st: add power-domains to
	sdmmc1 on stm32mp251
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amarulasolutions.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:devicetree@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.878];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3F33260D0E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..b3416c928c08 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0

base-commit: f5e5d3509bffb95c6648eb9795f7f236852ae62d
branch: stm32mp251-sdmmc1-power-domains
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
