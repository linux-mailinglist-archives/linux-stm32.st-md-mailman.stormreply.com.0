Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pIS/JdSLQ2oobAoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 11:26:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 690A86E2240
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 11:26:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=UGFFMqLy;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 336F6C0A472;
	Tue, 30 Jun 2026 09:26:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DC63C8F278
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 09:26:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4629051c946so301947f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 02:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1782811602; x=1783416402;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
 b=UGFFMqLyLkWgFFv1xcv8WJTzfRVy1I02JYY7NXcjFYtDhjUSjRBo4VcllmEyRoxQh7
 hQ0lNPrtB//C4Nv9TET088e9HwgUqKKyhpomSa0pxvbiMWbdeuUHL1Syi6D/28NVBxNs
 x4SNqT6HUk2kTUBwxePMUl2czJOL5F/CFI174=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782811602; x=1783416402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
 b=BV98m5JfcuOwcRwT9Ot42JTO0lWXdQtR5Ij1/QpJCh95a6cP8WaQx3pLNiUWuUgF3N
 1oH+O+YcWNzblIMzTGljxsQcVTGwZEJMkmzMhbW3K7SHeIqTt+0jDloCwMH3s/2oCPWo
 TahmU3gIx2WFCGYU1dN7Vc1X+LN+bwkX0qRzZq8KsvyhnjFYXAf/Ltc5b88y8Femnp7F
 DM+AnxYxThZpJ57gVw5U1+tIEOLWuLabnPIkcdm9EEN1+f2oOjvhHdtpMKpLV4kDr+xr
 ozBdSGK+esELv0nAX+eMbHevold3I5SbKgrBfKUbawXNEp44Zm0M0ERvzvb5jhr6uZhX
 jh7Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpXV4KCIy7kxQO210CcgceS7dIp2fWwvGqI7/7SVQIJhFzWdWzzFGLUd24wYj9APXeifT/E9ANEbD2QJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzz7MGFnpL4KbOcr3SlligRjpsD4gV3I8BVas67LQjifCP/dOgd
 wHb1jOgPAPCpNfJTcY0dZsXDcm7JBbndAsKcPIjb47hGOh+pe/5a/9DdgEQPArJ58Cg=
X-Gm-Gg: AfdE7cnHWVZ5fonPwzckNPUQBKJaLzh9CS4XejHTM/Xt/b9v9DB7ARzKrNGQgM78zzX
 ZMue4vpVIylQn2JkWImSp8hADEfznWOx1lpPvf+dWb3gObxdERz8ZIx+7Bry34WgcwDN6MgN6BW
 sgboHKIQIPDb0WvTe7XE0ChV37UdC9esiHWVj0F6oBif9fKdYA4Hh/x6mSUAhFilmDx8qt3TwG6
 AdCfM4Vv4ydd6aFRxv0l5iW/Tm9Wy/ACnK6IMrXC8R+fsITK6mnbQOhn/TJtpYAKf3Y8s3CzuwV
 jaB3EvNdW0NCjGP0x5ZM44je1g3LFA39IT+S866ztGCfh/MpxMckgS4sU0qV7tUef9AkjnF9mmQ
 5Xzooeo9Zlz3wqogxPN/YwVUUW3Iyl/if03DlflGuJy3/IImJVTvtqwWLpscwFXd/K0D54ZheIG
 Pzxj3Z5/1umVihboO2ySRvPMszW5Eb0kF3yEy89kycm+OL7SfgcIjLEBqqIKIJtIByQ68+mQ84n
 i7xDPOVFiFNK7SDBRCkFdtuPAcgsj9jnpT2DR1o06wkJ3UNx8o0CAZiH2AOOwgLoBM2TWZ0v/NB
 uRe5+s+ATbUdyg==
X-Received: by 2002:a05:6000:24ca:b0:475:f0c2:75af with SMTP id
 ffacd0b85a97d-475f7344337mr1343805f8f.26.1782811601977; 
 Tue, 30 Jun 2026 02:26:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 02:26:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 30 Jun 2026 11:24:32 +0200
Message-ID: <20260630092628.1695560-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 03/16] arm64: dts: st: add power-domains to
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,amarulasolutions.com:email,amarulasolutions.com:mid,amarulasolutions.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 690A86E2240

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
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
