Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FQowACrQJmrekwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2CD6571AE
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 16:22:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=FSxiKo+v;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47C90C5F1E9;
	Mon,  8 Jun 2026 14:22:33 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C0A1C5F1D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 14:22:32 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-bec449cf976so603043066b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2026 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780928552; x=1781533352;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PatEQLdut9te2eHCPW8R4X5P453NImp5hCpKSvxqec=;
 b=FSxiKo+v9hPePD9/E5FoMvqgK9z1n2Mir0pJJATuOWWCE3ZxXlV8hE/6KYQWl7ZkT6
 4j5GhUk0EVpgb9l9w110S8HqjfkV0SCLcD/d3Gb/O4J0ikaxbguy+xCRD3QCxZG9JpLu
 Anou7WmbgIamknL3MOrSS6bb9e7g45CNW4Zmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780928552; x=1781533352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8PatEQLdut9te2eHCPW8R4X5P453NImp5hCpKSvxqec=;
 b=sMXL9aEsPill4vcEgnyAVzz8bovuW5YhnMevtzjk8C4Cexsg2R6ZpC/t4OniPm/N5N
 Z2z9lNPlqYj0NiHs9DvA6RNRWy3GLul9RK8+HEecfiNkCypUJoju/vVWbaX3y/Vh0yzv
 2xOiZGiqborRv5h4WP1azors3kAl0gcqR+qWvMn7FLdgNCnZBkeQx5lM5WmqMFvlJu83
 LuMxE45CD9jobrgRd+DVYwcT0KnPwd3LLau/jNsQNWpfAcnTLEk4YnT+3eSsFZvxT9+x
 VLfFOR2tubFC53Ol3Z7d0f6oCeqgfOLR1Pxz/sErjkFTuPeDequjeZ4GE3VZ1z59DXpW
 J8Ng==
X-Forwarded-Encrypted: i=1;
 AFNElJ9PM2UT4PtD9Rl97KnQMj5BMOQguDh9ScxfYOjtEcBATphz/isPhSQZ5N3h5ytVe05Ky1hsjMzXzZd6qg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyLC07Sg39jRNmBid96KhmPdfSd8+g3urALAk7b1wad549g3ZWL
 +L7sBAhKdDM+Sq9Jd5Ym0zbeH9tKTDIWf76GGoB0jS0HmdjS5Y8VLvmpoT9v2VFQqGs=
X-Gm-Gg: Acq92OFVq69HyhfVQuJKP4OTMWjYEnZbXGypALIo6ngaPluiOLwsk8il6KiD8O8Z7jp
 7loCl1DsQq9qmTmj1FCjqNVgup3hZFE35xHA6zhTViD47mFR+1HhhWhPlWj3wzcDG4HfCY9LvQh
 Zm8Lm4+bsykW/tuWxjlGXtfmRnGZbQ2+vVIoCNGbjEzPOmR2vPJNH2cGVG2M/vb69cE9xlMEdmm
 4++Bjt3896nUCqF5wBWNR7ynNsMclHr76NsjOjxM5Be8xmGprEWyqYcavL1qyzzfQvDwfnkuTZm
 S4tDS2BjPhEy7mNaaITBuXqIUsFpTkHuKuAhmEWmYKp/u95k2K1gWbfGiMr3otvWPXaN1sC5X0T
 qBNdx8Fv7Z5+Wni7mk1Yu8yT6RGeECIphylqTduNJPlvY6wdwuxWWC1ETuiH8hmgPCnTtnFKZ+x
 Ij3HGCjOA1Q8J4tfIh2VlkGRXR8jSZLAQt0S3HgAFYm3Jy+gF3wscSdL++Hwsy0n3WGN3WsnoAj
 u4N1tq+63Y7rXeamxVKW+jqP6aTWLzX7vis/NLKUJbb0Ro83yqmOZAVyV8=
X-Received: by 2002:a17:907:72d1:b0:bde:170:a0ef with SMTP id
 a640c23a62f3a-bf37234c5d9mr825860266b.27.1780928551592; 
 Mon, 08 Jun 2026 07:22:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 07:22:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  8 Jun 2026 16:20:20 +0200
Message-ID: <20260608142221.952245-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 03/16] arm64: dts: st: add power-domains to
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:devicetree@vger.kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,amarulasolutions.com,vger.kernel.org,engicam.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:email,amarulasolutions.com:mid,amarulasolutions.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF2CD6571AE

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Added in version 5. Suggested by Sashiko.

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

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
