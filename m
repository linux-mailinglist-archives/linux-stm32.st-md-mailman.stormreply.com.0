Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOLxCSC3GWpByggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 17:56:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C9605226
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 17:56:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEBEDC8F296;
	Fri, 29 May 2026 15:56:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAE7CC87ED1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 15:56:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so95482455e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780070172; x=1780674972;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LnHNg9n0JGZsDydxLfv4khIj43e63eeZtcUcMwaZSDY=;
 b=htsK01jmRL5ro+16hZLsYgBniWtJUwrFLc/ce24FS4FumqVV0jsUN/ylj2pfCrdA0Q
 WJfK9ui0yYZgGPOgE1M4LQWzBLYvY4z/cIqhCjCSmyVuAiUqxOf3UNskuIcSDWFQmPjT
 y1rEoFOH9LtayDqhIzEqzKtKxZJENUhP7tPXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780070172; x=1780674972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnHNg9n0JGZsDydxLfv4khIj43e63eeZtcUcMwaZSDY=;
 b=RuzZJUqzY7EHLA9TC4iWWdUnAyka4d8qR4lf/LOzINKMKuZXJ6grpJEjw7wx39bW6O
 cbtZJcuxXvcLIOMvKsIZBeiYznMYls4m/aipkq6x+nuSVCdxRTT58Dj2Pz9FKyjk6E08
 XCtygZpGAeLsnl8XL+ksZw4stMdaD9mFix2rBoOrMPsKmtp1rkkrNkd/JiKowgR+iBpu
 p7dkGT8IG76y5LTEpRrKXpH190cME/VgK0hPWCPwYC9HQUSIS9dxZzizQa0prm7aB2qf
 pz2LfivB9IXjKhLu7vd7nX7E04fKWYGRec2QceY3QADs6r8G4DSmEuxMQf2MwTAYARW4
 fpgg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+qQpMo7UJ8bLksCigpGA/SxCaifEAeOQ03uLT3b1+sH44KqwNt4XvvFjyKAjIZpxVqfa5jN89efHvZ7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2/71ncmpUdmiL3EEAHlJoGvZXAEinMMebb8BsDONC7NuyUl5G
 EFV0w3huvqQJr8fY/pHCjFB6+4zzT5xBnRMGrmxV5dNBpjxItqtu3qQesgcXHklc02o=
X-Gm-Gg: Acq92OFGvFK6VcNwp38xaD7VT/CUwB2C1Ni2ZvJi0G1/nfjX/wgd8wvrMdD8t3suPAG
 4YIRonvUPQ1gA4SxlPttK2yfqt6mpMRUvJTwBgGcNGq2uG60B9cbC69c+rxawU6cLrKA7Ch8O1/
 LXcrrrTI6ykZvF5fODWIVGUR6xTiDFmbHGuKMurbmgitaMmAavff+R2Jh+SqcMvJgMtBHjJ/azl
 03vH25q4Nm9gbtvOwRO5Tx/PRWL/J9hM/hpMuSdJC4JrYyx+wWZFyZ7NNQiLoTVVygV6CSq0trW
 G8njbdk8dwkPp4B9SDg8hMxZvLnriYFY37PT5mEUvXCrFUsnMXUpkhRNPUSRLe9hJ/qjR5N5kuJ
 2Shu5JkMmmKen39P830juyLY/EvCWPK5RiYnz0ighCjjnqecdOP1soEeH7MR2I/hGv7EZlTSWGO
 Xz4VqSQlpVZ45NvwR40UVBg753zXip2MD73schKrvkjSwXPU4gfLrnGWTwXk27ysKRkH7/2zFE7
 e10d72zDfj4gSNyT3ihvDOpGCIu5MKw8ARkJwK3OEA26jzPIlES6iP3Epje7EMv03HrvQ==
X-Received: by 2002:a05:600c:8a0d:20b0:48a:906b:14ca with SMTP id
 5b1f17b1804b1-490a293dcaamr2867795e9.20.1780070172253; 
 Fri, 29 May 2026 08:56:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354c682sm4114680f8f.23.2026.05.29.08.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:56:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 May 2026 17:55:50 +0200
Message-ID: <20260529155607.3948045-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] arm64: dts: st: add power-domains to sdmmc1
	on stm32mp251
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:devicetree@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,amarulasolutions.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.879];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:mid,amarulasolutions.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,2.223.199.96:email]
X-Rspamd-Queue-Id: AF6C9605226
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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

base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
branch: stm32mp251-sdmmc1-power-domains
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
