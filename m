Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJI9MrbsGmpg9wgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 15:57:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F160D0E7
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 15:57:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53990C8F26E;
	Sat, 30 May 2026 13:57:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53304C8F26E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 May 2026 13:57:09 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so9872f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 May 2026 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780149429; x=1780754229;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0IlYPZDTmu58pp41/fakyyKvhFw5X89LEw/REFRZ2s=;
 b=nhxI5nQk/Dv/bdpWpoHiGCXlkDPsc+LvKjSIQD0kKGb1XaBqflKz5mjyDksOzSO4sG
 EY6vUaJUJV/vbXG4A36MTA6Buq4QItjXxeFTwjiKSk60fxkKbe/RW3GrS3CjOkwMnGog
 CfD0HuGKiC2bj2B3oyrgWvbtn9TrOWiuGA8zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780149429; x=1780754229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B0IlYPZDTmu58pp41/fakyyKvhFw5X89LEw/REFRZ2s=;
 b=leiwH5hoFB/gDb87NdbzryJaUHsW1kOMD7Jjkz98UMZ1IhEc2L6Jk20Bofy6lngwS8
 gZii/iUhuGywQ02Q94IqdLRfWRrQbZm0bGvDoPDvCH29UsMhrOyNCVmOY+UjCb/GHpDG
 FTJBKOW0fUy2HRUrSyTt+INvtOocT9I1Twh03D65t6wxFNGDTBlrd07BT5rysxeL3gh+
 qd6NL7aan5adfGhmW3GNh5hT3+VdI37BJj0zRwJUYkY35JPvkJlgAH6JqDOjoD706YxO
 fEUxm2HE9QU+s7TPS+wwkx+WRhHuRvj06WwQGNoykkRWVMto/DPgdsA2iWy8Cu1doMpe
 Z1mA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+x9a4OJi+ZQhzHY4THJPkxEaCfD5joxvhUVwe+wiZToIgqyV7hy9zRrgNvZWgwTFmlDRAhEryWNHmRvg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzvJU7OtYgXD4TEWXXKWtFbf+VZl6Q8f8AgXW4emv6+uEv9JOvB
 8bLZyIZP5L44InPvBZ8KMJPt5tU9dMpjDS/h4g3hUkjZybkVCKSubl90YxxaRgyMhCM=
X-Gm-Gg: Acq92OFzVfGXTXVYnMrR3BMkNZBx8nl4sDaV7bkTlaUnSEmsS+btcqzszagxKsEsV5a
 FBG5aYpnAurU7Y1+Gw51CJ04bHQtgW7JQM2U47UW1ua0fMZChx13PgwXhTHLdjb5oj8CUX6QhMY
 UIzfyGZQZ7yB2WeyU9hSz+8bBetVIA1Ispdv8uPu/GfVJUei56J+YQw87lGYGZdOQvrUwwDZZAD
 GOfnKyWf69P/7IyU2NKsJsNRBHNTxYSmEca57kYWkUXw9Itk+V49P1jOSm5jLOIjBwS5sHXcCzo
 j3wtGYy0RxIiLFA+RkL870Yk2lg3LhTgyokgDNy0nVycgCSpqC+G0qy+tDW/wNfbmpRNZZsfXjN
 tGC1GLygIw/ublfNzltdIqQTopMCtGD/hBPWdqADELHot8P4rw7Sm8wv+0MaJYDqrnDIGlHGpSz
 qOo00G8A4BQnPuXadRMa5OHLwOmS9NPWkTHOLEMUBHhY+h9SioKZLsE+8TEzHT096/Uw3ILu3P6
 hSsZyTPaiD638+ey/Vzr4TSl/VrrRwlDqPl/uQ7tRZqYPmcnDXIQOoTPJLB8gSB+XQI1hzGF7Q4
 SCowqwsEilbeJZcKoZLUMrfQSKLEqLKe
X-Received: by 2002:a05:6000:60a:b0:45e:7997:8b82 with SMTP id
 ffacd0b85a97d-45ef6b397b5mr6861406f8f.16.1780149428765; 
 Sat, 30 May 2026 06:57:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-0-96-182.retail.telecomitalia.it. [87.0.96.182])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b47eesm12101711f8f.9.2026.05.30.06.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 06:57:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 30 May 2026 15:56:55 +0200
Message-ID: <20260530135701.3961023-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
References: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] arm64: dts: st: add power-domains to
	sdmmc1 on stm32mp231
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:devicetree@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amarulasolutions.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.876];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 944F160D0E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add patch. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
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
